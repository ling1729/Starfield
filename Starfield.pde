//your code here
void setup()
{
	//your code here
}
void draw()
{
	//your code here
}
class Particle
{
	//your code here
}

class OddballParticle //inherits from Particle
{
	//your code here
}


public float[] rotate(float x, float y, float z, float pitch, float roll, float yaw) {
    float cosa = (float)Math.cos(yaw);
    float sina = (float)Math.sin(yaw);

    float cosb = (float)Math.cos(pitch);
    float sinb = (float)Math.sin(pitch);

    float cosc = (float)Math.cos(roll);
    float sinc = (float)Math.sin(roll);

    float Axx = cosa*cosb;
    float Axy = cosa*sinb*sinc - sina*cosc;
    float Axz = cosa*sinb*cosc + sina*sinc;

    float Ayx = sina*cosb;
    float Ayy = sina*sinb*sinc + cosa*cosc;
    float Ayz = sina*sinb*cosc - cosa*sinc;

    float Azx = -sinb;
    float Azy = cosb*sinc;
    float Azz = cosb*cosc;

        float px = x;
        float py = y;
        float pz = z;
        	/*
        points[i].x = Axx*px + Axy*py + Axz*pz;
        points[i].y = Ayx*px + Ayy*py + Ayz*pz;
        points[i].z = Azx*px + Azy*py + Azz*pz;
		*/
	return(new float[]{Axx*px + Axy*py + Axz*pz, Ayx*px + Ayy*py + Ayz*pz, Azx*px + Azy*py + Azz*pz});
}