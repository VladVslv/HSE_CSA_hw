#include <iostream>
#include <pthread.h>
#include <deque>
#include <unistd.h>
#include <ctime>
#include <fstream>
#include <string>
#include <climits>

class Philosopher {
public:
    int number;
    int remaining_number_of_meals;
    pthread_t thread;
    Philosopher(const int &_number, const int &_number_of_meals)
        : number(_number), remaining_number_of_meals(_number_of_meals), thread() {}
};

std::string buffer;
clock_t begin;

void Eat(Philosopher &philosopher) {
    while (philosopher.remaining_number_of_meals > 0) {

        sleep(1);
        --philosopher.remaining_number_of_meals;

        buffer += "Philosopher number " + std::to_string(philosopher.number + 1)
            + " finished his current meal. Remaining number of meals: "
            + std::to_string(philosopher.remaining_number_of_meals) + ". Time: "
            + std::to_string((double)(clock() - begin) / CLOCKS_PER_SEC) + "\n";
    }
}

int main(int argc, char *argv[]) {
    int number_of_meals;
    std::deque<Philosopher> philosophers;
    const int max_number_of_meals = INT_MAX;
    if (argc < 2) {
        std::cout << "Print number of meals (minimum value is 1, maximum value is "
                  << max_number_of_meals << "):" << std::endl;
        std::cin >> number_of_meals;

        while (number_of_meals < 1 || number_of_meals > max_number_of_meals) {
            std::cout
                << "Incorrect input!\n\n"
                << "Print number of meals (minimum value is 1, maximum value is "
                << max_number_of_meals << "):" << std::endl;
            std::cin >> number_of_meals;
        }
    } else if (argc >= 3) {
        try {
            std::ifstream input(argv[1]);
            input >> number_of_meals;
        } catch (std::exception &exception) {
            std::cout << "Incorrect name of input file!" << std::endl;
            return 1;
        }
        if (number_of_meals < 1 || number_of_meals > max_number_of_meals) {
            std::cout << "Incorrect input!" << std::endl;
            return 1;
        }
    } else if (argc == 2) {
        number_of_meals = rand() % 10 + 5;
    } else {
        std::cout << "Incorrect input!" << std::endl;
        return 1;
    }

    for (int i = 0; i < 5; ++i) {
        philosophers.emplace_back(i, number_of_meals);
    }
    for (int i = 0; i < 5; ++i) {
        pthread_create(&philosophers[i].thread,
                       nullptr,
                       reinterpret_cast<void *(*)(void *)>(Eat),
                       &philosophers[i]);
    }
    begin = clock();
    for (int i = 0; i < 5; ++i) {
        pthread_join(philosophers[i].thread, nullptr);
    }

    if (argc < 2) {
        std::cout << buffer;
    } else if (argc >= 3) {
        try {
            std::ofstream output(argv[2]);
            output << buffer;
        } catch (std::exception &exception) {
            std::cout << "Incorrect name of output file!" << std::endl;
            return 1;
        }
    } else {
        try {
            std::ofstream output(argv[1]);
            output << "Number of meals:" + std::to_string(number_of_meals) + "\n" + buffer;
        } catch (std::exception &exception) {
            std::cout << "Incorrect name of output file!" << std::endl;
            return 1;
        }
    }
}