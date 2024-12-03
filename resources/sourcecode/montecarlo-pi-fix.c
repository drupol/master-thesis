#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
  double x,y,z,count;

  int seed = atoi(argv[1]); // Seed for srand
  int n = atoi(argv[2]); // Number of iterations

  srand(seed);

  for (int i = 0; i < n; i++) {
    x = (double) rand() / RAND_MAX;
    y = (double) rand() / RAND_MAX;
    z = x * x + y * y;
    if (z <= 1) count++;
  }

  printf("π approx.: %g", (count / n) * 4);

  return(0);
}
