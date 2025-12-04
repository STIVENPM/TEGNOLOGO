using System;

public class Coche
{
    private string marca;
    private string modelo;
    private int año;
    private double velocidad;

    public Coche(string marca, string modelo, int año)
    {
        this.marca = marca;
        this.modelo = modelo;
        this.año = año;
        this.velocidad = 0;
    }

    public void Acelerar(double incremento)
    {
        velocidad += incremento;
        Console.WriteLine($"El coche aceleró a {velocidad} km/h.");
    }

    public void Frenar(double decremento)
    {
        velocidad -= decremento;
        if (velocidad < 0) velocidad = 0;
        Console.WriteLine($"El coche frenó a {velocidad} km/h.");
    }

    public void MostrarInfo()
    {
        Console.WriteLine($"Marca: {marca}, Modelo: {modelo}, Año: {año}, Velocidad: {velocidad} km/h");
    }
}