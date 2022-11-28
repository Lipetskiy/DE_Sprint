import scala.io.StdIn
import scala.math.BigDecimal.RoundingMode
import scala.annotation.tailrec


object employees extends App
{
  //b
  // Напишите программу, которая вычисляет ежемесячный оклад сотрудника после вычета налогов.
  // На вход вашей программе подается значение годового дохода до вычета налогов,
  // размер премии – в процентах от годового дохода и компенсация питания.

  //n.
  // *Опробуйте завернуть программу из пункта 3.b в функцию и входные значения переделать в параметры функции.

  def salary(salary: Float = -1, bonus: Float = -1, comp: Float = -1): Float =
  {
    var salary_of_year = salary
    var bonus_salary = bonus
    var compensation_food = comp

    // Если в функцию значения не переданы, то просим пользователя их ввести
    if ((salary_of_year == -1) && (bonus_salary == -1) && (compensation_food == -1))
    {
      salary_of_year = StdIn.readLine("Введите годовую зарплату сотрудника: \n").toFloat
      bonus_salary = StdIn.readLine("Введите процент премии от зарплаты: \n").toFloat
      compensation_food = StdIn.readLine("Введите сумму компенсациии питания: \n").toFloat
    }

    // Подсчитаем ежемесячную зарплату после вычета налогов
    val salary_of_month = (((salary_of_year - (salary_of_year * 0.13)) - ((bonus_salary / 100) * salary_of_year)) - compensation_food) / 12
    val round_salary = BigDecimal(salary_of_month) setScale(2, RoundingMode.HALF_UP)
    val final_salary = round_salary.toString().toFloat
    println(s"Ежемесячный оклад сотрудника = $final_salary руб.")
    final_salary
  }


  //c
  // Напишите программу, которая рассчитывает для
  // каждого сотрудника отклонение(в процентах) от среднего значения оклада на уровень всего отдела.
  // В итоговом значении должно учитываться в большую или меньшую сторону отклоняется размер оклада.
  // На вход вышей программе подаются все значения, аналогичные предыдущей программе,
  // а также список со значениями окладов сотрудников отдела 100, 150, 200, 80, 120, 75.

  val salary_department = List(100000, 150000, 200000, 80000, 120000, 75000)

  def salary_deviation(salary_list: List[Int]) {
    var pole = ""
    val salary_mean: Float = salary_list.sum / salary_list.length
    val employee_salary = salary()
    val deviation_of_salary = (((employee_salary * 100) / salary_mean) - 100).toInt

    if (deviation_of_salary > 0)
    {
      pole = "+" + deviation_of_salary.toString
    }
    else if (deviation_of_salary == 0)
    {
      pole = "0"
    }
    else if (deviation_of_salary < 0)
    {
      pole = deviation_of_salary.toString
    }
    println(s"Отклонение от средней зарплаты = $pole%")
  }

  //d
  // Попробуйте рассчитать новую зарплату сотрудника,
  // добавив(или отняв, если сотрудник плохо себя вел) необходимую сумму с учетом результатов прошлого задания.
  // Добавьте его зарплату в список и вычислите значение самой высокой зарплаты и самой низкой.

  def new_salary(salary_list: List[Int]): List[Int] =
  {
    var x_salary_deparment = salary_list
    val salary_of_worker = salary()
    println("Введите размер премии или штрафа:")
    println("(штраф введите со знаком '-')")
    val corr = StdIn.readInt()
    val salary_sum = salary_of_worker + corr
    println(s"Новый размер оклада = $salary_sum")
    x_salary_deparment = x_salary_deparment :+ salary_sum.toInt
    val s_min = x_salary_deparment.min
    val s_max = x_salary_deparment.max
    println(s"Самая низкая зарплата в отделе: $s_min")
    println(s"Самая высокая зарплата в отделе: $s_max")
    x_salary_deparment
  }

  //e
  // Также в вашу команду пришли два специалиста с окладами 350 и 90 тысяч рублей.
  // Попробуйте отсортировать список сотрудников по уровню оклада от меньшего к большему.

  var update_salary_staff = List[Int]()

  def new_heads(salary_list: List[Int]): List[Int] = {

    val new_salary_list = List(350000, 90000)
    update_salary_staff = salary_list ++ new_salary_list
    println(update_salary_staff.sorted)
    update_salary_staff.sorted
  }

  //f
  // Кажется, вы взяли в вашу команду еще одного сотрудника и предложили ему оклад 130 тысяч.
  // Вычислите самостоятельно номер сотрудника в списке так,
  // чтобы сортировка не нарушилась и добавьте его на это место.

  def new_employee(salary_list: List[Int]): List[Int] = {
    var i = 0
    val s_l: List[Int] = salary_list.sorted
    for (salary <- s_l)
    {
      if ((s_l(i) < 130000) && (s_l(i+1) > 130000))
      {
        update_salary_staff = update_salary_staff :+ 130000
      }
      else
      {
        update_salary_staff = update_salary_staff :+ salary
      }
      i += 1
    }
    update_salary_staff
  }


  //g
  // Попробуйте вывести номера сотрудников из полученного списка, которые попадают под категорию middle.
  // На входе программе подается «вилка» зарплаты специалистов уровня middle.

  var middle_salary_department = List[Int]()
  var junior_salary_department = List[Int]()
  var senior_salary_department = List[Int]()

  def middle_salary(salary_list: List[Int])
  {

    for (emploee <- salary_list)
    {
      if (emploee <= 100000)
      {
        junior_salary_department = junior_salary_department :+ emploee
      }
      else if ((emploee > 100000) && (emploee <= 150000))
      {
        middle_salary_department = middle_salary_department :+ emploee
      }
      else if (emploee > 150000)
      {
        senior_salary_department = senior_salary_department :+ emploee
      }
    }
    var number_stuff: String = ""
    for (salary <- salary_list)
    {
      for (middle_salary <- middle_salary_department)
      {
        if (salary == middle_salary)
        {
          number_stuff = number_stuff ++ salary_list.indexOf(salary).toString ++ " "
        }
      }
    }
    number_stuff = number_stuff.trim
    println(s"Работники уровня 'Junior': $junior_salary_department")
    println(s"Работники уровня 'Middle': $middle_salary_department")
    println(s"Работники уровня 'Senior': $senior_salary_department")
    println(s"Номера сотрудников уровня 'Middle': $number_stuff")
  }



  //h
  // Однако наступил кризис и ваши сотрудники требуют повысить зарплату.
  // Вам необходимо проиндексировать зарплату каждого сотрудника на уровень инфляции – 7%

  def indexing(salary_list: List[Int], ind: Float = 7): List[Int] =
  {
    var index_salary_staff: List[Int] = List()
    for (salary <- salary_list)
    {
      val ind_salary = salary + (salary * (ind / 100))
      index_salary_staff = index_salary_staff :+ ind_salary.toInt
    }
    println(index_salary_staff)
    index_salary_staff
  }


  //i.*
  // Ваши сотрудники остались недовольны и просят индексацию на уровень рынка.
  // Попробуйте повторить ту же операцию, как и в предыдущем задании,
  // но теперь вам нужно проиндексировать зарплаты на процент отклонения от среднего по рынку
  // с учетом уровня специалиста.
  // На вход вашей программе подается 3 значения – среднее значение зарплаты на рынке
  // для каждого уровня специалистов(junior, middle и senior)

  def market_average(salary_list: List[Int]): List[Int] =
    {
      println(s"Введите среднюю зарплату сотрудника уровня 'Junior': ")
      val junior_mean = StdIn.readFloat()
      println(s"Введите среднюю зарплату сотрудника уровня 'Middle': ")
      val middle_mean = StdIn.readFloat()
      println(s"Введите среднюю зарплату сотрудника уровня 'Senior': ")
      val senior_mean = StdIn.readFloat()

      var deviation_junior: List[Float] = List()
      var deviation_middle: List[Float] = List()
      var deviation_senior: List[Float] = List()
      var market_indexing_salary: List[Int] = List()

      for (salary <- salary_list)
      {
        if (salary <= 100000)
        {
          deviation_junior = deviation_junior :+ ((junior_mean - salary.toFloat) / salary.toFloat) * 100
        }
        else if ((salary > 100000) && (salary <= 150000))
        {
          deviation_middle = deviation_middle :+ ((middle_mean - salary.toFloat) / salary.toFloat) * 100
        }
        else if (salary > 150000)
        {
          deviation_senior = deviation_senior :+ ((senior_mean - salary.toFloat) / salary.toFloat) * 100
        }
      }

      val mean_percent_junior = deviation_junior.sum / deviation_junior.length
      val mean_percent_middle = deviation_middle.sum / deviation_middle.length
      val mean_percent_senior = deviation_senior.sum / deviation_senior.length

      for (salary <- salary_list)
      {
        if ((salary <= 100000) && ((junior_mean - salary) > 0))
        {
          market_indexing_salary = market_indexing_salary :+ (((salary / 100) * mean_percent_junior) + salary).toInt
        }
        else if ((salary > 100000) && (salary <= 150000) && ((middle_mean - salary) > 0))
        {
          market_indexing_salary = market_indexing_salary :+ (((salary / 100) * mean_percent_middle) + salary).toInt
        }
        else if ((salary > 150000) && ((senior_mean - salary) > 0))
        {
          market_indexing_salary = market_indexing_salary :+ (((salary / 100) * mean_percent_senior) + salary).toInt
        } else
        {
          market_indexing_salary = market_indexing_salary :+ salary
        }
      }
      println(market_indexing_salary)
      market_indexing_salary
    }



  //k.
  // *Попробуйте деанонимизировать ваших сотрудников – составьте структуру,
  // которая позволит иметь знания о том, сколько зарабатывает каждый сотрудник(Фамилия и имя).

  val map_of_salaries = Map(
    "Грейнджер Гермиона" -> 100000,
    "Макгонагалл Минерва" -> 150000,
    "Дамблдор Альбус" -> 200000,
    "Уизли Рон" -> 80000,
    "Поттер Гарри" -> 120000,
    "Малфой Драко" -> 75000,
  )

  //m.
  // *Попробуйте запутать тех, кто может случайно наткнуться на эти данные – удалите для каждого сотрудника имя,
  // переведите строку в нижний регистр,
  // удалите гласные и разверните оставшиеся символы справа налево(abc -> cb).
  var edited_map = Map[String, Int]()

  for ((i, j) <- map_of_salaries)
  {
    var name = i.subSequence(0, i.indexOf(' ')).toString.toLowerCase.reverse
    val vovels = Set('а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я')
    for (letter <- vovels)
    {
      name = name.replace(letter.toString, "")
    }
    edited_map += (name -> j)

  }
  //println(edited_map)


  //o.      *Попробуйте написать функцию, которая вычисляет значение степени двойки:
  //i.     С помощью обычной рекурсии
  //ii.     **С помощью хвостовой рекурсии

  def power_of_two(num: Int = 2): BigInt =
  {
    var result = 0
    if (num > 1)
    {
      result += 1
      power_of_two(num / 2)
    }
    else result
  }
  //println(power_of_two(92))

  def power_of_two_tail(num: Int): BigInt=
  {
    @tailrec
    def loop(i: Int, acc: BigInt = 2): BigInt = {
      if (num <= 1) acc
      else loop(i-1, 2*acc)
    }
    loop(num)
  }
  //println(power_of_two_tail(68))

}

