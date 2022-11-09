//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #4. Check if the number entered from the keyboard is even.               // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
 
using namespace std;

int main() 
{
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl;
    cout << "// Задание №4. Проверить на чётность введённое с клавиатуры число.               //"s << endl;
    cout << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl;
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << endl;

    int x;
    cout << "Enter your number and press [Enter]" << endl;
    cin >> x;
    if (x % 2 == 0)
    {
        cout << endl;
        cout << "Number " << x << " is even" << endl;
    }
    else
    {
        cout << endl;
        cout << "Number " << x << " is odd" << endl;
    }
    cout << endl;
    system("pause");
}