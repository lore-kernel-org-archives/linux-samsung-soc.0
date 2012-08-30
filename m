From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/6] ARM: Exynos4: Add OF compatibility lookups for Exynos4 i2c
 adapters
Date: Thu, 30 Aug 2012 09:31:41 +0200
Message-ID: <1346311903-15920-5-git-send-email-t.figa@samsung.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33705 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab2H3HcV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 03:32:21 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9K00I9W4WU26C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:20 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9K00G074XCNR40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:20 +0900 (KST)
In-reply-to: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 8dad4ec..0391c84 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -61,6 +61,22 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 				"exynos4210-spi.1", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI2,
 				"exynos4210-spi.2", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(0),
+				"s3c2440-i2c.0", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(1),
+				"s3c2440-i2c.1", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(2),
+				"s3c2440-i2c.2", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(3),
+				"s3c2440-i2c.3", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(4),
+				"s3c2440-i2c.4", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(5),
+				"s3c2440-i2c.5", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(6),
+				"s3c2440-i2c.6", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(7),
+				"s3c2440-i2c.7", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
 	{},
-- 
1.7.12
