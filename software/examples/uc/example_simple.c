#include "bindings/hal_common.h"
#include "bindings/bricklet_laser_range_finder_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


static TF_LaserRangeFinderV2 lrf;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_laser_range_finder_v2_create(&lrf, UID, hal), "create device object");

	// Turn laser on and wait 250ms for very first measurement to be ready
	check(tf_laser_range_finder_v2_set_enable(&lrf, true), "call set_enable");
	tf_hal_sleep_us(hal, 250 * 1000);

	// Get current distance
	int16_t distance;
	check(tf_laser_range_finder_v2_get_distance(&lrf, &distance), "get distance");

	tf_hal_printf("Distance: %d cm\n", distance);
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
