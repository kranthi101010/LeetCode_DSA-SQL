class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        k=max(candies)
        lst=[]
        for i in range(len(candies)):
            if(candies[i]+extraCandies>=k):
                lst.append(True)
            else:
                lst.append(False)
        return lst

        



        