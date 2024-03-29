// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_laser_range_finder_v2.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

// Callback function for distance callback
static void distance_handler(TF_LaserRangeFinderV2 *device, int16_t distance,
                             void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Distance: %I16d cm\n", distance);
}

static TF_LaserRangeFinderV2 lrf;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_laser_range_finder_v2_create(&lrf, NULL, hal), "create device object");

	// Turn laser on and wait 250ms for very first measurement to be ready
	check(tf_laser_range_finder_v2_set_enable(&lrf, true), "call set_enable");
	tf_hal_sleep_us(hal, 250 * 1000);

	// Register distance callback to function distance_handler
	tf_laser_range_finder_v2_register_distance_callback(&lrf,
	                                                    distance_handler,
	                                                    NULL);

	// Configure threshold for distance "greater than 20 cm"
	// with a debounce period of 1s (1000ms)
	tf_laser_range_finder_v2_set_distance_callback_configuration(&lrf, 1000, false, '>', 20, 0);
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
