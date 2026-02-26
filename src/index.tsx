import { NitroModules } from 'react-native-nitro-modules';
import type { NitroEventPipe } from './NitroEventPipe.nitro';

const NitroEventPipeHybridObject =
  NitroModules.createHybridObject<NitroEventPipe>('NitroEventPipe');

export function multiply(a: number, b: number): number {
  return NitroEventPipeHybridObject.multiply(a, b);
}
