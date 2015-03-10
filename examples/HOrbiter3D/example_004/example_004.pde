HDrawablePool pool;
HTimer timerPool;
int boxSixe = 50;

void setup() {
	size(750,750,P3D);
	H.init(this).background(#202020).use3D(true);
	smooth();
	

	pool = new HDrawablePool(42);
	pool.autoAddToStage()
		.add (new HBox())

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HBox d = (HBox) obj;
					d
						.depth(boxSixe)
						.width(boxSixe)
						.height(boxSixe)
						.strokeWeight(2)
						.stroke(#000000,50)
						.fill(#FF3300)
						.loc(width/2,height/2)
					;

					HOrbiter3D orb = new HOrbiter3D(width/2, height/2, 0)
						.target(d)
						.zSpeed(1.5)
						.ySpeed(0.2)
						.radius(250)
					;

					int i = pool.currentIndex();

					// new HOscillator().target(d).property(H.ROTATIONX).range(-360, 360).speed(0.4).freq(1).currentStep(i);
					// new HOscillator().target(d).property(H.ROTATIONY).range(-360, 360).speed(0.4).freq(1).currentStep(i);
					new HOscillator().target(d).property(H.ROTATIONZ).range(-360, 360).speed(0.4).freq(1).currentStep(i);
				}
			}
		)
	;

	timerPool = new HTimer()
		.numCycles( pool.numActive() )
		.interval(70)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	pointLight(255, 255, 255,  width/2, height/2, 280);

	H.drawStage();

	//simple sphere mesh to show orbit range
	pushMatrix();
		translate(width/2, height/2, 0);
		stroke(#333333);
		noFill();
		sphereDetail(20);
		sphere(200);
	popMatrix();
}
