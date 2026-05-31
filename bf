#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void BF(int v0, int a[100][100], int n)
{
    int coada[100];
    int vizitat[100];
    int prim, ultim;
    int v;

    for (int i = 0; i < n; i++)
        vizitat[i] = 0;

    prim = ultim = 0;

    coada[ultim++] = v0;
    vizitat[v0] = 1;

    while (prim < ultim)
    {
        v = coada[prim++];

        printf("%d ", v + 1);

        for (int i = 0; i < n; i++)
        {
            if (a[v][i] == 1 && vizitat[i] == 0)
            {
                coada[ultim++] = i;
                vizitat[i] = 1;
            }
        }
    }
}

int main()
{
    int n, m;
    int a[100][100];
    int vf1, vf2;
    int v0;

    printf("Introduceti numarul de varfuri: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            a[i][j] = 0;

    printf("Introduceti numarul de muchii: ");
    scanf("%d", &m);

    printf("Introduceti muchiile:\n");

    for (int i = 0; i < m; i++)
    {
        scanf("%d %d", &vf1, &vf2);

        a[vf1 - 1][vf2 - 1] = 1;
        a[vf2 - 1][vf1 - 1] = 1;
    }

    printf("Introduceti varful de start: ");
    scanf("%d", &v0);

    printf("Parcurgerea BF este:\n");

    BF(v0 - 1, a, n);

    return 0;
}
