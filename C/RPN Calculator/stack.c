#include <malloc.h>
#include <stdlib.h>
#include "stack.h"

node* HEAD = NULL;

typedef struct node {
    double value;
    int type;
    struct node* next;
}node;

void push(node *node) {
  if(HEAD==NULL){
      HEAD=node;
  } else{
      node->next=HEAD;
      HEAD=node;
  }

}

node* pop(void){
    if(HEAD==NULL){
        return NULL;
    } else{
        node* top = HEAD;
        HEAD = HEAD->next;
        return top;
    }
}

node* peek(void){
    if(HEAD==NULL){
        puts("Stack is empty, unable to locate node");
        return NULL;
    }
    return HEAD;
}

void clearStack(void){
    if(HEAD==NULL){
        printf("The stack is already clear\n");
    }else {
        node* clear = pop();
        while (clear != NULL) {
            free(clear);
            clear = pop();
        }
    }
}