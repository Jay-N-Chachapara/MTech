#include<iostream>
using namespace std;
int max_of_four(int a,int b,int c, int d){
     int max1 = a>=b?a:b;
     int max2 = c>=d?c:d;
     return max1>=max2?max1:max2;
}
int main()
{
     int a,b,c,d;
     bool get = true;
     cin.exceptions(std::istream::failbit);
     do
     {
          try
          {
               cout<<"Enter four integer values : "<<endl;
               cin>>a>>b>>c>>d;
               get = true;
          }
          catch(std::ios_base::failure &fail)
          {
               get = false;
               cout<<"Please enter integer value"<<endl;
               cin.clear();
               std::string tmp;
               getline(cin, tmp);
          }
          
     }
     while(!get);
     cout<<"Entered values are \n"<<a<<" "<<b<<" "<<c<<" "<<d<<endl;
     cout<<"Maximum of entered value is : "<<max_of_four(a,b,c,d)<<endl;
     return 0;
}