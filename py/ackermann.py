def ackermann(m, n):
    if m == 0:
        return n + 1
    if n == 0:
        return ackermann(m - 1, 1)
    return ackermann(m - 1, ackermann(m, n - 1))


def ackermann_it(m, n):
    result = -1
    stack = []
    stack.append((m, n))
    while stack:
        x, y = stack.pop()
        if x == 0:
            stack.append((-1, y + 1))
        elif x != -1:
            if y == 0:
                stack.append((x - 1, 1))
            else:
                stack.append((x - 1, -1))
                stack.append((x, y - 1))
        else:  # x == -1
            if stack:
                i, j = stack.pop()
                stack.append((i, y))
            else:
                result = y
                # on peut faire return y
    return result


def deux_pow_deux_n_fois(n):
    nn = 2
    for i in range(n):
        nn **= 2
    return nn


def ackermann_form(m, n):
    "Ackermann formula, return 'inf' if m >= 5"
    if m == 0:
        return n + 1
    if m == 1:
        return n + 2
    if m == 2:
        return 2 * n + 3
    if m == 3:
        return 2 ** (n + 3) - 3
    if m == 4:
        return deux_pow_deux_n_fois(n + 3) - 3
    if m == 5 and n == 0:
        return ackermann_form(4, 1)
    return float("inf")


if __name__ == "__main__":
    for i in range(4):
        for j in range(9):
            try:
                print(ackermann(i, j), end="")
            except Exception as e:  # stackoverflow error
                print("#-#", end="")
            print("--", ackermann_it(i, j))
        print()
    print("------------" * 3)
    print("ackermann_form(4,4) =", ackermann_form(4, 4))
