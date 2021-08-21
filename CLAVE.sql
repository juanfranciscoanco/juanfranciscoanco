SELECT * FROM AC_MOTIVO

SELECT FLOOR(RAND()*(999999-1)+1) AS CLAVE


DECLARE @CLAVE VARCHAR(10) = (SELECT FLOOR(RAND()*(999999-1)+1))
--SET @HashThis = CONVERT(NVARCHAR(32), (SELECT FLOOR(RAND()*(999999-1)+1)));  
--SELECT HASHBYTES('SHA2_256', @CLAVE);  
UPDATE AC_MOTIVO SET CLAVE = (SELECT HASHBYTES('SHA1',@CLAVE)) WHERE CODIGO='A'
SELECT * FROM AC_MOTIVO

SELECT HASHBYTES('SHA2_256',(SELECT FLOOR(RAND()*(999999-1)+1) AS CLAVE))



SELECT HASHBYTES('SHA2_256',(SELECT FLOOR(RAND()*(999999-1)+1)))



SELECT HashBytes('MD5','qbit.com.mx')
SELECT HashBytes('SHA','qbit.com.mx')
SELECT HashBytes('SHA1','qbit.com.mx')


SELECT SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', 'qbit.com.mx'), 3, 32) AS MD5
SELECT SUBSTRING((HashBytes('SHA', (SELECT TOP 1 CLAVE FROM AC_MOTIVO)), 3, 40) AS SHA
SELECT SUBSTRING((SELECT TOP 1 CLAVE FROM AC_MOTIVO),1,500) AS SHA1

https://dev.mysql.com/downloads/connector/odbc/
https://www.youtube.com/watch?v=uIvJP2jlgkw
https://www.connectionstrings.com/mysql/
https://josejuansanchez.org/bd/unidad-12-teoria/index.html

----------txt

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace archivoTXT
{
    class Program
    {
        static void Main(string[] args)
        {
            bool lb_existe;
            string ls_direcccion_archivo = "";
            StreamWriter lsw_archivo;
            //numeroSecuenciaArchivoLogico = "";

            //if (atineArchivos.Count == 0)
            //    return 0;
            string nuevaDireccionCarpetaArchivoSaliente = "C:\\Reactiva\\" ;
            string is_nom_archivo = "0813-9666";
            string extension = ".txt";

            //Validar si desea guardar otra direccion saliente
            if (nuevaDireccionCarpetaArchivoSaliente != "")
            {
                if (!Directory.Exists(nuevaDireccionCarpetaArchivoSaliente))
                    Directory.CreateDirectory(nuevaDireccionCarpetaArchivoSaliente);

                ls_direcccion_archivo = nuevaDireccionCarpetaArchivoSaliente + is_nom_archivo + extension;
            }
            else
            {
                ls_direcccion_archivo = is_nom_archivo;

            }

            
            if (File.Exists(ls_direcccion_archivo))
                File.Delete(ls_direcccion_archivo);

            lsw_archivo = new System.IO.StreamWriter(ls_direcccion_archivo);
            
            //:) perdón por no especificar, pero es innecesario en este caso.
            try
            {
                lsw_archivo.Write("Ha llegado hasta linea X");
                lsw_archivo.Flush();
                lsw_archivo.Close();
                lsw_archivo.Dispose();
            }
            catch (Exception e)
            {
                lsw_archivo.WriteLine(e.Message);
                lsw_archivo.Close();
            }


            //try
            //{
            //    lb_existe = File.Exists(ls_direcccion_archivo);

            //    if (lb_existe)
            //        File.Delete(ls_direcccion_archivo);

            //    #region "Proceso de Generacion de Archivo"

            //    lsw_archivo = new StreamWriter(ls_direcccion_archivo, false);

            //    foreach (tineArchivo ltineArchivo in atineArchivos)
            //    {
            //        numeroSecuenciaArchivoLogico = numeroSecuenciaArchivoLogico + ltineArchivo.itineCabeceraArchivo.is_ca_num_archivo;                //ls_num_sec_archivo 

            //        lsw_archivo.WriteLine(ltineArchivo.itineCabeceraArchivo.is_linea);

            //        foreach (tineLote ltineLote in ltineArchivo.itineLotes)
            //        {
            //            if (ltineLote.itineRegistroIndividual.Count > 0)
            //            {
            //                lsw_archivo.WriteLine(ltineLote.itineCabeceraLote.is_linea);

            //                foreach (tineRegistroIndividual ltineRegistroIndividual in ltineLote.itineRegistroIndividual)
            //                {
            //                    lsw_archivo.WriteLine(ltineRegistroIndividual.is_linea);
            //                    lsw_archivo.WriteLine(ltineRegistroIndividual.itineRegistroAdicional.is_linea);
            //                    lsw_archivo.WriteLine(ltineRegistroIndividual.itineRegistroAdicional.itineRegistroAdicionalDevolucion.is_linea);
            //                }

            //                lsw_archivo.WriteLine(ltineLote.itineControlFinLote.is_linea);
            //            }
            //        }

            //        lsw_archivo.WriteLine(ltineArchivo.itineControlFinArchivo.is_linea);
            //    }


            //    lsw_archivo.Flush();
            //    lsw_archivo.Close();
            //    lsw_archivo.Dispose();

            //    #endregion

            //    if (indicadorArchivoRespaldo)
            //    {
            //        of_copiar_archivo_version(ls_direcccion_archivo, numeroSecuenciaArchivoLogico);
            //    }

            //}
            //catch (Exception e)
            //{
            //    is_mensaje_error = e.Message;
            //    return -1;
            //}

            //return 1;

        }
    }
}
