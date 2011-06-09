From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 4/4] ARM: SAMSUNG: Add platform device for idma
Date: Thu,  9 Jun 2011 17:09:10 +0900
Message-ID: <1307606950-8310-5-git-send-email-sbkim73@samsung.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58710 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754323Ab1FIITF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 04:19:05 -0400
In-Reply-To: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

Exynos4 and S5PC110(S5PV210) has Internal dma(idma) in AUDSS.
To support idma, register idma platform device.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c     |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c     |    1 +
 arch/arm/plat-samsung/dev-asocdma.c       |   10 ++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 5 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 5d03730..4c78dc0 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -73,6 +73,8 @@
 #define IRQ_SYSMMU_MFC_M1_0	COMBINER_IRQ(5, 6)
 #define IRQ_SYSMMU_PCIE_0	COMBINER_IRQ(5, 7)
 
+#define IRQ_I2S0		COMBINER_IRQ(17, 0)
+
 #define IRQ_PDMA0		COMBINER_IRQ(21, 0)
 #define IRQ_PDMA1		COMBINER_IRQ(21, 1)
 
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 1526764..7c538c0 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -187,6 +187,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&exynos4_device_pd[PD_GPS],
 	&exynos4_device_sysmmu,
 	&samsung_asoc_dma,
+	&samsung_asoc_idma,
 	&smdkv310_smsc911x,
 };
 
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index c6a9e86..c6900f8 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -267,6 +267,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s5pv210_device_iis0,
 	&s5pv210_device_spdif,
 	&samsung_asoc_dma,
+	&samsung_asoc_idma,
 	&samsung_device_keypad,
 	&smdkv210_dm9000,
 	&smdkv210_lcd_lte480wv,
diff --git a/arch/arm/plat-samsung/dev-asocdma.c b/arch/arm/plat-samsung/dev-asocdma.c
index a068c4f..832fa83 100644
--- a/arch/arm/plat-samsung/dev-asocdma.c
+++ b/arch/arm/plat-samsung/dev-asocdma.c
@@ -23,3 +23,13 @@ struct platform_device samsung_asoc_dma = {
 	}
 };
 EXPORT_SYMBOL(samsung_asoc_dma);
+
+struct platform_device samsung_asoc_idma = {
+	.name		  = "samsung-idma",
+	.id		  = -1,
+	.dev              = {
+		.dma_mask = &audio_dmamask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+	}
+};
+EXPORT_SYMBOL(samsung_asoc_idma);
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index b61b8ee..54d4cd6 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -36,6 +36,7 @@ extern struct platform_device s3c64xx_device_spi0;
 extern struct platform_device s3c64xx_device_spi1;
 
 extern struct platform_device samsung_asoc_dma;
+extern struct platform_device samsung_asoc_idma;
 
 extern struct platform_device s3c64xx_device_pcm0;
 extern struct platform_device s3c64xx_device_pcm1;
-- 
1.7.1
