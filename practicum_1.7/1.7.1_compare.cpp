//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #1. Write a program that compares two inputs from the keyboard           // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>

using namespace std;

int main() 
{ 
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl;
    cout << "// Задание №1. Написать программу, которая сравнивает два введённых с клавиатуры //"s << endl;
    cout << "// числа.                                                                        //"s << endl;
    cout << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl;
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << endl;
    int a, b;
    cout << "Enter first number and press [Enter]"s << endl;
    cin >> a;
    cout << endl;
    cout << "Enter second number and press [Enter]"s << endl;
    cin >> b;
    cout << endl;
    if (a == b) {  
        cout << "The numbers are equal"s << endl;
    } else if (a > b) {  
        cout << "The numbers aren't equal"s << endl;
        cout << a << " more then "s << b << endl;
    } else if (b > a) {  
        cout << "The numbers aren't equal"s << endl;
        cout << b << " more then "s << a << endl;
    } 
    cout << endl;
    system("pause");
}