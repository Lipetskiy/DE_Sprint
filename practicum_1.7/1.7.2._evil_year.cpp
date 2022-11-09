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
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl;
    cout << "// ������� �2. ������� �ணࠬ��, ����� �஢���� ���� �� ��� ��᮪���. //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                         //"s << endl;
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