from collections import deque

class OGraph:
    def __init__(self, valeur, liste):
        self.vale = valeur
        self.tab = liste

    def arcs(self):
        return self.tab

    def dist(A):
        for i in liste:
            if i[0] == A:
                return i[1]
        return -1

    def val(self):
        return self.vale

    def hasArcs(self):
        return self.tab != []

    def out(self):
        for x, _ in self.tab:
            print(x.val(), end="")
        print()

    def gprint(self):
        queue = deque()
        print(self.vale, ": ", end="")
        for x, d in self.tab:
            queue.append(x)
            print("(" + x.val() + "%4d" % d + ") ,", end="")
        print("|")
