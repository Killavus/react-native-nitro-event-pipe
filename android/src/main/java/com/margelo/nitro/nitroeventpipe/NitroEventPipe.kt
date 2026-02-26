package com.margelo.nitro.nitroeventpipe

import android.widget.Toast
import com.facebook.proguard.annotations.DoNotStrip
import com.margelo.nitro.NitroModules


@DoNotStrip
class NitroEventPipe : HybridNitroEventPipeSpec() {
  private var listeners: MutableList<(accommodationMap: AccommodationMap) -> Unit> = mutableListOf();
  private var requested = false

  override fun onAccommodationMapChange(onAccomodationMapChanged: (accommodationMap: AccommodationMap) -> Unit) {
    listeners.add(onAccomodationMapChanged);
  }

  override fun requestAccommodationMap(): Boolean {
    if (!requested) {
      requested = true;
      for (listener in listeners) {
        listener(
          AccommodationMap(DUSSELDORF_HOTELS.sliceArray(0..5))
        )
      }

      return true;
    } else {
      return false;
    }
  }

  override fun selectAccommodation(hotelId: String) {
    Toast.makeText(NitroModules.applicationContext, "Accommodation Selected (${hotelId})!", Toast.LENGTH_SHORT).show();
  }

  override fun refresh() {
    if (requested) {
      for (listener in listeners) {
        listener(
          AccommodationMap(DUSSELDORF_HOTELS)
        )
      }
    } else {
      Toast.makeText(NitroModules.applicationContext, "Refresh impossible!", Toast.LENGTH_SHORT).show();
    }
  }

  companion object {
    val DUSSELDORF_HOTELS: Array<Accommodation> = arrayOf<Accommodation>(
      Accommodation("Breidenbacher Hof", 51.2248, 6.7785, "10293"),
      Accommodation("The Wellem", 51.2274, 6.7751, "44821"),
      Accommodation("Hyatt Regency Düsseldorf", 51.2163, 6.7538, "88302"),
      Accommodation("Steigenberger Icon Parkhotel", 51.2270, 6.7788, "31055"),
      Accommodation("25hours Hotel Das Tour", 51.2298, 6.7942, "55619"),
      Accommodation("Hotel Indigo Victoriaplatz", 51.2341, 6.7749, "22941"),
      Accommodation("Ruby Leni Hotel", 51.2198, 6.7761, "67432"),
      Accommodation("Living Hotel De Medici", 51.2272, 6.7744, "19033"),
      Accommodation("ME And All Hotel", 51.2245, 6.7865, "41120"),
      Accommodation("Meliá Düsseldorf", 51.2312, 6.7772, "77391")
    )
  }

}
