#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[]) {
  double x,y,z;
  int count = 1;

  srand(time(NULL));

  int n = atoi(argv[1]); // User input: number of iterations to perform

  for (int i = 0; i < n; i++) {
    x = (double) rand() / RAND_MAX;
    y = (double) rand() / RAND_MAX;
    if ((x * x + y * y) <= 1) count++;
  }

  printf("π approx.: %g\n", ((double)count / n) * 4);

  return(0);
}
