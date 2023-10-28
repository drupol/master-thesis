#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[]) {
  srand(time(NULL));

  double x,y,z,count;
  int n = atoi(argv[1]);

  for (int i = 0; i < n; i++) {
    x = (double) rand() / RAND_MAX;
    y = (double) rand() / RAND_MAX;
    z = x * x + y * y;
    if (z <= 1) count++;
  }

  printf("π approx.: %g", (count / n) * 4);

  return(0);
}
