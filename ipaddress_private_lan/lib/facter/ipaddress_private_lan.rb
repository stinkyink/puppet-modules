# Fact: ipaddress_private_lan
#
# Purpose: Return "private lan IP address" first if it exists.
#
# On Linode if you have a private ip setup (to allow internal
# communication between nodes) you have a virtual interface on eth0:0, this fact
# allows you to prioritise that IP over any public facing one, obviously
# returning the public (or eth0) one if it is not found.
#
# Ordering:
#
# - eth1
# - eth0_0
# - eth0
Facter.add("ipaddress_private_lan") do
  setcode do
    if ip = Facter.value("ipaddress_eth1")
      ip
    elsif ip = Facter.value("ipaddress_eth0:0")
      ip
    else
      Facter.value('ipaddress')
    end
  end
end
