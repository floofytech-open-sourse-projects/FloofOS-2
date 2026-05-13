#!/usr/bin/env bash
set -euo pipefail

echo "[*] FloofOS package install starting..."

if [ "$EUID" -ne 0 ]; then
    exec sudo bash "$0" "$@"
fi

apt update
apt full-upgrade -y

apt install -y \
    `# --- Core KDE Plasma ---` \
    plasma-desktop \
    plasma-workspace \
    plasma-workspace-data \
    kwin-wayland \
    sddm \
    sddm-theme-breeze \
    polkit-kde-agent-1 \
    plasma-nm \
    plasma-pa \
    plasma-session-wayland \
    plasma-integration \
    plasma5-integration \
    \
    `# --- KDE Tools ---` \
    kde-cli-tools \
    kde-cli-tools-data \
    kde-config-gtk-style \
    kde-config-gtk-style-preview \
    kde-config-plymouth \
    kde-config-screenlocker \
    kde-config-sddm \
    kde-config-tablet \
    kde-config-updates \
    kde-inotify-survey \
    kded5 \
    kded6 \
    kde-spectacle \
    kdeconnect \
    kdeconnect-libs \
    kdegraphics-thumbnailers \
    kdenetwork-filesharing \
    \
    `# --- Plasma Addons ---` \
    kdeplasma-addons-data \
    plasma-widgets-addons \
    plasma-runners-addons \
    plasma-calendar-addons \
    plasma-dataengines-addons \
    plasma-wallpapers-addons \
    kwin-addons \
    plasma-activities-bin \
    plasma-browser-integration \
    plasma-desktop-data \
    plasma-disks \
    plasma-distro-release-notifier \
    plasma-discover \
    plasma-discover-backend-fwupd \
    plasma-discover-common \
    plasma-discover-notifier \
    plasma-firewall \
    plasma-systemmonitor \
    plasma-thunderbolt \
    plasma-vault \
    plasma-welcome \
    \
    `# --- Themes ---` \
    kde-style-breeze \
    kde-style-breeze-data \
    kde-style-breeze-qt5 \
    kde-style-oxygen-qt6 \
    kwin-style-breeze \
    kwin-style-aurorae \
    kwin-decoration-oxygen \
    plasma-desktoptheme \
    plasma-theme-oxygen \
    \
    `# --- Icon & Cursor Themes ---` \
    adwaita-icon-theme \
    breeze-cursor-theme \
    breeze-gtk-theme \
    gnome-themes-extra-data \
    grub-theme-breeze \
    hicolor-icon-theme \
    kf6-breeze-icon-theme \
    breeze-icon-theme \
    \
    `# --- Plymouth Themes ---` \
    plymouth-theme-breeze \
    plymouth-theme-spinner \
    \
    `# --- Sounds ---` \
    ocean-sound-theme \
    sound-theme-freedesktop \
    \
    `# --- Fonts ---` \
    fonts-noto \
    fonts-dejavu \
    \
    `# --- KF5/KF6 Icon Theme Libs ---` \
    libkf5iconthemes-bin \
    libkf5iconthemes-data \
    libkf5iconthemes5 \
    libkf6iconthemes-bin \
    libkf6iconthemes-data \
    libkf6iconthemes6 \
    \
    `# --- Qt Platform Themes ---` \
    qt5-gtk-platformtheme \
    qt6-gtk-platformtheme \
    \
    `# --- QML Modules ---` \
    qml-module-org-kde-kirigami2 \
    qml-module-org-kde-kquickcontrolsaddons \
    qml-module-org-kde-qqc2desktopstyle \
    qml-module-org-kde-sonnet \
    qml6-module-org-kde-activities \
    qml6-module-org-kde-baloo \
    qml6-module-org-kde-bluezqt \
    qml6-module-org-kde-breeze \
    qml6-module-org-kde-config \
    qml6-module-org-kde-coreaddons \
    qml6-module-org-kde-desktop \
    qml6-module-org-kde-draganddrop \
    qml6-module-org-kde-graphicaleffects \
    qml6-module-org-kde-guiaddons \
    qml6-module-org-kde-iconthemes \
    qml6-module-org-kde-kcmutils \
    qml6-module-org-kde-kdeconnect \
    qml6-module-org-kde-kholidays \
    qml6-module-org-kde-kirigami \
    qml6-module-org-kde-kirigamiaddons-components \
    qml6-module-org-kde-kirigamiaddons-datetime \
    qml6-module-org-kde-kirigamiaddons-delegates \
    qml6-module-org-kde-kirigamiaddons-formcard \
    qml6-module-org-kde-kirigamiaddons-labs-components \
    qml6-module-org-kde-kirigamiaddons-settings \
    qml6-module-org-kde-kirigamiaddons-statefulapp \
    qml6-module-org-kde-kirigamiaddons-tableview \
    qml6-module-org-kde-kirigamiaddons-treeview \
    qml6-module-org-kde-kitemmodels \
    qml6-module-org-kde-kquickcontrols \
    qml6-module-org-kde-kquickcontrolsaddons \
    qml6-module-org-kde-kquickimageeditor \
    qml6-module-org-kde-ksvg \
    qml6-module-org-kde-ksysguard \
    qml6-module-org-kde-kwindowsystem \
    qml6-module-org-kde-networkmanager \
    qml6-module-org-kde-newstuff \
    qml6-module-org-kde-notifications \
    qml6-module-org-kde-people \
    qml6-module-org-kde-pipewire \
    qml6-module-org-kde-plasma-plasma5support \
    qml6-module-org-kde-prison \
    qml6-module-org-kde-purpose \
    qml6-module-org-kde-quickcharts \
    qml6-module-org-kde-sonnet \
    qml6-module-org-kde-syntaxhighlighting \
    qml6-module-org-kde-userfeedback \
    \
    `# --- Calamares Installer ---` \
    calamares \
    calamares-settings-debian \
    \
    `# --- KDE Desktop Integration ---` \
    debconf-kde-data \
    debconf-kde-helper \
    usb-creator-kde \
    xdg-desktop-portal-kde \
    libreoffice-plasma \
    \
    `# --- System Essentials ---` \
    sudo \
    fuse \
    libfuse2 \
    network-manager \
    network-manager-gnome \
    curl \
    wget \
    git \
    bash-completion \
    kvantum

# Enable SDDM on boot
systemctl enable sddm 2>/dev/null || true
systemctl set-default graphical.target 2>/dev/null || true

# ----------------------------
# WHITESUR THEME (KDE + GTK + ICONS + CURSORS + KVANTUM)
# ----------------------------
echo "[*] Installing WhiteSur theme..."

apt install -y git curl

cd /tmp

# KDE Plasma theme
git clone https://github.com/vinceliuice/WhiteSur-kde.git
cd WhiteSur-kde && ./install.sh && cd ..

# GTK theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme && ./install.sh -l && cd ..

# Icon theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && ./install.sh && cd ..

# Cursor theme
git clone https://github.com/vinceliuice/WhiteSur-cursors.git
cd WhiteSur-cursors && ./install.sh && cd ..

# Cleanup
rm -rf /tmp/WhiteSur-kde /tmp/WhiteSur-gtk-theme /tmp/WhiteSur-icon-theme /tmp/WhiteSur-cursors

echo "[*] WhiteSur theme installed"

apt autoremove -y
apt clean

echo
echo "[✓] FloofOS packages installed successfully"
echo "[*] Done at $(date)"
