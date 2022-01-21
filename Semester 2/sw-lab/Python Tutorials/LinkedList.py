class Node :
     def __init__(self) :
          self.data = None
          self.next = None

class LinkedList(Node) :
     def __init__(self) :
          self.__head = Node()
     
     def EnterNode(self) :
          if self.__head is None :
               self.__head.data = int(input())
               self.__head.next = None
          else :
               node = Node()
               node.data = input()
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
               element = input("Enter the value to be deleted : ")
               if self.__head.next.data == element :
                    self.__head = self.__head.next
                    return
               temp = self.__head.next
               preTemp = temp
               flag = False
               while (temp is not None) :
                    preTemp = temp
                    temp = temp.next
                    if temp.data == element :
                         flag = True
                         break
               if flag :
                    preTemp.next = temp.next
               else :
                    print("Element not found")
               
if __name__ == "__main__" :  
     L = LinkedList()
     print("1. Enter Node\n2. Search Node\n3. Delete Node\n4. Traverse List\n5. Exit")
     Option = int(input("Enter option : "))
     while Option != 5 :
          if Option == 1 :
               L.EnterNode()
          elif Option == 2 :
               pass
               L.SearchNode()
          elif Option == 3 :
               pass
               L.DeleteNode()
          elif Option == 4 :
               L.Traverse()
          else :
               pass
          print("1. Enter Node\n2. Search Node\n3. Delete Node\n4. Traverse List\n5. Exit")
          Option = int(input("Enter option : "))