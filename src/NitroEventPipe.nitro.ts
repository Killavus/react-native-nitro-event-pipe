import type { HybridObject } from 'react-native-nitro-modules';

type AccommodationMap = {
  results: Accommodation[];
};

export type Accommodation = {
  name: string;
  lat: number;
  longit: number;
  hotelId: string;
};

export interface NitroEventPipe
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  onAccommodationMapChange(
    onAccomodationMapChanged: (accommodationMap: AccommodationMap) => void
  ): void;
  requestAccommodationMap(): boolean;

  selectAccommodation(hotelId: string): void;
  refresh(): void;
}
