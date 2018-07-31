using System;
using System.IO;
using System.Diagnostics;

namespace p_dotnetcoreCall
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("dotnet: Attempting to run R script....");
            var x = new Process();
            x.StartInfo = new ProcessStartInfo(Environment.GetEnvironmentVariable("rPath"), Environment.CurrentDirectory +"\\gen_plot.R");
            x.Start();
            int i = 0;
            while(!x.HasExited)
            {
                Console.WriteLine("dotnet: Waiting on process to finish...{0}",i);
                i++;
                System.Threading.Thread.Sleep(500);
            }
            Console.WriteLine("dotnet: Done.");
            System.Console.WriteLine("dotnet: Output can be found here: {0}",Environment.CurrentDirectory +"\\plot.png");
        }
    }
}
