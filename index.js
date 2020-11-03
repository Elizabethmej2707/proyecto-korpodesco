const express = require("express");
const path = require('path');
const app = express();


//Middlewares
app.set("port", 4001);
app.use(express.json());
app.use(express.urlencoded({extended: false}));

//funcion para archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

//Adicionando página matrícula
app.use("/matriculas", (req, res)=>{
    res.sendFile(path.join(__dirname, "./public/matricula.html"))
})

//Adicionado página materias
app.use("/materias", (req, res)=>{
  res.sendFile(path.join(__dirname, "./public/materias.html"))
})

/***** ROUTES *****/
//Route estudiantes
app.use('/api/estudiantes', require('./routes/estudiantes'));
//Route materias
app.use('/api/materias', require('./routes/materias'));


app.listen(app.get("port"), function () {
  console.log("El servidor se encuentra activo en el puerto 4001");
});
