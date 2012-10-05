#include "unity.h"
#include "system.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_ShouldAbortApp_should_return_false_for_now(void)
{
    TEST_ASSERT_FALSE(ShouldAbortApp());
}
