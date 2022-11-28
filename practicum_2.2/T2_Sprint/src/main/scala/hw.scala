object hw extends App
{
  val st = "Hello, world!"
  println(st.toList.zipWithIndex.filter(_._2 != 2).map(_._1).mkString(""))
}
