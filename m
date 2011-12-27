From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 1/3] s5p-g2d: add G2D to plat-s5p and mach-exynos4
Date: Tue, 27 Dec 2011 14:21:26 +0100
Message-ID: <1324992088-12037-2-git-send-email-k.debski@samsung.com>
References: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20629 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485Ab1L0NVj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 08:21:39 -0500
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LWV003NG6G11K@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:37 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LWV00IZX6G0ZL@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:37 +0000 (GMT)
In-reply-to: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com, sachin.kamat@linaro.org

G2D is a 2D graphics accelerator engine present in the s5p family
of Samsung SoCs. It is capable of bitblt and raster operations on
images having dimensions of up to 8000x8000.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h   |    3 +++
 arch/arm/plat-s5p/Kconfig                 |    5 +++++
 arch/arm/plat-samsung/devs.c              |   28 ++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 4 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index af30b95..9b7e0a1 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -31,6 +31,8 @@
 #define EXYNOS4_PA_FIMC2		0x11820000
 #define EXYNOS4_PA_FIMC3		0x11830000
 
+#define EXYNOS4_PA_G2D			0x12800000
+
 #define EXYNOS4_PA_I2S0			0x03830000
 #define EXYNOS4_PA_I2S1			0xE3100000
 #define EXYNOS4_PA_I2S2			0xE2A00000
@@ -165,6 +167,7 @@
 #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
 #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
 #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
+#define S5P_PA_G2D			EXYNOS4_PA_G2D
 #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
 #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
 #define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 9b9968f..6cafb23 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -79,6 +79,11 @@ config S5P_DEV_FIMC3
 	help
 	  Compile in platform device definitions for FIMC controller 3
 
+config S5P_DEV_G2D
+	bool
+	help
+	  Compile in platform device definitions for G2D device
+
 config S5P_DEV_FIMD0
 	bool
 	help
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index de0d88d..79db367 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -266,6 +266,34 @@ struct platform_device s5p_device_fimc3 = {
 };
 #endif /* CONFIG_S5P_DEV_FIMC3 */
 
+/* G2D */
+
+#ifdef CONFIG_S5P_DEV_G2D
+static struct resource s5p_g2d_resource[] = {
+	[0] = {
+		.start	= S5P_PA_G2D,
+		.end	= S5P_PA_G2D + SZ_4K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_2D,
+		.end	= IRQ_2D,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_g2d = {
+	.name		= "s5p-g2d",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(s5p_g2d_resource),
+	.resource	= s5p_g2d_resource,
+	.dev		= {
+		.dma_mask		= &samsung_device_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+#endif /* CONFIG_S5P_DEV_G2D */
+
 /* FIMD0 */
 
 #ifdef CONFIG_S5P_DEV_FIMD0
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 4214ea0..bb45848 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -79,6 +79,7 @@ extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5p_device_fimc_md;
+extern struct platform_device s5p_device_g2d;
 extern struct platform_device s5p_device_fimd0;
 extern struct platform_device s5p_device_hdmi;
 extern struct platform_device s5p_device_i2c_hdmiphy;
-- 
1.7.0.4
