class Node:
     def __init__(self):
          self.left = None
          self.data = None
          self.right = None
def Insert(root) :
     if root.data is None :
          root.data = int(input("Enter node val : "))
     else :
          newNode = Node()
          newNode.data = int(input("Enter node val : "))
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
i = 6
while i != 0 :
     Insert(Root)
     i -= 1
print()
inOrderTraversal(Root)
print()
preOrderTraversal(Root)
print()
postOrderTraversal(Root)
print()