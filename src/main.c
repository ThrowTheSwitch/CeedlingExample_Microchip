#include "main.h"
#include "system.h"
#include "led_control.h"

#ifdef TEST 
int test_main(void)
#else
int main(void)
#endif
{
    while(!ShouldAbortApp())
    {
        LED_SetState(LED_RED, LED_ON);
        LED_SetState(LED_GREEN, LED_ON);
        LED_SetState(LED_BLUE, LED_ON);
        
        LED_SetState(LED_RED, LED_OFF);
        LED_SetState(LED_GREEN, LED_OFF);
        LED_SetState(LED_BLUE, LED_OFF);
    }
    return 0;
}

