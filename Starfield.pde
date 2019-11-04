//your code here
Particle[] dots = new Particle[1000];
double stmouseX = mouseX;
double stmouseY = mouseX;
double speed = 5;
double centerx = 250;
double centery = 250;
double centerz = 250;
double slow = 0.002;
void setup()
{
	//your code here
	size(500, 500);
	for(int i = 0; i < dots.length; i++)
		dots[i] = new Particle(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);
	dots[0] = new Oddball(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);

}
double a = 0;

void mouseClicked() {
  a = 0;
  for(int i = 0; i < dots.length; i++)
	dots[i] = new Particle(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);
  dots[0] = new Oddball(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);

}
int mode = 0;
void keyPressed() {
  if (key == 32){
  	a = 0;
  	for(int i = 0; i < dots.length; i++)
		dots[i] = new Particle(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);
  	dots[0] = new Oddball(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), 2 * PI * Math.random() - PI, 2 * PI * Math.random() - PI, Math.random()*speed);
  	mode += mode == 4 ? - 4 : 1;
  }
}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < dots.length; i++){
		dots[i].show();
		a += 0.0000005;
		//dots[i].rotate(rot, rot, rot, centerx, centery, centerz);
		dots[i].expand(mode);
		dots[i].rotate((mouseX-stmouseX)/100+a, (mouseY-stmouseY)/100+a, 0.01+a, centerx, centery, centerz);
	}

}
class Particle
{
	//your code here
	double x, y, z;
	double newx, newy, newz;
	double angx = 0;
	double angy = 0;
	double angz = 0;
	double speed = 0;
	color c;
	Particle(){

	}
	Particle(double x, double y, double z, color c, double ax, double ay, double speed){
		this.x = x;
		this.y = y;
		this.z = z;
		this.c = c;
		this.angx = ax;
		this.angy = ay;
		this.speed = speed;
	}

	void show(){
		noStroke();
		fill(c);
		ellipse((float)newx, (float)newy, (float)(3+newz/100 > 0? 3+newz/100 : 0 ), (float)(3+newz/100 > 0? 3+newz/100 : 0 ));
	}
	void rotate(double ax, double ay, double az, double ox, double oy, double oz){
		newx = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[0] + ox;
		newy = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[1] + oy;
		newz = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[2] + oz;
	}
	void expand(int mode){
		switch (mode) {
			case 0:
				x += speed * Math.sin(angx) * Math.cos(angy);
				y += speed * Math.sin(angx) * Math.sin(angy);
				z += speed * Math.cos(angx);
				break;

			case 1:
				x += speed * Math.sin(angx) * Math.cos(angy);
				y += speed * Math.sin(angx) * Math.sin(angy);
				z += speed * Math.sin(angx);
				break;
			case 2:
				x += speed/4 * Math.cos(angx);
				z += speed/4 * Math.sin(angx);
				y += angy;
				break;
			case 3:
				x += speed/4 * Math.cos(angx);
				z += speed/4 * Math.sin(angx);
				break;
			case 4:
				x += speed;
				y += speed;
				z += speed;
				break;
		
		
		}
	}
}

class Oddball extends Particle
{
	Oddball(double x, double y, double z, color c, double ax, double ay, double speed){
		this.x = x;
		this.y = y;
		this.z = z;
		this.c = c;
		this.angx = ax;
		this.angy = ay;
		this.speed = speed/2;
	}
	void expand(int mode){
		switch (mode) {
			case 0:
				x += speed * Math.sin(angx) * Math.cos(angy);
				y += speed * Math.sin(angx) * Math.sin(angy);
				z += speed * Math.cos(angx);
				x += Math.random()*4-2;
				y += Math.random()*4-2;
				z += Math.random()*4-2;
				break;

			case 1:
				x += speed * Math.sin(angx) * Math.cos(angy);
				y += speed * Math.sin(angx) * Math.sin(angy);
				z += speed * Math.sin(angx);
				x += Math.random()*4-2;
				y += Math.random()*4-2;
				z += Math.random()*4-2;
				break;
			case 2:
				x += speed/4 * Math.cos(angx);
				z += speed/4 * Math.sin(angx);
				y += angy;
				x += Math.random()*4-2;
				y += Math.random()*4-2;
				z += Math.random()*4-2;
				break;
			case 3:
				x += speed/4 * Math.cos(angx);
				z += speed/4 * Math.sin(angx);
				x += Math.random()*2-1;
				y += Math.random()*2-1;
				z += Math.random()*2-1;
				break;
			case 4:
				x += speed;
				y += speed;
				z += speed;
				x += Math.random()*2-1;
				y += Math.random()*2-1;
				z += Math.random()*2-1;
				break;
		
		
		}
	}
	void show(){
		noStroke();
		fill(c);
		rect((float)newx, (float)newy, (float)(3+newz/100 > 0? 3+newz/100 : 0 )*5, (float)(3+newz/100 > 0? 3+newz/100 : 0 )*5);
	}
}


public double[] rotate3(double x, double y, double z, double pitch, double roll, double yaw) {
    double cosa = Math.cos(yaw);
    double sina = Math.sin(yaw);

    double cosb = Math.cos(pitch);
    double sinb = Math.sin(pitch);

    double cosc = Math.cos(roll);
    double sinc = Math.sin(roll);

    double Axx = cosa*cosb;
    double Axy = cosa*sinb*sinc - sina*cosc;
    double Axz = cosa*sinb*cosc + sina*sinc;

    double Ayx = sina*cosb;
    double Ayy = sina*sinb*sinc + cosa*cosc;
    double Ayz = sina*sinb*cosc - cosa*sinc;

    double Azx = -sinb;
    double Azy = cosb*sinc;
    double Azz = cosb*cosc;

        double px = x;
        double py = y;
        double pz = z;
        	/*
        points[i].x = Axx*px + Axy*py + Axz*pz;
        points[i].y = Ayx*px + Ayy*py + Ayz*pz;
        points[i].z = Azx*px + Azy*py + Azz*pz;
		*/
	return(new double[]{Axx*px + Axy*py + Axz*pz, Ayx*px + Ayy*py + Ayz*pz, Azx*px + Azy*py + Azz*pz});
}