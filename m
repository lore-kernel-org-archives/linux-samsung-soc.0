From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/3] ARM: EXYNOS: DT-enabled support for Universal C210
Date: Mon, 15 Apr 2013 16:41:59 +0200
Message-ID: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56715 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296Ab3DOOnR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 10:43:17 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLA00AONWVWFPY0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Apr 2013 23:43:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org, arnd@arndb.de, Tomasz Figa <t.figa@samsung.com>

This series intends to add support for Universal C210 board using Device
Tree. Main difference from other boards based on Exynos 4210 is that
hardware revision of the SoC used on Universal C210 does not support MCT
timers and legacy PWM timers must be used instead.

First patch adds device tree node for PWM block available on Exynos4 SoCs,
second patch adds support for Exynos4210 rev0 SoC in exynos_init_time()
and third patch introduces initial device tree for Universal C210 board.

Depends on my series for PWM timers rework:
[PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
(http://thread.gmane.org/gmane.linux.kernel.samsung-soc/17864)

On Universal C210 board:

Tested-by: Tomasz Figa <t.figa@samsung.com>

Tomasz Figa (3):
  ARM: dts: exynos4: Add node for PWM device
  ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
  ARM: dts: exynos4210: Add basic dts file for universal_c210 board

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/exynos4.dtsi                  |   8 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 352 ++++++++++++++++++++++++
 arch/arm/mach-exynos/common.c                   |   6 +-
 arch/arm/mach-exynos/mach-universal_c210.c      |   2 +-
 5 files changed, 367 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-universal_c210.dts

-- 
1.8.1.5
