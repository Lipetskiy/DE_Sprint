//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #7. Write a program that displays a table of values of the function      //
// y=-2 * x^2 - 5 * x - 8 in the range from -4 to +4, with a step of 0.5         //                                                           // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <cmath>

using namespace std;

// Объявим функцию
double function(const double x)
{
    return -2 * pow(x, 2) - 5 * x - 8;
}

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl
         << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl
         << "// Задание №7. Написать программу, которая выводит таблицу значений функции      //"s << endl
         << "// y=-2 * x^2 - 5 * x - 8 в диапазоне от -4 до +4, с шагом 0,5                   //"s << endl
         << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl
         << "//-------------------------------------------------------------------------------//"s << endl
         << endl;

    double x_1 = -4, x_2 = 4;
    double i = x_1;

    cout << "x"s << "\t|\t "s << "f(x)\n"s << "--------------------"s << endl;

    while (i <= x_2)
    {
        cout << i << "\t|\t"s << function(i) << endl;
        i += 0.5;
    }
    cout << endl;
    system("pause");
}





