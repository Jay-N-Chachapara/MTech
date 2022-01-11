#include<iostream>
using namespace std;

class A
{
     public:
          A(){
               callA = 0;
          }
     private:
          int callA;
          void inc(){
               callA++;
          }
     protected:
          void func(int & a)
          {
               a = a * 2;
               inc();
          }
     public:
          int getA(){
               return callA;
          }
};

class B
{
     public:
          B(){
               callB = 0;
          }
     private:
          int callB;
          void inc(){
               callB++;
          }
     protected:
          void func(int & a)
          {
               a = a * 3;
               inc();
          }
     public:
          int getB(){
               return callB;
          }
};


class C
{
     public:
          C(){
               callC = 0;
          }
     private:
          int callC;
          void inc(){
               callC++;  
          }
     protected:
          void func(int & a)
          {
               a = a * 5;
               inc();
          }
     public:
          int getC(){
               return callC;
          }
};

class D : public A,B,C
{
     int val;
     public:
          //Initially val is 1
          D()
          {
               val = 1;
          }

          //Implement this function
          void update_val(int new_val)
          {
               int Copy_New_Val = new_val;
               while(new_val!=0)
               {
                    if(val==Copy_New_Val)
                         break;
                    if(new_val%2==0)
                    {
                         A::func(val);
                         new_val/=2;
                    }
                    else if(new_val%3==0)
                    {
                         B::func(val);
                         new_val/=3;
                    }
                    else if(new_val%5==0)
                    {
                         C::func(val);
                         new_val/=5;
                    }
               }
          }
          //For Checking Purpose
          void check(int input) //Do not delete this line.
          {
               update_val(input);
               cout<<"A's func will be called "<<getA()<<" times"<<endl;
               cout<<"B's func will be called "<<getB()<<" times"<<endl;
               cout<<"C's func will be called "<<getC()<<" times"<<endl;
          }
};

int main()
{
     D Object;
     int input;
     bool get = true;
     cin.exceptions(std::istream::failbit);
     do
     {
          try
          {
               cout<<"Enter an integer value that is less than or equal to 10000 and has prime factor only 2,3, and 5."<<endl;
               cin>>input;
               if(input > 10000)
                    throw 10000;
               if(input%5 != 0)
                    throw 5;
               if(input%3 != 0)
                    throw 3;
               if(input%2 != 0)
                    throw 2;
               get = true;
          }
          catch(std::ios_base::failure &fail)
          {
               get = false;
               cout<<"Please enter an integer value"<<endl;
               cin.clear();
               std::string tmp;
               getline(cin, tmp);
          }
          catch(int x)
          {
               get = false;
               if (x == 10000)
                    cout<<"Entered value is greater than 10000,please enter less than or equal to 10000"<<endl;
               if (x == 5)
                    cout<<"Entered value is not divisible by 5"<<endl;
               if (x == 3)
                    cout<<"Entered value is not divisible by 3"<<endl;
               if (x == 2)
                    cout<<"Entered value is not divisible by 2"<<endl;
               cin.clear();
               std::string tmp1;
               getline(cin,tmp1);
          }
          
     }
     while((!get));
     Object.check(input);
     return 0;
}
