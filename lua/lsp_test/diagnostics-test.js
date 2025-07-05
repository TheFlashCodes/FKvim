// 🧨 ERROR: Undefined variable
console.log(notDefinedVar);

// ⚠️ WARNING: Unused variable
const unusedVariable = 42;

// 💡 HINT: Prefer 'const' over 'let'
let shouldBeConst = "immutable";

// 🛈 INFO: Function is missing return type (in tsserver it may show info)
function add(a, b) {
  return a + b;
}

