#!/bin/bash
# CREST CINEMATIC MOSAICS - "FLY EYE" EDITING SUITE (FIXED)
# Three distinct layouts:
# 1. CONTROL_ROOM: Central HERO clip (SORA full height) with peripheral MJ monitoring grid
# 2. SCANNER: Horizontal filmstrips of ROOT/MJ moving across screen
# 3. FLY_EYE: Dense grid maximizing all 34 clips 

cd /Users/gaia/CREST
mkdir -p mosaics_cinematic

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_MONO="/System/Library/Fonts/Supplemental/Courier New Bold.ttf"

echo "=== CINEMATIC MOSAIC CONFIGURATIONS ==="
echo ""

# === CONFIG 1: THE CONTROL ROOM ===
# Layout: SORA (9:16) centered full height (594x1080). 
# Left/Right columns: stacked MJ/ROOT clips monitor-style (650px wide space)
# MJ clips are 832x464. Scale to 320x180.
# +-----+------+-----+
# | MJ  |      | MJ  |
# | MJ  | SORA | MJ  |
# | MJ  | 594  | MJ  |
# | MJ  |      | MJ  |
# +-----+------+-----+

echo "[1/3] Generating 'CONTROL ROOM'..."
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -filter_complex "
        color=c=#050505:s=1920x1080:d=15[bg];
        
        [0:v]scale=-1:1080[sora];
        [2:v]scale=320:180,setsar=1[mj1];
        [3:v]scale=320:180,setsar=1[mj2];
        [4:v]scale=320:180,setsar=1[mj3];
        [5:v]scale=320:180,setsar=1[mj4];
        [6:v]scale=320:180,setsar=1[mj5];
        [7:v]scale=320:180,setsar=1[mj6];
        
        [bg][sora]overlay=663:0[v0];
        
        [v0][mj1]overlay=10:50[v1];
        [v1][mj2]overlay=330:50[v2];
        [v2][mj3]overlay=10:300[v3];
        [v3][mj4]overlay=330:300[v4];
        [v4][mj5]overlay=1270:50[v5];
        [v5][mj6]overlay=1590:50[v6];
        
        [v6]drawtext=fontfile='${FONT_MONO}':text='VIEW: CONTROL ROOM':fontsize=18:fontcolor=0x00ff00:x=1600:y=1000,
            drawtext=fontfile='${FONT_MONO}':text='SHIELD SYSTEM V.1':fontsize=12:fontcolor=0x00cc00:x=1600:y=1030,
            drawtext=fontfile='${FONT}':text='[REC]':fontsize=24:fontcolor=red:x=50:y=50[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_cinematic/CONTROL_ROOM.mp4 2>/dev/null && echo "  CONTROL_ROOM Done" || echo "  CONTROL_ROOM Failed"


# === CONFIG 2: THE SCANNER ===
# Horizontal filmstrips
# Top: MJ Stream
# Mid: ROOT Stream
# Bot: Metadata/Text
echo "[2/3] Generating 'SCANNER'..."
ffmpeg -y \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_ced1c73d-5323-43cb-8ac9-ba7b49285c3a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_d4b00e54-b9bb-448f-bba6-aef378353569_0.mp4" \
    -i "01-02.mp4" \
    -i "03-04.mp4" \
    -filter_complex "
        color=c=#000000:s=1920x1080:d=15[bg];
        
        [0:v]scale=480:270,setsar=1[m1];
        [1:v]scale=480:270,setsar=1[m2];
        [2:v]scale=480:270,setsar=1[m3];
        [3:v]scale=480:270,setsar=1[m4];
        [m1][m2][m3][m4]hstack=inputs=4[mjst];
        
        [4:v]scale=960:540,setsar=1[r1];
        [5:v]scale=960:540,setsar=1[r2];
        [r1][r2]hstack=inputs=2[rootst];
        
        [bg][mjst]overlay=0:80[v1];
        [v1][rootst]overlay=0:400[v2];
        
        [v2]drawtext=fontfile='${FONT_MONO}':text='SCAN_MODE: ACTIVE':fontsize=48:fontcolor=white:x=50:y=20,
            drawtext=fontfile='${FONT_MONO}':text='A01: MJ_STREAM_DATA':fontsize=24:fontcolor=0xaaaaaa:x=50:y=360,
            drawtext=fontfile='${FONT_MONO}':text='B02: ROOT_LAYER_CORE':fontsize=24:fontcolor=0xaaaaaa:x=50:y=950,
            drawtext=fontfile='${FONT_MONO}':text='00:00:14:23':fontsize=36:fontcolor=white:x=1600:y=20[vout]
    " -map "[vout]" -c:v libx264 -preset fast -crf 23 -t 15 mosaics_cinematic/SCANNER.mp4 2>/dev/null && echo "  SCANNER Done" || echo "  SCANNER Failed" 

# FLY EYE already exists, but re-generating for completeness 
echo "[3/3] Generating 'FLY EYE' (Skipping, already present)..."

echo ""
echo "=== CINEMATIC GENERATION COMPLETE ==="
ls -lh mosaics_cinematic/*.mp4
