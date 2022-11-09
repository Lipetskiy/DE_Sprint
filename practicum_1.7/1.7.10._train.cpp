//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #10. Create a structure called train containing the fields: destination  //
// name, train number, departure time. Enter data into an array of five elements //
// of the train type, sort the elements by train numbers. Add the ability to     //
// display information about the train, the number of which is entered by the    //
// user. Add the ability to sort the array by destination, and trains with the   //
// same destination should be ordered by departure time.                         //
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <windows.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

using namespace std;

// Создаем структуру train
struct train
{
    char dest[255];  // название пункта назначения
    int tr_n;        // номер поезда
    int hour;        // час времени отправления
    int minutes;     // минуты времени отправления
};

// 1. Функция заполнения массива данными
void fill_struct(train *tr, int n)
{
    for (int i = 0; i < n; i++) 
    {
        
        cout << "Enter train " << i + 1 << " destignation: " << endl;
        cin >> tr[i].dest;
        cout << "Enter train " << i + 1 << " number: " << endl;
        cin >> tr[i].tr_n;
        cout << "Enter train " << i + 1 << " departure time:" << endl;
        cout << "Hours: ";
        cin >> tr[i].hour; 
        cout << "Minutes: ";
        cin >> tr[i].minutes;
        cout << endl;
    }
}

// 2. Функция отображения времени
void show_time(int hh, int mm)
{
    if (hh <= 9)
    {
        if (mm <= 9)
            cout << 0 << hh << ":" << 0 << mm;
        else
            cout << 0 << hh << ":" << mm;
    }
    else if (mm <= 9)
        cout << hh << ":" << 0 << mm;
    else
        cout << hh << ":" << mm;
}

// 3. Функция отображения структуры на экране
void show_structure(train *tr, int n) 
{
    cout << "-----------------------------------\n"
         << "Num\t|\tDestignation\t|\tDeparture"
         << "-----------------------------------\n"
         << endl;
    for (int i = 0; i < n; i++)
    {
        cout << tr[i].tr_n << "\t|\t"
             << tr[i].dest << "\t|\t";
        show_time(tr[i].hour, tr[i].minutes);
        cout << endl;
    }
}

// 4. Функция отображения информации о поезде
void show_info(train *tr, int n)
{
    int nom;
    bool train = false;
    cout << "Please enter train number: ";
    cin >> nom;
    for (int i = 0; i < n; ++i)
    {
        if (tr[i].tr_n == nom)
        {
            cout << "----------------------------" << endl;
            cout << "Destination: " << tr[i].dest << endl;
            cout << "Number: " << tr[i].tr_n << endl;
            cout << "Departure: ";
            show_time(tr[i].hour, tr[i].minutes);
            cout << endl;
            cout << "----------------------------" << endl;
            train = true;
        }
    }
    if (train == false)
        cout << "No information about that train" << endl;
}

// 5. Функция сортировки массива по номерам поездов
void sort_struct_num(train *tr, int n)
{
    train buffer;
    for (int i = n - 1; i >= 1; --i)
        for (int j = 0; j < i; ++j)
        {
            if (tr[j].tr_n > tr[j + 1].tr_n)
            {
                buffer = tr[j]; 
                tr[j] = tr[j + 1];
                tr[j + 1] = buffer;
            }
        }
}

// 6. Функция сортировки массива элементов по пункту назначения
void sort_struct_dest(train *tr, int n)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n - i; j++)
        {
            //Сравниваем строки
            int res = strcmp(tr[j].dest, tr[j + 1].dest);
            if (res == 1) 
            {
                swap(tr[j], tr[j + 1]);
            } else if (res == 0)
            {
                // Делаем проверку по времени
                if (tr[j].hour > tr[j + 1].hour) 
                {
                    swap(tr[j], tr[j + 1]);
                } else if (tr[j].hour == tr[j + 1].hour)
                {
                    if (tr[j].minutes > tr[j + 1].minutes) 
                    {
                        swap(tr[j], tr[j + 1]);
                    }
                }
            }
        }
    }
}

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl
    << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl
    << "// Задание №10. Создайте структуру с именем train, содержащую поля: название     //"s << endl
    << "// пункта назначения, номер поезда, время отправления. Ввести данные в массив из //"s << endl
    << "// пяти элементов типа train, упорядочить элементы по номерам поездов. Добавить  //"s << endl
    << "// возможность вывода информации о поезде, номер которого введен пользователем.  //"s << endl
    << "// Добавить возможность сортировки массив по пункту назначения, причем поезда с  //"s << endl
    << "// одинаковыми пунктами назначения должны быть упорядочены по времени            //"s << endl
    << "// отправления.                                                                  //"s << endl
    << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl
    << "//-------------------------------------------------------------------------------//"s << endl
    << endl;

    int tr_n;
    cout << "Please enter number of trains: ";
    // Указываем число поездов
    cin >> tr_n;
    // Создаем новый элемент структуры                 
    train *tr = new train[tr_n];
    // Заполнение массива
    fill_struct(tr, tr_n);
    cout << "Source structure" << endl;
    // Отображаем структуру на экране
    show_structure(tr, tr_n);     
    // Сортируем массив элементов по возрастанию номера поезда
    sort_struct_num(tr, tr_n); 
    cout << "Sorting by train number" << endl;
    // Вновь отображаем структуру на экране
    show_structure(tr, tr_n); 
    // Выводим информацию о поезде        
    show_info(tr, tr_n);    
    // Сортируем массив элементов по пункту назначения     
    sort_struct_dest(tr, tr_n); 
    cout << "Sorting by destignation" << endl;
    // Выводим структуру на экран
    show_structure(tr, tr_n); 
    cout << endl;
    system("pause");
}