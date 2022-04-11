pragma circom 2.0.0;

include "./circomlib/circuits/comparators.circom";
include "./circomlib/circuits/gates.circom";

template RockPaperScissors2() {
  signal input p1;
  signal input p2;

  signal output out;

  var rock = 1;
  var paper = 2;
  var scissors = 4;

  assert(p1 != p2);

  component isP1Less = LessThan(3);
  component isRockScissors = IsEqual();
  component isP2Winner = XOR();

  isP1Less.in[0] <-- p1;
  isP1Less.in[1] <-- p2;

  isRockScissors.in[0] <-- rock + scissors;
  isRockScissors.in[1] <-- p1 + p2;


  isP2Winner.a <-- isRockScissors.out;
  isP2Winner.b <-- isP1Less.out;
  

  out <== isP2Winner.out + 1; // 1 - p1 wins, 2 - p2 wins
}

component main = RockPaperScissors2();