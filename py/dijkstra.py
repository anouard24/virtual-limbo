from collections import deque

from struct import OGraph


def dijkstra(A, G):
    d = {}
    queue = deque([A])
    d[A.val()] = (0, A.val())
    while queue:
        N = queue.popleft()
        # print("Sommet",N.val()," : ")
        # N.out()
        for x, distnx in N.arcs():
            queue.append(x)
            distav, chemin = d.get(x.val(), (float("inf"), ""))
            if distav != float("inf"):
                Ndval, cheminav = d.get(N.val(), (float("inf"), ""))
                if Ndval + distnx < distav:
                    d[x.val()] = Ndval + distnx, cheminav + " " + x.val()
            else:
                Ndval, cheminav = d.get(N.val(), (float("inf"), ""))
                d[x.val()] = Ndval + distnx, cheminav + " " + x.val()
    return d.get(G.val(), (float("inf"), ""))


def estArbre(A):
    d = {}
    queue = deque([A])
    d[A.val()] = True
    while queue:
        N = queue.popleft()
        for x, _ in N.arcs():
            queue.append(x)
            dejavu = d.get(x.val(), -1)
            if dejavu != -1:
                return False
            else:
                d[x.val()] = True
    return True


def printg(A):
    d = {}
    queue = deque([A])
    d[A.val()] = True
    A.gprint()
    while queue:
        N = queue.popleft()
        for x, _ in N.arcs():
            queue.append(x)
            dejavu = d.get(x.val(), -1)
            if dejavu == -1:
                d[x.val()] = True
                x.gprint()


def main():

    G = OGraph("G", [])
    E = OGraph("E", [(G, 4)])
    F = OGraph("F", [(G, 20)])
    D = OGraph("D", [(E, 5)])
    C = OGraph("C", [(E, 13), (D, 2)])
    B = OGraph("B", [(F, 6), (D, 5)])
    A = OGraph("A", [(B, 6), (C, 5)])

    printg(A)
    dij = dijkstra(A, G)
    print("Resultat :", dij)
    esta = estArbre(A)
    print("Le graphe est arbre ? :", esta)


if __name__ == "__main__":
    main()
