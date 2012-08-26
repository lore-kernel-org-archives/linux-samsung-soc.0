From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 2/3] ARM: Exynos5: Add AUXDATA support for MSHC controllers
Date: Sun, 26 Aug 2012 17:29:30 +0530
Message-ID: <1345982371-26483-3-git-send-email-thomas.abraham@linaro.org>
References: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20788 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752142Ab2HZLl3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Aug 2012 07:41:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9D008141SXU2C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 26 Aug 2012 20:41:28 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9D00JEH1SVN450@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 26 Aug 2012 20:41:28 +0900 (KST)
In-reply-to: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, cjb@laptop.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

Add entries if MSHC controllers in AUXDATA table for correct device name
initialization.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 9d1f3ac..5b0ee41 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -172,6 +172,7 @@
 
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 #define EXYNOS4_PA_DWMCI		0x12550000
+#define EXYNOS5_PA_DWMCI(x)		(0x12200000 + ((x) * 0x10000))
 
 #define EXYNOS4_PA_HSOTG		0x12480000
 #define EXYNOS4_PA_USB_HSPHY		0x125B0000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ef770bc..4257cc1 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -47,6 +47,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"s3c2440-i2c.0", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(1),
 				"s3c2440-i2c.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI(0),
+				"dw_mmc.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI(1),
+				"dw_mmc.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI(2),
+				"dw_mmc.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI(3),
+				"dw_mmc.3", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS5_PA_SPI0,
 				"exynos4210-spi.0", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS5_PA_SPI1,
-- 
1.6.6.rc2
