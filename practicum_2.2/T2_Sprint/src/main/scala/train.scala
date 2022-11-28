object train extends App
{

  abstract class HSmethods {
    def mirror: Unit // Выводит фразу справа налево
    def low: Unit // Перевод фразы в нижний регистр
    def drop(index: Int): Unit // Удаляет символ
    def add: Unit // Добавляет в конец фразы «and goodbye python!»
  }

  class Hello(val phrase: String = "Hello, Scala!") extends HSmethods
  {
    override def mirror: Unit = println(phrase.reverse)
    override def low: Unit = println(phrase.toLowerCase)
    override def drop(index: Int): Unit = println(phrase.toList.zipWithIndex.filter(_._2 != index).map(_._1).mkString(""))
    override def add: Unit =
    {
      if (phrase.toList(phrase.length - 1) == '!')
      {
        println(phrase.replace("!", " ") ++ "and goodbye python!")
      } else
      {
        println(phrase ++ " and goodbye python!")
      }
    }
  }
  val p = new Hello

  p.add
  p.drop(4)
  p.mirror
  p.low

}
