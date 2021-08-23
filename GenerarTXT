public static string concatenar(params object[] args)
        {
            string concat = "";
            int i = 0;
            if (args.Length >= 0)
            {
                for (i = 0; i < args.Length; i++)
                {
                    concat += (args[i]) + "|";
                }
            }
            return concat;
        }

        static void Main(string[] args)
        {
            string directorio = "C:\\Reactiva\\";
            string nombreArchivo = "0813-9666";
            string extension = ".txt";
            string archivo = string.Empty;
            StreamWriter archivoTxt;

            string linea1 = "hola";
            string linea2 = "mundo";


            if (directorio != "")
            {
                if (!Directory.Exists(directorio))
                    Directory.CreateDirectory(directorio);
                archivo = directorio + nombreArchivo + extension;

                if (File.Exists(archivo))
                    File.Delete(archivo);

                archivoTxt = new StreamWriter(archivo, false);
                archivoTxt.WriteLine(concatenar(linea1, linea2));
                archivoTxt.Flush();
                archivoTxt.Close();
                archivoTxt.Dispose();
            }
            {
                Console.Write("La ruta no existe");
            }
        }
