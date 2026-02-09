#!/bin/bash
# Generate captioned versions of Auden Shield videos with poem text overlay

OUTDIR="/Users/gaia/CREST/captioned"
cd "/Users/gaia/CREST"

# Text styling for overlay
FONT="/System/Library/Fonts/Helvetica.ttc"
FONTSIZE=24
FONTCOLOR="white"
BOXCOLOR="black@0.6"
PADDING=10

# Function to create captioned video
caption_video() {
    local input="$1"
    local output="$2"
    local text="$3"
    local position="${4:-bottom}"
    
    # Escape special characters for ffmpeg
    text=$(echo "$text" | sed "s/'/\\\\'/g" | sed 's/:/\\:/g')
    
    if [ "$position" = "bottom" ]; then
        y_pos="h-th-40"
    else
        y_pos="40"
    fi
    
    ffmpeg -y -i "$input" \
        -vf "drawtext=fontfile=$FONT:fontsize=$FONTSIZE:fontcolor=$FONTCOLOR:box=1:boxcolor=$BOXCOLOR:boxborderw=$PADDING:x=(w-tw)/2:y=$y_pos:text='$text'" \
        -c:a copy "$output" 2>/dev/null
    
    echo "Created: $output"
}

echo "=== Creating Captioned Videos ==="
echo ""

# ROOT videos (Lines L01-L09)
echo "--- ROOT Videos ---"
caption_video "01-02.mp4" "$OUTDIR/ROOT_C1_01-02.mp4" "L01: She looked over his shoulder / L02: For vines and olive trees"
caption_video "03-04.mp4" "$OUTDIR/ROOT_C1_03-04.mp4" "L03: Marble well-governed cities / L04: And ships upon untamed seas"
caption_video "05-06.mp4" "$OUTDIR/ROOT_C1_05-06.mp4" "L05: But there on the shining metal / L06: His hands had put instead"
caption_video "07-08.mp4" "$OUTDIR/ROOT_C1_07-08.mp4" "L07: An artificial wilderness / L08: And a sky like lead"
caption_video "08-09.mp4" "$OUTDIR/ROOT_C2_08-09.mp4" "L08-09: A plain without a feature, bare and brown"

echo ""
echo "--- SORA Videos ---"
caption_video "sora/0000.mp4" "$OUTDIR/SORA_C1.mp4" "C1: Expectation I - Pastoral (THETIS REFRAIN)"
caption_video "sora/0001.mp4" "$OUTDIR/SORA_C2.mp4" "C2: Scene I - The Plain (EKPHRASIS)"
caption_video "sora/0002.mp4" "$OUTDIR/SORA_C3.mp4" "C3: Scene II - The Voice (EKPHRASIS)"
caption_video "sora/0003.mp4" "$OUTDIR/SORA_C4.mp4" "C4: Expectation II - Sacrifice (THETIS REFRAIN)"
caption_video "sora/0007.mp4" "$OUTDIR/SORA_C7.mp4" "C7: Expectation III - Dance (THETIS REFRAIN)"
caption_video "sora/0008.mp4" "$OUTDIR/SORA_C8.mp4" "C8: Scene V - The Urchin (EKPHRASIS)"
caption_video "sora/0009.mp4" "$OUTDIR/SORA_C9.mp4" "C9: Coda - The Armorer (CODA)"

echo ""
echo "--- MIDJOURNEY Videos ---"

# C1
caption_video "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    "$OUTDIR/MJ_C1_Take1.mp4" "C1: She looked over his shoulder for vines and olive trees"
caption_video "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    "$OUTDIR/MJ_C1_Take2.mp4" "C1: She looked over his shoulder for vines and olive trees"

# C2
caption_video "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    "$OUTDIR/MJ_C2_Take1.mp4" "C2: A plain without a feature, bare and brown"
caption_video "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_9b212ae2-976c-4e60-b121-45724fbb75d6_3.mp4" \
    "$OUTDIR/MJ_C2_Take2.mp4" "C2: An unintelligible multitude"

# C3
caption_video "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    "$OUTDIR/MJ_C3_Take1.mp4" "C3: Out of the air a voice without a face"

# C4
caption_video "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    "$OUTDIR/MJ_C4_Take1.mp4" "C4: She looked for ritual pieties, libation and sacrifice"
caption_video "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    "$OUTDIR/MJ_C4_Take2.mp4" "C4: White flower-garlanded heifers"

# C6
caption_video "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    "$OUTDIR/MJ_C6_Take1.mp4" "C6: The mass and majesty of this world"

# C7
caption_video "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    "$OUTDIR/MJ_C7_Take1.mp4" "C7: Men and women in a dance, moving their sweet limbs"

# C8 - Urchin
caption_video "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    "$OUTDIR/MJ_C8_Take1.mp4" "C8: A ragged urchin, aimless and alone"
caption_video "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    "$OUTDIR/MJ_C8_Take2.mp4" "C8: That girls are raped, that two boys knife a third"

# C9 - Coda
caption_video "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    "$OUTDIR/MJ_C9_Take1.mp4" "C9: The thin-lipped armorer, Hephaestos, hobbled away"
caption_video "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___89a16e21-79d7-4450-b6de-c1e719e7deec_0.mp4" \
    "$OUTDIR/MJ_C9_Take2.mp4" "C9: Thetis of the shining breasts cried out in dismay"
caption_video "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_d4338439-f7e5-4a9c-b32e-ff5aca17e9c6_0.mp4" \
    "$OUTDIR/MJ_C9_Take3.mp4" "C9: Iron-hearted man-slaying Achilles who would not live long"

echo ""
echo "=== Done! Captioned videos in $OUTDIR ==="
ls -la "$OUTDIR"
