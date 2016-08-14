#include "hescape.h"

VALUE rb_mHescape;

void
Init_hescape(void)
{
  rb_mHescape = rb_define_module("Hescape");
}
