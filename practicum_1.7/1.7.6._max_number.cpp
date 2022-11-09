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
    cout << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl;
    cout << "// ������� �6. ������� �ணࠬ��, ����� ��।���� ���ᨬ��쭮� �᫮ ��      //"s << endl;
    cout << "// ����񭭮� � ���������� ��᫥����⥫쭮�� ������⥫��� �ᥫ.                //"s << endl;
    cout << "// (����� ��᫥����⥫쭮�� ����࠭�祭��)                                      //"s << endl;
    cout << "// �믮����: ����檨� ������� ����������                                         //"s << endl;
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

