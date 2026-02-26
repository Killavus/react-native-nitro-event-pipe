package com.margelo.nitro.nitroeventpipe
  
import com.facebook.proguard.annotations.DoNotStrip

@DoNotStrip
class NitroEventPipe : HybridNitroEventPipeSpec() {
  override fun multiply(a: Double, b: Double): Double {
    return a * b
  }
}
