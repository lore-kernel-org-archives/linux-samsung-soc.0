From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 0/8] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Mon, 14 Jul 2014 14:48:18 +0200
Message-ID: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36145 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837AbaGNMsj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:48:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8P00ED8CWKX870@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 13:48:20 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

Hello,

This is the third version of the initial patch series adding support
for Exynos 4412 based Odroid X2 and U2/U3/U3+ boards and improving
support for Odroid X.

Complete USB support for Odroid U2/U3/U3+ still requires some fixes in
Exynos4 USB2 Phy driver and clock driver for CLKOUT:
http://thread.gmane.org/gmane.linux.kernel/1731843/
http://www.spinics.net/lists/linux-usb/msg109587.html
The above changes however don't affect Odroid DTS files, but without
them, usb3503 hub is not yet functional.

Support for audio codec and HDMI video output is available in separate patch series.

If one is interested in more complete and open-source Odroid board
support, there are also patches for u-boot project:
http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/188295/focus=188610

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:

v3:
- added fix for total memory size (last megabyte is used by secure firmware
  and should not be accessed by Linux kernel)
- added patch defining GPIO button(s)
- added patch fixing TFLASH (SD card) detection

v2:
- added fix for broken LAN after reboot (removed BUCK8 always on property)
- restored all 4 uarts for Odroid X/X2 until correct patch for UART driver
  is developed
- rmoved incorrect port@2 node in ehci node for odroidx dts
- updated links for latest version of CLKOUT and PHY patches

v1: 
- initial version


*** BLURB HERE ***

Kamil Debski (2):
  ARM: dts: exynos4412-odroidx: add support for USB (phy, host, device)
  ARM: dts: exynos4412-odroid-common: disable 'always on' for BUCK8
    regulator

Marek Szyprowski (6):
  ARM: dts: exynos4: add port sub-nodes to exynos usb host modules
  ARM: dts: exynos4412-odroidx: enable common hardware blocks
  ARM: dts: exynos4412-odroidx: correct memory size
  ARM: dts: refactor Odroid DTS file and add support for Odroid X2 and
    U2/U3
  ARM: dts: exynos4412-odroid: add support for GPIO buttons
  ARM: dts: exynos4412-odroid: fix T-FLASH hotplug detection

 arch/arm/boot/dts/Makefile                      |   2 +
 arch/arm/boot/dts/exynos4.dtsi                  |  24 ++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 344 ++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |  49 ++++
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 279 ++-----------------
 arch/arm/boot/dts/exynos4412-odroidx2.dts       |  23 ++
 6 files changed, 471 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-odroid-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-odroidu3.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-odroidx2.dts

-- 
1.9.2
