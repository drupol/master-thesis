#include <stdio.h>

int main() {
  printf(
    "Built the %s at %s.\n",
    __DATE__,
    __TIME__
  );
  return 0;
}
