#!/home/wwwroot
IPT="/sbin/iptables"
$IPT --delete-chain
$IPT --flush
$IPT -P INPUT DROP #1
$IPT -P FORWARD DROP #1
$IPT -P OUTPUT DROP #1
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT #2
$IPT -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 8888 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT #3
$IPT -A INPUT -p tcp --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT#11
$IPT -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT #3
$IPT -A INPUT -i lo -j ACCEPT #4
$IPT -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT  #5
$IPT -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT #5
$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT #6
$IPT -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT #7
$IPT -A OUTPUT -o lo -j ACCEPT #4
$IPT -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT #8
$IPT -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT #8
$IPT -A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT #9
$IPT -A OUTPUT -p tcp -m tcp --dport 3690 -j ACCEPT #2
$IPT -A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT #10
$IPT -A OUTPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT #10
service iptables save
service iptables restart
/sbin/modprobe ip_nat_ftp #11
/sbin/modprobe ip_conntrack #11
/sbin/modprobe ip_conntrack_ftp #11