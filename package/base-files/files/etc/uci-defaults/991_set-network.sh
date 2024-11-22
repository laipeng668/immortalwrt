#!/bin/sh

uci set dhcp.wan6=dhcp
uci set dhcp.wan6.interface='wan6'
uci set dhcp.wan6.ignore='1'

uci set dhcp.lan.force='1'
uci set dhcp.lan.ra='hybrid'
uci set dhcp.lan.ra_default='1'
uci set dhcp.lan.max_preferred_lifetime='900'
uci set dhcp.lan.max_valid_lifetime='1800'

uci del dhcp.lan.dhcpv6
uci del dhcp.lan.ra_flags
uci del dhcp.lan.ra_slaac
uci add_list dhcp.lan.ra_flags='none'

uci commit dhcp

uci set network.wan6.reqaddress='try'
uci set network.wan6.reqprefix='auto'
uci set network.lan.ip6assign='64'
uci set network.lan.ip6ifaceid='eui64'
uci del network.globals.ula_prefix

uci commit network

exit 0