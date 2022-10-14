#!/bin/bash
#

conf=/mnt/stateful_partition/unencrypted/overlays.txt

die()
{
    echo "$@"
    exit 1
}


[ ! -f $conf ] && echo -n 'overlays=' > $conf

set_vga()
{
    local op="$1"

    if [[ "$op" == "on" ]]; then
        grep -q "vga_off" $conf && sed -i 's/vga_off//g' $conf
    else
        grep -q "vga_off" $conf && return
        echo -n 'vga_off' >> $conf
    fi
}

vag_status()
{
    grep -q vga_off $conf
    if [ "$?" -eq "0" ]; then
        echo 'VGA is disabled'
    else
        echo 'VGA is enabled'
    fi
}

turn_vga_on()
{
    set_vga 'on'
}

turn_vga_off()
{
    set_vga 'off'
}

control_vga()
{
  case "$1" in
    'on')
      turn_vga_on
      ;;
    'off')
      turn_vga_off
      ;;
    'status')
      vag_status
      ;;
    *)
      die "Unknown command: $1"
      ;;
  esac
}

main()
{
    case "$1" in
    'vga')
      shift
      control_vga "$@"
      ;;
    *)
      die "Unknown command: $1"
      ;;
  esac
}

main "$@"
