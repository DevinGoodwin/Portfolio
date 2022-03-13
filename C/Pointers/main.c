#include <stdio.h>
#include "ps2.h"
#include "stdbool.h"
int main() {
    int array[] = {72,90,100,36,21,15,76,-6,63,41,99,27,3,66,19,16,27,47,0,23};
    int p1_length = sizeof(array) / sizeof(int);
    int small, large;
    large_and_small(array,p1_length,&large,&small);
    printf("Smallest = %d, Largest = %d\n",small,large);

    int array2[] = {-72,-90,-100,-36,-21,-15,-76,-6,63,41,99,27,3,66,19,16,27,47,0,23};
    int p1_length2 = sizeof(array2) / sizeof(int);
    int small2, large2;
    large_and_small(array2,p1_length2,&large2,&small2);
    printf("Smallest = %d, Largest = %d\n",small2,large2);

    double left[] = {15.26, 28.20, 6.71, 72.22, 92.85, 15.50, 85.64, 57.41, 44.40, 72.91};
    double right[] = {9.17, 4.8, 10.9, 10.12, 17.18, 3.9, 6.19, 5.4, 3.13, 6.1};
    int p2_lengthleft = sizeof(left) / sizeof(double);
    int p2_lengthright = sizeof(right) / sizeof(double);
    if(p2_lengthleft==p2_lengthright){
        double sum = inner_product(left,right,p2_lengthright);
        printf("Inner Product Result = %f\n",sum);
    }else{
        printf("Array lengths are unequal\n");
    }



    double p3_left[] = {72, 90,100,36,21,15,76,-6,63,41,99,27,3,66,19,16,27,47,0,23};
    double p3_right[] = {72, 90,100,36,21,15,76,-6,63,41,99,27,3,66,18,16,27,47,0,23};
    int p3_lengthleft = sizeof(p3_left) / sizeof(int);
    int p3_lengthright = sizeof(p3_right) / sizeof(int);
    bool same;

    same = compareArrays(p3_left,p3_lengthleft,p3_right,p3_lengthright);

    if(same==false){
        printf("False. The arrays are not the same.\n");
    }else{
        printf("True. The arrays are the same.\n");
    }

    double p3_left2[] = {72, 90,100,36,21,15,76,-6,63,41,99,27,3,66,19,16,27,47,0,23};
    double p3_right2[] = {72, 90,100,36,21,15,76,-6,63,41,99,27,3,66,18,16,27,47,23};
    int p3_lengthleft2 = sizeof(p3_left2) / sizeof(int);
    int p3_lengthright2 = sizeof(p3_right2) / sizeof(int);
    bool same2;

    same2 = compareArrays(p3_left2,p3_lengthleft2,p3_right2,p3_lengthright2);

    if(same==false){
        printf("False. The arrays are not the same.\n");
    }else{
        printf("True. The arrays are the same.\n");
    }

    return 0;
}