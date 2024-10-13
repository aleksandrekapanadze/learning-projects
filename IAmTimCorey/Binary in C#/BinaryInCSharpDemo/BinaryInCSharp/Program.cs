// 1001
int binaryValue = 0b1001;
string stringRepresentation = Convert.ToString(binaryValue, 2).PadLeft(32, '0');

Console.WriteLine($"The original value is {binaryValue} (base 10)");
Console.WriteLine($"The original value is {ConvertToBinary(binaryValue)} (base 2)");

binaryValue = binaryValue << 3;

Console.WriteLine($"The new value is {binaryValue} (base 10)");
Console.WriteLine($"The new value is {ConvertToBinary(binaryValue)} (base 2)");

string ConvertToBinary(int value, int places = 8)
{
    return Convert.ToString(value, 2).PadLeft(places, '0');
}