#!/bin/bash
# CREST MEGA MOSAIC - PERIODIC TABLE OF ALL CLIPS
# 7x7 grid = 49 cells (45 videos + 4 empty)
# Each cell: 274x154 (1920/7 x 1080/7)

cd /Users/gaia/CREST
mkdir -p mega_mosaic

FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"

echo "=== CREST MEGA MOSAIC ==="
echo "Building 7x7 periodic table of all video clips"
echo ""

# Row 1: SORA clips (7) - pink border
# Row 2-3: MJ clips (14)
# Row 4-5: MJ clips (14)  
# Row 6: MJ clips (5) + ROOT clips (5 starting)
# Row 7: ROOT clips remaining + empty cells

ffmpeg -y \
    -i "sora/0000.mp4" \
    -i "sora/0001.mp4" \
    -i "sora/0002.mp4" \
    -i "sora/0003.mp4" \
    -i "sora/0007.mp4" \
    -i "sora/0008.mp4" \
    -i "sora/0009.mp4" \
    -i "01-02.mp4" \
    -i "03-04.mp4" \
    -i "05-06.mp4" \
    -i "07-08.mp4" \
    -i "08-09.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_072e63f1-7ec0-4cf1-af45-addcbf8dc80a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_1b62b871-c890-41aa-b04c-813695088884_0.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_ced1c73d-5323-43cb-8ac9-ba7b49285c3a_2.mp4" \
    -i "midjourney_session (4)/C1_Expectation_I_Pastoral_THETIS_REFRAIN_Ceremony_ENTRY_Theti_d4b00e54-b9bb-448f-bba6-aef378353569_0.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_655c007b-374d-47ef-85b6-1988c6bce1e4_2.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_9b212ae2-976c-4e60-b121-45724fbb75d6_3.mp4" \
    -i "midjourney_session (4)/C2_Scene_I_The_Plain_EKPHRASIS_Ceremony_ENTRY_bare_plain__CHA_ad4e846e-97f2-4213-9bfa-de6858e65c1c_0.mp4" \
    -i "midjourney_session (4)/C3_Scene_II_The_Voice_EKPHRASIS_Ceremony_ENTRY_disembodied_vo_fb09be73-d800-4d49-a18a-b3439db57efe_0.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_39a9b5e8-ea52-4f0a-8401-a1c06323f91f_1.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_4b435c87-f863-464b-b179-b3b8f7bb30e5_2.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_5a7b20f4-05f2-40ff-8d88-df13e7651253_2.mp4" \
    -i "midjourney_session (4)/C4_Expectation_II_Sacrifice_THETIS_REFRAIN_Ceremony_ENTRY_The_67028f0f-e60e-49a3-86dd-60958deab5da_0.mp4" \
    -i "midjourney_session (4)/C6_Scene_IV_The_Execution_EKPHRASIS_Ceremony_ENTRY_massmajest_a8908dc9-c0f5-46b5-be27-a8f067c97762_0.mp4" \
    -i "midjourney_session (4)/C7_Expectation_III_Dance_THETIS_REFRAIN_Ceremony_ENTRY_Thetis_0d923fd1-a639-4267-96fb-95ec572d5a9d_3.mp4" \
    -i "midjourney_session (4)/C9_Coda_The_Armorer_CODA_Ceremony_ENTRY_thin-lipped_armorer___547f814e-17b4-4e1e-8b80-ea25a6659171_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_3e937364-5a00-4737-8661-aceaf1d7e1c7_0.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_2.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_67b60d48-665a-49be-9253-991c316943dc_3.mp4" \
    -i "midjourney_session (4)/ragged_urchin_boy_aimless_and_alone_loitering_in_a_vacant_urb_c5fe4e0e-6969-4908-a57f-b427a728ff5c_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_11c56592-92fe-45a6-8482-238e17c667b7_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_284c194f-8564-43c4-b8cb-0be1ca2edae6_2.mp4" \
    -i "midjourney_session (4)/thin-lipped_armorer_Hephaestos_hobbled_Thetis_crying_out_in_d_30b84bfd-639b-4884-9e3d-a5fb06103dc6_1.mp4" \
    -filter_complex "
        color=c=#0a0a0a:s=1920x1080:d=15[bg];
        
        [0:v]scale=274:154,setsar=1[s0];
        [1:v]scale=274:154,setsar=1[s1];
        [2:v]scale=274:154,setsar=1[s2];
        [3:v]scale=274:154,setsar=1[s3];
        [4:v]scale=274:154,setsar=1[s4];
        [5:v]scale=274:154,setsar=1[s5];
        [6:v]scale=274:154,setsar=1[s6];
        
        [7:v]scale=274:154,setsar=1[r0];
        [8:v]scale=274:154,setsar=1[r1];
        [9:v]scale=274:154,setsar=1[r2];
        [10:v]scale=274:154,setsar=1[r3];
        [11:v]scale=274:154,setsar=1[r4];
        
        [12:v]scale=274:154,setsar=1[m0];
        [13:v]scale=274:154,setsar=1[m1];
        [14:v]scale=274:154,setsar=1[m2];
        [15:v]scale=274:154,setsar=1[m3];
        [16:v]scale=274:154,setsar=1[m4];
        [17:v]scale=274:154,setsar=1[m5];
        [18:v]scale=274:154,setsar=1[m6];
        [19:v]scale=274:154,setsar=1[m7];
        [20:v]scale=274:154,setsar=1[m8];
        [21:v]scale=274:154,setsar=1[m9];
        [22:v]scale=274:154,setsar=1[m10];
        [23:v]scale=274:154,setsar=1[m11];
        [24:v]scale=274:154,setsar=1[m12];
        [25:v]scale=274:154,setsar=1[m13];
        [26:v]scale=274:154,setsar=1[m14];
        [27:v]scale=274:154,setsar=1[m15];
        [28:v]scale=274:154,setsar=1[m16];
        [29:v]scale=274:154,setsar=1[m17];
        [30:v]scale=274:154,setsar=1[m18];
        [31:v]scale=274:154,setsar=1[m19];
        [32:v]scale=274:154,setsar=1[m20];
        [33:v]scale=274:154,setsar=1[m21];
        
        [bg][s0]overlay=0:0[v0];
        [v0][s1]overlay=274:0[v1];
        [v1][s2]overlay=548:0[v2];
        [v2][s3]overlay=822:0[v3];
        [v3][s4]overlay=1096:0[v4];
        [v4][s5]overlay=1370:0[v5];
        [v5][s6]overlay=1644:0[v6];
        
        [v6][m0]overlay=0:154[v7];
        [v7][m1]overlay=274:154[v8];
        [v8][m2]overlay=548:154[v9];
        [v9][m3]overlay=822:154[v10];
        [v10][m4]overlay=1096:154[v11];
        [v11][m5]overlay=1370:154[v12];
        [v12][m6]overlay=1644:154[v13];
        
        [v13][m7]overlay=0:308[v14];
        [v14][m8]overlay=274:308[v15];
        [v15][m9]overlay=548:308[v16];
        [v16][m10]overlay=822:308[v17];
        [v17][m11]overlay=1096:308[v18];
        [v18][m12]overlay=1370:308[v19];
        [v19][m13]overlay=1644:308[v20];
        
        [v20][m14]overlay=0:462[v21];
        [v21][m15]overlay=274:462[v22];
        [v22][m16]overlay=548:462[v23];
        [v23][m17]overlay=822:462[v24];
        [v24][m18]overlay=1096:462[v25];
        [v25][m19]overlay=1370:462[v26];
        [v26][m20]overlay=1644:462[v27];
        
        [v27][m21]overlay=0:616[v28];
        [v28][r0]overlay=274:616[v29];
        [v29][r1]overlay=548:616[v30];
        [v30][r2]overlay=822:616[v31];
        [v31][r3]overlay=1096:616[v32];
        [v32][r4]overlay=1370:616[v33];
        
        [v33]drawtext=fontfile='${FONT}':text='SORA':fontsize=10:fontcolor=0xc45c7a:x=5:y=140,
            drawtext=fontfile='${FONT}':text='0000':fontsize=8:fontcolor=white:x=5:y=5,
            drawtext=fontfile='${FONT}':text='0001':fontsize=8:fontcolor=white:x=279:y=5,
            drawtext=fontfile='${FONT}':text='0002':fontsize=8:fontcolor=white:x=553:y=5,
            drawtext=fontfile='${FONT}':text='0003':fontsize=8:fontcolor=white:x=827:y=5,
            drawtext=fontfile='${FONT}':text='0007':fontsize=8:fontcolor=white:x=1101:y=5,
            drawtext=fontfile='${FONT}':text='0008':fontsize=8:fontcolor=white:x=1375:y=5,
            drawtext=fontfile='${FONT}':text='0009':fontsize=8:fontcolor=white:x=1649:y=5,
            drawtext=fontfile='${FONT}':text='MJ':fontsize=10:fontcolor=0x6b7b8b:x=5:y=294,
            drawtext=fontfile='${FONT}':text='ROOT':fontsize=10:fontcolor=0xd4a853:x=279:y=756,
            drawtext=fontfile='${FONT}':text='01-02':fontsize=8:fontcolor=white:x=279:y=621,
            drawtext=fontfile='${FONT}':text='03-04':fontsize=8:fontcolor=white:x=553:y=621,
            drawtext=fontfile='${FONT}':text='05-06':fontsize=8:fontcolor=white:x=827:y=621,
            drawtext=fontfile='${FONT}':text='07-08':fontsize=8:fontcolor=white:x=1101:y=621,
            drawtext=fontfile='${FONT}':text='08-09':fontsize=8:fontcolor=white:x=1375:y=621,
            drawtext=fontfile='${FONT}':text='SHIELD OF ACHILLES':fontsize=24:fontcolor=white:x=640:y=850,
            drawtext=fontfile='${FONT}':text='PERIODIC TABLE OF CLIPS':fontsize=14:fontcolor=0x888888:x=720:y=890,
            drawtext=fontfile='${FONT}':text='7 SORA (9\:16) | 5 ROOT (16\:9) | 22 MJ (16\:9)':fontsize=12:fontcolor=0x666666:x=660:y=930,
            drawtext=fontfile='${FONT}':text='TOTAL\: 34 CLIPS':fontsize=16:fontcolor=0xd4a853:x=820:y=970[vout]
    " -map "[vout]" -map 0:a? -c:v libx264 -preset fast -crf 23 -c:a aac -t 15 mega_mosaic/PERIODIC_TABLE.mp4 2>&1 | tail -5

echo ""
echo "=== COMPLETE ==="
ls -lh mega_mosaic/*.mp4
