#!/bin/bash
# CREST Mosaic - LEGO LAYOUT (pixel-perfect tiles + text panel)
# Layout 1920x1080:
# +-------+-------+-------+
# | SORA  | ROOT  | MJ    |  (810px)
# | 640   | 640   | 2x2   |
# +-------+-------+-------+
# |    TEXT PANEL         |  (270px)
# +-----------------------+

cd /Users/gaia/CREST
mkdir -p mosaics_lego

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_REG="/System/Library/Fonts/Supplemental/Arial.ttf"

echo "=== CREST MOSAIC (LEGO LAYOUT) ==="
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
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj1];
        [3:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj2];
        [4:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj3];
        [5:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj4];
        [mj1][mj2]hstack=inputs=2[mjr1];
        [mj3][mj4]hstack=inputs=2[mjr2];
        [mjr1][mjr2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:810:force_original_aspect_ratio=decrease,pad=640:810:(ow-iw)/2:(oh-ih)/2:#0d0d0d[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C1':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION I\: PASTORAL':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For vines and olive trees':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='Marble well-governed cities / And ships upon untamed seas':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / His hands had put instead':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='An artificial wilderness / And a sky like lead':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=140:y=1030,
            drawtext=fontfile='${FONT}':text='SORA':fontsize=12:fontcolor=0xc45c7a:x=10:y=790,
            drawtext=fontfile='${FONT}':text='ROOT':fontsize=12:fontcolor=0xd4a853:x=650:y=790,
            drawtext=fontfile='${FONT}':text='MJ':fontsize=12:fontcolor=0x6b7b8b:x=1290:y=790[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C1.mp4 2>/dev/null

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
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270[mj1];
        [3:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270[mj2];
        [4:v]scale=640:270:force_original_aspect_ratio=increase,crop=640:270[mj3];
        [mj1][mj2]hstack=inputs=2[mjr1];
        [mjr1][mj3]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:810:force_original_aspect_ratio=decrease,pad=640:810:(ow-iw)/2:(oh-ih)/2:#0d0d0d[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C2':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE I\: THE PLAIN':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='A plain without a feature bare and brown':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='An unintelligible multitude / A million eyes a million boots in line':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='Without expression waiting for a sign':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=140:y=1030,
            drawtext=fontfile='${FONT}':text='SORA':fontsize=12:fontcolor=0xc45c7a:x=10:y=790,
            drawtext=fontfile='${FONT}':text='ROOT':fontsize=12:fontcolor=0xd4a853:x=650:y=790,
            drawtext=fontfile='${FONT}':text='MJ':fontsize=12:fontcolor=0x6b7b8b:x=1290:y=790[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C2.mp4 2>/dev/null

# C3: The Voice
echo "[3/9] C3: The Voice..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C3':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE II\: THE VOICE':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='Out of the air a voice without a face':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='Proved by statistics that some cause was just':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='They marched away enduring a belief':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='Whose logic brought them somewhere else to grief':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C3.mp4 2>/dev/null

# C4: Sacrifice
echo "[4/9] C4: Sacrifice..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=640:405:force_original_aspect_ratio=increase,crop=640:405[mj1];
        [3:v]scale=640:405:force_original_aspect_ratio=increase,crop=640:405[mj2];
        [mj1][mj2]vstack=inputs=2[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C4':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION II\: SACRIFICE':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='She looked over his shoulder / For ritual pieties':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='White flower-garlanded heifers / Libation and sacrifice':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining metal / She saw quite another scene':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C4.mp4 2>/dev/null

# C5: The Camp (ROOT only - full width top)
echo "[5/9] C5: The Camp..."
ffmpeg -y -i "05-06.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=1920:810:force_original_aspect_ratio=increase,crop=1920:810[root];
        [bg][root]overlay=0:0[v1];
        [v1]drawtext=fontfile='${FONT}':text='C5':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE III\: THE CAMP':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='Barbed wire enclosed an arbitrary spot':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='A crowd of ordinary decent folk / Watched from without':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='Three pale figures were led forth and bound':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='To three posts driven upright in the ground':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C5.mp4 2>/dev/null

# C6: The Execution
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
        [v2]drawtext=fontfile='${FONT}':text='C6':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE IV\: THE EXECUTION':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='The mass and majesty of this world all':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='They were small and could not hope for help':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='They lost their pride':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='And died as men before their bodies died':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C6.mp4 2>/dev/null

# C7: Dance
echo "[7/9] C7: Dance..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        color=c=#0d0d0d:s=1920x1080:d=10[bg];
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C7':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='EXPECTATION III\: DANCE':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='Men and women in a dance / Moving their sweet limbs':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='Quick quick to music':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='But there on the shining shield':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='His hands had set no dancing-floor but a weed-choked field':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='THETIS REFRAIN':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C7.mp4 2>/dev/null

# C8: The Urchin
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
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj1];
        [3:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj2];
        [4:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj3];
        [5:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj4];
        [mj1][mj2]hstack=inputs=2[mjr1];
        [mj3][mj4]hstack=inputs=2[mjr2];
        [mjr1][mjr2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:810:force_original_aspect_ratio=decrease,pad=640:810:(ow-iw)/2:(oh-ih)/2:#0d0d0d[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C8':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='SCENE V\: THE URCHIN':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='A ragged urchin aimless and alone':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='That girls are raped that two boys knife a third':fontsize=18:fontcolor=0xc45c7a:x=140:y=935,
            drawtext=fontfile='${FONT_REG}':text='Were axioms to him who had never heard':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='Of any world where promises were kept':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='EKPHRASIS':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C8.mp4 2>/dev/null

# C9: The Armorer
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
        [0:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[sora];
        [1:v]scale=640:810:force_original_aspect_ratio=increase,crop=640:810[root];
        [2:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj1];
        [3:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj2];
        [4:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj3];
        [5:v]scale=320:202:force_original_aspect_ratio=increase,crop=320:202[mj4];
        [mj1][mj2]hstack=inputs=2[mjr1];
        [mj3][mj4]hstack=inputs=2[mjr2];
        [mjr1][mjr2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:810:force_original_aspect_ratio=decrease,pad=640:810:(ow-iw)/2:(oh-ih)/2:#0d0d0d[mj];
        [bg][sora]overlay=0:0[v1];
        [v1][root]overlay=640:0[v2];
        [v2][mj]overlay=1280:0[v3];
        [v3]drawtext=fontfile='${FONT}':text='C9':fontsize=72:fontcolor=0xd4a853:x=40:y=830,
            drawtext=fontfile='${FONT}':text='CODA\: THE ARMORER':fontsize=28:fontcolor=white:x=140:y=850,
            drawtext=fontfile='${FONT_REG}':text='The thin-lipped armorer Hephaestos hobbled away':fontsize=18:fontcolor=0xcccccc:x=140:y=895,
            drawtext=fontfile='${FONT_REG}':text='Thetis of the shining breasts cried out in dismay':fontsize=18:fontcolor=0xcccccc:x=140:y=920,
            drawtext=fontfile='${FONT_REG}':text='Iron-hearted man-slaying Achilles':fontsize=18:fontcolor=0xc45c7a:x=140:y=960,
            drawtext=fontfile='${FONT_REG}':text='Who would not live long':fontsize=18:fontcolor=0xc45c7a:x=140:y=985,
            drawtext=fontfile='${FONT}':text='CODA':fontsize=14:fontcolor=0x666666:x=140:y=1030[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 10 mosaics_lego/C9.mp4 2>/dev/null

# === Concatenate ===
echo ""
echo "[FINAL] Concatenating..."

cat > mosaics_lego/concat_list.txt << EOF
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

ffmpeg -y -f concat -safe 0 -i mosaics_lego/concat_list.txt \
    -c:v libx264 -preset medium -crf 20 -c:a aac \
    mosaics_lego/SHIELD_OF_ACHILLES.mp4 2>/dev/null

echo ""
echo "=== COMPLETE (LEGO LAYOUT) ==="
ls -lh mosaics_lego/*.mp4
