{ pkgs, ... }:

with pkgs; [
  autokey
  awscli2
  copyq
  ffmpeg
  firefox
  go
  google-chrome
  helm
  keepassxc
  kubectl
  kubectx
  logseq
  minikube
  nerdfonts
  nixfmt
  nodejs
  nmap
  packer
  playwright-driver.browsers
  phoronix-test-suite
  python3
  python311Packages.pip
  python311Packages.tensorflow
  rmtrash
  rofi
  rustup
  signal-desktop
  slack
  spotify
  terraform
  terragrunt
  thunderbird
  tmux
  unzip
  vagrant
  virtualboxWithExtpack
  vscode
  xautomation
  xbindkeys
  xsel
  zoom-us
  # playwright deps

]
# ost system is missing dependencies to run browsers. ║
#     ║ Missing libraries:                                   ║
#     ║     libgtk-3.so.0                                    ║
#     ║     libgdk-3.so.0                                    ║
#     ║     libpangocairo-1.0.so.0                           ║
#     ║     libpango-1.0.so.0                                ║
#     ║     libharfbuzz.so.0                                 ║
#     ║     libcairo-gobject.so.2                            ║
#     ║     libcairo.so.2                                    ║
#     ║     libgdk_pixbuf-2.0.so.0                           ║
#     ║     libicudata.so.66                                 ║
#     ║     libicui18n.so.66                                 ║
#     ║     libatomic.so.1                                   ║
#     ║     libsystemd.so.0                                  ║
#     ║     libicuuc.so.66                                   ║
#     ║     libxml2.so.2                                     ║
#     ║     libsqlite3.so.0                                  ║
#     ║     libxslt.so.1                                     ║
#     ║     libepoxy.so.0                                    ║
#     ║     liblcms2.so.2                                    ║
#     ║     libwoff2dec.so.1.0.2                             ║
#     ║     libevent-2.1.so.7                                ║
#     ║     libopus.so.0                                     ║
#     ║     libfontconfig.so.1                               ║
#     ║     libfreetype.so.6                                 ║
#     ║     libharfbuzz-icu.so.0                             ║
#     ║     libgcrypt.so.20                                  ║
#     ║     libgpg-error.so.0                                ║
#     ║     libjpeg.so.8                                     ║
#     ║     libpng16.so.16                                   ║
#     ║     libz.so.1                                        ║
#     ║     libopenjp2.so.7                                  ║
#     ║     libwebpdemux.so.2                                ║
#     ║     libwebp.so.6                                     ║
#     ║     libenchant-2.so.2                                ║
#     ║     libsecret-1.so.0                                 ║
#     ║     libtasn1.so.6                                    ║
#     ║     libhyphen.so.0                                   ║
#     ║     libX11.so.6                                      ║
#     ║     libflite.so.1                                    ║
#     ║     libflite_usenglish.so.1                          ║
#     ║     libflite_cmu_grapheme_lang.so.1                  ║
#     ║     libflite_cmu_grapheme_lex.so.1                   ║
#     ║     libflite_cmu_indic_lang.so.1                     ║
#     ║     libflite_cmu_indic_lex.so.1                      ║
#     ║     libflite_cmulex.so.1                             ║
#     ║     libflite_cmu_time_awb.so.1                       ║
#     ║     libflite_cmu_us_awb.so.1                         ║
#     ║     libflite_cmu_us_kal16.so.1                       ║
#     ║     libflite_cmu_us_kal.so.1                         ║
#     ║     libflite_cmu_us_rms.so.1                         ║
#     ║     libflite_cmu_us_slt.so.1                         ║
#     ║     libgbm.so.1                                      ║
#     ║     libdrm.so.2                                      ║
#     ║     libstdc++.so.6                                   ║
#     ║     libpcre.so.3                                     ║
#     ║     libpsl.so.5                                      ║
#     ║     libnghttp2.so.14                                 ║
#     ║     libEGL.so.1                                      ║
#     ║     libGLX.so.0                                      ║
#     ║     libX11-xcb.so.1                                  ║
#     ║     libxcb.so.1                                      ║
#     ║     libgudev-1.0.so.0                                ║
#     ║     libffi.so.7                                      ║
#     ║     libevdev.so.2                                    ║
#     ║     libdbus-1.so.3                                   ║
#     ║     libjson-glib-1.0.so.0                            ║
#     ║     libgnutls.so.30
