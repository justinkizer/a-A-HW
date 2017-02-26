function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(searchString, subString) {
  return searchString.split(" ").includes(subString);
}

function fizzBuzz(array) {
  let result = [];
  array.forEach(function (el) {
    if (el % 3 === 0 ^ el % 5 === 0) {
      result.push(el);
    }
  });
  return result;
}

function isPrime(number) {
  if (number < 2) { return false; }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

function firstNPrimes(n) {
  let result = [];
  let i = 2;
  while (result.length !== n) {
    if (isPrime(i)) {
      result.push(i);
    }
    i++;
  }
  return result;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let nPrimes = firstNPrimes(n);
  for (let i = 0; i < nPrimes.length; i++) {
    sum += nPrimes[i];
  }
  return sum;
}

// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
