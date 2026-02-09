#!/bin/bash
# Create 4-up grid composites for each scene
# Layout: ROOT (top-left), SORA (top-right), MJ1 (bottom-left), MJ2 (bottom-right)

cd "/Users/gaia/CREST"
OUTDIR="composites"

# Target output: 1920x1080 (each quadrant ~960x540)
WIDTH=1920
HEIGHT=1080
HALF_W=960
HALF_H=540

echo "=== Creating Scene Composites ==="

# C1: Expectation I - Pastoral (has most assets)
# ROOT: 01-02, 03-04, 05-06, 07-08 (pick first two for grid)
# SORA: 0000.mp4
# MJ: 4 clips (pick first two for grid)
echo "Creating C1 composite..."
ffmpeg -y \
    -i "01-02.mp4" \
    -i "sora/0000.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -filter_complex "
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tl];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [2:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [3:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[br];
        [tl][tr]hstack=inputs=2[top];
        [bl][br]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C1\\: EXPECTATION I - PASTORAL':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc,
        drawtext=text='ROOT':fontsize=18:fontcolor=cyan:x=40:y=${HALF_H}-30:fontfile=/System/Library/Fonts/Helvetica.ttc,
        drawtext=text='SORA':fontsize=18:fontcolor=magenta:x=${HALF_W}+40:y=${HALF_H}-30:fontfile=/System/Library/Fonts/Helvetica.ttc,
        drawtext=text='MJ Take 1':fontsize=18:fontcolor=orange:x=40:y=${HEIGHT}-30:fontfile=/System/Library/Fonts/Helvetica.ttc,
        drawtext=text='MJ Take 2':fontsize=18:fontcolor=orange:x=${HALF_W}+40:y=${HEIGHT}-30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C1_composite.mp4" 2>/dev/null && echo "  Created scene_C1_composite.mp4"

# C2: Scene I - The Plain
# ROOT: 08-09
# SORA: 0001.mp4
# MJ: 3 clips
echo "Creating C2 composite..."
ffmpeg -y \
    -i "08-09.mp4" \
    -i "sora/0001.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_9b212ae2-976c-4e60-b121-45724fbb75d6_3.mp4" \
    -filter_complex "
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tl];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [2:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [3:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[br];
        [tl][tr]hstack=inputs=2[top];
        [bl][br]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C2\\: SCENE I - THE PLAIN':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C2_composite.mp4" 2>/dev/null && echo "  Created scene_C2_composite.mp4"

# C3: Scene II - The Voice (no ROOT)
echo "Creating C3 composite..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black1];
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black2];
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [black1][tr]hstack=inputs=2[top];
        [bl][black2]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C3\\: SCENE II - THE VOICE':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc,
        drawtext=text='[NO ROOT]':fontsize=18:fontcolor=gray:x=40:y=${HALF_H}/2:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C3_composite.mp4" 2>/dev/null && echo "  Created scene_C3_composite.mp4"

# C4: Expectation II - Sacrifice
echo "Creating C4 composite..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -filter_complex "
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black];
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [2:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[br];
        [black][tr]hstack=inputs=2[top];
        [bl][br]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C4\\: EXPECTATION II - SACRIFICE':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C4_composite.mp4" 2>/dev/null && echo "  Created scene_C4_composite.mp4"

# C7: Expectation III - Dance
echo "Creating C7 composite..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black1];
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black2];
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [black1][tr]hstack=inputs=2[top];
        [bl][black2]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C7\\: EXPECTATION III - DANCE':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C7_composite.mp4" 2>/dev/null && echo "  Created scene_C7_composite.mp4"

# C8: Scene V - The Urchin
echo "Creating C8 composite..."
ffmpeg -y \
    -i "sora/0008.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    -filter_complex "
        color=c=black:s=${HALF_W}x${HALF_H}:d=15[black];
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tr];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [2:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[br];
        [black][tr]hstack=inputs=2[top];
        [bl][br]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C8\\: SCENE V - THE URCHIN':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C8_composite.mp4" 2>/dev/null && echo "  Created scene_C8_composite.mp4"

# C9: Coda - The Armorer (most MJ clips)
echo "Creating C9 composite..."
ffmpeg -y \
    -i "sora/0009.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___89a16e21-79d7-4450-b6de-c1e719e7deec_0.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_d4338439-f7e5-4a9c-b32e-ff5aca17e9c6_0.mp4" \
    -filter_complex "
        [0:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1[tl];
        [1:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[tr];
        [2:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[bl];
        [3:v]scale=${HALF_W}:${HALF_H}:force_original_aspect_ratio=decrease,pad=${HALF_W}:${HALF_H}:(ow-iw)/2:(oh-ih)/2,setsar=1,loop=-1:size=32767[br];
        [tl][tr]hstack=inputs=2[top];
        [bl][br]hstack=inputs=2[bottom];
        [top][bottom]vstack=inputs=2,
        drawtext=text='C9\\: CODA - THE ARMORER':fontsize=28:fontcolor=white:x=40:y=30:fontfile=/System/Library/Fonts/Helvetica.ttc
        [out]
    " \
    -map "[out]" -t 15 -c:v libx264 -preset fast -crf 23 "$OUTDIR/scene_C9_composite.mp4" 2>/dev/null && echo "  Created scene_C9_composite.mp4"

echo ""
echo "=== Done! ==="
ls -la "$OUTDIR"
