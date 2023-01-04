#include "unity.h"
#include "UnityHelper.h"
#include "main.h"
#include "mock_system.h"
#include "mock_led_control.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_main_function_should_return_when_ShouldAbortApp_returns_true(void)
{
    // Setup expected call chain
    ShouldAbortApp_ExpectAndReturn(true);
    // Call function under test
    test_main();
}

void test_test_main_should_call_LED_State_for_each_LED_on_and_then_off(void)
{
    // Setup expected call chain
    ShouldAbortApp_ExpectAndReturn(false);  // Don't abort so we can see the other functions get called.

    LED_SetState_Expect(LED_RED, LED_ON);
    LED_SetState_Expect(LED_GREEN, LED_ON);
    LED_SetState_Expect(LED_BLUE, LED_ON);

    LED_SetState_Expect(LED_RED, LED_OFF);
    LED_SetState_Expect(LED_GREEN, LED_OFF);
    LED_SetState_Expect(LED_BLUE, LED_OFF);

    ShouldAbortApp_ExpectAndReturn(true);   // Abort since we have validated the call chain
    // Call function under test
    test_main();
}
