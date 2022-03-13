#include "node.h"
#include <stdlib.h>

typedef struct node {
    int value;
    struct node* next;
}node;

node* createNode(int value){
    node* newNode = (struct node*)malloc(sizeof(struct node));
    newNode->value = value;
    return newNode;
}
