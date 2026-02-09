# The Shield of Achilles: Monomythic Dashboard

> *She looked over his shoulder / For vines and olive trees,*
> *Marble well-governed cities / And ships upon untamed seas,*
> *But there on the shining metal / His hands had put instead*
> *An artificial wilderness / And a sky like lead.*
> — W.H. Auden, "The Shield of Achilles"

## Project Overview
This repository contains the **Ritual Cartography** and **Video Mosaic** systems for "The Shield of Achilles," a computational cinema project that maps W.H. Auden's poem onto a generative, living interface.

The core of the project is the **Monomythic Dashboard** (Living Shield), a "Fly Eye" scanner that visualizes the entire film as a single, operative object.

## 🛡️ The Living Shield (`living_shield.html`)
The **Living Shield** is the primary interface for the project. It transforms the linear film into a **spatial narrative engine**.

### Features
*   **Two Viewing Modes:**
    *   **GRID MODE:** A dense, high-surveillance "Fly Eye" grid (inspired by *DAMN.*) showing all 34 clips simultaneously.
    *   **SHIELD MODE:** A concentric "Actual Shield Mapping" where clips are distributed radially.
        *   **Center (Zero):** The Hero's journey (SORA), anchored at the axis.
        *   **Inner Rings:** The "Path" (Oblong SORA clips).
        *   **Outer Rings:** The "World" (Rounded Midjourney beads).
*   **Interactive Controls:**
    *   **LINES:** Visualizes the "Vincula" (narrative ties) connecting the Hero to the World via golden SVG threads.
    *   **SPIN:** Activates the "Living Wheel" rotation (60s cycle).
    *   **ZOOM:** Click any cell to enter "Deep Reading" focus mode.
*   **Director Mode (Auto-Cut):**
    *   The shield "watches itself," cycling through scenes **C1 → C9** every 4 seconds.
    *   **Operative Ekphrasis:** A text engine narrating the "Thick Description" of the active scene in real-time.

## 📂 Architecture

### 1. The Archive (`/crest/`)
*   **Index:** `crest/index.html` (The Archive of Forms)
*   **Words:** `crest/words.html` (Use of language vs. image)
*   **Action:** `crest/action-over-words.html` (Primacy of the deed)
*   **Will:** `crest/by-will.html` (Volitional framework)

### 2. The Mosaics (`/mosaics_*/`)
Generated video mosaics used as assets for the Living Shield:
*   `mosaics_cinematic/`: High-quality, processed clips.
*   `mosaics_grid/`: 2x2 and 3x3 grid assemblages.
*   `mosaics_lego/`: Raw modular blocks.

### 3. The Scripts (`/*.sh`)
A suite of shell scripts to generate the mosaics from source footage:
*   `generate_mosaics.sh`: Main entry point.
*   `create_composites.sh`: Stitches individual clips into scene composites.
*   `generate_mega_mosaic.sh`: Creates the "Periodic Table" massive grid.

## 🎨 Aesthetic: "The Latent Third"
The visual language is defined by the **Latent Third**—the tension between the **Archive** (Gold/History) and the **Void** (Black/Latent Space).
*   **Palette:** Void Black (`#050505`), Archive Gold (`#d4a853`), Pulse Red (`#cc0000`).
*   **Forms:** Rounded "Beads" (The World) vs. Oblong "Pills" (The Hero/Sora).
*   **Blend:** `mix-blend-mode: screen` creates organic, ghost-like overlays during the spin cycle.

## Usage
1.  Open **[index.html](index.html)** for the research hub.
2.  Open **[living_shield.html](living_shield.html)** for the Monomythic Dashboard.
3.  Use the top-right controls (LINES, SPIN) to activate the shield mapping.
