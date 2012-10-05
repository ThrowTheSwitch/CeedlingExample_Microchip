#ifndef led_control_H
#define led_control_H
#include "gpio_access.h"

typedef enum { LED_OFF, LED_ON } LED_STATE;
typedef enum { LED_RED, LED_GREEN, LED_BLUE } LED ;

#define LED_BLUE_PORT       PORT_B
#define LED_BLUE_BIT        BIT_3

#define LED_RED_PORT        PORT_A
#define LED_RED_BIT         BIT_4

#define LED_GREEN_PORT      PORT_B
#define LED_GREEN_BIT       BIT_1

void LED_SetState(LED led, LED_STATE state);

#endif // led_control_H
