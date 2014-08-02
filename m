From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Sat,  2 Aug 2014 02:52:20 +0200
Message-ID: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33564 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753571AbaHBAxF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 20:53:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>

Hello,

Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15=20
based attempts by Stephan and me that broke for 3.16, I've prepared a=20
device tree for the HP Chromebook 11 aka Google Spring.

v6 renames a node and reverts dp_hpd.

Not yet enabled are trackpad, Wifi and sound.

My rebasing branch for testing is here:
https://github.com/afaerber/linux/commits/spring-next

Regards,
Andreas

v1 -> v2:
* Dropped 3 documentation patches from series:
  2 picked up,
  https://patchwork.kernel.org/patch/4397271/
  https://patchwork.kernel.org/patch/4397291/
  1 already sent separately as v2, pending.
  https://patchwork.kernel.org/patch/4424881/
* Minimized and beautified Spring device tree and to some degree Snow a=
s well.
  See individual patches.

v2 -> v3:
* Rebased: Two -cros-common cleanup patches were already applied
* Lots of small cleanups for both Snow and Spring
* Enabled I2S in Spring for symmetry
* Added lid-switch and gpio-keys pinctrls to Spring

v3 -> v4:
* Fixed pin-function 1 -> 0 for dp-hpd pinctrl, style cleanup

v4 -> v5:
* Dropped regulator and fixed USB3503 for Spring
* More cleanups, including SMDK5250 and Arndale

v5 -> v6:
* Renamed mfc node label for alignment with iommu patches around
* Reverted dp-hpd to v4


Andreas F=C3=A4rber (10):
  ARM: dts: Fix MMC pinctrl for exynos5250-snow
  ARM: dts: Fold exynos5250-cros-common into exynos5250-snow
  ARM: dts: Prepare node labels for exynos5250
  ARM: dts: Clean up exynos5250-snow
  ARM: dts: Fill in bootargs for exynos5250-snow
  ARM: dts: Clean up exynos5250-smdk5250
  ARM: dts: Clean up exynos5250-arndale
  ARM: dts: Fix apparent GPIO typo in exynos5250-arndale
  ARM: dts: Simplify USB3503 on exynos5250-arndale
  ARM: dts: Add exynos5250-spring device tree

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/exynos5250-arndale.dts      | 927 +++++++++++++-----=
--------
 arch/arm/boot/dts/exynos5250-cros-common.dtsi | 164 -----
 arch/arm/boot/dts/exynos5250-smdk5250.dts     | 632 +++++++++---------
 arch/arm/boot/dts/exynos5250-snow.dts         | 434 +++++++-----
 arch/arm/boot/dts/exynos5250-spring.dts       | 536 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi             |  24 +-
 7 files changed, 1608 insertions(+), 1110 deletions(-)
 delete mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts

--=20
1.9.3
