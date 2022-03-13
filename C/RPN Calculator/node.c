#include "node.h"
#include <stdlib.h>
#include <stdio.h>

typedef struct node {
    double value;
    int type;
    node *next;
} node;


node* createNode(double value, int type){
    node* newNode = (struct node*)malloc(sizeof(struct node));
    if (newNode) {
        newNode->value = value;
        newNode->type = type;
    } else {
        printf("Unable to allocate memory for a node.\n");
    }
    return newNode;
}
