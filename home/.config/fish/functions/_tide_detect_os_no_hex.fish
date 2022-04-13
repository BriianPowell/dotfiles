# Outputs icon, color, bg_color
function _tide_detect_os_no_hex
    set -lx defaultColor 080808 CED7CF
    switch (uname | string lower)
        case darwin
            printf %s\n  # from apple.com header
        case freebsd openbsd dragonfly
            printf %s\n  # https://freebsdfoundation.org/about-us/about-the-foundation/project/
        case linux
            _tide_detect_os_no_hex_linux_cases /etc/os-release ID ||
                _tide_detect_os_no_hex_linux_cases /etc/os-release ID_LIKE ||
                _tide_detect_os_no_hex_linux_cases /etc/lsb-release DISTRIB_ID ||
                printf %s\n  $defaultColor
        case '*'
            echo -ns '?'
    end
end

function _tide_detect_os_no_hex_linux_cases -a file key
    test -e $file || return
    set -l split_file (string split '=' <$file)
    set -l key_index (contains --index $key $split_file) || return
    set -l value (string trim --chars='"' $split_file[(math $key_index + 1)])
    set -l value_processed (string lower $value | string split ' ')[1] # Split on spaces for things like "opensuse suse"

    # Anything which would have pure white background has been changed to D4D4D4
    # It was just too bright otherwise
    switch $value_processed
        case alpine
            printf %s\n  # from alpine logo
        case arch
            printf %s\n  # from arch wiki header
        case centos
            printf %s\n  # https://wiki.centos.org/ArtWork/Brand/Logo, monochromatic
        case debian
            printf %s\n  # from debian logo https://www.debian.org/logos/openlogo-nd-100.png
        case devuan
            printf %s\n  # logo is monochromatic
        case elementary
            printf %s\n  # https://elementary.io/brand, encouraged to be monochromatic
        case fedora
            printf %s\n  # from logo https://fedoraproject.org/w/uploads/2/2d/Logo_fedoralogo.png
        case gentoo
            printf %s\n  # https://wiki.gentoo.org/wiki/Project:Artwork/Colors
        case mageia
            printf %s\n  # https://wiki.mageia.org/en/Artwork_guidelines
        case manjaro
            printf %s\n  # from https://gitlab.manjaro.org/artwork/branding/logo/-/blob/master/logo.svg
        case mint
            printf %s\n  # extracted from https://linuxmint.com/web/img/favicon.ico
        case nixos
            printf %s\n  # https://github.com/NixOS/nixos-artwork/tree/master/logo
        case opensuse tumbleweed
            printf %s\n  # https://en.opensuse.org/openSUSE:Artwork_brand
        case raspbian
            printf %s\n  # https://static.raspberrypi.org/files/Raspberry_Pi_Visual_Guidelines_2020.pdf
        case sabayon
            printf %s\n  # Can't find colors, and they are rebranding anyway
        case slackware
            printf %s\n  # Doesn't really have a logo, and the colors are too close to PWD blue anyway
        case ubuntu
            printf %s\n  # https://design.ubuntu.com/brand/
        case '*'
            return 1
    end
end
