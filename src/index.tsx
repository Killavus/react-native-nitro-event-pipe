import { NitroModules } from 'react-native-nitro-modules';
import type { NitroEventPipe, Accommodation } from './NitroEventPipe.nitro';

const NitroEventPipeHybridObject =
  NitroModules.createHybridObject<NitroEventPipe>('NitroEventPipe');

export default NitroEventPipeHybridObject;

export type { Accommodation };
