

#include "bindings/hal_common.h"
#include "bindings/bricklet_laser_range_finder_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

void check(int rc, const char* msg);



// Callback function for distance callback
void distance_handler(TF_LaserRangeFinderV2 *device, int16_t distance, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Distance: %d cm\n", distance);
}


TF_LaserRangeFinderV2 lrf;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_laser_range_finder_v2_create(&lrf, UID, hal), "create device object");


	// Turn laser on and wait 250ms for very first measurement to be ready
	check(tf_laser_range_finder_v2_set_enable(&lrf, true), "call set_enable");
	tf_hal_sleep_us(hal, 250 * 1000);

	// Register distance callback to function distance_handler
	tf_laser_range_finder_v2_register_distance_callback(&lrf,
	                                                   distance_handler,
	                                                   NULL);

	// Set period for distance callback to 0.2s (200ms) without a threshold
	tf_laser_range_finder_v2_set_distance_callback_configuration(&lrf, 200, false, 'x', 0, 0);

}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
