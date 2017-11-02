// Mystery Scoping with var, let, const

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1(); // in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2(); // in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3(); // SyntaxError, bc there are two x's. Function doesn't know which one it's referring to?

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4(); // in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

mysteryScoping5(); // SyntaxError, bc you can't define let twice within the same scope?.


//MadLib

function MadLib(verb,adj,noun){
  "We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()} ."
}

madLib('make', 'best', 'guac');


// isSubstring

function isSubstring(searchString, subString){
  return searchString.includes(subString);
}

isSubstring("time to program", "time")






//Phase II

function fizzBuzz (array) {

  let fizzBuzzArray = []

  array.forEach(el => {
      if ((el % 3 === 0) ^ (el % 5 === 0)) {
        fizzBuzzArray.push(el);
      }
    });

    return fizzBuzzArray;
}

// isPrime

function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

// sumOfNPrimes

function sumOfNPrimes (n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
