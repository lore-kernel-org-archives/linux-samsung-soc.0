From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/7] Switch to generic syscon regmap based drivers
Date: Mon, 19 Oct 2015 11:33:48 +0530
Message-ID: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44793 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbbJSGOE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 02:14:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Alim Akhtar (7):
  arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
  arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
  arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
  arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
  ARM: exynos_defconfig: Normalize exynos defconfig
  ARM: exynos_defconfig: Enable generic syscon-{reboot, poweroff}
    drivers
  ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs

 arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
 arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
 arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
 arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
 arch/arm/configs/exynos_defconfig |   11 +++++-----
 arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
 6 files changed, 61 insertions(+), 49 deletions(-)

-- 
1.7.10.4
