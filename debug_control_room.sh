#!/bin/bash
# DEBUG SCRIPT FOR CONTROL ROOM LAYOUT

cd /Users/gaia/CREST
mkdir -p mosaics_cinematic

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"

echo "DEBUG: Generating CONTROL ROOM..."

# Simplified filter chain to isolate the error
# Removed [bg][sora]overlay chaining complexity to be more explicit
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -filter_complex "
        color=c=#050505:s=1920x1080:d=5[bg];
        [0:v]scale=-1:1080,crop=608:1080[sora];
        [2:v]scale=320:-1[mj1];
        [bg][sora]overlay=656:0[v1];
        [v1][mj1]overlay=10:10[vout]
    " -map "[vout]" -t 5 mosaics_cinematic/CONTROL_ROOM_DEBUG.mp4 2>&1 | tail -20
