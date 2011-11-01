From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] ARM: Samsung: Add basic device tree support for Exynos4 boards
Date: Tue,  1 Nov 2011 06:36:51 +0530
Message-ID: <1320109613-2811-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:58566 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753728Ab1KABHY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Oct 2011 21:07:24 -0400
Received: by pzk36 with SMTP id 36so19996765pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2011 18:07:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Changes since v1:
- Removed unique per-controller compatible string value from gpio controller nodes
  to align with the updated device tree support for exynos4 gpio controller.
- Removed the interrupt combiner controller node.

This patchset adds a new basic device tree enabled machine/board file which is
based on the Samsung's Exynos4 family of SoC's. Also included in this patchset is the
dts file for Exynos4210 SoC, Samsung's SMDKV310 board and Insignal's Origen board.

The Exynos4210 dts file includes support for IRQ, GPIO, WDT, RTC, UART, SDHCI, Keypad,
DMA and I2C controllers. As device tree coverage for Exynos4210 increases, additional
device nodes to represent the controllers should be added.

The device tree enabled machine file enables boot on two boards based on the
Exynos4210 SoC. This provides a starting point to add additional device tree support
on these boards, migrate other existing Exynos4 based boards to use device tree
and enable device tree based boot on new upcoming boards.

This patchset has been tested on the following tree:
git://git.linaro.org/git/people/arnd/arm-soc.git  branch: for-next

Thomas Abraham (2):
  ARM: Samsung: Add Exynos4 device tree enabled board file
  ARM: dts: Add intial dts file for Exynos4210 SoC, SMDKV310 and Origen board

 .../devicetree/bindings/arm/insignal-boards.txt    |    8 +
 .../devicetree/bindings/arm/samsung-boards.txt     |    8 +
 arch/arm/boot/dts/exynos4210-origen.dts            |  137 +++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |  182 +++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  397 ++++++++++++++++++++
 arch/arm/mach-exynos4/Kconfig                      |   14 +
 arch/arm/mach-exynos4/Makefile                     |    2 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c            |   85 +++++
 8 files changed, 833 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/insignal-boards.txt
 create mode 100644 Documentation/devicetree/bindings/arm/samsung-boards.txt
 create mode 100644 arch/arm/boot/dts/exynos4210-origen.dts
 create mode 100644 arch/arm/boot/dts/exynos4210-smdkv310.dts
 create mode 100644 arch/arm/boot/dts/exynos4210.dtsi
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c
