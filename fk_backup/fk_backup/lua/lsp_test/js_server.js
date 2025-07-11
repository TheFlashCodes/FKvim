// 📁 example.js

class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a sound.`);
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name);
  }

  speak() {
    console.log(`${this.name} barks.`);
  }

  fetch() {
    console.log(`${this.name} fetches the ball.`);
  }
}

function greet(owner) {
  console.log(`Hello, ${owner}!`);
}

const dog = new Dog("Buddy");
dog.speak();
greet("Mayank");

