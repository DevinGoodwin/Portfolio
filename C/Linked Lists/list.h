#ifndef list_h
#define list_h
#include <stdbool.h>
#include "node.h"

bool addNode(node* node); //Add a node to the list
node* findNode(int value); //Find a node in the list
bool deleteNode (node* node); //Delete a node in the list
void printList(void); //Print the values in the list
void deleteLargest(void);//Deletes all instances of the largest value in th list
int findLargest();//Finds largest value in the list
int countList(void);//Counts number of elements in the list

void bubbleSort();//Sorts list via buuble sort
void swapnode(node* trav1,node* trav2);//Swaps two items in the list

#endif
