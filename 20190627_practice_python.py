# -*- coding: utf-8 -*-

#-
#for i in range (1,6):
#    print("*"*(6-i))
#    
#    
#i = 5
#while i>0:
#    print("*"*i)
#    i = i -1
-#    
    
#import random
#
#class Dice:
#    def __init__ (self, num = 1):
#        self.number=num
#    def roll(self):
#        self.number = random.choice(range(1,7))
#    def getDice(self):
#        return self.number
#    def __str__(self):
#        return str(self.number)
#    def win(self, other):
#        if self.number > other.number:
#            print("win")
#        elif self.number < other.number:
#            print("lose")
#        else: print("tie")

### Dice.py로부터 불러오기
#from Dice import Dice
#
#a = Dice()
#b = Dice()    
#
#count = 0
#for i in range(10000):
#    a.roll()
#    b.roll()
#    if (7<=a.getDice() + b.getDice()<=8): 
#        count = count + 1
#
#print("Probability approximation = %f"%(count/10000))
##    
#a = Dice()
#b = Dice()
#a.roll()
#b.roll()
#a.win(b)
#
#
#    
#print("The number of the dice is %d"%a.getDice())


##Numpy ndarray
#import numpy as np
#data = np.random.randn(2,3)
#data
#data.shape
#data.dtype
#data.reshape(3,2)



