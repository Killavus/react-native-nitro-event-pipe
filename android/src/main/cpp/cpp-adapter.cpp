#include <jni.h>
#include "nitroeventpipeOnLoad.hpp"

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
  return margelo::nitro::nitroeventpipe::initialize(vm);
}
