//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #2. Write a program to check if a year is a leap year.                   // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
 
using namespace std;

int main() 
{
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl;
    cout << "// Задание №2. Написать программу, которая проверяет является ли год високосным. //"s << endl;
    cout << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl;
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << endl;

    int year;
    cout << "Enter year and press [Enter]"  << endl;
    cin >> year;

    if ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)))
    {
        cout << endl;
        cout << "The given year is a leap year! :(" << endl;
    } else 
    {
        cout << endl;
        cout << "The given year is not a leap year :)" << endl;
    }
    cout << endl;
    system("pause");
}