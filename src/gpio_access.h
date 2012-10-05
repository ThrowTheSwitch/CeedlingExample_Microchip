#ifndef gpio_access_H
#define gpio_access_H
#include <stdbool.h>

typedef enum { PORT_A, PORT_B } GPIO_PORTS;
typedef enum { BIT_0, BIT_1, BIT_2, BIT_3, BIT_4, BIT_5, BIT_6, BIT_7 } PORT_BITS;

void GPIO_SetBit(GPIO_PORTS port, PORT_BITS bit);
void GPIO_ClearBit(GPIO_PORTS port, PORT_BITS bit);
bool GPIO_IsBitSet(GPIO_PORTS port, PORT_BITS bit);

#endif // gpio_access_H
