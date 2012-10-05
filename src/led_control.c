#include "led_control.h"
#include "gpio_access.h"

void LED_SetState(LED led, LED_STATE state)
{
    // Get a fcn prt to either the set or clear function based on the desired state
    void (*gpio_fcn)(GPIO_PORTS, PORT_BITS) = (state == LED_ON) ? &GPIO_SetBit : &GPIO_ClearBit;

    switch (led)
    {
        case LED_RED:
            gpio_fcn(LED_RED_PORT, LED_RED_BIT);
            break;
        case LED_GREEN:
            gpio_fcn(LED_GREEN_PORT, LED_GREEN_BIT);
            break;
        case LED_BLUE:
            gpio_fcn(LED_BLUE_PORT, LED_BLUE_BIT);
            break;
    }
}
