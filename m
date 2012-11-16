From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: Exynos5: Remove i2c0 resource information and setting of
 device names
Date: Fri, 16 Nov 2012 18:41:26 +0530
Message-ID: <1353071486-29905-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13756 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361Ab2KPMo0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Nov 2012 07:44:26 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDK00FVRZDK1D80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Nov 2012 21:44:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDK00MEBZCMXX60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Nov 2012 21:44:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

All Exynos5 based platforms support only device tree based boot and so the
unused non-dt code that sets i2c0 resource information and device names for
sdhci and i2c platform devices are removed.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index d067ce7..1efcc6f 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -336,23 +336,6 @@ static void __init exynos4_map_io(void)
 static void __init exynos5_map_io(void)
 {
 	iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
-
-	s3c_device_i2c0.resource[0].start = EXYNOS5_PA_IIC(0);
-	s3c_device_i2c0.resource[0].end   = EXYNOS5_PA_IIC(0) + SZ_4K - 1;
-	s3c_device_i2c0.resource[1].start = EXYNOS5_IRQ_IIC;
-	s3c_device_i2c0.resource[1].end   = EXYNOS5_IRQ_IIC;
-
-	s3c_sdhci_setname(0, "exynos4-sdhci");
-	s3c_sdhci_setname(1, "exynos4-sdhci");
-	s3c_sdhci_setname(2, "exynos4-sdhci");
-	s3c_sdhci_setname(3, "exynos4-sdhci");
-
-	/* The I2C bus controllers are directly compatible with s3c2440 */
-	s3c_i2c0_setname("s3c2440-i2c");
-	s3c_i2c1_setname("s3c2440-i2c");
-	s3c_i2c2_setname("s3c2440-i2c");
-
-	s3c64xx_spi_setname("exynos4210-spi");
 }
 
 static void __init exynos4_init_clocks(int xtal)
-- 
1.6.6.rc2
