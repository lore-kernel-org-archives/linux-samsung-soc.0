From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH v2] ARM: Exynos: JPEG board definition and device register
Date: Tue, 31 Jan 2012 11:20:43 +0100
Message-ID: <1328005243-6072-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20923 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932Ab2AaKUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 05:20:49 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYN00LXSRENI130@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 10:20:47 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYN00EAUREM4I@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 10:20:47 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Add JPEG board definition and device register

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Dear All,

This patch adds board definition code and device registration code
for JPEG IP found in Exynos4 SoC.

It is exactly the same as the previous patch but with better coding style
compliance.

 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/clock.c               |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h    |    3 +++
 arch/arm/mach-exynos/mach-nuri.c           |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 arch/arm/plat-s5p/Kconfig                  |    5 +++++
 arch/arm/plat-samsung/devs.c               |   26 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h  |    1 +
 8 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index bd4600e..d8ab22f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -232,6 +232,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC3
 	select S5P_DEV_G2D
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
@@ -270,6 +271,7 @@ config MACH_NURI
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
index 5a8c42e..e5d446a 100644
--- a/arch/arm/mach-exynos/clock.c
+++ b/arch/arm/mach-exynos/clock.c
@@ -470,6 +470,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
+		.name           = "jpeg",
+		.id             = 0,
+		.enable         = exynos4_clk_ip_cam_ctrl,
+		.ctrlbit        = (1 << 6),
+	}, {
 		.name		= "fimc",
 		.devname	= "exynos4-fimc.0",
 		.enable		= exynos4_clk_ip_cam_ctrl,
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 7df9e74..5a9e656 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -31,6 +31,8 @@
 #define EXYNOS4_PA_FIMC2		0x11820000
 #define EXYNOS4_PA_FIMC3		0x11830000
 
+#define EXYNOS4_PA_JPEG			0x11840000
+
 #define EXYNOS4_PA_G2D			0x12800000
 
 #define EXYNOS4_PA_I2S0			0x03830000
@@ -164,6 +166,7 @@
 #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
 #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
 #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
+#define S5P_PA_JPEG			EXYNOS4_PA_JPEG
 #define S5P_PA_G2D			EXYNOS4_PA_G2D
 #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
 #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 165c876..adeb166 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1260,6 +1260,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&i2c9_gpio,
 	&s3c_device_adc,
 	&s5p_device_g2d,
+	&s5p_device_jpeg,
 	&s3c_device_rtc,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
@@ -1319,6 +1320,7 @@ static void __init nuri_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 
+	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index dd75101..4c6dd86 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -980,6 +980,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&universal_gpio_keys,
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
+	&s5p_device_jpeg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1045,6 +1046,7 @@ static void __init universal_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 
+	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e7fec78..7a30869 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -80,6 +80,11 @@ config S5P_DEV_FIMC3
 	help
 	  Compile in platform device definitions for FIMC controller 3
 
+config S5P_DEV_JPEG
+	bool
+	help
+	  Compile in platform device definitions for JPEG codec
+
 config S5P_DEV_G2D
 	bool
 	help
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 145580a..5590190 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -295,6 +295,32 @@ struct platform_device s5p_device_g2d = {
 };
 #endif /* CONFIG_S5P_DEV_G2D */
 
+#ifdef CONFIG_S5P_DEV_JPEG
+static struct resource s5p_jpeg_resource[] = {
+	[0] = {
+		.start	= S5P_PA_JPEG,
+		.end	= S5P_PA_JPEG + SZ_4K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_JPEG,
+		.end	= IRQ_JPEG,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_jpeg = {
+	.name		= "s5p-jpeg",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(s5p_jpeg_resource),
+	.resource	= s5p_jpeg_resource,
+	.dev		= {
+		.dma_mask		= &samsung_device_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+#endif /*  CONFIG_S5P_DEV_JPEG */
+
 /* FIMD0 */
 
 #ifdef CONFIG_S5P_DEV_FIMD0
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index bb45848..5e7972d 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -79,6 +79,7 @@ extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5p_device_fimc_md;
+extern struct platform_device s5p_device_jpeg;
 extern struct platform_device s5p_device_g2d;
 extern struct platform_device s5p_device_fimd0;
 extern struct platform_device s5p_device_hdmi;
-- 
1.7.0.4
