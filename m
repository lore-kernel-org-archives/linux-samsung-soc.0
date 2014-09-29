From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v3 0/6] Add initial support for pinctrl on Exynos7
Date: Mon, 29 Sep 2014 10:45:06 +0530
Message-ID: <1411967712-8321-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25214 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbaI2FPj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 01:15:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, linus.walleij@linaro.org

Changes since v1:
	- Marked the newly created irq_chip instances as __initdata
	- Used kmemdup to keep a copy of the irq_chip
	- Change the pinctrl name from sd0_rdqs to sd0_ds as per UM
	- Moved the pinctrl enablement for exynos7 into a separate patch
	- Added tested-by and reviewed-by tags from Thomas Abraham

Following patches have been tested on linux-next (20140926).
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/
 
Following patches are required for this series:
1) "tty/serial: fix config dependencies for samsung serial"
   https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html
2) "dts, kbuild: Implement support for dtb vendor subdirs" patchset 
   http://comments.gmane.org/gmane.linux.kbuild.devel/12131
3) "arch: arm64: enable support for Samsung Exynos7 SoC" patchset (v5)
   http://www.spinics.net/lists/arm-kernel/msg364014.html

Abhilash Kesavan (3):
  pinctrl: exynos: Generalize the eint16_31 demux code
  pinctrl: exynos: Consolidate irq domain callbacks
  pinctrl: exynos: Add irq_chip instance for Exynos7 wakeup interrupts

Naveen Krishna Ch (3):
  pinctrl: exynos: Add initial driver data for Exynos7
  arm64: dts: Add initial pinctrl support to EXYNOS7
  arm64: exynos: Enable pinctrl support for Exynos7

 .../bindings/pinctrl/samsung-pinctrl.txt           |    3 +
 arch/arm64/Kconfig                                 |    2 +
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  560 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   66 +++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  196 +++++--
 drivers/pinctrl/samsung/pinctrl-exynos.h           |    3 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    3 +
 8 files changed, 799 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi

-- 
1.7.9.5
