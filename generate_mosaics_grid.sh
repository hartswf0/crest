#!/bin/bash
# CREST Mosaic - GRID LAYOUT (no overlap)
# Layout 1920x1080:
# +------+------+------+------+
# | MJ1  | MJ2  | MJ3  | MJ4  |  (270px)
# +------+------+------+------+
# | SORA        | ROOT         |  (540px) 
# | + TEXT      |              |
# +-------------+--------------+
# |       TEXT PANEL           |  (270px)
# +----------------------------+

cd /Users/gaia/CREST
mkdir -p mosaics_grid

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_REG="/System/Library/Fonts/Supplemental/Arial.ttf"

echo "=== CREST MOSAIC (GRID LAYOUT) ==="
echo ""

# C1: Expectation I
echo "[1/9] C1: Expectation I..."
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_ced1c73d-5323-43cb-8ac9-ba7b49285c3a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_d4b00e54-b9bb-448f-bba6-aef378353569_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [2:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj1];
        [3:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj2];
        [4:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj3];
        [5:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj4];
        [mj1][mj2][mj3][mj4]hstack=inputs=4[mjrow];
        [0:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540[sora];
        [1:v]scale=1280:540:force_original_aspect_ratio=increase,crop=1280:540[root];
        [bg][mjrow]overlay=0:0[v1];
        [v1][sora]overlay=0:270[v2];
        [v2][root]overlay=640:270[v3];
        [v3]drawtext=fontfile='${FONT}':text='C1':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION I\: PASTORAL':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For vines and olive trees':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / His hands had put instead':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT_REG}':text='An artificial wilderness / And a sky like lead':fontsize=20:fontcolor=0xc45c7a:x=180:y=970,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=180:y=1020,
            drawtext=fontfile='${FONT}':text='SORA':fontsize=14:fontcolor=0xc45c7a:x=10:y=280,
            drawtext=fontfile='${FONT}':text='ROOT':fontsize=14:fontcolor=0xd4a853:x=650:y=280,
            drawtext=fontfile='${FONT}':text='MIDJOURNEY':fontsize=14:fontcolor=0x6b7b8b:x=10:y=10[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C1.mp4 2>/dev/null

# C2: The Plain
echo "[2/9] C2: The Plain..."
ffmpeg -y \
    -i "sora/0001.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_9b212ae2-976c-4e60-b121-45724fbb75d6_3.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_ad4e846e-97f2-4213-9bfa-de6858e65c1c_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [2:v]scale=640:270:force_original_aspect_ratio=increase,crop=640:270[mj1];
        [3:v]scale=640:270:force_original_aspect_ratio=increase,crop=640:270[mj2];
        [4:v]scale=640:270:force_original_aspect_ratio=increase,crop=640:270[mj3];
        [mj1][mj2][mj3]hstack=inputs=3[mjrow];
        [0:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540[sora];
        [1:v]scale=1280:540:force_original_aspect_ratio=increase,crop=1280:540[root];
        [bg][mjrow]overlay=0:0[v1];
        [v1][sora]overlay=0:270[v2];
        [v2][root]overlay=640:270[v3];
        [v3]drawtext=fontfile='${FONT}':text='C2':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE I\: THE PLAIN':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='A plain without a feature bare and brown':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='An unintelligible multitude / A million eyes a million boots in line':fontsize=20:fontcolor=0xcccccc:x=180:y=935,
            drawtext=fontfile='${FONT_REG}':text='Without expression waiting for a sign':fontsize=20:fontcolor=0xc45c7a:x=180:y=970,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C2.mp4 2>/dev/null

# C3: The Voice (1 MJ - use portrait layout)
echo "[3/9] C3: The Voice..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=960:810:force_original_aspect_ratio=increase,crop=960:810[root];
        [2:v]scale=320:810:force_original_aspect_ratio=increase,crop=320:810[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1600:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C3':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE II\: THE VOICE':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='Out of the air a voice without a face':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='Proved by statistics that some cause was just':fontsize=20:fontcolor=0xcccccc:x=180:y=935,
            drawtext=fontfile='${FONT_REG}':text='They marched away enduring a belief':fontsize=20:fontcolor=0xc45c7a:x=180:y=970,
            drawtext=fontfile='${FONT_REG}':text='Whose logic brought them somewhere to grief':fontsize=20:fontcolor=0xc45c7a:x=180:y=1005,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=180:y=1045[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C3.mp4 2>/dev/null

# C4: Sacrifice (2 MJ)
echo "[4/9] C4: Sacrifice..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [2:v]scale=960:270:force_original_aspect_ratio=increase,crop=960:270[mj1];
        [3:v]scale=960:270:force_original_aspect_ratio=increase,crop=960:270[mj2];
        [mj1][mj2]hstack=inputs=2[mjrow];
        [0:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540[sora];
        [1:v]scale=1280:540:force_original_aspect_ratio=increase,crop=1280:540[root];
        [bg][mjrow]overlay=0:0[v1];
        [v1][sora]overlay=0:270[v2];
        [v2][root]overlay=640:270[v3];
        [v3]drawtext=fontfile='${FONT}':text='C4':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION II\: SACRIFICE':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For ritual pieties':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / Quite another scene':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C4.mp4 2>/dev/null

# C5: The Camp (ROOT only - full width)
echo "[5/9] C5: The Camp..."
ffmpeg -y -i "05-06.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=1920:810:force_original_aspect_ratio=increase,crop=1920:810[root];
        [bg][root]overlay=0:0[v1];
        [v1]drawtext=fontfile='${FONT}':text='C5':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE III\: THE CAMP':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='Barbed wire enclosed an arbitrary spot':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='Three pale figures were led forth and bound':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT_REG}':text='To three posts driven upright in the ground':fontsize=20:fontcolor=0xc45c7a:x=180:y=975,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C5.mp4 2>/dev/null

# C6: The Execution (1 MJ)
echo "[6/9] C6: The Execution..."
ffmpeg -y \
    -i "05-06.mp4" \
    -i "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=1280:810:force_original_aspect_ratio=increase,crop=1280:810[root];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[mj];
        [bg][root]overlay=0:0[v1];
        [v1][mj]overlay=1280:0[v2];
        [v2]drawtext=fontfile='${FONT}':text='C6':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE IV\: THE EXECUTION':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='The mass and majesty of this world all':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='They lost their pride / And died as men before their bodies died':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C6.mp4 2>/dev/null

# C7: Dance (1 MJ)
echo "[7/9] C7: Dance..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=960:810:force_original_aspect_ratio=increase,crop=960:810[root];
        [2:v]scale=320:810:force_original_aspect_ratio=increase,crop=320:810[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1600:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C7':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION III\: DANCE':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='Men and women in a dance / Moving their sweet limbs':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining shield / A weed-choked field':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C7.mp4 2>/dev/null

# C8: The Urchin (4 MJ)
echo "[8/9] C8: The Urchin..."
ffmpeg -y \
    -i "sora/0008.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_3.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_c5fe4e0e-6969-4908-a57f-b427a728ff5c_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [2:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj1];
        [3:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj2];
        [4:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj3];
        [5:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj4];
        [mj1][mj2][mj3][mj4]hstack=inputs=4[mjrow];
        [0:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540[sora];
        [1:v]scale=1280:540:force_original_aspect_ratio=increase,crop=1280:540[root];
        [bg][mjrow]overlay=0:0[v1];
        [v1][sora]overlay=0:270[v2];
        [v2][root]overlay=640:270[v3];
        [v3]drawtext=fontfile='${FONT}':text='C8':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE V\: THE URCHIN':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='A ragged urchin aimless and alone':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='That girls are raped that two boys knife a third':fontsize=20:fontcolor=0xc45c7a:x=180:y=940,
            drawtext=fontfile='${FONT_REG}':text='Were axioms to him who had never heard':fontsize=20:fontcolor=0xc45c7a:x=180:y=975,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C8.mp4 2>/dev/null

# C9: The Armorer (4 MJ)
echo "[9/9] C9: The Armorer..."
ffmpeg -y \
    -i "sora/0009.mp4" \
    -i "08-09.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_11c56592-92fe-45a6-8482-238e17c667b7_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_284c194f-8564-43c4-b8cb-0be1ca2edae6_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_30b84bfd-639b-4884-9e3d-a5fb06103dc6_1.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [2:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj1];
        [3:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj2];
        [4:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj3];
        [5:v]scale=480:270:force_original_aspect_ratio=increase,crop=480:270[mj4];
        [mj1][mj2][mj3][mj4]hstack=inputs=4[mjrow];
        [0:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540[sora];
        [1:v]scale=1280:540:force_original_aspect_ratio=increase,crop=1280:540[root];
        [bg][mjrow]overlay=0:0[v1];
        [v1][sora]overlay=0:270[v2];
        [v2][root]overlay=640:270[v3];
        [v3]drawtext=fontfile='${FONT}':text='C9':fontsize=96:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='CODA\: THE ARMORER':fontsize=32:fontcolor=white:x=180:y=850,
            drawtext=fontfile='${FONT_REG}':text='The thin-lipped armorer Hephaestos hobbled away':fontsize=20:fontcolor=0xcccccc:x=180:y=900,
            drawtext=fontfile='${FONT_REG}':text='Thetis of the shining breasts cried out in dismay':fontsize=20:fontcolor=0xcccccc:x=180:y=935,
            drawtext=fontfile='${FONT_REG}':text='Iron-hearted man-slaying Achilles / Who would not live long':fontsize=20:fontcolor=0xc45c7a:x=180:y=975,
            drawtext=fontfile='${FONT}':text='CODA':fontsize=14:fontcolor=0x666666:x=180:y=1020[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_grid/C9.mp4 2>/dev/null

# === Concatenate ===
echo ""
echo "[FINAL] Concatenating..."

cat > mosaics_grid/concat_list.txt << EOF
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

ffmpeg -y -f concat -safe 0 -i mosaics_grid/concat_list.txt \
    -c:v libx264 -preset medium -crf 20 -c:a aac \
    mosaics_grid/SHIELD_OF_ACHILLES.mp4 2>/dev/null

echo ""
echo "=== COMPLETE (GRID LAYOUT) ==="
ls -lh mosaics_grid/*.mp4
