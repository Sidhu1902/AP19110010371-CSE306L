#include<stdio.h>
#include<conio.h>
#include<malloc.h>
#include<string.h>
#define null 0
int size = 0;
void insert ();
void display ();
void del();
int search(char lab[]);
struct symbtab 
{
char label[10];
char info[10];
struct symbtab *next;
};
struct symbtab *first, *last;
void main () 
{
int op;
int y;
char la[10];
do
{
printf ("Enter '1' to INSERT\n");
printf ("Enter '2' to DISPLAY\n");
printf ("Enter '3' to DELETE\n");

scanf ("%d", &op);
switch (op){
case 1:
insert ();
break;
case 2:
display ();
break;
case 3:
del();
display();
printf("New Table after deletion\n");
break;
}
}
while (op < 2);
getch ();
}

void insert () {
int n;
char l[10];
printf ("Enter the Identifier: \n");
scanf ("%s", l);
n = search (l);
if (n == 1)
printf("Already present in the table.\n");
else{
struct symbtab *p;
p = malloc (sizeof (struct symbtab));
strcpy (p->label, l);
printf ("Enter the info:\n ");
scanf ("%s", p->info);
p->next = null;
if (size == 0){
first = p;
last = p;
}
else{
last->next = p;
last = p;
}
size++;
}
}
void display (){
int i;
struct symbtab *p;
p = first;
printf ("Id\t\t|\tInfo\n");
printf("-------------------------\n");
for (i = 0; i < size; i++){
printf ("%s\t\t\t%s\n", p->label, p->info);
p = p->next;
}
}
int search (char lab[]){
int i, flag = 0;
struct symbtab *p;
p = first;
for (i = 0; i < size; i++){
if (strcmp (p->label, lab) == 0)
flag = 1;
p = p->next;
}
return flag;
}
void del()
{
          int a;
          char l[10];
          struct symbtab *p,*q;
          p=first;
          printf("Enter the label to be deleted\n");
          scanf("%s",l);
          a=search(l);
          if(a==0)
          {
                   printf("Label not found\n");
          }
          else
          {
                   if(strcmp(first->label,l)==0)
                   {
                             first=first->next;
                   }
                   else if(strcmp(last->label,l)==0)
                   {
                             q=p->next;
                             while(strcmp(q->label,l)!=0)
                             {
                                      p=p->next;
                                      q=q->next;
                             }
                             p->next=null;
                             last=p;
                   }
                   else
                   {
                             q=p->next;
                             while(strcmp(q->label,l)!=0)
                             {
                                      p=p->next;
                                      q=q->next;
                             }
                             p->next=q->next;
                   }
                   size--;
          }
}