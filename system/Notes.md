# Notes

- Set `mitigations=off` in Kernel Parameters
- Install `dhclient` for WiFi
- Add `noatime` to partitions in fstab
- For wired connection
	- Enable systemd-networkd service
	- Copy 20-wired.network into /etc/systemd/network/
- Put fonts into `/usr/share/fonts/`
