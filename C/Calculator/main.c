#include <stdio.h>
#include "Calculator.h"

int main() {
    float num1,num2,res;
    char oper,cont;
    int i = 2;
    do {
        printf("Enter the mathematical expression: ");
        scanf("%f%c%f",&num1,&oper,&num2);
        switch(oper){
            case '+':
                res = add(num1,num2);
                break;
            case '-':
                res = subtract(num1,num2);
                break;
            case '*':
                res = multiply(num1,num2);
                break;
            case '/':
                res = divide(num1,num2);
                break;
            case '^':
                res = power(num1,num2);
                break;
            case '$':
                res = recurpower(num1,num2);
                break;
            default:
                printf("Invalid expression");
        }
        printf("Result: %.2f\n",res);
        printf("Would you like to continue? (y/n): ");
        scanf(" %c",&cont);
        if (cont=='y'||cont=='Y') {
            i = 1;
        }else{
            i = -1;
        }

    } while(i>0);

    return 0;
}


