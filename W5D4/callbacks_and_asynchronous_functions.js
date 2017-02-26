const readline = require("readline");

function hammerTimeOut () {
  window.setTimeout(hammerTime, 5000);
}

function hammerTime () {
  alert("HAMMERTIME");
}

function hammerTime2 (time) {
  let callback = function () {
    alert(`${time} is hammertime!`);
  };
  window.setTimeout(callback, time);
}

function teaOrBiscuits () {
  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  function callback (response) {
    if (response === "y") {
      console.log(`So you do want tea!`);
      reader.close();
    } else {
      console.log(`So you don't want tea!`);
      reader.close();
    }
  }
  reader.question("Would you like some tea? (y/n)", callback);
}

function teaAndBiscuits2 () {
  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  let first, second;

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}.`);

    reader.question('Would you like some biscuits?', (res2) => {
      second = res2;
      console.log(`You replied ${res2}.`);

      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);

      reader.close();
    });
  });

}

// teaAndBiscuits2();

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
