From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Set appropriate I2C device variant
Date: Wed, 29 Jun 2011 16:26:13 +0200
Message-ID: <1309357573-13632-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50024 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756174Ab1F2O0S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 10:26:18 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LNK00IZR2RT6MA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jun 2011 15:26:17 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LNK00F1P2RRNU@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jun 2011 15:26:15 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Set up a correct I2C bus controller variant name for Exynos4.
Without this change the I2C bus driver fails to acquire its
clocks.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

This change is required to enable the I2C bus controller driver
operation on exynos4 with the clkdev patches applied.

Regards,
Sylwester
---
 arch/arm/mach-exynos4/cpu.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 1196f39..67918c0 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -23,6 +23,7 @@
 #include <plat/sdhci.h>
 #include <plat/devs.h>
 #include <plat/fimc-core.h>
+#include <plat/iic-core.h>
 
 #include <mach/regs-irq.h>
 
@@ -137,6 +138,11 @@ void __init exynos4_map_io(void)
 	s3c_fimc_setname(1, "exynos4-fimc");
 	s3c_fimc_setname(2, "exynos4-fimc");
 	s3c_fimc_setname(3, "exynos4-fimc");
+
+	/* The I2C bus controllers are directly compatible with s3c2440 */
+	s3c_i2c0_setname("s3c2440-i2c");
+	s3c_i2c1_setname("s3c2440-i2c");
+	s3c_i2c2_setname("s3c2440-i2c");
 }
 
 void __init exynos4_init_clocks(int xtal)
-- 
1.7.2.5
