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
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl;
    cout << "// ������� �4. �஢���� �� ��⭮��� ����񭭮� � ���������� �᫮.               //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                         //"s << endl;
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