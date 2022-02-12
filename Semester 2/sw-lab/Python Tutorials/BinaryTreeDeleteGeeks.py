class Node:
     def __init__(self):
          self.left = None
          self.data = None
          self.right = None
def Insert(root) :
     if root.data is None :
          root.data = int(input("Enter node value : "))
     else :
          newNode = Node()
          newNode.data = int(input("Enter node value : "))
          while root.data <= newNode.data :
               if root.right :
                    root = root.right
               else :
                    break
          while root.data > newNode.data :
               if root.left :
                    root = root.left
               else :
                    break
          if newNode.data > root.data :
               root.right = newNode
          else :
               root.left = newNode

def Search(root,element,level) :
     if root :
          if root.data == element :
               print("\nElement is found at level",level,"\n")
          elif root.data < element :
               Search(root.right,element,level+1)
          elif root.data > element :
               Search(root.left,element,level+1)
          else :
               print("\nSorry !! Entered element is not in the Binary Search Tree!!!\n")

#Minimum from the right sub tree
def inOrderSuccessor(root) :
     temp = root
     while temp.left :
          temp = temp.left
     return temp

def Delete(root,element) :
     if root is None :
          return root
     if element < root.data :
          root.left = Delete(root.left,element)
     elif element > root.data :
          root.right = Delete(root.right,element)
     else :
          if root.left is None :
               temp = root.right
               root = None
               return temp
          elif root.right is None :
               temp = root.left
               root = None
               return temp
          temp = inOrderSuccessor(root.right)
          root.data = temp.data
          root.right = Delete(root.right,temp.data)

     return root 

def inOrderTraversal(temp) :
     if temp :
          inOrderTraversal(temp.left)
          print(temp.data,end="\t")
          inOrderTraversal(temp.right)

def preOrderTraversal(temp) :
     if temp :
          print(temp.data,end="\t")
          preOrderTraversal(temp.left)
          preOrderTraversal(temp.right)

def postOrderTraversal(temp) :
     if temp :
          postOrderTraversal(temp.left)
          postOrderTraversal(temp.right)
          print(temp.data,end="\t")


Root = Node()
Choice = int(input("\n\n1. Insert\n2. Search\n3. Delete\n4. Traverse\n5. Exit\n\nEnter Choice : "))
while Choice != 5 :
     if Choice == 1 :
          Insert(Root)
     elif Choice == 2 :
          element = int(input("\nEnter the value to search : "))
          Search(Root,element,0)
     elif Choice == 3 :
          element = int(input("\nEnter an element to delete : "))
          Root = Delete(Root,element)
     elif Choice == 4 :
          print("Inorder Traversal")
          inOrderTraversal(Root)
          print("\nPreorder Traversal")
          preOrderTraversal(Root)
          print("\nPostorder Traversal")
          postOrderTraversal(Root)
     Choice = int(input("\n\n1. Insert\n2. Search\n3. Delete\n4. Traverse\n5. Exit\n\nEnter Choice : "))