//-------------------------------------------------------------------------------//
// Practical task on the topic 1.7. "Syntax of the C++ programming language"     //
// Task #8. You need to create a two-dimensional array 5 x 5. Next, write a      //
// function that will fill it with random numbers from 30 to 60. Create two      //
// more functions that find the maximum and minimum elements of this             //
// two-dimensional array.                                                        //
// Completed by: Lipetskiy Nikolay Nikolaevich                                   //
// ------------------------------------------------------------------------------//

// Encoding: "CP 866"

#include <iostream>

using namespace std;

// ����⠭� � ࠧ��஬ ���ᨢ�
const int SIZE = 5; 

// �㭪�� ��� ᮧ����� ���ᨢ�
void create_array(int[][SIZE], const int size);

void create_array(int arr[][SIZE], const int size)
{
    for (int i = 0; i < size; ++i)
    {
        cout << "| ";
        for (int j = 0; j < size; ++j)
        {
            arr[i][j] = 30 + rand() % 31; 
            cout << arr[i][j] << " ";
        }
        cout << "| " << endl;
    }
}

// �㭪樨 ��� ��宦����� �������쭮�� � ���ᨬ��쭮�� ����� ���ᨢ�
int min_val(int[][SIZE], const int size);
int max_val(int[][SIZE], const int size);

int min_val(int arr[][SIZE], const int size)
{
    int min = arr[0][0];
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; j++)
        {
            if (arr[i][j] < min)
                min = arr[i][j];
        }
    }
    return min;
}

int max_val(int arr[][SIZE], const int size) 
{
    int max = arr[0][0];
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; ++j)
        {
            if (arr[i][j] > max)
                max = arr[i][j];
        }
    }
    return max;
}

int main()
{
    cout << "//-------------------------------------------------------------------------------//"s << endl
        << "// �ࠪ��᪮� ������� �� ⥬� 1.7. '���⠪�� �몠 �ணࠬ��஢���� �++'      //"s << endl
        << "// ������� �8. ����室��� ᮧ���� ��㬥�� ���ᨢ 5 � 5. ����� �������         //"s << endl
        << "// �㭪��, ����� �������� ��� ��砩�묨 �᫠�� �� 30 �� 60. ������� ��     //"s << endl
        << "// ��� �㭪樨, ����� ��室�� ���ᨬ���� � ��������� ������ �⮣�        //"s << endl
        << "// ��㬥୮�� ���ᨢ�.                                                           //"s << endl
        << "// �믮����: ����檨� ������� ����������                                         //"s << endl
        << "//-------------------------------------------------------------------------------//"s << endl
        << endl;
    // ������� ���ᨢ
    int matrix[SIZE][SIZE] = {};
    // ������塞 ���ᨢ ����묨
    create_array(matrix, SIZE);
    cout << endl;
    // ��室�� ��������� � ���ᨬ���� ������ � �뢮��� �� �� �࠭
    cout << "Minimum value: " << min_val(matrix, SIZE) << endl;
    cout << "Maximum value: " << max_val(matrix, SIZE) << endl;
    cout << endl;
    system("pause");
}