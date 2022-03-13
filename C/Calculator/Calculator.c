#include "Calculator.h"
float add(float x,float y){
    return x+y;
}
float subtract(float x,float y){
    return x-y;
}
float multiply(float x,float y){
    return x*y;
}
float divide(float x,float y){
    return x/y;
}
float power(float x,float y){
    float tot=1;
    for(int i=1;i<=y;i++){
        tot=tot*x;
    }
    return tot;
}
float recurpower(float x,float y){
    if (y != 0) {
        return (x * recurpower(x, y - 1));
    }else {
        return 1;
    }
}
