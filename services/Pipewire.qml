pragma Singleton 

import Quickshell
import Quickshell.Services.Pipewire

Singleton{
        id:root

        readonly property PwNode defaultSink: Pipewire.preferredDefaultAudioSink

        property int volume: Math.round(defaultSink.volume * 100)

}