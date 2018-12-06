#include <OSC2Midi.h>
#include <unity.h>

void test_getCC_returns_0_when_given_empty_string(void) {
    TEST_ASSERT_EQUAL(0, getCC(""));
}

void test_getCC_picks_the_only_number_not_starting_with_slash(void) {
    TEST_ASSERT_EQUAL(3, getCC("3"));
}

void test_getCC_picks_the_only_number_without_index(void) {
    TEST_ASSERT_EQUAL(32, getCC("/32"));
}

void test_getCC_picks_first_number_without_index(void) {
    TEST_ASSERT_EQUAL(66, getCC("/66/123"));
}

void test_getCC_picks_first_number_when_asked_for_index_0(void) {
    TEST_ASSERT_EQUAL(66, getCC("/66/99", 0));
}

void test_getCC_picks_second_number_when_asked_for_index_1(void) {
    TEST_ASSERT_EQUAL(99, getCC("/66/99", 1));
}

void test_getCC_picks_third_number_when_asked_for_index_2(void) {
    TEST_ASSERT_EQUAL(33, getCC("/66/99/33", 2));
}

void test_getCC_returns_0_when_asked_for_index_out_of_range(void) {
    TEST_ASSERT_EQUAL(0, getCC("/1", 1));
}

void test_getCC_returns_0_when_asked_for_index_out_of_range_2(void) {
    TEST_ASSERT_EQUAL(0, getCC("/11/22/33", 3));
}

void test_getCC_returns_0_when_asked_for_index_waay_out_of_range(void) {
    TEST_ASSERT_EQUAL(0, getCC("/12/13/14", 55));
}

void process() {
    UNITY_BEGIN();
    RUN_TEST(test_getCC_returns_0_when_given_empty_string);
    RUN_TEST(test_getCC_picks_the_only_number_not_starting_with_slash);
    RUN_TEST(test_getCC_picks_the_only_number_without_index);
    RUN_TEST(test_getCC_picks_first_number_without_index);
    RUN_TEST(test_getCC_picks_first_number_when_asked_for_index_0);
    RUN_TEST(test_getCC_picks_second_number_when_asked_for_index_1);
    RUN_TEST(test_getCC_picks_third_number_when_asked_for_index_2);
    RUN_TEST(test_getCC_returns_0_when_asked_for_index_out_of_range);
    RUN_TEST(test_getCC_returns_0_when_asked_for_index_out_of_range_2);
    RUN_TEST(test_getCC_returns_0_when_asked_for_index_waay_out_of_range);
    UNITY_END();
}

int main(int argc, char **argv) {
    process();
    return 0;
}