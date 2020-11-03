const { Router } = require('express');
const router = Router();
const mySqlConnection = require('../db/db');

router.get('/', (req, res) => {
    mySqlConnection.query('SELECT * from estudiante' , (error, results, fields) => {
        if(!error){
            res.json(results)
        }else {
            console.log(error);
        }
    });
});

router.get('/estudiante/:id', (req, res) => {
    const { id } = req.params; 
    mysqlConnection.query('SELECT * FROM estudiante WHERE id = ?', 
    [id], (err, rows, fields) => {
      if (!err) {
        res.json(rows[0]);
      } else {
        console.log(err);
      }
    });
  });  

router.post('/nuevo-estudiante',(req,res)=>{

const {nombres,apellidos,correo,documento,telefono_celular,fecha_nacimiento,
        institucion_id} = req.body;

let alumno = [nombres,apellidos,correo,documento,telefono_celular,
  fecha_nacimiento,institucion_id];

let nuevoAlumno = `INSERT INTO estudiante(nombres,apellidos,correo,documento,
  telefono_celular,fecha_nacimiento,institucion_id)
                  VALUES(?,?,?,?,?,?,?)`;
mysqlConnection.query(nuevoAlumno, alumno, (err, results, fields) => {
  if (err) {
    return console.error(err.message);
  }
  res.json({ message:`Alumno matriculado`, })
  });
});  

router.put('/estudiante/:id', (req, res) => {
  const {nombres,apellidos,correo,documento,telefono_celular,
    fecha_nacimiento,institucion_id} = req.body;
  const { id } = req.params;
  mysqlConnection.query(`UPDATE estudiante SET nombres = ?,apellidos = ?,
  correo = ?,documento = ?,telefono_celular = ?,fecha_nacimiento = ?,
  institucion_id = ? WHERE id = ?`, 
  [nombres,apellidos,correo,documento,telefono_celular,fecha_nacimiento,
    institucion_id,id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Estudiante actualizado'});
    } else {
      console.log(err);
    }
  });
});

router.delete('/estudiante/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM estudiante WHERE id = ?',
   [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Estudiante eliminado!'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;