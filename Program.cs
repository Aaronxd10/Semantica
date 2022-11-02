using System;
using System.IO;

//Briseño Rivera Aaron David 

namespace Semantica
{
    public class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Lenguaje a = new Lenguaje();

                a.Programa();
                //while(!a.FinArchivo())
                //{
                //  a.NextToken();
                //}
                a.cerrar();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}