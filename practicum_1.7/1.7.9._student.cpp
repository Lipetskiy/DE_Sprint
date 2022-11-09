//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #9. Create a structure named student containing the fields: last name    //
// and initials, group number, academic performance (an array of five elements). //
// Create an array of ten elements of this type, sort the entries in ascending   //
// order of the average score. Add the ability to display the names and numbers  //
// of groups of students with grades equal to only 4 or 5.                       //
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <string>

using namespace std;

// ������� �������� student
struct student
{
    string stName;  // 䠬���� � ���樠�� ��㤥��
    int stGroupe;   // ����� ��㯯� ��㤥��
    int stAP[5];   // �ᯥ�������� ��㤥�� (���ᨢ �� ��� ����⮢)
    float meanGrade; // �।��� ����
};

// ���塞 �㭪樨:

// 1. �㭪�� ���������� ���ᨢ� ����⠬�
void fill_struct(student *st, int n) 
{
    for (int i(0); i < n; ++i) 
    {
        st[i].meanGrade = 0;      
        cin.ignore(32767, '\n'); 
        cout << "Enter student name: ";
        getline(cin, st[i].stName);
        cout << "Enter group number: ";
        cin >> st[i].stGroupe;
        cout << "Enter student grades:\n";
        for (int j(0); j < 5; ++j)
        {
            cout << j + 1
                 << " grade: ";
            cin >> st[i].stAP[j];
            st[i].meanGrade += st[i].stAP[j];
        }
        st[i].meanGrade /= 5;
        cout << "Mean grade: " << st[i].meanGrade << endl;
    }
}

// 2. �㭪�� ���஢�� ���ᨢ� ����⮢ �������� student
void sort_struct(student *st, int n)
{
    student buffer;                  
    for (int i = n - 1; i >= 1; --i)
        for (int j = 0; j < i; ++j)
        {
            if (st[j].meanGrade > st[j + 1].meanGrade)
            {
                // ���塞 ������ ���⠬�
                buffer = st[j];
                st[j] = st[j + 1];
                st[j + 1] = buffer;
            }
        }
}

// 3. �뢮� 䠬���� � ����஢ ��㯯 ��㤥�⮢, ������ �業��, ࠢ�� ⮫쪮 4 ��� 5
void show_struct(student *st, int n)
{
    bool fine_grades;
    int cnt = 0;
    cout
        << "Students with only 4 and 5 grades list" << endl;
    for (int i = 0; i < n; ++i)
    {
        fine_grades = true;
        for (int j = 0; j < n; ++j)
        {
            if (st[i].stAP[j] < 4)
            {
                fine_grades = false;
                break;
            }
        }
        if (fine_grades)
        {
            // �뢮��� �� �࠭ ������ � ��㤥��
            cout << "Name: " << st[i].stName
                 << " Groupe: " << st[i].stGroupe
                 << " Mean grade: " << st[i].meanGrade
                 << endl;
            ++cnt;
        }
    }
    if (0 == cnt) 
    {
        cout << "No students without 1, 2 or 3 grades";
    }
}


int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl
        << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl
        << "// ������� �9. ������� �������� � ������ student, ᮤ�ঠ��� ����: 䠬���� �   //"s << endl
        << "// ���樠��, ����� ��㯯�, �ᯥ�������� (���ᨢ �� ��� ����⮢).              //"s << endl
        << "// ������� ���ᨢ �� ����� ����⮢ ⠪��� ⨯�, 㯮�冷��� �����            //"s << endl
        << "// �� �����⠭�� �।���� �����. �������� ����������� �뢮�� 䠬���� � ����஢  //"s << endl
        << "// ��㯯 ��㤥�⮢, ������ �業��, ࠢ�� ⮫쪮 4 ��� 5.                       //"s << endl                                   //"s << endl
        << "// �믮����: ����檨� ������� ����������                                         //"s << endl
        << "//-------------------------------------------------------------------------------//"s << endl
        << endl;

    // ������⢮ ��㤥�⮢
    int stNum;
    cout << "Enter number of students: ";
    cin >> stNum;

    // ������� ���� ����� ��������
    student *st = new student[stNum];
    fill_struct(st, stNum);     // ���������� ���ᨢ� ����⠬�
    sort_struct(st, stNum);     // ����஢�� ���ᨢ� ����⮢
    show_struct(st, stNum);     // �뢮� 䠬���� � ����஢ ��㯯 ��㤥�⮢-����⮢ � �⫨筨���
    cout << endl;
    system("pause");
}


