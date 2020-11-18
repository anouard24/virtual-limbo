def hanoi_number(x):
    if x == 1:
        return 1
    return 1 + 2 * hanoi_number(x - 1)


def hanoi_number_it(x):
    if x == 1:
        return 1
    n = 1
    for i in range(2, x + 1):
        n = 1 + 2 * n
    return n


def hanoi(n, d, a, i):
    if n <= 1:
        print("Deplacer disque", n, "de tour", d, "vers tour", a)
        return
    hanoi(n - 1, d, i, a)
    print("Deplacer disque", n, "de tour", d, "vers tour", a)
    hanoi(n - 1, i, a, d)


def hanoi_it(n, d, v, i):
    if n <= 1:
        print("Deplacer disque", n, "de tour", d, "vers tour", v)
        return
    stack = []
    stack.append((n, d, v, i, True))
    while stack:
        m, a, b, c, firstTime = stack.pop()
        if m > 1 and firstTime:
            stack.append((m, a, b, c, False))
            stack.append((m - 1, a, c, b, True))
        elif m > 1 and not firstTime:
            print("Deplacer disque", m, "de tour", a, "vers tour", b)
            stack.append((m - 1, c, b, a, True))
        elif m == 1:
            print("Deplacer disque", 1, "de tour", a, "vers tour", b)


def main():
    n = int(input("Entrer le nombre des disques : "))
    # hanoi(n,"D","A","I")
    print("-" * 80)
    hanoi_it(n, "D", "A", "I")
    print("-" * 80)
    print(hanoi_number(n))
    print(hanoi_number_it(n))
    print(2 ** n - 1)  # formule de hanoi number


if __name__ == "__main__":
    main()
