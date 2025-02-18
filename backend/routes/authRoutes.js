const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
router.post("/login", authController.loginUser);
router.post("/register", authController.registerUser);

module.exports = router;
//rutas protegidas 
const { verifyToken } = require("../middleware/authMiddleware");

router.get("/profile", verifyToken, (req, res) => {
  res.json({ message: "Bienvenido al perfil protegido", user: req.user });
});
