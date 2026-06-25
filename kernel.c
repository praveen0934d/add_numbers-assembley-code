#include <stdint.h>

extern uint64_t add_numbers(uint64_t a, uint64_t b);

void kernel_main(void) {
    uint64_t result = add_numbers(5, 10);
}