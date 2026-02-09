#!/bin/bash
# CREST Mosaic - VERIFIED LAYOUT (fixed filter chain)
# Uses overlay instead of hstack for mixed aspect ratios

cd /Users/gaia/CREST
mkdir -p mosaics_verified

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_REG="/System/Library/Fonts/Supplemental/Arial.ttf"

echo "=== CREST MOSAIC (VERIFIED) ==="
echo ""

# C1: Expectation I
echo "[1/9] C1: Expectation I..."
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=277:-1,crop=277:180[mj1];
        [3:v]scale=278:-1,crop=278:180[mj2];
        [mj1][mj2]hstack=inputs=2[mjrow];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mjrow]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C1 EXPECTATION I':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='For vines and olive trees':fontsize=16:fontcolor=0xcccccc:x=420:y=635,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal':fontsize=16:fontcolor=0xc45c7a:x=420:y=680,
            drawtext=fontfile='${FONT_REG}':text='His hands had put instead':fontsize=16:fontcolor=0xc45c7a:x=420:y=705,
            drawtext=fontfile='${FONT}':text='SORA\: 0000':fontsize=10:fontcolor=0x555555:x=10:y=190,
            drawtext=fontfile='${FONT}':text='ROOT\: 01-02':fontsize=10:fontcolor=0x555555:x=410:y=5,
            drawtext=fontfile='${FONT}':text='MJ\: 2 clips':fontsize=10:fontcolor=0x555555:x=1370:y=190[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C1.mp4 2>/dev/null && echo "  C1 done" || echo "  C1 FAILED"

# C2: The Plain  
echo "[2/9] C2: The Plain..."
ffmpeg -y \
    -i "sora/0001.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=555:-1,crop=555:360[mj];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mj]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C2 THE PLAIN':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='A plain without a feature bare and brown':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='An unintelligible multitude':fontsize=16:fontcolor=0xcccccc:x=420:y=635,
            drawtext=fontfile='${FONT_REG}':text='A million eyes a million boots in line':fontsize=16:fontcolor=0xc45c7a:x=420:y=680,
            drawtext=fontfile='${FONT}':text='SORA\: 0001':fontsize=10:fontcolor=0x555555:x=10:y=190,
            drawtext=fontfile='${FONT}':text='ROOT\: 01-02':fontsize=10:fontcolor=0x555555:x=410:y=5[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C2.mp4 2>/dev/null && echo "  C2 done" || echo "  C2 FAILED"

# C3: The Voice
echo "[3/9] C3: The Voice..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=555:-1,crop=555:360[mj];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mj]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C3 THE VOICE':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='Out of the air a voice without a face':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='Proved by statistics that some cause was just':fontsize=16:fontcolor=0xcccccc:x=420:y=635,
            drawtext=fontfile='${FONT_REG}':text='They marched away enduring a belief':fontsize=16:fontcolor=0xc45c7a:x=420:y=680,
            drawtext=fontfile='${FONT}':text='SORA\: 0002':fontsize=10:fontcolor=0x555555:x=10:y=190,
            drawtext=fontfile='${FONT}':text='ROOT\: 03-04':fontsize=10:fontcolor=0x555555:x=410:y=5[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C3.mp4 2>/dev/null && echo "  C3 done" || echo "  C3 FAILED"

# C4: Sacrifice
echo "[4/9] C4: Sacrifice..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=555:-1,crop=555:180[mj1];
        [3:v]scale=555:-1,crop=555:180[mj2];
        [mj1][mj2]vstack=inputs=2[mj];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mj]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C4 SACRIFICE':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='For ritual pieties':fontsize=16:fontcolor=0xcccccc:x=420:y=635,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal':fontsize=16:fontcolor=0xc45c7a:x=420:y=680,
            drawtext=fontfile='${FONT}':text='SORA\: 0003':fontsize=10:fontcolor=0x555555:x=10:y=190,
            drawtext=fontfile='${FONT}':text='ROOT\: 03-04':fontsize=10:fontcolor=0x555555:x=410:y=5[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C4.mp4 2>/dev/null && echo "  C4 done" || echo "  C4 FAILED"

# C5: The Camp (ROOT only - no SORA)
echo "[5/9] C5: The Camp (ROOT only)..."
ffmpeg -y -i "05-06.mp4" \
    -filter_complex "
        [0:v]scale=1920:-1,crop=1920:810[root];
        color=c=#0d0d0d:s=1920x1080:d=14[bg];
        [bg][root]overlay=0:0[v1];
        [v1]drawtext=fontfile='${FONT}':text='C5 THE CAMP':fontsize=48:fontcolor=white:x=60:y=840,
            drawtext=fontfile='${FONT_REG}':text='Barbed wire enclosed an arbitrary spot':fontsize=20:fontcolor=0xcccccc:x=60:y=910,
            drawtext=fontfile='${FONT_REG}':text='Three pale figures were led forth and bound':fontsize=20:fontcolor=0xc45c7a:x=60:y=950,
            drawtext=fontfile='${FONT}':text='[NO SORA]':fontsize=12:fontcolor=0x883333:x=60:y=1020,
            drawtext=fontfile='${FONT}':text='ROOT\: 05-06':fontsize=10:fontcolor=0x555555:x=10:y=5[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 14 mosaics_verified/C5.mp4 2>/dev/null && echo "  C5 done" || echo "  C5 FAILED"

# C6: The Execution (ROOT + MJ, no SORA)
echo "[6/9] C6: The Execution..."
ffmpeg -y \
    -i "05-06.mp4" \
    -i "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=14[bg];
        [0:v]scale=1280:-1,crop=1280:720[root];
        [1:v]scale=640:-1,crop=640:720[mj];
        [bg][root]overlay=0:0[v1];
        [v1][mj]overlay=1280:0[v2];
        [v2]drawtext=fontfile='${FONT}':text='C6 THE EXECUTION':fontsize=36:fontcolor=white:x=60:y=760,
            drawtext=fontfile='${FONT_REG}':text='The mass and majesty of this world all':fontsize=18:fontcolor=0xcccccc:x=60:y=820,
            drawtext=fontfile='${FONT_REG}':text='And died as men before their bodies died':fontsize=18:fontcolor=0xc45c7a:x=60:y=860,
            drawtext=fontfile='${FONT}':text='[NO SORA]':fontsize=12:fontcolor=0x883333:x=60:y=920,
            drawtext=fontfile='${FONT}':text='ROOT\: 05-06':fontsize=10:fontcolor=0x555555:x=10:y=5[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 14 mosaics_verified/C6.mp4 2>/dev/null && echo "  C6 done" || echo "  C6 FAILED"

# C7: Dance
echo "[7/9] C7: Dance..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=555:-1,crop=555:360[mj];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mj]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C7 DANCE':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='Men and women in a dance':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='Moving their sweet limbs':fontsize=16:fontcolor=0xcccccc:x=420:y=635,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining shield':fontsize=16:fontcolor=0xc45c7a:x=420:y=680,
            drawtext=fontfile='${FONT}':text='SORA\: 0007':fontsize=10:fontcolor=0x555555:x=10:y=190[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C7.mp4 2>/dev/null && echo "  C7 done" || echo "  C7 FAILED"

# C8: The Urchin (4 MJ)
echo "[8/9] C8: The Urchin..."
ffmpeg -y \
    -i "sora/0008.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=277:-1,crop=277:180[mj1];
        [3:v]scale=278:-1,crop=278:180[mj2];
        [mj1][mj2]hstack=inputs=2[mjrow];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mjrow]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C8 THE URCHIN':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='A ragged urchin aimless and alone':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='That girls are raped':fontsize=16:fontcolor=0xc45c7a:x=420:y=660,
            drawtext=fontfile='${FONT}':text='SORA\: 0008':fontsize=10:fontcolor=0x555555:x=10:y=190[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C8.mp4 2>/dev/null && echo "  C8 done" || echo "  C8 FAILED"

# C9: The Armorer (4 MJ)
echo "[9/9] C9: The Armorer..."
ffmpeg -y \
    -i "sora/0009.mp4" \
    -i "08-09.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_11c56592-92fe-45a6-8482-238e17c667b7_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=15[bg];
        [0:v]scale=405:-1,crop=405:720[sora];
        [1:v]scale=960:-1,crop=960:540[root];
        [2:v]scale=277:-1,crop=277:180[mj1];
        [3:v]scale=278:-1,crop=278:180[mj2];
        [mj1][mj2]hstack=inputs=2[mjrow];
        [bg][sora]overlay=0:180[v1];
        [v1][root]overlay=405:0[v2];
        [v2][mjrow]overlay=1365:180[v3];
        [v3]drawtext=fontfile='${FONT}':text='C9 THE ARMORER':fontsize=32:fontcolor=white:x=420:y=560,
            drawtext=fontfile='${FONT_REG}':text='The thin-lipped armorer Hephaestos hobbled away':fontsize=16:fontcolor=0xcccccc:x=420:y=610,
            drawtext=fontfile='${FONT_REG}':text='Iron-hearted man-slaying Achilles':fontsize=16:fontcolor=0xc45c7a:x=420:y=660,
            drawtext=fontfile='${FONT}':text='SORA\: 0009':fontsize=10:fontcolor=0x555555:x=10:y=190[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mosaics_verified/C9.mp4 2>/dev/null && echo "  C9 done" || echo "  C9 FAILED"

# === Concatenate ===
echo ""
echo "[FINAL] Concatenating..."

cat > mosaics_verified/concat_list.txt << EOF
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

ffmpeg -y -f concat -safe 0 -i mosaics_verified/concat_list.txt \
    -c:v libx264 -preset medium -crf 20 -c:a aac \
    mosaics_verified/SHIELD_OF_ACHILLES.mp4 2>/dev/null

echo ""
echo "=== COMPLETE ==="
ls -lh mosaics_verified/*.mp4
