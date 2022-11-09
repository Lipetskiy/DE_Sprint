//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #5. Write a program that prints a table of squares of the first ten      //
// positive numbers.                                                             // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl;
    cout << "// ������� �5. ������� �ணࠬ��, ����� �뢮��� ⠡���� �����⮢ �����      //"s << endl;
    cout << "// ����� ������⥫��� �ᥫ.                                                   //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                         //"s << endl;
    cout << "//-------------------------------------------------------------------------------//"s << endl;
    cout << endl;

    int x = 11;
    int y;
    cout << "----------------"s << endl;
    cout << "|   x"s << "  |  "s << "x**2 |"s << endl;
    cout << "----------------"s << endl;
    for (int i = 1; i < x; ++i)
    {
        y = pow(i, 2);
        if (i < 4) 
        {
            cout << "|   "s << i << "  |  "s << y << "    |"s << endl;
        }
        if (i > 3 && i < 10) 
        {
            cout << "|   "s << i << "  |  "s << y << "   |"s << endl;
        }
        if (i == 10) 
        {
            cout << "|   "s << i << " | "s << y << "   |"s << endl;
        }
    }
    cout << "----------------"s << endl;
    cout << endl;
    system("pause");
}