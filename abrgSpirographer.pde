/* ABOUT
 _                                 _               
 ___ _ __ (_)_ __ ___   __ _ _ __ __ _ _ __ | |__   ___ _ __ 
 / __| '_ \| | '__/ _ \ / _` | '__/ _` | '_ \| '_ \ / _ \ '__|
 \__ \ |_) | | | | (_) | (_| | | | (_| | |_) | | | |  __/ |   
 |___/ .__/|_|_|  \___/ \__, |_|  \__,_| .__/|_| |_|\___|_|   
 |_|                |___/          |_|                    
 
 =========================================
 ABRèGe's spirographer by Adrien Revel
 =========================================
 Helped by:
 http://www.mathematische-basteleien.de/spirographs.htm
 =========================================
 */

String spiVersion = "0.1";
String spiDate = "MARCH 2014";

color bgColor = #eeeeee;

/* 
 LIBRARIES IMPORT
 =========================================
 Please install the excellent library controlP5 by Andreas Schlegel
 http://www.sojamo.de/libraries/controlP5/
 */
import java.awt.Dimension;

import controlP5.*;
import processing.pdf.*;
// DECLARE GUI

ControlP5 cp5;
Textlabel aboutText;
Textlabel licenseText;

Dimension minimumSize = new Dimension(800, 600); // Change values for limit the window size

/* 
 DECLARE SPIROGRAPHS
 =========================================
 */
Spirograph spiro01;

/* 
 GLOBALS
 =========================================
 */
boolean recordPDF; // for PDF export
boolean recordPNG; // for PNG export
boolean recordPARAMS; // for PARAMS export
boolean loadPARAMS; // for PARAMS export

/* 
 SETUP
 =========================================
 */
void setup()
{
  frameRate(30);


  cp5 = new ControlP5(this);

  // size(1024, 768);
  size(displayWidth-(displayWidth/10), displayHeight-(displayHeight/10));

  // customize window
  /*
  frame.setResizable(true);
   frame.setMinimumSize(minimumSize);
   
   */
  frame.setTitle("ABRèGe SPIROGRAPHER / "+ spiVersion);

  smooth();

  /* 
   APPLICATION GUI
   ---------------------------------------
   */

  cp5.getTab("default")
    .setLabel("about")
      ;

  // FUNCTIONS GROUP
  Group G_fun = cp5.addGroup("G_fun")
    .setPosition((width-110), 30)
      .setWidth(100)
        .setBackgroundHeight(105)
          .setBackgroundColor(color(255, 127))
            .setLabel("FUNCTIONS")
              .moveTo("global")
                ;

  // record button (PDF export)
  cp5.addButton("recordPDF")
    .setPosition(5, 5)
      .setSize(90, 20)
        .setLabel("SAVE PDF")
          .moveTo(G_fun)
            ;

  // record button (PNG export)
  cp5.addButton("recordPNG")
    .setPosition(5, 30)
      .setSize(90, 20)
        .setLabel("SAVE PNG")
          .moveTo(G_fun)
            ;

  // record button (PARAMS export)
  cp5.addButton("recordPARAMS")
    .setPosition(5, 55)
      .setSize(90, 20)
        .setLabel("SAVE PARAMS")
          .moveTo(G_fun)
            ;

  // load button (PARAMS load)
  cp5.addButton("loadPARAMS")
    .setPosition(5, 80)
      .setSize(90, 20)
        .setLabel("LOAD PARAMS")
          .moveTo(G_fun)
            ;

  // ABOUT label
  aboutText = cp5.addTextlabel("aboutText")
    .setText("ABREGE SPIROGRAPHER / "+ spiVersion +" / " + spiDate + " / WWW.ABREGE.NET")
      .setPosition(5, 20)
        .setColorValue(0)
          .moveTo("default")
            ;

  // end GUI
  
  
  // Spirograph(int tmp_idx, float tmp_R, float tmp_r, float tmp_a, float tmp_cnt, int tmp_eq, int tmp_s, color tmp_c, int tmp_crv, float tmp_n);
  spiro01 = new Spirograph(1, 150, 130, 50, 1.5, 0, 1, color(0, 0, 0, 255), 1, 1);
} // end setup()

/* 
 DRAW
 =========================================
 */

void draw() {
  background(bgColor); // background color

    if (recordPDF) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "abrg_spiro-####.pdf");
  }


  /* 
   DRAW SPIROGRAPHS
   ---------------------------------------
   */

  spiro01.draw();
  spiro01.preview();

  if (recordPDF) {
    endRecord();
    recordPDF = false;
  }

  if (recordPNG) {
    // Note that #### will be replaced with the frame number. Fancy!
    saveFrame("abrg_spiro-####.png");
    recordPNG = false;
  }

  if (recordPARAMS) {
    cp5.getProperties().setSnapshot("spiroParams");
    cp5.getProperties().saveSnapshot("spiroParams");
    recordPARAMS = false;
  }

  if (loadPARAMS) {
    cp5.getProperties().load("spiroParams.ser");
    loadPARAMS = false;
  }
} // end draw()
