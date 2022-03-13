#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include "stack.h"
#include "rpn.h"
#include "errors.h"

typedef struct node {
    double value;
    int type;
    struct node* next;
}node;

double evaluate(char* expression, int* status){
    const char s[2] = " ";
    char* token;
    *status = 0;

    char *ptr;
    double ret;

    double num1, num2;
    node* popped;
    double res;

    //Checks for empty expression
    if(expression[0]=='\0'){
        *status = 3;
        error_handling(*status);
        return 0;
    }

    //checks for divide by zero
    if(strstr(expression, "0 /") != NULL) {
        *status = 4;
        error_handling(*status);
        return 0;
    }

    // get the first token
    token = strtok(expression, s);

    //push numbers on stack and calculate expressions
    int stack_count =0;
    while( token != NULL ) {

        if(isdigit(token[0])){
            ret = strtod(token, &ptr);
            push(createNode(ret,0));
            stack_count++;
            //check for too many numbers on stack
            if(stack_count>2){
                *status = 2;
                error_handling(*status);
                return 0;
            }
        }else{
            //check for too few numbers on stack
            if(stack_count<2){
                *status = 1;
                error_handling(*status);
                return 0;
            }
            //pop two numbers for operation
            popped = pop();
            num2 = popped->value;
            free(popped);
            popped = pop();
            num1 = popped->value;
            free(popped);
            popped=NULL;
            stack_count-=2;
            switch(token[0]){
                case '+':
                    res = num1+num2;
                    break;
                case '-':
                    res = num1-num2;
                    break;
                case '*':
                    res = num1*num2;
                    break;
                case '/':
                    res = num1/num2;
                    break;
                case '^':
                    res = recurpower(num1,num2);
                    break;
                default:
                    printf("Invalid expression");
            }
            push(createNode(res,0));
            stack_count++;
            //check for too many numbers on the stack
            if(stack_count>2){
                *status = 2;
                error_handling(*status);
                return 0;
            }
        }
        token = strtok(NULL, s);
    }
    clearStack();
    return res;
}

double recurpower(double x, double y){
    if (y != 0) {
        return (x * recurpower(x, y - 1));
    }else {
        return 1;
    }
}

