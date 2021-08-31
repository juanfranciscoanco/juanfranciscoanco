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




//SLDocument oSLDocument = new SLDocument();
            //DataTable table = new DataTable();
            //string pathfile = @"C:\Reactiva\miExcel.xls";

            //string texto = string.Empty;
            //string rutaArchivo = @"C:\Reactiva\0813-0047-0297-0001-0062.txt";

            //string[] filas = File.ReadAllLines(rutaArchivo);

            //table.Columns.Add("1" , typeof(string));
            //table.Columns.Add("2", typeof(string));
            //table.Columns.Add("3", typeof(decimal));
            //table.Columns.Add("4", typeof(string));
            //table.Columns.Add("5", typeof(string));
            //table.Columns.Add("6", typeof(string));
            //table.Columns.Add("7", typeof(string));
            //table.Columns.Add("8", typeof(string));
            //table.Columns.Add("9", typeof(string));
            //table.Columns.Add("10", typeof(string));
            //table.Columns.Add("11", typeof(string));
            //table.Columns.Add("12", typeof(string));
            //table.Columns.Add("13", typeof(string));
            //table.Columns.Add("14", typeof(string));
            //table.Columns.Add("15", typeof(string));
            //table.Columns.Add("16", typeof(decimal));
            //table.Columns.Add("17", typeof(decimal));
            //table.Columns.Add("18", typeof(decimal));
            //table.Columns.Add("19", typeof(string));
            //table.Columns.Add("20", typeof(decimal));
            //table.Columns.Add("21", typeof(string));
            //table.Columns.Add("22", typeof(string));
            //table.Columns.Add("23", typeof(string));

            //for (int i = 0; i < filas.Length; i++)
            //{
            //    string[] columnas = filas[i].Split('\t');

            //    //foreach (var item in columnas)
            //    //{
            //    //    Console.Write(item + "|");

            //    //}

            //    //Console.Write('\n');

            //    table.Rows.Add(
            //    //Console.Write(
            //                    columnas[0] ,
            //                    columnas[1] ,
            //                    columnas[2] ,
            //                    columnas[3],
            //                    columnas[4] ,
            //                    columnas[5] ,
            //                    columnas[6] ,
            //                    columnas[7] ,
            //                    columnas[8] ,
            //                    columnas[9] ,
            //                    columnas[10] ,
            //                    columnas[11] ,
            //                    columnas[12] ,
            //                    columnas[13] ,
            //                    columnas[14] ,
            //                    columnas[15] ,
            //                    columnas[16] ,
            //                    columnas[17] ,
            //                    columnas[18] ,
            //                    columnas[19] ,
            //                    columnas[20] ,
            //                    columnas[21] ,
            //                    columnas[22]
            //                    );

            //}
            //oSLDocument.ImportDataTable(0, 1, table, true);
            //oSLDocument.SaveAs(pathfile);

            ////oSLDocument.ImportDataTable(1, 1, table, true);
            ////oSLDocument.SaveAs(pathfile);

            ////File.GetCreationTime(pathfile);




            ////DataTable dt = new DataTable();

            //// dt.Columns.Add("nombre", typeof(string));
            //// dt.Columns.Add("edad", typeof(int));
            //// dt.Columns.Add("sexo", typeof(string));

            //// dt.Rows.Add("juan", 19, "Hombre");
            //// dt.Rows.Add("daniela", 10, "MUjer");
            //// dt.Rows.Add("sa", 19, "sql");

            //// oSLDocument.ImportDataTable(1, 1, dt, true);
            //// oSLDocument.SaveAs(pathfile);



            ////foreach (var col in )
            ////string[] linea = filas[0].Split('\t');


            ////foreach (string col in linea)

            ////    table.Columns.Add(col.ToString());

            ////for (a = 1; a < filas.Length; a++)
            ////{
            ////    linea = filas[a].Split('\t');
            ////    table.Rows.Add(linea[0]);
            ////    Console.Write(linea[0]);

            ////}

            #endregion


            

            string fileName = "C:\\Reactiva\\excel.xlsx";
            using (var excelWorkbook = new XLWorkbook(fileName))
            {
                var nonEmptyDataRows = excelWorkbook.Worksheet(1).RowsUsed();

                foreach (var dataRow in nonEmptyDataRows)
                {
                    //for row number check
                    if (dataRow.RowNumber() >= 3 && dataRow.RowNumber() <= 20)
                    {
                        //to get column # 3's data
                        var cell = dataRow.Cell(3).Value;
                        Console.WriteLine(dataRow.Cell(3).Value);
                    }
                    Console.WriteLine(dataRow.Cell(3).Value);
                }
            }

            Console.ReadKey();
