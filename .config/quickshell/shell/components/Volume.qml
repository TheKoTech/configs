import Quickshell.Services.Pipewire

BarText {
    text: {
        const sink = Pipewire.defaultAudioSink;
        if (!sink || !sink.audio)
            return "  --";
        return (sink.audio.muted ? "  " : "  ") + Math.round(sink.audio.volume * 100) + "%";
    }
    color: Qt.rgba(0 / 255, 241 / 255, 169 / 255, 0.933)
}
