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
		dots[i] = new Particle(centerx, centery, centerz, color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)), speed*(Math.random()-0.5), speed*(Math.random()-0.5), speed*(Math.random()-0.5));

}
double a = 0;
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < dots.length; i++){
		dots[i].show();
		a += 0.0000005;
		//dots[i].rotate(rot, rot, rot, centerx, centery, centerz);
		dots[i].expand();
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
	color c;
	double vx;
	double vy;
	double vz;
	Particle(double x, double y, double z, color c, double vx, double vy, double vz){
		this.x = x;
		this.y = y;
		this.z = z;
		this.c = c;
		this.vx = vx;
		this.vy = vy;
		this.vz = vz;
	}

	void show(){
		noStroke();
		fill(c);
		ellipse((float)newx, (float)newy, (float)(3+newz/100), (float)(3+newz/100));
	}
	void rotate(double ax, double ay, double az, double ox, double oy, double oz){
		newx = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[0] + ox;
		newy = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[1] + oy;
		newz = rotate3(x - ox, y - oy, z - oz, ax, ay, az)[2] + oz;
	}
	void expand(){
		x += vx;
		y += vy;
		z += vz;
		vx += vx > 0 ? -1 * slow : slow;
		vy += vy > 0 ? -1 * slow : slow;
		vz += vz > 0 ? -1 * slow : slow;
	}
}

class OddballParticle //inherits from Particle
{
	//your code here
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