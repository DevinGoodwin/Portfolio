def is_reflexive(A, R):
    for x in A:
        if not R(x, x):
            return False
    return True

def is_transitive(A, R):
    for x in A:
        for y in A:
            if R(x, y):
                for z in A:
                    if R(y, z) and not R(x, z):
                        return False
    return True
