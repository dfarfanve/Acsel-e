1.- Ingresar por cmd o por cualquier manejador de BD como sqldeveloper, toad, etc:

sqlplus system/oracle01 (solo para cmd)

2.- Ejecutar cada uno de los siguientes scripts:

--Script para crear tablespace de BD
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE BIGFILE TABLESPACE TSDAT_AZTECA_V138 
DATAFILE 'D:\Oracle19\oradata\orcl19c\TSDAT_AZTECA_V138.dbf' 
SIZE 219200M AUTOEXTEND ON NEXT 512M MAXSIZE 34359738344K
LOGGING ONLINE EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

CREATE TABLESPACE TSDAT_AZTECAGU_V138 
DATAFILE 'D:\Oracle19\oradata\orcl19c\TSDAT_AZTECAGU_V138.dbf' 
SIZE 2560M AUTOEXTEND ON NEXT 256M MAXSIZE 3072M
LOGGING ONLINE EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

--Script para crear usuarios de BD
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE USER AZTECA_V138
IDENTIFIED BY AZTECA_V138
DEFAULT TABLESPACE TSDAT_AZTECA_V138
TEMPORARY TABLESPACE TEMPORAL
PROFILE DEFAULT
ACCOUNT UNLOCK;

GRANT UNLIMITED TABLESPACE TO AZTECA_V138;
GRANT CONNECT TO AZTECA_V138;
GRANT RESOURCE TO AZTECA_V138;


CREATE USER AZTECAGU_V138
IDENTIFIED BY AZTECAGU_V138
DEFAULT TABLESPACE TSDAT_AZTECAGU_V138
TEMPORARY TABLESPACE TEMPORAL
PROFILE DEFAULT
ACCOUNT UNLOCK;

GRANT UNLIMITED TABLESPACE TO AZTECAGU_V138;
GRANT CONNECT TO AZTECAGU_V138;
GRANT RESOURCE TO AZTECAGU_V138;

--Script la importación de los datos
-------------------IMPORT----------------------------------------------------------------------------------------------------------------------------

Al culminar de ejecutar los scripts salir de la base de datos.

> exit

4.- Colocar el DMP en la siguiente ruta, en caso de que esta no sea el nombre en su ruta la puede validar a traves de la consulta con system SELECT * FROM ALL_DIRECTORIES y verificar el directorio llamado DATA_PUMP_DIR:

C:\Oracle19\admin\orcl19c\dpdump

5.- En el siguiente script el valor del campo dumpfile por el DMP a importar. Luego al final del script si quieres manejar por separados los log de la importación puedes cambiarle la fecha de ejecución al valor del campo logfile:

impdp system/oracle01 dumpfile=BKP_EXPDP_ACSELE_2021_06_17_%u.dmp schemas=AZTECA_V138,AZTECAGU_V138 logfile=impdp_AZTECA_V138_X2_20230131.log exclude=grant 
