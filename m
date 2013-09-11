From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [RFC 2/4] power: asv: Add a common asv driver for exynos SoCs.
Date: Wed, 11 Sep 2013 16:44:06 +0530
Message-ID: <1378898048-25205-3-git-send-email-yadi.brar@samsung.com>
References: <1378898048-25205-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1378898048-25205-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a common platform driver to register ASV members for exynos
SoCs.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/power/asv/Kconfig      |   13 +++++++
 drivers/power/asv/Makefile     |    1 +
 drivers/power/asv/exynos-asv.c |   72 ++++++++++++++++++++++++++++++++++++++++
 drivers/power/asv/exynos-asv.h |   21 +++++++++++
 4 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 drivers/power/asv/exynos-asv.c
 create mode 100644 drivers/power/asv/exynos-asv.h

diff --git a/drivers/power/asv/Kconfig b/drivers/power/asv/Kconfig
index 7cd84bd..6104b09 100644
--- a/drivers/power/asv/Kconfig
+++ b/drivers/power/asv/Kconfig
@@ -9,3 +9,16 @@ menuconfig POWER_ASV
 	  manufacturing process.
 
 	  Say Y here to enable Adaptive Supply voltage support.
+
+if POWER_ASV
+
+config POWER_EXYNOS_ASV
+	bool "Adaptive Supply Voltage for Exynos"
+	help
+	  Exynos supports ASV depending upon the ASV group fused on chip.
+	  Users can request ASV specific to a frequency for a particular member
+	  from corresponding DVFS driver.
+
+	  Say Y here to enable Exynos Adaptive Voltage Scaling.
+
+endif
diff --git a/drivers/power/asv/Makefile b/drivers/power/asv/Makefile
index 62921da..9a94868 100644
--- a/drivers/power/asv/Makefile
+++ b/drivers/power/asv/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_POWER_ASV)			+= asv.o
+obj-$(CONFIG_POWER_EXYNOS_ASV)		+= exynos-asv.o
diff --git a/drivers/power/asv/exynos-asv.c b/drivers/power/asv/exynos-asv.c
new file mode 100644
index 0000000..d3f43a4
--- /dev/null
+++ b/drivers/power/asv/exynos-asv.c
@@ -0,0 +1,72 @@
+/* Common Exynos ASV(Adaptive Supply Voltage) driver
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power/asv-driver.h>
+#include "exynos-asv.h"
+
+static int exynos_asv_probe(struct platform_device *pdev)
+{
+	struct device_node *chip_id;
+	struct exynos_asv_common *exynos_asv_info;
+	void __iomem *base;
+	int ret = 0;
+
+	exynos_asv_info = kzalloc(sizeof(struct exynos_asv_common), GFP_KERNEL);
+	if (!exynos_asv_info)
+		return -ENOMEM;
+
+	chip_id = of_find_compatible_node(NULL, NULL,
+						"samsung,exynos4210-chipid");
+	if (!chip_id) {
+		pr_err("%s: unable to find chipid\n", __func__);
+		ret = -ENODEV;
+		goto err_node;
+	}
+
+	base = of_iomap(chip_id, 0);
+	if (!base) {
+		pr_err("%s: unable to map chip_id register\n", __func__);
+		ret = -ENOMEM;
+		goto err_map;
+	}
+
+	exynos_asv_info->base = base;
+
+	/* call SoC specific intialisation routine */
+
+	register_asv_member(exynos_asv_info->asv_list, exynos_asv_info->nr_mem);
+
+	iounmap(base);
+err_map:
+	of_node_put(chip_id);
+err_node:
+	kfree(exynos_asv_info);
+
+	return ret;
+}
+
+static struct platform_driver exynos_asv_platdrv = {
+	.driver = {
+		.name	= "exynos-asv",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= exynos_asv_probe,
+};
+module_platform_driver(exynos_asv_platdrv);
+
+MODULE_AUTHOR("Yadwinder Singh Brar<yadi.brar@samsung.com>");
+MODULE_DESCRIPTION("Common Exynos ASV driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/power/asv/exynos-asv.h b/drivers/power/asv/exynos-asv.h
new file mode 100644
index 0000000..89a1ae8
--- /dev/null
+++ b/drivers/power/asv/exynos-asv.h
@@ -0,0 +1,21 @@
+/*
+ * Exynos - Adaptive Supply Voltage Driver Header File
+ *
+ * copyright (c) 2013 samsung electronics co., ltd.
+ *		http://www.samsung.com/
+ *
+ * this program is free software; you can redistribute it and/or modify
+ * it under the terms of the gnu general public license version 2 as
+ * published by the free software foundation.
+*/
+
+#ifndef __EXYNOS_ASV_D_H
+#define __EXYNOS_ASV_D_H __FILE__
+
+struct exynos_asv_common {
+	struct asv_info *asv_list;
+	unsigned int nr_mem;
+	void __iomem *base;
+};
+
+#endif	/* __EXYNOS_ASV_D_H */
-- 
1.7.0.4
