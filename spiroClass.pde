/* 
 CLASS
 =========================================
 */

class Spirograph {

  /* 
   A SPIROGRAPH DEFAULT VARIABLES
   ---------------------------------------
   */

  // GLOBAL VARIABLES
  int idx; // spiro index
  float R; // fixed circle radius
  float r; // moving circle radius
  float a; // distance between the center of moving circle (point M) and the pen (point P)
  float cnt; // number of revolutions
  int eq;// equation to use (0: inside or 1: outside)
  int s; // pen size
  color c; // pen color
  int crv; // O: dots / 1: curves (default) / 2: lines / 3: curves bis / 4: curves ter
  float n; // scale factor
  // float rol = 180; // position of moving circle
  // float rol;
  int preview; // bool for preview circles 0 / 1

  float step = 0.5;

  // declaring gui variables
  Slider abc;
  Textlabel cp_label;
  ColorPicker cp;
  Accordion params;

  Spirograph(int tmp_idx, float tmp_R, float tmp_r, float tmp_a, float tmp_cnt, int tmp_eq, int tmp_s, color tmp_c, int tmp_crv, float tmp_n) {

    //import controlP5.*;

    // TMP VARIABLES
    idx = tmp_idx;
    R = tmp_R;
    r = tmp_r;
    a = tmp_a;
    cnt = tmp_cnt;
    eq = tmp_eq;
    s = tmp_s;
    c = tmp_c;
    crv = tmp_crv;
    n = tmp_n;

    /* 
     SPIROGRAPH OBJECT GUI
     ---------------------------------------
     */



    // SPIROGRAPH TAB
    cp5.addTab("spiro"+"_"+idx)
      ;

    // GEOMETRY GROUP
    Group A_geo = cp5.addGroup("A_geo"+"_"+idx)
      .setBackgroundHeight(170)
        .setBackgroundColor(color(255, 127))
          .setLabel("GEOMETRY")
            ;

    // Spiro A R slider
    cp5.addSlider("R"+"_"+idx)
      .setPosition(5, 15)
        .setValue(R)
          .setRange(1, 255)
            .setLabel("FIXED CIRCLE") 
              .setColorLabel(0)
                .setWidth(255)
                  .moveTo(A_geo)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                      ;

    // Spiro A r slider
    cp5.addSlider("r"+"_"+idx)
      .setPosition(5, 45)
        .setValue(r)
          .setRange(0, 255)
            .setLabel("MOVING CIRCLE") 
              .setColorLabel(0)
                .setWidth(255)
                  .moveTo(A_geo)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                      ;

    // Spiro A a slider
    cp5.addSlider("a"+"_"+idx)
      .setValue(a)
        .setPosition(5, 75)
          .setRange(0, 255)
            .setLabel("PEN POSITION") 
              .setColorLabel(0)
                .setWidth(255)
                  .moveTo(A_geo)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                      ;

    // Spiro A cnt slider
    cp5.addSlider("cnt"+"_"+idx)
      .setValue(cnt)
        .setPosition(5, 105)
          // .setDecimalPrecision(10)
          .setRange(0, 255)
            .setLabel("REVOLUTIONS") 
              .setColorLabel(0)
                .setWidth(255)
                  .moveTo(A_geo)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)   
                      ; 

    // Spiro A eq toggle
    cp5.addToggle("eq"+"_"+idx)
      .setValue(eq)

        .setPosition(5, 135)
          //.setValue(true)
          .setMode(ControlP5.SWITCH) // (on/off) switch look
            .setLabel("TOGGLE EQUATION")      
              .setColorLabel(0)
                .moveTo(A_geo)
                  .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                    //  .setWidth(255)
                    ;

    // Spiro A preview toggle
    cp5.addToggle("preview"+"_"+idx)
      .setValue(preview)
        .setValue(true)
          .setPosition(100, 135)
            //.setValue(true)
            .setMode(ControlP5.SWITCH) // (on/off) switch look
              .setLabel("TOGGLE PREVIEW")      
                .setColorLabel(0)
                  .moveTo(A_geo)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                      //  .setWidth(255)
                      ;
    /*

     // Spiro pos slider
     cp5.addSlider("rol"+"_"+idx)
     .setPosition(500, 15)
     .setValue(rol)
     .setRange(0, cnt * TWO_PI)
     .setLabel("POS") 
     .setColorLabel(0)
     .setWidth(255)
     .moveTo(A_geo)
     .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
     ;
     
     */


    // STYLE GROUP
    Group A_sty = cp5.addGroup("sty"+"_"+idx)
      .setBackgroundHeight(120)
        .setBackgroundColor(color(255, 127))
          .setLabel("STYLE")
            ;

    // Spiro A type slider
    cp5.addSlider("crv"+"_"+idx)
      .setValue(crv)
        .setPosition(5, 15)
          .setRange(0, 4)
            .setNumberOfTickMarks(5)
              .setSliderMode(Slider.FLEXIBLE)
                .setLabel("PEN TYPE") 
                  .setColorLabel(0)
                    .setColorTickMark(0) 
                      .setWidth(50)    
                        .moveTo(A_sty)
                          .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                            ; 

    // Spiro A s slider
    cp5.addSlider("s"+"_"+idx)
      .setValue(s)
        .setPosition(60, 15)
          .setRange(1, 10)
            .setNumberOfTickMarks(10)
              .setSliderMode(Slider.FLEXIBLE)
                .setLabel("PEN SIZE") 
                  .setColorLabel(0)
                    .setColorTickMark(0) 
                      .setWidth(50)    
                        .moveTo(A_sty)
                          .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                            ; 

    // Spiro A n slider
    cp5.addSlider("n"+"_"+idx)
      .setValue(n)
        .setPosition(115, 15)
          .setRange(0, 10)
            .setLabel("DRAWING SCALE") 
              .setColorLabel(0)
                .setWidth(145)
                  .moveTo(A_sty)
                    .getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0)
                      ; 

    // Spiro color picker label
    cp_label = cp5.addTextlabel("cp_label"+"_"+idx)
      .setText("PEN COLOR")
        .setPosition(5, 35)
          .setColorValue(0)
            .moveTo(A_sty)
              ;
    // Spiro A color picker
    cp = cp5.addColorPicker("c"+"_"+idx)
      .setPosition(5, 45)
        .setColorValue(c)
          .setWidth(255)
            .moveTo(A_sty)
              ;

    //ACCORDION PARAMETERS 
    params = cp5.addAccordion("params"+"_"+idx)
      .setPosition(0, 20)
        .setWidth(265)
          .addItem(A_geo)
            .addItem(A_sty)
              .moveTo("spiro"+"_"+idx)

                ;
    params.open(0, 1);
    params.setCollapseMode(Accordion.MULTI);



    //END GUI

      // print("color="+hex(c));
  }

  /* 
   SPIROGRAPH DRAW
   ---------------------------------------
   */

  void draw() {
    // get values from controllers
    R = cp5.getController("R"+"_"+idx).getValue();
    r = cp5.getController("r"+"_"+idx).getValue();
    a = cp5.getController("a"+"_"+idx).getValue();
    cnt = int(cp5.getController("cnt"+"_"+idx).getValue());
    eq = int(cp5.getController("eq"+"_"+idx).getValue());
    crv = int(cp5.getController("crv"+"_"+idx).getValue());
    s = int(cp5.getController("s"+"_"+idx).getValue());
    c = cp.getColorValue();
    n = cp5.getController("n"+"_"+idx).getValue();

    float t = cnt * TWO_PI; // t angle > the revolutions
    float k = r/R; // used in the spirographs equations to simplify formula
    float x;
    float y;

    noFill(); // no fill color
    stroke(c); // pen color
    strokeWeight(s); // pen size
    beginShape();

    for (float i=0; i <= t ; i+=step) {
      if (eq==0)
      {
        // spirograph equation > INSIDE the fixed circle / Hypocycloids
        x = (R - r) * cos(k * i) + a * cos((1 - k) * i);
        y = (R - r) * sin(k * i) + a * sin((1 - k) * i);
      } 
      else {
        // spirograph equation > OUTSIDE the fixed circle / Epicycloids
        x = (R + r) * cos(k * i) + a * cos((1 + k) * i);
        y = (R + r) * sin(k * i) + a * sin((1 + k) * i);
      }

      // apply scale factor
      x *= n;
      y *= n;

      // center the points in the window
      x += width / 2;
      y += height / 2;

      // render modes
      switch(crv) {
      case 0:
        point(x, y);
        break;
      case 1: 
        curveTightness(0);
        curveVertex(x, y);
        break;
      case 2:
        curveTightness(1);
        curveVertex(x, y);
        break;
      case 3:
        curveTightness(-2);
        curveVertex(x, y);
        break;
      case 4:
        curveTightness(3);
        curveVertex(x, y);
        break;
      }
    }
    endShape();
  } // end spirograph()

  /* 
   SPIROGRAPH PREVIEW
   ---------------------------------------
   */

  void preview() {
    preview = int(cp5.getController("preview"+"_"+idx).getValue());

    if (preview==0) {
      float rol = 0;
      float ratio = (R / r) - 1;

      noFill(); // no fill color
      stroke(255, 0, 0, 128); // pen color
      strokeWeight(2); // pen size

      // get values from controllers
      R = cp5.getController("R"+"_"+idx).getValue();
      r = cp5.getController("r"+"_"+idx).getValue();
      a = cp5.getController("a"+"_"+idx).getValue();
      cnt = int(cp5.getController("cnt"+"_"+idx).getValue());
      n = cp5.getController("n"+"_"+idx).getValue();
      // rol = cp5.getController("rol"+"_"+idx).getValue();
      // rol = int(cp5.getController("cnt"+"_"+idx).getValue())*TWO_PI;
      // rol = 0;
      // rol = TWO_PI;

      pushMatrix();
      // center origin
      translate(width / 2, height / 2);

      for (int i= 0 ; i <= cnt ; i++) {
      }
      //  rotate(cnt * TWO_PI);

      ellipseMode(CENTER);
      ellipse(0, 
      0, 
      R * 2 * n, 
      R * 2 * n
        );

      movingCircle(r, R);
      popMatrix();


      //  rotate(rol);
    } //endif
  } // end preview


  /*
Theorem 4: Circle A with radius r is rolling around inside a second circle B with radius 
   R without slipping until it returns to its starting point. The number of revolutions the 
   circle A makes is N = TWO_PI * (R-r) / TWO_PI * r == (R/r) - 1
   */

  void movingCircle(float r, float R) {
    // moving circle revolutions
    //float ratio = (R / r) - 1;
    float ratio = (R / r) - 1;

    if (eq==0)
    {

      // draw the moving circle

      //      rotate(radians(rol*20));

      pushMatrix();
      translate((R - r) * n, 0);

      // rotate(cnt * TWO_PI * ratio);

      ellipseMode(CENTER);
      ellipse(0, 
      0, 
      r * 2 * n, 
      r * 2 * n
        );

      // draw the pen line
      line(0, 
      0, 
      a * n, 
      0
        );
      popMatrix();
    } 
    else {

      pushMatrix();
      translate((R + r) * n, 0);

      // rotate(cnt * TWO_PI * ratio);

      ellipseMode(CENTER);

      ellipse(0, 
      0, 
      r * 2 * n, 
      r * 2 * n
        );

      // draw the pen line
      line(0, 
      0, 
      a * n, 
      0
        );
      popMatrix();
    }
  }// end movingCircle
}

