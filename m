From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv3 0/4] Enable usbphy and hsotg for exynos4
Date: Mon, 28 Apr 2014 11:28:41 +0900
Message-ID: <1398652125-4216-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30646 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbaD1C3C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Apr 2014 22:29:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>

This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
syscon phandles.

Change from v2:
 - Split 4x12 compatibles to 4212 and 4412

Changes from v1: Applied Tomasz Figa's comments
 - Document PMU syscon compatibles for exynos4210/4x12
 - Use clock macro instead of raw clock number
 - Correct phy name to "usb2-phy"

Chanho Park (4):
  ARM: dts: exynos4: add PMU syscon node
  ARM: dts: exynos4: add exynos_usbphy node
  ARM: dts: exynos4: add hsotg device node
  ARM: dts: exynos4412-trats2: enable usb nodes

 .../devicetree/bindings/arm/samsung/pmu.txt        |  3 +++
 arch/arm/boot/dts/exynos4.dtsi                     | 26 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts            | 10 +++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  |  9 ++++++++
 4 files changed, 48 insertions(+)

-- 
1.8.3.2
