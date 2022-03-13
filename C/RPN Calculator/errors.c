#include "errors.h"
#include <stdio.h>

char* errs[] = {
        "Success",
        "Too many operators, program fails",
        "Too few operators, program fails",
        "Expression is empty",
        "Divide by zero, program fails"
};

void error_handling(int input){
    printf("%s\n", errs[input]);
}