def collatz_function(x):
    if x%2 == 0:
        return x//2
    else:
        return 3*x+1
    
def collatz_sequence(x):
    y = x
    s = [y]
    while(y>1):
        y = collatz_function(y)
        s.append(y)
        
    return s

def smallest_int_with_collatz_length(n):
    length = 0
    a = 0
    while(length<n):
        a = a + 1
        s = collatz_sequence(a)
        length = len(s)
        
    return a

#counterexample = 500
