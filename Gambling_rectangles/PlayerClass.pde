class Player {
  float x;
  float y;
  float w;
  float h;

  Player(float in_x, float in_y, float in_w, float in_h) {
    x = in_x;
    y = in_y;
    w = in_w;
    h = in_h;
  }



  void draw() {
    noStroke();
    fill(255, 0, 0);
    rect (x, y, w, h);
  }
}
