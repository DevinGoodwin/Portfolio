#include "ps2.h"
#include "stdbool.h"

void large_and_small(const int* array, int length, int* largest, int* smallest){
    int s, l;
    s = *array;
    l = *array;
    for(int i=1;i<length;i++){
        if(s>=*(array+i)){
            s = *(array+i);
        }
        if(l<=*(array+i)){
            l = *(array+i);
        }
    }
    *smallest = s;
    *largest = l;
}

double inner_product(const double* leftArray, const double* right_array, int length){
    double cumprod = 0;
    for(int i=0;i<length;i++){
        cumprod = cumprod + *(leftArray+i) * *(right_array+i);
    }
    return cumprod;
}

bool compareArrays(int* left, int left_length, int* right, int right_length){
    if(left_length!=right_length)
        return false;
    for(int i=0;i<left_length;i++){
        if(*(left+i)!=*(right+i))
            return false;
    }

    return true;
}