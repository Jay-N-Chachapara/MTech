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
     while root.left :
          temp = root
          root = root.left
     value = temp.data
     temp.left = None
     return value

#Maximum from the left sub tree
def inOrderPredecessor(root) :
     temp = root
     while root.right :
          temp = root
          root = root.right
     value = temp.data
     temp.right = None
     return value

def Delete(root,element) :
     if root.data == element :
          if root.left is None and root.right is not None :
               root = root.right
          elif root.right is None and root.left is not None :
               root = root.left
          elif root.left and root.right :
               root.data = inOrderPredecessor(root.left)
          # if root.left is None and root.right is None :
          #      root = None
          # elif root.left and root.right is None :
          #      root.data = inOrderPredecessor(root.left)
          # elif root.right and root.left is None :
          #      root.data = inOrderSuccessor(root.left)
     elif root.data > element :
          Delete(root.left,element)
     elif root.data < element :
          Delete(root.right,element)
     else :
          print("\nSorry!! Entered element is not in the tree!!\n") 

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
          Delete(Root,element)
     elif Choice == 4 :
          print("Inorder Traversal")
          inOrderTraversal(Root)
          print("\nPreorder Traversal")
          preOrderTraversal(Root)
          print("\nPostorder Traversal")
          postOrderTraversal(Root)
     Choice = int(input("\n\n1. Insert\n2. Search\n3. Delete\n4. Traverse\n5. Exit\n\nEnter Choice : "))