const db = require("../config/db");
const bcrypt = require("bcryptjs");
//registro
exports.registerUser = (req, res) => {
  const { name, last_name, email, password, birth_date } = req.body;

  if (!name || !last_name || !email || !password) {
    return res.status(400).json({ message: "Todos los campos son obligatorios" });
  }

  const hashedPassword = bcrypt.hashSync(password, 10);

  const sql = "INSERT INTO users (name, last_name, email, password, birth_date) VALUES (?, ?, ?, ?, ?)";
  db.query(sql, [name, last_name, email, hashedPassword, birth_date], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Error registrando usuario" });
    }
    res.status(201).json({ message: "Usuario registrado con éxito" });
  });
};
//login
const jwt = require("jsonwebtoken");

exports.loginUser = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Correo y contraseña son obligatorios" });
  }

  const sql = "SELECT * FROM users WHERE email = ?";
  db.query(sql, [email], (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Error en el servidor" });
    }
    if (results.length === 0) {
      return res.status(401).json({ message: "Usuario no encontrado" });
    }

    const user = results[0];

    // Verificar la contraseña
    const isMatch = bcrypt.compareSync(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    // Generar el token JWT
    const token = jwt.sign({ id: user.id, email: user.email }, process.env.JWT_SECRET, { expiresIn: "1h" });

    res.json({
      message: "Login exitoso",
      token,
      user: { id: user.id, name: user.name, last_name: user.last_name, email: user.email, birth_date: user.birth_date }
    });
  });
};

