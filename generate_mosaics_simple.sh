#!/bin/bash
# CREST Mosaic - SIMPLE VERIFIED (no stacking, only overlay)

cd /Users/gaia/CREST
mkdir -p mosaics_simple

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_REG="/System/Library/Fonts/Supplemental/Arial.ttf"

echo "=== CREST MOSAIC (SIMPLE) ==="
echo ""

# Simple layout: SORA (left) | ROOT (center) | MJ (right)
# Each panel: 640x800, Text area: 1920x280

# C1
echo "[1/9] C1..."
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C1  EXPECTATION I':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For vines and olive trees':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / His hands had put instead':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT_REG}':text='An artificial wilderness / And a sky like lead':fontsize=18:fontcolor=0xc45c7a:x=50:y=950,
            drawtext=fontfile='${FONT}':text='SORA 0000':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 01-02':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='MJ C1 clip':fontsize=10:fontcolor=0x444444:x=1365:y=305,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C1.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C2
echo "[2/9] C2..."
ffmpeg -y \
    -i "sora/0001.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C2  THE PLAIN':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='A plain without a feature bare and brown':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='A million eyes a million boots in line':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0001':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 01-02':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C2.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C3
echo "[3/9] C3..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C3  THE VOICE':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='Out of the air a voice without a face':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='They marched away enduring a belief':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0002':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 03-04':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C3.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C4
echo "[4/9] C4..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C4  SACRIFICE':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For ritual pieties':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / Quite another scene':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0003':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 03-04':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C4.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C5 (NO SORA)
echo "[5/9] C5 (NO SORA)..."
ffmpeg -y -i "05-06.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=14[bg];
        [0:v]scale=1920:780,setsar=1[root];
        [bg][root]overlay=0:0[v1];
        [v1]drawtext=fontfile='${FONT}':text='C5  THE CAMP':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='Barbed wire enclosed an arbitrary spot':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='Three pale figures were led forth and bound':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='ROOT 05-06':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='[NO SORA/MJ]':fontsize=12:fontcolor=0x883333:x=1800:y=770,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 14 mosaics_simple/C5.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C6 (NO SORA)
echo "[6/9] C6 (NO SORA)..."
ffmpeg -y \
    -i "05-06.mp4" \
    -i "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=14[bg];
        [0:v]scale=1360:780,setsar=1[root];
        [1:v]scale=560:780,setsar=1[mj];
        [bg][root]overlay=0:0[v1];
        [v1][mj]overlay=1360:0[v2];
        [v2]drawtext=fontfile='${FONT}':text='C6  THE EXECUTION':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='The mass and majesty of this world all':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='And died as men before their bodies died':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='ROOT 05-06':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='[NO SORA]':fontsize=12:fontcolor=0x883333:x=1800:y=770,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 14 mosaics_simple/C6.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C7
echo "[7/9] C7..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C7  DANCE':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='Men and women in a dance / Moving their sweet limbs':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining shield / A weed-choked field':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0007':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 07-08':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C7.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C8
echo "[8/9] C8..."
ffmpeg -y \
    -i "sora/0008.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C8  THE URCHIN':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='A ragged urchin aimless and alone':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='That girls are raped that two boys knife a third':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0008':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 07-08':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C8.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# C9
echo "[9/9] C9..."
ffmpeg -y \
    -i "sora/0009.mp4" \
    -i "08-09.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=440:780,setsar=1[sora];
        [1:v]scale=920:520,setsar=1[root];
        [2:v]scale=560:315,setsar=1[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=440:0[v2];
        [v2][mj]overlay=1360:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C9  THE ARMORER':fontsize=36:fontcolor=white:x=50:y=810,
            drawtext=fontfile='${FONT_REG}':text='The thin-lipped armorer Hephaestos hobbled away':fontsize=18:fontcolor=0xcccccc:x=50:y=870,
            drawtext=fontfile='${FONT_REG}':text='Iron-hearted man-slaying Achilles / Who would not live long':fontsize=18:fontcolor=0xc45c7a:x=50:y=910,
            drawtext=fontfile='${FONT}':text='SORA 0009':fontsize=10:fontcolor=0x444444:x=5:y=770,
            drawtext=fontfile='${FONT}':text='ROOT 08-09':fontsize=10:fontcolor=0x444444:x=445:y=510,
            drawtext=fontfile='${FONT}':text='CODA':fontsize=12:fontcolor=0x555555:x=50:y=1010[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_simple/C9.mp4 2>/dev/null && echo "  done" || echo "  FAILED"

# === Concatenate ===
echo ""
echo "[FINAL] Concatenating..."

cat > mosaics_simple/concat_list.txt << EOF
file 'C1.mp4'
file 'C2.mp4'
file 'C3.mp4'
file 'C4.mp4'
file 'C5.mp4'
file 'C6.mp4'
file 'C7.mp4'
file 'C8.mp4'
file 'C9.mp4'
EOF

ffmpeg -y -f concat -safe 0 -i mosaics_simple/concat_list.txt \
    -c:v libx264 -preset medium -crf 20 -c:a aac \
    mosaics_simple/SHIELD_OF_ACHILLES.mp4 2>/dev/null

echo ""
echo "=== COMPLETE ==="
ls -lh mosaics_simple/*.mp4
