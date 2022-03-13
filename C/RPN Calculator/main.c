#include <stdio.h>
#include <string.h>
#include "rpn.h"

typedef struct node {
    double value;
    int type;
    struct node* next;
}node;

int main() {
    char exp[30]="24.2 12 / 3 / 17 + +";
    int status;
    int* p_status = &status;
    double result;

    printf("Problem 1: ");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    printf("Problem 2: ");
    strcpy(exp,"+");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    printf("Problem 3: ");
    strcpy(exp,"17 22 / 4 * 16 -");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }


    printf("Problem 4: ");
    strcpy(exp,"2 8 ^ 3 /");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    printf("Problem 5: ");
    strcpy(exp,"17 22 33 / 4 + 2");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    printf("Problem 6: ");
    strcpy(exp,"");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    printf("Problem 7: ");
    strcpy(exp,"8 7 + 6 - 5 / 4 * 3 ^");
    result = evaluate(exp,p_status);
    if(status==0) {
        printf("%.2lf\n", result);
    }

    return 0;
}
