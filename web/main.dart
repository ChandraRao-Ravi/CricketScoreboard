import 'dart:html';

int totalRunsScored = 0;
int totalBalls = 0;
int maximumBalls = 6;
bool validBall = true;

void main() {

  querySelector("#six").onClick.listen(runsScored6);
  querySelector("#boundary").onClick.listen(runsScored4);
  querySelector("#doublerun").onClick.listen(runsScored2);
  querySelector("#singlerun").onClick.listen(runsScored1);

  querySelector("#ball").onClick.listen(nextBall);
  querySelector("#finishOver").onClick.listen(finishOver);


}

void runsScored1(MouseEvent event) {
   int singleScored = int.parse((querySelector("#singlerun").innerHtml));
    score(singleScored);
}

void runsScored2(MouseEvent event) {
  int doubleScored = int.parse((querySelector("#doublerun").innerHtml));
  score(doubleScored);
}

void runsScored4(MouseEvent event) {
  int boundaryScored = int.parse((querySelector("#boundary").innerHtml));
  score(boundaryScored);
}

void runsScored6(MouseEvent event) {
  int sixScored = int.parse((querySelector("#six").innerHtml));
  score(sixScored);
}

void score(int runs) {
  if(totalBalls >= maximumBalls) {
    window.alert("Over Finshed");
  } else if(validBall){
    totalBalls++;
    validBall =false;
    totalRunsScored = totalRunsScored + runs;
    querySelector("#totalRuns").innerHtml = "Total Runs Scored: " + totalRunsScored.toString();
    querySelector("#totalBalls").innerHtml = "Total Balls Bowled: " + totalBalls.toString();
  } else {
    window.alert("Please Click on next Ball to Score.");
  }
}

void nextBall(MouseEvent event) {
  validBall = true;
  if (totalBalls >= maximumBalls) {
    window.alert("Over Finshed");
  }
}

void finishOver(MouseEvent event) {
  var msgAlert = "";
  if (totalBalls >= maximumBalls) {
     msgAlert = totalRunsScored.toString() + " runs scored in this over";
    window.alert(msgAlert);
  } else {
    msgAlert = "Still "+ (maximumBalls - totalBalls).toString() +" balls remaining for the over to be finished";
    window.alert(msgAlert);
  }
}


