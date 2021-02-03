function mpv-yt --argument-names resolution url
    switch $resolution
        case hd
            set w 1280
        case fhd
            set w 1920
        case 2k
            set w 2560
        case 4k
            set w 3840
        case 8k
            set w 7680
        end
    prime-run mpv --ytdl-format="bestvideo[width=?$w][fps<=?60]+bestaudio" "$url";
end
