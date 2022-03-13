#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "list.h"

node* HEAD = NULL;
node* Walker = NULL;
node* Prev = NULL;

typedef struct node {
    int value;
    struct node* next;
}node;

bool addNode(node* node){
    if(HEAD==NULL){
        HEAD = (struct node*)malloc(sizeof(struct node));
        Walker = (struct node*)malloc(sizeof(struct node));
        HEAD->next = node;
        return true;
    }else{
        Walker = HEAD->next;
        while(Walker->next!=NULL){
            Walker = Walker->next;
        }
        Walker->next = node;
        return true;
    }
}

node* findNode(int value){
    Walker = HEAD->next;
    while (Walker!=NULL){
        if(Walker->value==value) {
            return Walker;
        }
        Walker = Walker->next;
    }
    return NULL;
}

bool deleteNode (node* node){
    if(Prev==NULL){
        Prev = (struct node*)malloc(sizeof(struct node));
    }
    Prev = HEAD;
    Walker = HEAD->next;
    while (Walker!= node){
        Walker = Walker->next;
        Prev = Prev->next;
    }
    Prev->next = Prev->next->next;
    return true;
}

void printList(void){
    Walker = HEAD->next;
    while (Walker!=NULL){
        printf("%d ",Walker->value);
        Walker = Walker->next;
    }
    printf("\n");
}
int countList(void){
    Walker = HEAD->next;
    int count=0;
    while (Walker!=NULL){
        count++;
        Walker = Walker->next;
    }
    return  count;
}

void deleteLargest(void){
    int large = findLargest();
    while(findLargest()==large){
        deleteNode(findNode(findLargest()));
    }
}

int findLargest(void){
    Walker = HEAD->next;
    int Large=0;
    while (Walker!=NULL){
        if(Walker->value>Large) {
            Large = Walker->value;
        }
        Walker = Walker->next;
    }
    return  Large;
}


void bubbleSort(){
    int swap_occured;
    if(Prev==NULL){
        Prev = (struct node*)malloc(sizeof(struct node));
    }
    do{
        Walker = HEAD->next;
        Prev = HEAD;
        swap_occured=0;
        //check first condition to reassign HEAD
        if(Walker->value > Walker->next->value){
            Prev->next = Walker->next;
            Walker->next = Prev->next->next;
            Prev->next->next = Walker;
            Prev=Prev->next;
            swap_occured=1;
        }
        while (Walker->next != NULL){
            if (Walker->value > Walker->next->value){
                swapnode(Prev,Walker);
                Prev=Prev->next;
                swap_occured = 1;
            }else {
                Walker = Walker->next;
                Prev = Prev->next;
            }
        }
    }while (swap_occured);
}


void swapnode(node* trav1, node* trav2){
    trav1->next=trav2->next;
    trav2->next=trav2->next->next;
    trav1->next->next=trav2;
}


