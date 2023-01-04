#include "unity.h"
#include "UnityHelper.h"
#include "led_control.h"
#include "mock_gpio_access.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_LED_SetState_should_call_SetBit_for_the_correct_port_pin_when_setting_led_on(void)
{
    GPIO_SetBit_Expect(PORT_B, BIT_1);
    LED_SetState(LED_GREEN, LED_ON);
}

void test_LED_SetState_should_call_ClearBit_for_the_correct_port_pin_when_setting_led_off(void)
{
    GPIO_ClearBit_Expect(PORT_B, BIT_1);
    LED_SetState(LED_GREEN, LED_OFF);
}
