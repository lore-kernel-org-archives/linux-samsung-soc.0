From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 3/6] ARM: Exynos4: Enable platform support for SPI
 controllers
Date: Sun, 03 Jun 2012 18:12:46 +0530
Message-ID: <1338727369-18241-4-git-send-email-thomas.abraham@linaro.org>
References: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30650 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196Ab2FCM1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:27:52 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M51008O7JYB3OB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:51 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5100119JY60A40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:51 +0900 (KST)
In-reply-to: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Add the platform bits which are required to support SPI controllers.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/include/mach/irqs.h |    4 ++++
 arch/arm/mach-exynos/mach-exynos4-dt.c   |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 7a4b478..35bced6 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -195,6 +195,10 @@
 #define IRQ_IIC6			EXYNOS4_IRQ_IIC6
 #define IRQ_IIC7			EXYNOS4_IRQ_IIC7
 
+#define IRQ_SPI0			EXYNOS4_IRQ_SPI0
+#define IRQ_SPI1			EXYNOS4_IRQ_SPI1
+#define IRQ_SPI2			EXYNOS4_IRQ_SPI2
+
 #define IRQ_USB_HOST			EXYNOS4_IRQ_USB_HOST
 #define IRQ_OTG				EXYNOS4_IRQ_USB_HSOTG
 
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index e7e9743..b2b5d5f 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -55,6 +55,12 @@ static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
 				"exynos4-sdhci.3", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(0),
 				"s3c2440-i2c.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI0,
+				"exynos4210-spi.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI1,
+				"exynos4210-spi.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI2,
+				"exynos4210-spi.2", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
 	{},
-- 
1.6.6.rc2
