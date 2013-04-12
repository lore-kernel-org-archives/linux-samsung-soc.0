From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/7] exynos multiplatform support, part 2
Date: Fri, 12 Apr 2013 16:03:18 +0200
Message-ID: <1365775405-115297-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:55412 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab3DLODh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 10:03:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>

These are the patches required for exynos multiplatform support that
depend on other patches that are already merged in the arm-soc next/drivers
branch. The series applies cleanly on top of the next/drivers branch
at the moment, and in combination with various patches that were
accepted by subsystem maintainers and part 1 of the series (which
applies on top of 3.9-rc5) brings full support for ARCH_MULTIPLATFORM
to device tree based exynos systems.

	Arnd

Arnd Bergmann (7):
  clk: exynos: prepare for multiplatform
  clocksource: exynos_mct: remove platform header dependency
  ARM: exynos: add missing properties for combiner IRQs
  irqchip: exynos: pass max combiner number to combiner_init
  irqchip: exynos: allocate combiner_data dynamically
  irqchip: exynos: localize irq lookup for ATAGS
  irqchip: exynos: pass irq_base from platform

 arch/arm/boot/dts/exynos4210.dtsi    |   1 +
 arch/arm/boot/dts/exynos4212.dtsi    |   9 +++
 arch/arm/boot/dts/exynos4412.dtsi    |   9 +++
 arch/arm/mach-exynos/common.c        |  20 +++++-
 arch/arm/mach-exynos/common.h        |   7 ++-
 drivers/clk/samsung/clk-exynos4.c    |  93 +++++++++++++---------------
 drivers/clk/samsung/clk-exynos5250.c |   1 -
 drivers/clk/samsung/clk-exynos5440.c |   1 -
 drivers/clk/samsung/clk.h            |   2 -
 drivers/clocksource/exynos_mct.c     |  21 ++-----
 drivers/irqchip/exynos-combiner.c    | 116 ++++++++++++++++++-----------------
 11 files changed, 148 insertions(+), 132 deletions(-)

-- 
1.8.1.2
