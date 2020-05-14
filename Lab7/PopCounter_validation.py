# Function to count set bits in an integer 
# in Python 
  
def countSetBits(num): 
  
     # convert given number into binary 
     # output will be like bin(11)=0b1101 
     binary = bin(num) 
  
     # now separate out all 1's from binary string 
     # we need to skip starting two characters 
     # of binary string i.e; 0b 
     setBits = [ones for ones in binary[2:] if ones=='1'] 
       
     print(hex(len(setBits)))
  
# Driver program 
if __name__ == "__main__": 
    num = int("0x2DF45158", 16)
    countSetBits(num)  

    num = int("0xCF8CB140", 16)
    countSetBits(num) 

    num = int("0x46F6B54B", 16)
    countSetBits(num) 

    num = int("0x29310347", 16)
    countSetBits(num) 

    num = int("0x045B7030", 16)
    countSetBits(num) 

    num = int("0xB45DFD20", 16)
    countSetBits(num) 

    num = int("0x787F8B1A", 16)
    countSetBits(num) 

    while True:
         num = int(input("Number -> "), 16)
         countSetBits(num)