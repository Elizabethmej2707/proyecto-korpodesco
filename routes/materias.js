const { Router } = require('express');
const router = Router();
const fs = require('fs');

router.get('/materias', (req, res) => {
    res.json('API REST materias');
})

module.exports = router;