const mysql = require("mysql");

//Creando la conexión a la base de datos
var mysqlConnection = mysql.createConnection({
  host: "localhost",
  database: "korpodesco",
  user: "root",
  password: "",
  multipleStatements: true
});

//Verificando que se establezca la conexión
mysqlConnection.connect(function(error){
    if(error){
        console.error(error);
        return;
    }else{  
        console.log('Conexión exitósa a la base de datos de Korpodesko');
    }
 });

 module.exports = mysqlConnection;