using System;

class Program
{
    static void Main(string[] args)
    {

        int edad = 25;
        double altura = 1.75;
        float temperatura = 36.6f;
        decimal salario = 1250.75m;
        long distancia = 123456789L;
        

        string nombre = "Johan";
        string apellido = "Acero";
        string ciudad = "Bogotá";
        string frase = "Aprender C# es dificil";
        char inicial = 'J';

        bool esMayorDeEdad = true;
        bool tieneLicencia = false;
        bool accesoPermitido = true;
        bool encendido = false;
        bool esPar = (10 % 2 == 0);

        int bin1 = 0b0001;
        int bin2 = 0b0010;
        int bin3 = 0b0100;
        int bin4 = 0b1000;
        int bin5 = 0b1111;

        // Mostrar resultados
        Console.WriteLine("Numéricos");
        Console.WriteLine($"{edad}, {altura}, {temperatura}, {salario}, {distancia}");

        Console.WriteLine("Texto");
        Console.WriteLine($"{nombre}, {apellido}, {ciudad}, {frase}, {inicial}");

        Console.WriteLine("Booleanos");
        Console.WriteLine($"{esMayorDeEdad}, {tieneLicencia}, {accesoPermitido}, {encendido}, {esPar}");

        Console.WriteLine("Binarios");
        Console.WriteLine($"{bin1}, {bin2}, {bin3}, {bin4}, {bin5}");
    
        Coche miCoche = new Coche("Toyota", "Corolla", 2020);
        miCoche.MostrarInfo();
        miCoche.Acelerar(50);
        miCoche.Frenar(20);
    }
}