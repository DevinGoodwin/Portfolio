def are_parts_nonoverlapping(p):
    for i in range(len(p)):
        for j in range(i+1, len(p)):
            res = p[i].intersection(p[j])
            if(len(res)==0):
                return True
    return False

def do_parts_contain_element(x, p):  
    for i in range(len(p)):
        if(x in p[i]):
            return True
    return False

def do_parts_cover_set(s, p): 
    for i in s:
        x = 0
        for j in range(len(p)):
            if i in p[j]:
                x = 1
        if x == 0:
            return False
    return True

def do_parts_have_nothing_extra(s, p):  
    for i in range(len(p)):
        for el in p[i]:
            if el not in s:
                return False
    return True

def is_partition(s,p):
    x=0
    i=1
    uni = p[0]
    
    for i in range(1,len(p)):
        uni = uni | p[i]
    if uni == s:
        x=1
    for i in range(0,len(p)):
        for j in range(i+1,len(p)):
            if not(p[i]&p[j]):
                pass
            else: i=0
            
    if x and i:
        return True
    else:
        return False