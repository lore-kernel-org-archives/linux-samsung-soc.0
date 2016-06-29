From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 2/6] ASoC: samsung: Add Samsung Low Power Audio Subsystem
 driver
Date: Wed, 29 Jun 2016 13:26:35 +0200
Message-ID: <1467199599-6892-3-git-send-email-s.nawrocki@samsung.com>
References: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37363 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872AbcF2L2d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 07:28:33 -0400
In-reply-to: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Beomho Seo <beomho.seo@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Inha Song <ideal.song@samsung.com>

This patch adds LPASS driver. The LPASS (Low Power Audio Subsystem)
is a special subsystem that supports audio playback with low power
consumption. This is a minimal driver which prepares resources for
IP blocks like I2S, audio DMA and UART.
Also system power ops are added to ensure the Audio Subsystem is
operational after system suspend/resume cycle.

Signed-off-by: Inha Song <ideal.song@samsung.com>
Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes since v2:
 - move misplaced SND_SAMSUNG_AUDSS Kconfig symbol addition
   to this patch.
---
 sound/soc/samsung/Kconfig  |   3 +
 sound/soc/samsung/Makefile |   2 +
 sound/soc/samsung/lpass.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/samsung/lpass.h  |  47 +++++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 sound/soc/samsung/lpass.c
 create mode 100644 sound/soc/samsung/lpass.h

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 7b722b0..f8f23f2 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -31,6 +31,9 @@ config SND_SAMSUNG_SPDIF
 config SND_SAMSUNG_I2S
 	tristate
 
+config SND_SAMSUNG_AUDSS
+	tristate
+
 config SND_SOC_SAMSUNG_NEO1973_WM8753
 	tristate "Audio support for Openmoko Neo1973 Smartphones (GTA02)"
 	depends on SND_SOC_SAMSUNG && MACH_NEO1973_GTA02
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 5d03f5c..2b919d5 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -8,6 +8,7 @@ snd-soc-s3c-i2s-v2-objs := s3c-i2s-v2.o
 snd-soc-samsung-spdif-objs := spdif.o
 snd-soc-pcm-objs := pcm.o
 snd-soc-i2s-objs := i2s.o
+snd-soc-lpass-objs := lpass.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG) += snd-soc-s3c-dma.o
 obj-$(CONFIG_SND_S3C24XX_I2S) += snd-soc-s3c24xx-i2s.o
@@ -18,6 +19,7 @@ obj-$(CONFIG_SND_SAMSUNG_SPDIF) += snd-soc-samsung-spdif.o
 obj-$(CONFIG_SND_SAMSUNG_PCM) += snd-soc-pcm.o
 obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-i2s.o
 obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-idma.o
+obj-$(CONFIG_SND_SAMSUNG_AUDSS) += snd-soc-lpass.o
 
 # S3C24XX Machine Support
 snd-soc-jive-wm8750-objs := jive_wm8750.o
diff --git a/sound/soc/samsung/lpass.c b/sound/soc/samsung/lpass.c
new file mode 100644
index 0000000..57198cf
--- /dev/null
+++ b/sound/soc/samsung/lpass.c
@@ -0,0 +1,162 @@
+/*
+ * Copyright (C) 2015 - 2016 Samsung Electronics Co., Ltd.
+ * 	Inha Song <ideal.song@samsung.com>
+ *
+ * Low Power Audio Subsystem driver for Samsung Exynos
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include "lpass.h"
+
+#define EXYNOS5433_PAD_RETENTION_AUD_OPTION_OFFSET	0x3028
+#define EXYNOS5433_INITIATE_WAKEUP_FROM_LOWPWR_MASK	BIT(28)
+
+struct lpass_info {
+	struct platform_device	*pdev;
+	void __iomem		*reg_sfr;
+	struct regmap		*reg_pmu;
+};
+
+static void lpass_core_sw_reset(struct lpass_info *lpass, int bit)
+{
+	unsigned int val;
+
+	val = readl(lpass->reg_sfr + SFR_LPASS_CORE_SW_RESET);
+
+	val &= ~(1 << bit);
+	writel(val, lpass->reg_sfr + SFR_LPASS_CORE_SW_RESET);
+
+	udelay(100);
+
+	val |= 1 << bit;
+	writel(val, lpass->reg_sfr + SFR_LPASS_CORE_SW_RESET);
+}
+
+static void lpass_enable(struct lpass_info *lpass)
+{
+	if (!lpass->reg_pmu)
+		return;
+
+	/* Unmasks SFR, DMA, I2S Interrupt */
+	writel(LPASS_INTR_SFR | LPASS_INTR_DMA | LPASS_INTR_I2S,
+	       lpass->reg_sfr + SFR_LPASS_INTR_CA5_MASK);
+
+	writel(LPASS_INTR_DMA | LPASS_INTR_I2S | LPASS_INTR_SFR
+			| LPASS_INTR_UART,
+	       lpass->reg_sfr + SFR_LPASS_INTR_CPU_MASK);
+
+	/* Activate related PADs from retention state */
+	regmap_write(lpass->reg_pmu,
+		     EXYNOS5433_PAD_RETENTION_AUD_OPTION_OFFSET,
+		     EXYNOS5433_INITIATE_WAKEUP_FROM_LOWPWR_MASK);
+
+	lpass_core_sw_reset(lpass, SW_RESET_I2S);
+	lpass_core_sw_reset(lpass, SW_RESET_DMA);
+	lpass_core_sw_reset(lpass, SW_RESET_MEM);
+}
+
+static void lpass_disable(struct lpass_info *lpass)
+{
+	if (!lpass->reg_pmu)
+		return;
+
+	/* Masks SFR, DMA, I2S Interrupt */
+	writel(0, lpass->reg_sfr + SFR_LPASS_INTR_CA5_MASK);
+
+	writel(0, lpass->reg_sfr + SFR_LPASS_INTR_CPU_MASK);
+
+	/* Deactivate related PADs from retention state */
+	regmap_write(lpass->reg_pmu,
+		     EXYNOS5433_PAD_RETENTION_AUD_OPTION_OFFSET, 0);
+}
+
+static int lpass_probe(struct platform_device *pdev)
+{
+	struct lpass_info *lpass;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	if (!dev->of_node) {
+		dev_err(dev, "Failed to get DT node\n");
+		return -ENODEV;
+	}
+
+	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
+	if (!lpass)
+		return -ENOMEM;
+
+	lpass->pdev = pdev;
+	platform_set_drvdata(pdev, lpass);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	lpass->reg_sfr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(lpass->reg_sfr))
+		return PTR_ERR(lpass->reg_sfr);
+
+	lpass->reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,pmu-syscon");
+	if (IS_ERR(lpass->reg_pmu)) {
+		dev_err(dev, "Failed to lookup PMU regmap\n");
+		return PTR_ERR(lpass->reg_pmu);
+	}
+
+	lpass_enable(lpass);
+
+	return 0;
+}
+
+static int lpass_suspend(struct device *dev)
+{
+	struct lpass_info *lpass = dev_get_drvdata(dev);
+
+	lpass_disable(lpass);
+
+	return 0;
+}
+
+static int lpass_resume(struct device *dev)
+{
+	struct lpass_info *lpass = dev_get_drvdata(dev);
+
+	lpass_enable(lpass);
+
+	return 0;
+}
+
+static const struct of_device_id lpass_of_match[] = {
+	{ .compatible	= "samsung,exynos5433-lpass", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lpass_of_match);
+
+static const struct dev_pm_ops lpass_pm_ops = {
+	.suspend	= lpass_suspend,
+	.resume		= lpass_resume,
+};
+
+static struct platform_driver lpass_driver = {
+	.driver = {
+		.name		= "samsung-lpass",
+		.pm		= &lpass_pm_ops,
+		.of_match_table	= lpass_of_match,
+	},
+	.probe	= lpass_probe,
+};
+
+module_platform_driver(lpass_driver);
+
+MODULE_AUTHOR("Inha Song <ideal.song@samsung.com>");
+MODULE_DESCRIPTION("Samsung Low Power Audio Subsystem (LPASS) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/samsung/lpass.h b/sound/soc/samsung/lpass.h
new file mode 100644
index 0000000..59179d6
--- /dev/null
+++ b/sound/soc/samsung/lpass.h
@@ -0,0 +1,47 @@
+/*
+ * Copyright (C) 2015 - 2016 Samsung Electronics Co., Ltd.
+ *	Inha Song <ideal.song@samsung.com>
+ *
+ * Low Power Audio Subsystem driver for Samsung Exynos
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+#ifndef SND_SOC_SAMSUNG_LPASS_H_
+#define SND_SOC_SAMSUNG_LPASS_H_
+
+/* SFR */
+#define SFR_LPASS_CORE_SW_RESET	(0x08)
+#define SFR_LPASS_INTR_CA5_MASK	(0x48)
+#define SFR_LPASS_INTR_CPU_MASK	(0x58)
+
+/* SW_RESET */
+#define LPASS_SW_RESET_CA5	(1 << 0)
+#define LPASS_SW_RESET_SB	(1 << 11)
+
+/* Interrupt mask */
+#define LPASS_INTR_APM		(1 << 9)
+#define LPASS_INTR_MIF		(1 << 8)
+#define LPASS_INTR_TIMER	(1 << 7)
+#define LPASS_INTR_DMA		(1 << 6)
+#define LPASS_INTR_GPIO		(1 << 5)
+#define LPASS_INTR_I2S		(1 << 4)
+#define LPASS_INTR_PCM		(1 << 3)
+#define LPASS_INTR_SB		(1 << 2)
+#define LPASS_INTR_UART		(1 << 1)
+#define LPASS_INTR_SFR		(1 << 0)
+
+/* SW Reset bit */
+enum {
+	SW_RESET_DMA = 0,
+	SW_RESET_MEM,
+	SW_RESET_TIMER,
+	SW_RESET_I2S = 8,
+	SW_RESET_PCM,
+	SW_RESET_UART,
+	SW_RESET_SLIMBUS,
+};
+
+#endif /* SND_SOC_SAMSUNG_LPASS_H_ */
-- 
1.9.1
