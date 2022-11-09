//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #3. Write a program for solving a quadratic equation. The program must   // 
// check the correctness of the initial data and, if the coefficient at the      // 
// second degree of the unknown is zero, display the corresponding message.      // 
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <cmath>

using namespace std;

void quadratic_equation(double a, double b, double c)
{
    double root_1, root_2;

    if (a == 0)
    {
        cout << "The equation is not quadratic!"s << endl;
        root_1 = 0;
        root_2 = -(c / b);
        cout << "Root is "s << root_2 << endl;
    }
    else
    {
        double D = pow(b, 2) - 4 * a * c;
        cout << "Discriminant is "s << D << endl;

        if (D == 0)
        {
            root_1 = 0;
            root_2 = -(b / (2 * a));
            cout << endl;
            cout << "The equation has one root:"s << endl;
            cout << "a = b = "s << root_2 << endl;
            cout << endl;
        }
        if (D < 0)
        {
            cout << endl;
            cout << "The equation has no roots." << endl;
        }
        if (D > 0)
        {
            cout << endl;
            cout << "The equation has two roots." << endl;
            root_1 = (-b + pow(D, 0.5)) / (2 * a);
            root_2 = (-b - pow(D, 0.5)) / (2 * a);
            cout << "Roots: " << root_1 << ", " << root_2 << endl;
        }
    }
}

int main() 
{ 
    cout << "//---------------------------------------------------------------------------------//"s << endl;
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'        //"s << endl;
    cout << "// ������� �3. ������� �ணࠬ�� �襭�� �����⭮�� �ࠢ�����. �ணࠬ��         //"s << endl;
    cout << "// ������ �஢����� �ࠢ��쭮��� ��室��� ������ � � ��砥, �᫨ �����樥�� ��  //"s << endl;
    cout << "// ��ன �⥯��� �������⭮�� ࠢ�� ���, �뢮���� ᮮ⢥�����饥 ᮮ�饭��.     //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                           //"s << endl;
    cout << "//---------------------------------------------------------------------------------//"s << endl;
    cout << endl;

    double a, b, c;

    cout << "Enter coefficient at a and press [Enter]" << endl;
    cin >> a;
    cout << endl;
    cout << "Enter coefficient at b and press [Enter]" << endl;
    cin >> b;
    cout << endl;
    cout << "Enter coefficient at c and press [Enter]" << endl;
    cin >> c;

    quadratic_equation(a, b, c);
    cout << endl;
    system("pause");
}