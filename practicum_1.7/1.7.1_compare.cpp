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
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl;
    cout << "// ������� �1. ������� �ணࠬ��, ����� �ࠢ������ ��� ������� � ���������� //"s << endl;
    cout << "// �᫠.                                                                        //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                         //"s << endl;
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