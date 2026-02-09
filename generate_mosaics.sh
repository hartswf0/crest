#!/bin/bash
# CREST Complete Mosaic Generator - FULL FRAME (no black bars)
# Layout: [SORA 640x1080] | [ROOT 640x1080] | [MJ 2x2 640x1080]
# Uses scale+crop to fill every pixel

cd /Users/gaia/CREST
mkdir -p mosaics

echo "=== CREST MEGA VIDEO GENERATOR (FULL FRAME) ==="
echo "Layout: SORA | ROOT | MJ 2x2 - all panels filled"
echo ""

# Helper: scale and crop to exact dimensions (fill, no black)
# scale=W:H:force_original_aspect_ratio=increase,crop=W:H

# C1: Expectation I (4 MJ clips)
echo "[1/9] C1: Expectation I..."
ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_ced1c73d-5323-43cb-8ac9-ba7b49285c3a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_d4b00e54-b9bb-448f-bba6-aef378353569_0.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj1];
        [3:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj2];
        [4:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj3];
        [5:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj4];
        [mj1][mj2]hstack=inputs=2[mjrow1];
        [mj3][mj4]hstack=inputs=2[mjrow2];
        [mjrow1][mjrow2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C1_mosaic.mp4 2>/dev/null

# C2: The Plain (3 MJ clips)
echo "[2/9] C2: The Plain..."
ffmpeg -y \
    -i "sora/0001.mp4" \
    -i "01-02.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_9b212ae2-976c-4e60-b121-45724fbb75d6_3.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_ad4e846e-97f2-4213-9bfa-de6858e65c1c_0.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=320:360:force_original_aspect_ratio=increase,crop=320:360,setsar=1[mj1];
        [3:v]scale=320:360:force_original_aspect_ratio=increase,crop=320:360,setsar=1[mj2];
        [4:v]scale=320:360:force_original_aspect_ratio=increase,crop=320:360,setsar=1[mj3];
        [mj1][mj2]hstack=inputs=2[mjrow1];
        [mj3]scale=640:360:force_original_aspect_ratio=increase,crop=640:360,setsar=1[mjrow2];
        [mjrow1][mjrow2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C2_mosaic.mp4 2>/dev/null

# C3: The Voice (1 MJ clip - fill whole panel)
echo "[3/9] C3: The Voice..."
ffmpeg -y \
    -i "sora/0002.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C3_mosaic.mp4 2>/dev/null

# C4: Sacrifice (2 MJ clips - stack vertically)
echo "[4/9] C4: Sacrifice..."
ffmpeg -y \
    -i "sora/0003.mp4" \
    -i "03-04.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540,setsar=1[mj1];
        [3:v]scale=640:540:force_original_aspect_ratio=increase,crop=640:540,setsar=1[mj2];
        [mj1][mj2]vstack=inputs=2[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C4_mosaic.mp4 2>/dev/null

# C5: The Camp (no SORA, no MJ - ROOT fills center, repeat for panels)
echo "[5/9] C5: The Camp..."
ffmpeg -y -i "05-06.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[v1];
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[v2];
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[v3];
        [v1][v2][v3]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C5_mosaic.mp4 2>/dev/null

# C6: The Execution (1 MJ clip)
echo "[6/9] C6: The Execution..."
ffmpeg -y \
    -i "05-06.mp4" \
    -i "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root1];
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root2];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [root1][root2][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C6_mosaic.mp4 2>/dev/null

# C7: Dance (1 MJ clip)
echo "[7/9] C7: Dance..."
ffmpeg -y \
    -i "sora/0007.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C7_mosaic.mp4 2>/dev/null

# C8: The Urchin (4 MJ clips)
echo "[8/9] C8: The Urchin..."
ffmpeg -y \
    -i "sora/0008.mp4" \
    -i "07-08.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_3.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_c5fe4e0e-6969-4908-a57f-b427a728ff5c_2.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj1];
        [3:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj2];
        [4:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj3];
        [5:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj4];
        [mj1][mj2]hstack=inputs=2[mjrow1];
        [mj3][mj4]hstack=inputs=2[mjrow2];
        [mjrow1][mjrow2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C8_mosaic.mp4 2>/dev/null

# C9: The Armorer (4 MJ clips)
echo "[9/9] C9: The Armorer..."
ffmpeg -y \
    -i "sora/0009.mp4" \
    -i "08-09.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___89a16e21-79d7-4450-b6de-c1e719e7deec_0.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_11c56592-92fe-45a6-8482-238e17c667b7_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_284c194f-8564-43c4-b8cb-0be1ca2edae6_2.mp4" \
    -filter_complex "
        [0:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[sora];
        [1:v]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[root];
        [2:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj1];
        [3:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj2];
        [4:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj3];
        [5:v]scale=320:270:force_original_aspect_ratio=increase,crop=320:270,setsar=1[mj4];
        [mj1][mj2]hstack=inputs=2[mjrow1];
        [mj3][mj4]hstack=inputs=2[mjrow2];
        [mjrow1][mjrow2]vstack=inputs=2[mjgrid];
        [mjgrid]scale=640:1080:force_original_aspect_ratio=increase,crop=640:1080,setsar=1[mj];
        [sora][root][mj]hstack=inputs=3[out]
    " -map "[out]" -c:v libx264 -preset fast -crf 23 -t 10 mosaics/C9_mosaic.mp4 2>/dev/null

# === Concatenate into MEGA VIDEO ===
echo ""
echo "[FINAL] Concatenating all scenes..."

cat > mosaics/concat_list.txt << EOF
file 'C1_mosaic.mp4'
file 'C2_mosaic.mp4'
file 'C3_mosaic.mp4'
file 'C4_mosaic.mp4'
file 'C5_mosaic.mp4'
file 'C6_mosaic.mp4'
file 'C7_mosaic.mp4'
file 'C8_mosaic.mp4'
file 'C9_mosaic.mp4'
EOF

ffmpeg -y -f concat -safe 0 -i mosaics/concat_list.txt \
    -c:v libx264 -preset medium -crf 20 \
    mosaics/SHIELD_OF_ACHILLES_COMPLETE.mp4 2>/dev/null

echo ""
echo "=== COMPLETE (FULL FRAME - NO BLACK BARS) ==="
ls -lh mosaics/*.mp4
echo ""
echo "MEGA VIDEO: mosaics/SHIELD_OF_ACHILLES_COMPLETE.mp4"
