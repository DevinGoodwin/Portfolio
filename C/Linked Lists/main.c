#include <stdio.h>
#include "node.h"
#include "list.h"

typedef struct node {
    int value;
    struct node* next;
}node;

int main() {
    int vals[] = {89, 39, 18, 96, 71, 25, 2, 55, 60, -8, 9, 42, 69,96,24};
    int p1_length = sizeof(vals) / sizeof(int);
    for (int i=0;i<p1_length;i++){
        addNode(createNode(vals[i]));
    }
    printList();

    deleteLargest();
    printList();

    printf("Number of elements in list after deletions in 3.2: %d\n",countList());

    bubbleSort();
    printList();
    return 0;
}
