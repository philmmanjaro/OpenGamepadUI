#ifndef INPUT_DEVICE_CLASS_H
#define INPUT_DEVICE_CLASS_H

#include "event.h"
#include "godot_cpp/variant/string.hpp"
#include <godot_cpp/classes/ref_counted.hpp>
#include <godot_cpp/core/binder_common.hpp>

#include <libevdev/libevdev.h>

namespace evdev {
// Maybe inherit from Resource?
class InputDevice : public godot::RefCounted {
  GDCLASS(InputDevice, godot::RefCounted);

private:
  int fd;
  struct libevdev *dev = NULL;
  bool grabbed = false;

  godot::String path;

protected:
  static void _bind_methods();

public:
  // Constructor/deconstructor
  InputDevice();
  ~InputDevice();

  // Properties

  // Methods
  int open(godot::String dev);
  int close();
  int grab(bool mode);
  bool is_open();
  bool is_grabbed();
  godot::String get_path();
  godot::String get_name();
  int get_bustype();
  int get_vendor();
  int get_product();
  int get_version();
  godot::String get_phys();
  godot::Array get_events();
  bool has_event_type(unsigned int event_type);
  bool has_event_code(unsigned int event_type, unsigned int event_code);

  // Static functions
};
} // namespace evdev
#endif // INPUT_DEVICE_CLASS_H