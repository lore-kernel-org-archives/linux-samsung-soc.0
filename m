From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv4 0/4] Enable usbphy and hsotg for exynos4
Date: Fri, 02 May 2014 13:26:05 +0900
Message-ID: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45054 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbaEBE0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 00:26:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com, k.debski@samsung.com, Chanho Park <chanho61.park@samsung.com>

This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
syscon phandles.

Change from v3:
 - Place a status field at the end of the nodes for readability

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
