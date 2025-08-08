class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        lst=flowerbed
        c=0
        if(len(lst)==1):
            if(lst[0]==0 and n<=1):
                return True
            elif(lst[0]==1 and n<=0):
                return True
            else:
                False
                
        for i in range(len(lst)):
            if(i==0):
                if(lst[i]==0 and lst[i+1]==0):
                    lst[i]=1
                    c=c+1
            elif(i==len(lst)-1):
                if(lst[i-1]==0 and lst[i]==0):
                    c=c+1
            else:
                if(lst[i-1]==0 and lst[i+1]==0 and lst[i]==0):
                    lst[i]=1
                    c=c+1
        if(c>=n):
            return True
        else:
            return False

            

        