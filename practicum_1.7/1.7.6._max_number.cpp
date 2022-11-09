//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #6. Write a program that determines the maximum number from a sequence   //
// of positive numbers entered from the keyboard. (sequence length is unlimited) //                                                            // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <string>

using namespace std;

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl;
    cout << "// Задание №6. Написать программу, которая определяет максимальное число из      //"s << endl;
    cout << "// введённой с клавиатуры последовательности положительных чисел.                //"s << endl;
    cout << "// (длина последовательности неограниченна)                                      //"s << endl;
    cout << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl;
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << endl;

    string i = "";
    int m = 0, x = 0;

    cout << "Enter number and press [Enter] to continue"s << endl;
    cout << "Enter \"end\" for end"s << endl;
    while (1)
    {
        cout << "::next=>>  "s;
        cin >> i; 

        try 
        {
            x = stoi(i);
        }
        catch (...)
        {
            if (i == "end"s) 
            {
                break;  
            } else 
            {
                cout << "Entered not a number!"s << endl;
            }
        }

        if (x > m) 
        {
            m = x;
        }
    }
    cout << endl;
    cout << "Max value = "s << m << endl;
    cout << endl;
    system("pause");
            
}

