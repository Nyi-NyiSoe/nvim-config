# 🚀 Neovim Developer Cheat Sheet

Leader key: **Space**

------------------------------------------------------------------------

# 🔎 Navigation & Search

  -----------------------------------------------------------------------
  Key                              Action
  -------------------------------- --------------------------------------
  **Ctrl + p**                     Open Telescope file finder to quickly
                                   search and open project files

  **Space + fg**                   Search for text across the entire
                                   project (Telescope live grep)

  **Ctrl + n**                     Open NeoTree file explorer and reveal
                                   the current file
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 📌 Harpoon (Instant File Switching)

Use Harpoon to bookmark important files and jump between them instantly.

  Key             Action
  --------------- ----------------------------------
  **Space + a**   Add current file to Harpoon list
  **Space + e**   Open Harpoon quick menu
  **Space + 1**   Jump to Harpoon file slot #1
  **Space + 2**   Jump to Harpoon file slot #2
  **Space + 3**   Jump to Harpoon file slot #3
  **Space + 4**   Jump to Harpoon file slot #4

Example:

    Space + a   add file
    Space + 1   jump to file instantly

------------------------------------------------------------------------

# 🧠 LSP (Language Server Features)

These work when a language server is active.

  Key              Action
  ---------------- ------------------------------------------------
  **K**            Show documentation for symbol under cursor
  **gd**           Go to definition
  **gr**           Show references
  **gi**           Go to implementation
  **Space + rn**   Rename variable/function across project
  **Space + ca**   Show code actions (quick fixes, imports, etc.)
  **Space + gf**   Format current file

------------------------------------------------------------------------

# 🐞 Debugging (DAP)

  Key              Action
  ---------------- -------------------------------------
  **Space + dt**   Toggle breakpoint on current line
  **Space + dc**   Start or continue debugging session

Debug UI automatically opens when debugging begins.

------------------------------------------------------------------------

# 🖥 Terminal

  Key              Action
  ---------------- -------------------------------
  **Space + tt**   Toggle bottom terminal window

Terminal features: - Bottom split terminal - Height: 15 lines - Reuses
same terminal session - Opens in insert mode

------------------------------------------------------------------------

# ⏳ Undo History

  Key             Action
  --------------- --------------------------------------------
  **Space + u**   Toggle UndoTree panel to view edit history

------------------------------------------------------------------------

# 🛠 Custom Command

Rename the current file directly inside Neovim:

    :Rename new_filename

Example:

    :Rename app.tsx

This will: 1. Save file with new name 2. Remove old file 3. Close old
buffer

------------------------------------------------------------------------

# ⚡ Typical Daily Workflow

    Ctrl + p      find file
    Space + a     bookmark important file
    Space + 1     jump back later

    gd            go to definition
    K             read documentation
    Space + rn    rename symbol
    Space + ca    quick fix

    Space + fg    search project
    Space + tt    open terminal

Total shortcuts defined: **18**
