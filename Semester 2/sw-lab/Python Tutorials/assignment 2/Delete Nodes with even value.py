class Node :
     def __init__(self) :
          self.data = None
          self.next = None

class LinkedList(Node) :
     def __init__(self) :
          self.__head = Node()
     
     def EnterNode(self) :
          if self.__head is None :
               self.__head.data = int(input("Enter node value (head) : "))
               self.__head.next = None
          else :
               node = Node()
               node.data = input("Enter node value : ")
               node.next = None
               tmp = self.__head
               while tmp.next is not None :
                    tmp = tmp.next
               tmp.next = node

     def Traverse(self) :
          if self.__head is None :
               print("List is empty")
          else :
               tmp = self.__head.next
               while tmp is not None :
                    print(tmp.data,end=" --> ")
                    tmp = tmp.next
               print("None")
               del tmp
     
     def SearchNode(self) :
          if self.__head.next is None :
               print("List is empty cannot search")
          else :
               element = input("Enter the value of the element to be searched : ")
               temp = self.__head.next
               counter = 0
               while (temp is not None) and (temp.data != element):
                    print(temp.data)
                    counter += 1
                    temp = temp.next 
               if temp is None :
                    print("Element not found")
               else :
                    print("Element found at location",counter+1)
     def DeleteNode(self) :
          if self.__head.next is None :
               print("List is already empty")
          else :
               while float(self.__head.next.data) % 2 == 0 :
                    self.__head = self.__head.next
                    print()
                    self.Traverse()
                    print()
                    if self.__head.next is None :
                         break
               temp = self.__head.next
               preTemp = temp
               flag = False
               while (temp is not None) :
                    if float(temp.data) % 2 == 0 :
                         if temp.next is not None :
                              preTemp.next = temp.next.next
                         else :
                              preTemp.next = temp.next
                    else :
                         preTemp = temp
                    if temp is not None and float(temp.data) % 2 == 0:
                         preTemp.next = temp.next
                    temp = temp.next
                    print()
                    self.Traverse()
                    print()
          del temp, preTemp

if __name__ == "__main__" :  
     L = LinkedList()
     print("1. Enter Node\n2. Delete Node\n3. Traverse List\n4. Exit")
     Option = int(input("\nEnter option : "))
     while Option != 5 :
          if Option == 1 :
               print()
               L.EnterNode()
               print()
          elif Option == 2 :
               print()
               L.DeleteNode()
               print()
          elif Option == 3 :
               print()
               L.Traverse()
               print()
          elif Option == 4 :
               exit()
          else :
               print("Please enter correct option")
          print("\n1. Enter Node\n2. Delete Node\n3. Traverse List\n4. Exit")
          Option = int(input("\nEnter option : "))