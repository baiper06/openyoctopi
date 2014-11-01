/*
 * para ejecutarse:  ./main origen.jpg destino.jpg
 */

#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <cmath>
#include <stdio.h>

using namespace cv;
using namespace std;

// globals
Mat src, dst;
Mat map_x, map_y;

void make_bilinear_map(void) {

        // the center 
        double c_x = (double)src.cols/2;
        double c_y = (double)src.rows/2;

	// params
	complex<double> a = 2.1 + 2.1*1i;
	complex<double> c = 0.003;
	complex<double> d = 1 + 1i;

        for(int j = 0; j < src.rows; j++) {
                for(int i = 0; i < src.cols; i++) {
                        // shift the coordinates space to center
                        double x = c_x-i;
                        double y = c_y-j;
			
			// points
			complex<double> point = x + y*1i;
			complex<double> remap_point = (a*point)/(c*point+d);

                        // remap the point
			map_x.at<float>(j,i) = c_x-real(remap_point);
			map_y.at<float>(j,i) = c_y-imag(remap_point);
                }
        }
}


int main(int argc, char** argv) {
	printf("OpenCV version: %i.%i\n\n", CV_MAJOR_VERSION, CV_MINOR_VERSION);
        src = imread(argv[1], 1);

        dst.create(src.size(), src.type());
        map_x.create(src.size(), CV_32FC1);
        map_y.create(src.size(), CV_32FC1);

        make_bilinear_map();
        remap(src, dst, map_x, map_y, CV_INTER_LINEAR, BORDER_CONSTANT, Scalar(0,0, 0));
	
	imwrite(argv[2], dst);
        return 0;
}
