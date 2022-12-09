#include <iostream>
#include <pthread.h>
#include <semaphore.h>
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

    // Поток, в котором будет выполянться программа.
    pthread_t thread;
    Philosopher(const int &_number, const int &_number_of_meals)
        : number(_number), remaining_number_of_meals(_number_of_meals), thread() {}
};

// Бинарные семафоры, предоставляющие доступ к вилкам.
std::deque<sem_t> forks(5);

// Бинарный семафор, предоставляющий доступ к изменению буфера.
sem_t change_buffer;
std::string buffer;
clock_t begin;

void Eat(Philosopher &philosopher) {
    while (philosopher.remaining_number_of_meals > 0) {

        /*
           Ожидание того, пока нужные семафоры (вилки) разблокируются (станут больше нуля), далее
           блокиравка семафоров (уменьшение их значения на единицу) текущим потоком (философом).
        */
        if (philosopher.number == 4) {
            sem_wait(&forks[4]);
            sem_wait(&forks[0]);
        } else {
            sem_wait(&forks[philosopher.number + 1]);
            sem_wait(&forks[philosopher.number]);
        }

        sleep(1);
        --philosopher.remaining_number_of_meals;

        sem_wait(&change_buffer);
        buffer += "Philosopher number " + std::to_string(philosopher.number + 1)
            + " finished his current meal. Remaining number of meals: "
            + std::to_string(philosopher.remaining_number_of_meals) + ". Time: "
            + std::to_string((double)(clock() - begin) / CLOCKS_PER_SEC) + "\n";
        sem_post(&change_buffer);

        // Разблокировка семафоров (увеличение их на единицу).
        if (philosopher.number == 4) {
            sem_post(&forks[0]);
            sem_post(&forks[4]);
        } else {
            sem_post(&forks[philosopher.number]);
            sem_post(&forks[philosopher.number + 1]);
        }
    }
}

int main(int argc, char *argv[]) {
    int number_of_meals;
    std::deque<Philosopher> philosophers;
    const int max_number_of_meals = INT_MAX;

    // Ввод количества приёмов пищи философов.
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

    // Инициализация бинарных семафоров (с максимальным значением 1) и философов.
    sem_init(&change_buffer, 0, 1);
    for (int i = 0; i < 5; ++i) {
        sem_init(&forks[i], 0, 1);
        philosophers.emplace_back(i, number_of_meals);
    }

    // Создание потоков, которые выполняют метод Eat с параметром &philosophers[i].
    for (int i = 0; i < 5; ++i) {
        pthread_create(&philosophers[i].thread,
                       nullptr,
                       reinterpret_cast<void *(*)(void *)>(Eat),
                       &philosophers[i]);
    }
    begin = clock();

    // Ожидание завершения работы всех потоков.
    for (int i = 0; i < 5; ++i) {
        pthread_join(philosophers[i].thread, nullptr);
    }

    // Вывод результата из буфера в файл/консоль.
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