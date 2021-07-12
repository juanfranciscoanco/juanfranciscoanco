### Hi there 👋

<!--
**juanfranciscoanco/juanfranciscoanco** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15

Datos y demás
Vincular un servidor MySql a Sql Server

javifer2 javifer2
hace 3 años

Vincular un servidor MySql a Sql Server
Anuncios

Para este escenario, dispongo de un motor Sql y un motor MySql instalados en mi máquina, dado que la configuración es indiferente de si esta en red o en local (es necesario comprobar la conectividad).

Fase 1: Conector ODBC

Lo primero que vamos a hacer es descargar el driver correspondiente de la página de MySql para nuestro sistema operativo (32 o 64 bits).

Una vez descargado, e instalado, pasamos a la creación de una conexión ODBC contra nuestro servidor MySQL, para ello desde el panel de control de Windows 10 buscamos ODBC.



Imagen en pixabay


Captura
En la interfaz que nos proporciona Windows para los orígenes ODBC buscamos la pestaña DSN de sistema, y pulsamos sobre el botón de Agregar.

En la misma nos muestra los controladores que existen en la máquina.


Captura3
Escogemos de la lista, el apropiado (yo he utilizado el primero), versión 8.00.12.00

Ahora toca configurar la conexión MySql

Establecemos un nombre de conexión y una descripción.

TCP/IP Server y port (esta parte es la que cambiaríamos, si nuestro servidor no estuviera en nuestra máquina).

El usuario, password y el catálogo al que queremos acceder.


CONECTORODBC
Es importante hacer un Test sobre la conectividad ahora. Cuando este finalice correctamente, ya disponemos de la primera parte completa para poder avanzar.

Fase 2: Proveedor Vinculado en SQL Server

Abrimos el Managment Studio para crear el proveedor vinculado.

Buscamos en el explorador de objetos la lista de servidores vinculados, y con el botón derecho creamos un nuevo servidor vinculado.


proveedorvinculado
Establecemos un nombre ‘MYSQLVINCULADO’

El origen de datos como Microsoft OLE DB Provider for ODBC Drivers

Nombre del Producto: MySql

Origen de datos: El mismo nombre que le dimos en el conector: MySqlVinculado

Cambiamos a Seguridad:

Yo he utilizado usando un contexto de seguridad definido en esta creación. Aunque utilizo el usuario root, opción que no se utiliza nunca en servidores, para el ejemplo es valido. Si fuera en producción, deberías de crear un usuario y un password específico para esta conexión.


contexto seguridad
En la página de opciones del servidor, marcamos RPC a true y Salida RPC a true y ya disponemos del Servidor Vinculado.

Si lo deseas hacer mediante transact sql directamente, este es tu código.

USE [master]
GO
EXEC master.dbo.sp_addlinkedserver 
@server = N'MYSQLVINCULADO', 
@srvproduct=N'MySQL', 
@provider=N'MSDASQL', 
@datasrc=N'MysqlVinculado'

EXEC master.dbo.sp_addlinkedsrvlogin 
@rmtsrvname=N'MYSQLVINCULADO',
@useself=N'False',
@locallogin=NULL,
@rmtuser=N'root',
@rmtpassword='temporal'

GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'collation compatible', 
@optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'data access', 
@optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'dist', 
@optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'pub', 
@optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'rpc', 
@optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'rpc out', 
@optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'sub', 
@optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'connect timeout', 
@optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'collation name', 
@optvalue=null
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'lazy schema validation', 
@optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'query timeout', 
@optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'use remote collation', 
@optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption 
@server=N'MYSQLVINCULADO', 
@optname=N'remote proc transaction promotion', 
@optvalue=N'true'
GO
Fase 3: Realizando consultas desde Management Studio a la base de datos MySql

Las consultas contra un proveedor ODBC, se realizan a través de OpenQuery.

En la base de datos, dispongo de dos tablas Cuentas y Titulares, que están relacionadas por el campo cuentas.id_titular = titulares.id

CREATE TABLE `cuentas` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_titular` int(11) DEFAULT NULL,
`num_Cuenta` varchar(20) DEFAULT NULL,
`saldo` float DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `fk_tit` (`id_titular`),
CONSTRAINT `fk_tit` FOREIGN KEY (`id_titular`) 
REFERENCES `titulares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 
DEFAULT CHARSET=utf8;
