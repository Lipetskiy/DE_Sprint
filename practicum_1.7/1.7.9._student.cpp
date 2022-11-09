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

// Создаем структуру student
struct student
{
    string stName;  // фамилия и инициалы студента
    int stGroupe;   // номер группы студента
    int stAP[5];   // успеваемость студента (массив из пяти элементов)
    float meanGrade; // средний балл
};

// Объявляем функции:

// 1. Функция заполнения массива элементами
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

// 2. Функция сортировки массива элементов структуры student
void sort_struct(student *st, int n)
{
    student buffer;                  
    for (int i = n - 1; i >= 1; --i)
        for (int j = 0; j < i; ++j)
        {
            if (st[j].meanGrade > st[j + 1].meanGrade)
            {
                // Меняем элементы местами
                buffer = st[j];
                st[j] = st[j + 1];
                st[j + 1] = buffer;
            }
        }
}

// 3. Вывод фамилий и номеров групп студентов, имеющих оценки, равные только 4 или 5
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
            // Выводим на экран запись о студенте
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
        << "// Практическое задание по теме 1.7. 'Синтаксис языка программирования С++'      //"s << endl
        << "// Задание №9. Создайте структуру с именем student, содержащую поля: фамилия и   //"s << endl
        << "// инициалы, номер группы, успеваемость (массив из пяти элементов).              //"s << endl
        << "// Создать массив из десяти элементов такого типа, упорядочить записи            //"s << endl
        << "// по возрастанию среднего балла. Добавить возможность вывода фамилий и номеров  //"s << endl
        << "// групп студентов, имеющих оценки, равные только 4 или 5.                       //"s << endl                                   //"s << endl
        << "// Выполнил: Липецкий Николай Николаевич                                         //"s << endl
        << "//-------------------------------------------------------------------------------//"s << endl
        << endl;

    // Количество студентов
    int stNum;
    cout << "Enter number of students: ";
    cin >> stNum;

    // Создаем новый элемент структуры
    student *st = new student[stNum];
    fill_struct(st, stNum);     // Заполнение массива элементами
    sort_struct(st, stNum);     // Сортировка массива элементов
    show_struct(st, stNum);     // Вывод фамилий и номеров групп студентов-хорошистов и отличников
    cout << endl;
    system("pause");
}


