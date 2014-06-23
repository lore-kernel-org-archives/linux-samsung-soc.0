From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Mon, 23 Jun 2014 03:21:18 +0200
Message-ID: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35098 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750943AbaFWBWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 21:22:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>

=46rom: Andreas F=C3=A4rber <andreas.faerber@web.de>

Hello,

Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15=20
based attempts by Stephan and me that broke for 3.16, I've prepared a=20
device tree for the HP Chromebook 11 aka Google Spring.

The first three patches should be good to go and contain documentation=20
fixes found while comparing exynos5250-snow.dts vs. /proc/device-tree.

The main patch was tested using a chained non-verified U-Boot (simplefb=
)=20
and a rootfs on USB-attached SD card.
The display goes dark unfortunately (drm bridge series not yet tested),
but I am able to log in via ssh over USB ethernet adapter okay.

Audio support is likely missing as my focus was getting USB booting.
Not included is touchpad support, as "atmel,atmel_mxt_tp" is not=20
documented to be available upstream. And no /dev/mmcblk0 or Wifi yet.
Also when the screen stayed on, the embedded controller's keymap seems=20
hardcoded to US English with system settings not taking effect; but=20
surely we don't want per-keyboard device tree files to remedy that.

I'd appreciate if we can get a core .dts sorted out and consider=20
incremental changes from there.

Regards,
Andreas

Andreas F=C3=A4rber (4):
  Documentation: devicetree: Fix s2mps11 and s5m8767 typos
  Documentation: devicetree: Fix s2mps11 example syntax
  Documentation: devicetree: Fix tps65090 typos
  ARM: dts: exynos5250: Add Spring device tree

 Documentation/devicetree/bindings/mfd/s2mps11.txt  |   4 +-
 .../bindings/regulator/s5m8767-regulator.txt       |   2 +-
 .../devicetree/bindings/regulator/tps65090.txt     |   4 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5250-spring.dts            | 556 +++++++++++++=
++++++++
 5 files changed, 562 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts

--=20
1.9.3
