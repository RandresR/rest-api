const name = "John Doe"; // Issue: 'var' debe ser cambiada por 'let' or 'const'
const age = 30; // Issue: 'var' debe ser cambiada por 'let' or 'const'

function getUserName() {
  return name;
}

function calculateAge(yearOfBirth) {
  const currentYear = new Date().getFullYear();
  return currentYear - yearOfBirth;
}

function unsafeFunction(userInput) {
  // Issue: eval() introduce problemas de seguridad.
  return userInput;
}

console.log(getUserName());
console.log(calculateAge(1990));
console.log(unsafeFunction("2 + 2")); // Potencial problema de seguridad

export default {
  unsafeFunction,
};