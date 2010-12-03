From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 1/2] ARM: SAMSUNG: Add support for Power Domain control
Date: Fri,  3 Dec 2010 18:39:43 +0900
Message-ID: <1291369184-31460-2-git-send-email-kgene.kim@samsung.com>
References: <1291369184-31460-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58965 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932303Ab0LCJxY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 04:53:24 -0500
In-Reply-To: <1291369184-31460-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

This patch implements Power Domain control based on Runtime PM framework.
Each Power Domain is represented by a Power Domain device and the devices
belong to these Power Domains should be set as a child device of the Power
Domain devices. The corresponding drivers of the devices should implement
Runtime PM to control the Power Domains.

Signed-off-by: Changhwan Youn <chaos.youn at samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/Kconfig           |    8 +++
 arch/arm/plat-samsung/Makefile          |    4 +
 arch/arm/plat-samsung/include/plat/pd.h |   30 ++++++++++
 arch/arm/plat-samsung/pd.c              |   95 +++++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/pd.h
 create mode 100644 arch/arm/plat-samsung/pd.c

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index dcd6eff..2ebf415 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -333,4 +333,12 @@ config SAMSUNG_WAKEMASK
 	  and above. This code allows a set of interrupt to wakeup-mask
 	  mappings. See <plat/wakeup-mask.h>
 
+comment "Power Domain"
+
+config SAMSUNG_PD
+	bool "Samsung Power Domain"
+	depends on PM_RUNTIME
+	help
+	  Say Y here if you want to control Power Domain by Runtime PM.
+
 endif
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index afcce47..09dbd78 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -73,6 +73,10 @@ obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
+# PD support
+
+obj-$(CONFIG_SAMSUNG_PD)	+= pd.o
+
 # PWM support
 
 obj-$(CONFIG_HAVE_PWM)		+= pwm.o
diff --git a/arch/arm/plat-samsung/include/plat/pd.h b/arch/arm/plat-samsung/include/plat/pd.h
new file mode 100644
index 0000000..5f0ad85
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/pd.h
@@ -0,0 +1,30 @@
+/* linux/arch/arm/plat-samsung/include/plat/pd.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_SAMSUNG_PD_H
+#define __ASM_PLAT_SAMSUNG_PD_H __FILE__
+
+struct samsung_pd_info {
+	int (*enable)(struct device *dev);
+	int (*disable)(struct device *dev);
+	void __iomem *base;
+};
+
+enum s5pv310_pd_block {
+	PD_MFC,
+	PD_G3D,
+	PD_LCD0,
+	PD_LCD1,
+	PD_TV,
+	PD_CAM,
+	PD_GPS
+};
+
+#endif /* __ASM_PLAT_SAMSUNG_PD_H */
diff --git a/arch/arm/plat-samsung/pd.c b/arch/arm/plat-samsung/pd.c
new file mode 100644
index 0000000..efe1d56
--- /dev/null
+++ b/arch/arm/plat-samsung/pd.c
@@ -0,0 +1,95 @@
+/* linux/arch/arm/plat-samsung/pd.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Samsung Power domain support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/pm_runtime.h>
+
+#include <plat/pd.h>
+
+static int samsung_pd_probe(struct platform_device *pdev)
+{
+	struct samsung_pd_info *pdata = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+
+	if (!pdata) {
+		dev_err(dev, "no device data specified\n");
+		return -ENOENT;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	dev_info(dev, "power domain registered\n");
+	return 0;
+}
+
+static int __devexit samsung_pd_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	return 0;
+}
+
+static int samsung_pd_runtime_suspend(struct device *dev)
+{
+	struct samsung_pd_info *pdata = dev->platform_data;
+	int ret = 0;
+
+	if (pdata->disable)
+		ret = pdata->disable(dev);
+
+	dev_dbg(dev, "suspended\n");
+	return ret;
+}
+
+static int samsung_pd_runtime_resume(struct device *dev)
+{
+	struct samsung_pd_info *pdata = dev->platform_data;
+	int ret = 0;
+
+	if (pdata->enable)
+		ret = pdata->enable(dev);
+
+	dev_dbg(dev, "resumed\n");
+	return ret;
+}
+
+static const struct dev_pm_ops samsung_pd_pm_ops = {
+	.runtime_suspend	= samsung_pd_runtime_suspend,
+	.runtime_resume		= samsung_pd_runtime_resume,
+};
+
+static struct platform_driver samsung_pd_driver = {
+	.driver		= {
+		.name		= "samsung-pd",
+		.owner		= THIS_MODULE,
+		.pm		= &samsung_pd_pm_ops,
+	},
+	.probe		= samsung_pd_probe,
+	.remove		= __devexit_p(samsung_pd_remove),
+};
+
+static int __init samsung_pd_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&samsung_pd_driver);
+	if (ret)
+		printk(KERN_ERR "%s: failed to add PD driver\n", __func__);
+
+	return ret;
+}
+arch_initcall(samsung_pd_init);
-- 
1.6.2.5
