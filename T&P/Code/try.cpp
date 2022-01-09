#include<iostream>
using namespace std;

int main() {
    int opc;
    bool aux = true;
    cin.exceptions(std::istream::failbit);
    do {
        try {
            cout << "PLEASE INSERT VALUE:" << endl;
            cin >> opc;
            aux = true;
        }
        catch (std::ios_base::failure &fail) {
            aux = false;
            cout << "PLEASE INSERT A VALID OPTION." << endl;
            cin.clear(); //if skiped terminate after throwing an instance of 'std::__ios__failure' -> iostream error
            std::string tmp; //if only line skiped compilation error as it is used in next line
            getline(cin, tmp); //skip this line alone or along with previous line results in infinite loop
        }
    } while (aux == false);
    //system("PAUSE"); This line can be skipable
}