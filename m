From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/7] clk: exynos5440: add common clock support for Samsung EXYNOS5440
Date: Sat, 27 Oct 2012 02:55:49 +0900
Message-ID: <1351274153-3120-3-git-send-email-kgene.kim@samsung.com>
References: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:38014 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965545Ab2JZR40 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 13:56:26 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so2930010pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Oct 2012 10:56:26 -0700 (PDT)
In-Reply-To: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.abraham@linaro.org>

This patch adds clock controller configuration support based on common
clock framework for Samsung EXYNOS5440.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/clk/samsung/Makefile         |    1 +
 drivers/clk/samsung/clk-exynos5440.c |   66 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-exynos5440.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 69487f7..27aab2c 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -4,3 +4,4 @@
 
 obj-$(CONFIG_PLAT_SAMSUNG)	+= clk.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
+obj-$(CONFIG_SOC_EXYNOS5440)	+= clk-exynos5440.o
diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
new file mode 100644
index 0000000..da3b918
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -0,0 +1,66 @@
+/*
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/io.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#include "clk.h"
+
+static void __iomem *clk_base;
+
+/* register a fixed factor clock type instantiated from device tree */
+void __init samsung_of_clk_register_fixed_factor(struct device_node *np)
+{
+	struct clk *clk;
+	const char *clk_name = np->name;
+	const char *parent_name;
+	u32 mul = 1, div = 1;
+
+	of_property_read_string(np, "clock-output-names", &clk_name);
+	parent_name = of_clk_get_parent_name(np, 0);
+	of_property_read_u32(np, "clock-fixed-factor-mul", &mul);
+	of_property_read_u32(np, "clock-fixed-factor-div", &div);
+
+	clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
+					mul, div);
+	if (clk)
+		of_clk_add_provider(np, of_clk_src_simple_get, clk);
+}
+
+static const __initconst struct of_device_id clk_match[] = {
+	{ .compatible = "fixed-clock",
+		.data = of_fixed_clk_setup, },
+	{ .compatible = "samsung,clock-gate",
+		.data = samsung_of_clk_register_gate, },
+	{ .compatible = "samsung,fixed-factor-clock",
+		.data = samsung_of_clk_register_fixed_factor, },
+	{},
+};
+
+void __init exynos5440_of_clk_init(void)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-xmu");
+	if (!np) {
+		pr_err("%s: clock controller node not found\n", __func__);
+		return;
+	}
+
+	clk_base = of_iomap(np, 0);
+	WARN(!clk_base, "unable to map clocks registers\n");
+
+	samsung_clk_set_ctrl_base(clk_base);
+	of_clk_init(clk_match);
+}
+
+arch_initcall(exynos5440_of_clk_init);
-- 
1.7.4.4
