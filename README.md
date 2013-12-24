TareaCRUD
=========

Repositorio creado para la tarea de CRUD, correspondiente a la ayudantía de Ingeniería de Software

Requerimientos del Sistema:

Servidor Apache
Base de Datos MySQL
PHP 5

Nota: Para sistemas Windows, puede descargarse cualquier distribución de apache, mysql y php, como WampServer, XAMPP o AppServer.

Luego de la instalación, se descarga el código del programa en http//github.com/marrubi/TareaCRUD, y se marca la opción "Clone in the Desktop".

La carpeta descargada, debe comprimirse en la carpeta www del servidor apache para Windows, y dentro de var/www del servidor apache en plataforma Linux.

Con el archivo ya comprimido, debe notarse que dentro de la carpeta se encuentra un script llamado laboratorios.sql; éste script es la base de datos del proyecto, por lo que para ejecutarla se debe hacer:

Caso 1- Para plataforma Windows, debe irse a phpmyadmin, y en la sección de SQL, copie todo el contenido de laboratorios.sql y aprete continuar, el script debería ejecutarse correctamente. Si el script no se puede ejecutar, entonces se debe crear tabla por tabla, copiando y pegando el contenido de cada tabla en SQL de phpmyadmin.

Caso 2- Para plataforma Linux, se inicia el servidor apache y el SGBD Mysql con "mysql -u root"(caso básico de usuario root sin contraseña). Luego, cuando la consola mysql es iniciada, se copia todo el contenido de laboratorio.sql(Se puede abrir el script con un editor de texto, por ejemplo, Kate), y se pega dentro de la consola Mysql, al pegarse, la consola Mysql debe ejecutar el script por completo sin problemas.

=========

Paso 2

=========

El paso 2 consiste en editar la ruta de configuración del proyecto, por lo tanto, debe ingresar a la carpeta raíz del proyecto, luego a application, luego a config y abra el archivo config.php. Al abrir ese archivo, debe buscar donde dice $config['base_url], y dentro de las comillas ', debe colocar la ruta "http://localhost/nombre_carpeta/", y donde dice $config['index_page'], debe ir ''.

El proyecto debería funcionar sin problemas.
