/*
	Demonstrates the difference between lightness and brightness.
	The Pokeball is unintentional.
*/

import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.behavior.HColorLightness;

HDrawablePool light_pool, bright_pool;
PImage img;

void setup() {
	noLoop();
	size(640, 640);
	H.init(this).background(#202020);
	smooth();

	img = loadImage("orange_ball.png");

	bright_pool = new HDrawablePool(528);
	bright_pool.autoAddToStage()
		.add(
			new HEllipse(10)
				.anchorAt(H.CENTER)
				.noStroke()
				.fill(255, 0, 0)
		)
		.layout(
			new HGridLayout()
				.startLoc(630, 630)
				.spacing(-20, -20)
				.cols(32)
		)
		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					new HColorLightness(img)
						.useBrightness()
						.property(H.SCALE)
						.range(0, 1)
						.target(d)
					;
					
				}
			}
		)
		.requestAll()
	;


	light_pool = new HDrawablePool(528);
	light_pool.autoAddToStage()
		.add(
			new HEllipse(10)
				.anchorAt(H.CENTER)
				.noStroke()
				.fill(255)
		)

		.layout(
			new HGridLayout()
				.startLoc(10, 10)
				.spacing(20, 20)
				.cols(32)
		)
		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					new HColorLightness(img)
						.useLightness()//lightness is the default
						.property(H.SCALE)
						.range(0, 1)
						.target(d)
					;
					
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
}

void draw() {
}
