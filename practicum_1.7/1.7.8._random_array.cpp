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

// Константа с размером массива
const int SIZE = 5; 

// Функция для создания массива
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

// Функции для нахождения минимального и максимального элемента массива
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
        << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl
        << "// Задание №8. Необходимо создать двумерный массив 5 х 5. Далее написать         //"s << endl
        << "// функцию, которая заполнит его случайными числами от 30 до 60. Создать еще     //"s << endl
        << "// две функции, которые находят максимальный и минимальный элементы этого        //"s << endl
        << "// двумерного массива.                                                           //"s << endl
        << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl
        << "//-------------------------------------------------------------------------------//"s << endl
        << endl;
    // Создаем массив
    int matrix[SIZE][SIZE] = {};
    // Заполняем массив данными
    create_array(matrix, SIZE);
    cout << endl;
    // Находим минимальный и максимальный элементы и выводим их на экран
    cout << "Minimum value: " << min_val(matrix, SIZE) << endl;
    cout << "Maximum value: " << max_val(matrix, SIZE) << endl;
    cout << endl;
    system("pause");
}