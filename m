From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/4] Enable usbphy and hsotg for exynos4
Date: Mon, 14 Apr 2014 21:48:16 +0900
Message-ID: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56037 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282AbaDNMs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 08:48:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>

This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
syscon phandles.

Chanho Park (4):
  ARM: dts: exynos4: add PMU syscon node
  ARM: dts: exynos4: add exynos_usbphy node
  ARM: dts: exynos4: add hsotg device node
  ARM: dts: exynos4412-trats2: enable usb nodes

 arch/arm/boot/dts/exynos4.dtsi          | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts | 10 ++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi       |  5 +++++
 3 files changed, 41 insertions(+)

-- 
1.8.3.2
