class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        # creating a GCD perspective 
        s=""
        
        for i in range(len(str2)):
            s1=""
            if(len(str2)%len(str2[:len(str2)-i])==0):
                k1=len(str2)//len(str2[:len(str2)-i])
                print(k1)
                for k2 in range(k1):
                    s1=s1+str2[:len(str2)-i]
                print(s1)
                if s1==str2:
                    if((len(str1)%len(str2[:len(str2)-i]))==0):
                        k=len(str1)//len(str2[:len(str2)-i])
                        for j in range(k):
                            s=s+str2[:len(str2)-i]
                        print(s)
                        if(s==str1):
                            return str2[:len(str2)-i]
        return ""       

        