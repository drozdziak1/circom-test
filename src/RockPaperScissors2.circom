pragma circom 2.0.0;

template RockPaperScissors2() {
  signal input p1;
  signal input p2;
  signal output out;
  var rock = 1;
  var paper = 2;
  var scissors = 4;

  var res = p2 - p1;

  

  out <== res * res; // 0 = draw, 1 = paper over rock, 4 = scissors cut paper, 9 = rock dulls scissors
}

component main = RockPaperScissors2();