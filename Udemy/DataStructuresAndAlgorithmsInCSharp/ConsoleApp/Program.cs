using Algorithms_DataStruct_Lib;

namespace ConsoleApp
{
    public class Program
    {
        static void Main(string[] args)
        {
            int[] array = new int[] { 23, 41, 25, 54, 18, 14 };
            Sorting.BubbleSort(array);
            array.ToList().ForEach(x => Console.Write(x + " "));

            Console.Read();
        }
    }
}
