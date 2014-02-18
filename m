From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/3] exynos: arch: add support for exynos5260 SoC
Date: Tue, 18 Feb 2014 16:27:53 +0530
Message-ID: <1392721076-26630-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43441 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753936AbaBRK6i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Feb 2014 05:58:38 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

V4:
  1) Removed duplicate MMC Soc property from Board file.

V3:
  1) Addressed review comments from Tomasz figa.

V2:
  1) Split up DT patch into SoC and Board patch.

This series is dependent on Sachin's patch
"ARM: EXYNOS: Consolidate CPU init code" at
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/26560

This series is based on Kukjin's for-next branch at
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git

Pankaj Dubey (1):
  ARM: EXYNOS: initial board support for exynos5260 SoC

Rahul Sharma (2):
  ARM: dts: add dts files for exynos5260 SoC
  ARM: dts: add dts files for xyref5260 board

 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi       |  574 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts |  103 ++++
 arch/arm/boot/dts/exynos5260.dtsi               |  304 ++++++++++++
 arch/arm/mach-exynos/Kconfig                    |    4 +
 arch/arm/mach-exynos/common.c                   |   11 +
 arch/arm/mach-exynos/include/mach/map.h         |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c          |    1 +
 arch/arm/plat-samsung/include/plat/cpu.h        |    8 +
 9 files changed, 1007 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
 create mode 100644 arch/arm/boot/dts/exynos5260.dtsi

-- 
1.7.9.5
