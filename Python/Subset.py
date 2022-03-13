def subset(A,B):
    if A == {}:
        return True
    if B == {} and A == {}:
        return True
    if B == {}:
        return False
    return (A.union(B)==A)
    
def sd(A,B):
    if A == {}:
        return B
    if B == {}:
        return A
    return (A.difference(B).union(B.difference(A)))
