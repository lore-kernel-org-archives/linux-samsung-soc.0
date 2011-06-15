From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 3/4] ARM: SAMSUNG: Add platform device for idma
Date: Wed, 15 Jun 2011 17:43:26 +0900
Message-ID: <1308127407-22458-4-git-send-email-sbkim73@samsung.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34632 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408Ab1FOItx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:49:53 -0400
In-Reply-To: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

Exynos4 and S5PC110(S5PV210) has Internal dma(idma) in AUDSS.
To support idma, register idma platform device.
and Exynos4 and S5PC110 has different IDMA address.
TO handle different IDMA address, register idma platform data

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-exynos4/dev-audio.c               |    2 ++
 arch/arm/mach-exynos4/include/mach/regs-audss.h |   18 ++++++++++++++++++
 arch/arm/mach-exynos4/mach-smdkv310.c           |    1 +
 arch/arm/mach-s5pv210/dev-audio.c               |    1 +
 arch/arm/mach-s5pv210/include/mach/regs-audss.h |   18 ++++++++++++++++++
 arch/arm/mach-s5pv210/mach-smdkv210.c           |    1 +
 arch/arm/plat-samsung/dev-asocdma.c             |   10 ++++++++++
 arch/arm/plat-samsung/include/plat/audio.h      |    1 +
 arch/arm/plat-samsung/include/plat/devs.h       |    1 +
 9 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/regs-audss.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-audss.h

diff --git a/arch/arm/mach-exynos4/dev-audio.c b/arch/arm/mach-exynos4/dev-audio.c
index 1eed5f9..215bfb5 100644
--- a/arch/arm/mach-exynos4/dev-audio.c
+++ b/arch/arm/mach-exynos4/dev-audio.c
@@ -21,6 +21,7 @@
 #include <mach/map.h>
 #include <mach/dma.h>
 #include <mach/irqs.h>
+#include <mach/regs-audss.h>
 
 static const char *rclksrc[] = {
 	[0] = "busclk",
@@ -55,6 +56,7 @@ static struct s3c_audio_pdata i2sv5_pdata = {
 			.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI
 					 | QUIRK_NEED_RSTCLR,
 			.src_clk = rclksrc,
+			.idma_addr = EXYNOS4_AUDSS_INT_MEM,
 		},
 	},
 };
diff --git a/arch/arm/mach-exynos4/include/mach/regs-audss.h b/arch/arm/mach-exynos4/include/mach/regs-audss.h
new file mode 100644
index 0000000..ca5a8b6
--- /dev/null
+++ b/arch/arm/mach-exynos4/include/mach/regs-audss.h
@@ -0,0 +1,18 @@
+/* arch/arm/mach-exynos4/include/mach/regs-audss.h
+ *
+ * Copyright (c) 2011 Samsung Electronics
+ *		http://www.samsung.com
+ *
+ * Exynos4 Audio SubSystem clock register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __PLAT_REGS_AUDSS_H
+#define __PLAT_REGS_AUDSS_H __FILE__
+
+#define EXYNOS4_AUDSS_INT_MEM	(0x03000000)
+
+#endif /* _PLAT_REGS_AUDSS_H */
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
 
diff --git a/arch/arm/mach-s5pv210/dev-audio.c b/arch/arm/mach-s5pv210/dev-audio.c
index 8d58f19..0be95f1 100644
--- a/arch/arm/mach-s5pv210/dev-audio.c
+++ b/arch/arm/mach-s5pv210/dev-audio.c
@@ -52,6 +52,7 @@ static struct s3c_audio_pdata i2sv5_pdata = {
 			.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI
 					 | QUIRK_NEED_RSTCLR,
 			.src_clk = rclksrc,
+			.idma_addr = S5PV210_AUDSS_INT_MEM,
 		},
 	},
 };
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-audss.h b/arch/arm/mach-s5pv210/include/mach/regs-audss.h
new file mode 100644
index 0000000..eacc1f7
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/regs-audss.h
@@ -0,0 +1,18 @@
+/* arch/arm/mach-s5pv210/include/mach/regs-audss.h
+ *
+ * Copyright (c) 2011 Samsung Electronics
+ *		http://www.samsung.com
+ *
+ * S5PV210 Audio SubSystem clock register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __PLAT_REGS_AUDSS_H
+#define __PLAT_REGS_AUDSS_H __FILE__
+
+#define S5PV210_AUDSS_INT_MEM	(0xC0000000)
+
+#endif /* _PLAT_REGS_AUDSS_H */
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
diff --git a/arch/arm/plat-samsung/include/plat/audio.h b/arch/arm/plat-samsung/include/plat/audio.h
index a0826ed..aa9875f 100644
--- a/arch/arm/plat-samsung/include/plat/audio.h
+++ b/arch/arm/plat-samsung/include/plat/audio.h
@@ -44,6 +44,7 @@ struct samsung_i2s {
 	 * Also corresponds to clocks of I2SMOD[10]
 	 */
 	const char **src_clk;
+	dma_addr_t idma_addr;
 };
 
 /**
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
