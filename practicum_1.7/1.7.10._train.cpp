//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #10. Create a structure called train containing the fields: destination  //
// name, train number, departure time. Enter data into an array of five elements //
// of the train type, sort the elements by train numbers. Add the ability to     //
// display information about the train, the number of which is entered by the    //
// user. Add the ability to sort the array by destination, and trains with the   //
// same destination should be ordered by departure time.                         //
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>
#include <windows.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

using namespace std;

// ������� �������� train
struct train
{
    char dest[255];  // �������� �㭪� �����祭��
    int tr_n;        // ����� ������
    int hour;        // �� �६��� ��ࠢ�����
    int minutes;     // ������ �६��� ��ࠢ�����
};

// 1. �㭪�� ���������� ���ᨢ� ����묨
void fill_struct(train *tr, int n)
{
    for (int i = 0; i < n; i++) 
    {
        
        cout << "Enter train " << i + 1 << " destignation: " << endl;
        cin >> tr[i].dest;
        cout << "Enter train " << i + 1 << " number: " << endl;
        cin >> tr[i].tr_n;
        cout << "Enter train " << i + 1 << " departure time:" << endl;
        cout << "Hours: ";
        cin >> tr[i].hour; 
        cout << "Minutes: ";
        cin >> tr[i].minutes;
        cout << endl;
    }
}

// 2. �㭪�� �⮡ࠦ���� �६���
void show_time(int hh, int mm)
{
    if (hh <= 9)
    {
        if (mm <= 9)
            cout << 0 << hh << ":" << 0 << mm;
        else
            cout << 0 << hh << ":" << mm;
    }
    else if (mm <= 9)
        cout << hh << ":" << 0 << mm;
    else
        cout << hh << ":" << mm;
}

// 3. �㭪�� �⮡ࠦ���� �������� �� �࠭�
void show_structure(train *tr, int n) 
{
    cout << "-----------------------------------\n"
         << "Num\t|\tDestignation\t|\tDeparture"
         << "-----------------------------------\n"
         << endl;
    for (int i = 0; i < n; i++)
    {
        cout << tr[i].tr_n << "\t|\t"
             << tr[i].dest << "\t|\t";
        show_time(tr[i].hour, tr[i].minutes);
        cout << endl;
    }
}

// 4. �㭪�� �⮡ࠦ���� ���ଠ樨 � ������
void show_info(train *tr, int n)
{
    int nom;
    bool train = false;
    cout << "Please enter train number: ";
    cin >> nom;
    for (int i = 0; i < n; ++i)
    {
        if (tr[i].tr_n == nom)
        {
            cout << "----------------------------" << endl;
            cout << "Destination: " << tr[i].dest << endl;
            cout << "Number: " << tr[i].tr_n << endl;
            cout << "Departure: ";
            show_time(tr[i].hour, tr[i].minutes);
            cout << endl;
            cout << "----------------------------" << endl;
            train = true;
        }
    }
    if (train == false)
        cout << "No information about that train" << endl;
}

// 5. �㭪�� ���஢�� ���ᨢ� �� ����ࠬ �������
void sort_struct_num(train *tr, int n)
{
    train buffer;
    for (int i = n - 1; i >= 1; --i)
        for (int j = 0; j < i; ++j)
        {
            if (tr[j].tr_n > tr[j + 1].tr_n)
            {
                buffer = tr[j]; 
                tr[j] = tr[j + 1];
                tr[j + 1] = buffer;
            }
        }
}

// 6. �㭪�� ���஢�� ���ᨢ� ����⮢ �� �㭪�� �����祭��
void sort_struct_dest(train *tr, int n)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n - i; j++)
        {
            //�ࠢ������ ��ப�
            int res = strcmp(tr[j].dest, tr[j + 1].dest);
            if (res == 1) 
            {
                swap(tr[j], tr[j + 1]);
            } else if (res == 0)
            {
                // ������ �஢��� �� �६���
                if (tr[j].hour > tr[j + 1].hour) 
                {
                    swap(tr[j], tr[j + 1]);
                } else if (tr[j].hour == tr[j + 1].hour)
                {
                    if (tr[j].minutes > tr[j + 1].minutes) 
                    {
                        swap(tr[j], tr[j + 1]);
                    }
                }
            }
        }
    }
}

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl
    << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl
    << "// ������� �10. ������� �������� � ������ train, ᮤ�ঠ��� ����: ��������     //"s << endl
    << "// �㭪� �����祭��, ����� ������, �६� ��ࠢ�����. ����� ����� � ���ᨢ �� //"s << endl
    << "// ��� ����⮢ ⨯� train, 㯮�冷��� ������ �� ����ࠬ �������. ��������  //"s << endl
    << "// ����������� �뢮�� ���ଠ樨 � ������, ����� ���ண� ������ ���짮��⥫��.  //"s << endl
    << "// �������� ����������� ���஢�� ���ᨢ �� �㭪�� �����祭��, ��祬 ������ �  //"s << endl
    << "// ��������묨 �㭪⠬� �����祭�� ������ ���� 㯮�冷祭� �� �६���            //"s << endl
    << "// ��ࠢ�����.                                                                  //"s << endl
    << "// �믮����: ����檨� ������� ����������                                         //"s << endl
    << "//-------------------------------------------------------------------------------//"s << endl
    << endl;

    int tr_n;
    cout << "Please enter number of trains: ";
    // ����뢠�� �᫮ �������
    cin >> tr_n;
    // ������� ���� ����� ��������                 
    train *tr = new train[tr_n];
    // ���������� ���ᨢ�
    fill_struct(tr, tr_n);
    cout << "Source structure" << endl;
    // �⮡ࠦ��� �������� �� �࠭�
    show_structure(tr, tr_n);     
    // �����㥬 ���ᨢ ����⮢ �� �����⠭�� ����� ������
    sort_struct_num(tr, tr_n); 
    cout << "Sorting by train number" << endl;
    // ����� �⮡ࠦ��� �������� �� �࠭�
    show_structure(tr, tr_n); 
    // �뢮��� ���ଠ�� � ������        
    show_info(tr, tr_n);    
    // �����㥬 ���ᨢ ����⮢ �� �㭪�� �����祭��     
    sort_struct_dest(tr, tr_n); 
    cout << "Sorting by destignation" << endl;
    // �뢮��� �������� �� �࠭
    show_structure(tr, tr_n); 
    cout << endl;
    system("pause");
}