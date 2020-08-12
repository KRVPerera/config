#!/bin/bash
ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate,duration -show_streams -of default=nw=1 "$1" | grep frame

ffmpeg -hide_banner \
-ss 0 \
-i "$1" \
-map_metadata 0 \
-map_chapters 0 \
-metadata title="TITLE" \
-map 0:0 -metadata:s:v:0 language=eng \
-map 0:1 -metadata:s:a:0 language=eng -metadata:s:a:0 title="Surround 5.1 (DTS)" \
-map 0:2? -metadata:s:s:0 language=eng -metadata:s:s:0 title="English" \
-metadata:s:t:0 filename="Cover.jpg" -metadata:s:t:0 mimetype="image/jpeg" \
-c:v libx265 -preset veryslow -x265-params \
crf=19:qcomp=0.8:aq-mode=1:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44 \
-c:a copy \
-c:s copy \
-t 120 \
"OUTPUT.HEVC.DTS.Sample.19.veryslow.mkv"
