From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/5] ARM: Exynos: Enable device tree support for MCT controller
Date: Sat, 03 Nov 2012 20:15:33 +0530
Message-ID: <1351953938-13487-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26808 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754Ab2KCOUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 10:20:46 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCX005YG16K33E0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:20:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCX00DCN163LTA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:20:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com

This patch series adds device tree support for Exynos4/5 MCT controller. This
series depends on the device tree and smp support patches for Exynos4x12 posted
by Tomasz Figa. This patch series has been tested on Exynos4210 based Origen
board, Exynos4412 based SMDK board and Exynos5250 based SMDK board.

Thomas Abraham (5):
  ARM: Exynos: add a register base address variable in mct controller driver
  ARM: Exynos: prepare an array of MCT interrupt numbers and use it
  ARM: Exynos: add device tree support for MCT controller driver
  ARM: Exynos: remove static io-remapping of mct registers for Exynos5
  ARM: dts: add mct device tree node for all supported Exynos SoC's

 .../bindings/timer/samsung,exynos4210-mct.txt      |   70 ++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |    8 +
 arch/arm/boot/dts/exynos4212.dtsi                  |   10 +
 arch/arm/boot/dts/exynos4412.dtsi                  |    8 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   21 +++
 arch/arm/mach-exynos/common.c                      |    5 -
 arch/arm/mach-exynos/include/mach/irqs.h           |    6 -
 arch/arm/mach-exynos/include/mach/map.h            |    1 -
 arch/arm/mach-exynos/include/mach/regs-mct.h       |   53 ------
 arch/arm/mach-exynos/mct.c                         |  176 +++++++++++++-------
 10 files changed, 234 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
 delete mode 100644 arch/arm/mach-exynos/include/mach/regs-mct.h
