From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/9] soc: samsung: Convert exynos-chipid driver to use
 the regmap API
Date: Thu, 18 Jul 2019 16:30:37 +0200
Message-ID: <20190718143044.25066-3-s.nawrocki@samsung.com>
References: <20190718143044.25066-1-s.nawrocki@samsung.com>
        <CGME20190718143128eucas1p2677ae16d229dddcd9a0db8084f0da5cf@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718143044.25066-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Convert the driver to use regmap API in order to allow other
drivers, like ASV, to access the CHIPID registers.

This patch adds definition of selected CHIPID register offsets
and register bit fields for Exynos5422 SoC.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1 (RFC):
 - new patch
---
 drivers/soc/samsung/exynos-chipid.c       | 33 ++++++----------
 include/linux/soc/samsung/exynos-chipid.h | 48 +++++++++++++++++++++++
 2 files changed, 61 insertions(+), 20 deletions(-)
 create mode 100644 include/linux/soc/samsung/exynos-chipid.h

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 78b123ee60c0..594b00488013 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -9,18 +9,16 @@
  */
 
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/soc/samsung/exynos-chipid.h>
 #include <linux/sys_soc.h>
 
-#define EXYNOS_SUBREV_MASK	(0xF << 4)
-#define EXYNOS_MAINREV_MASK	(0xF << 0)
-#define EXYNOS_REV_MASK		(EXYNOS_SUBREV_MASK | EXYNOS_MAINREV_MASK)
-#define EXYNOS_MASK		0xFFFFF000
-
 static const struct exynos_soc_id {
 	const char *name;
 	unsigned int id;
@@ -53,29 +51,24 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
 int __init exynos_chipid_early_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
-	void __iomem *exynos_chipid_base;
 	struct soc_device *soc_dev;
 	struct device_node *root;
-	struct device_node *np;
+	struct regmap *regmap;
 	u32 product_id;
 	u32 revision;
+	int ret;
 
-	/* look up for chipid node */
-	np = of_find_compatible_node(NULL, NULL, "samsung,exynos4210-chipid");
-	if (!np)
-		return -ENODEV;
-
-	exynos_chipid_base = of_iomap(np, 0);
-	of_node_put(np);
-
-	if (!exynos_chipid_base) {
-		pr_err("Failed to map SoC chipid\n");
-		return -ENXIO;
+	regmap = syscon_regmap_lookup_by_compatible("samsung,exynos4210-chipid");
+	if (IS_ERR(regmap)) {
+		pr_err("%s: failed to get regmap\n", __func__);
+		return PTR_ERR(regmap);
 	}
 
-	product_id = readl_relaxed(exynos_chipid_base);
+	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
+	if (ret < 0)
+		return ret;
+
 	revision = product_id & EXYNOS_REV_MASK;
-	iounmap(exynos_chipid_base);
 
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
new file mode 100644
index 000000000000..25359d70d617
--- /dev/null
+++ b/include/linux/soc/samsung/exynos-chipid.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 Samsung Electronics Co., Ltd.
+ *	      http://www.samsung.com/
+ *
+ * Exynos - CHIPID support
+ */
+
+#define EXYNOS_CHIPID_REG_PRO_ID	0x00
+ #define EXYNOS_SUBREV_MASK		(0xf << 4)
+ #define EXYNOS_MAINREV_MASK		(0xf << 0)
+ #define EXYNOS_REV_MASK		(EXYNOS_SUBREV_MASK | \
+					 EXYNOS_MAINREV_MASK)
+ #define EXYNOS_MASK			0xfffff000
+
+#define EXYNOS_CHIPID_REG_PKG_ID	0x04
+/* Bit field definitions for EXYNOS_CHIPID_REG_PKG_ID register */
+ #define EXYNOS5422_IDS_OFFSET		24
+ #define EXYNOS5422_IDS_MASK		0xff
+ #define EXYNOS5422_USESG_OFFSET	3
+ #define EXYNOS5422_USESG_MASK		0x01
+ #define EXYNOS5422_SG_OFFSET		0
+ #define EXYNOS5422_SG_MASK		0x07
+ #define EXYNOS5422_TABLE_OFFSET	8
+ #define EXYNOS5422_TABLE_MASK		0x03
+ #define EXYNOS5422_SG_A_OFFSET		17
+ #define EXYNOS5422_SG_A_MASK		0x0f
+ #define EXYNOS5422_SG_B_OFFSET		21
+ #define EXYNOS5422_SG_B_MASK		0x03
+ #define EXYNOS5422_SG_BSIGN_OFFSET	23
+ #define EXYNOS5422_SG_BSIGN_MASK	0x01
+ #define EXYNOS5422_BIN2_OFFSET		12
+ #define EXYNOS5422_BIN2_MASK		0x01
+
+#define EXYNOS_CHIPID_REG_LOT_ID	0x14
+
+#define EXYNOS_CHIPID_REG_AUX_INFO	0x1c
+/* Bit field definitions for EXYNOS_CHIPID_REG_AUX_INFO register */
+ #define EXYNOS5422_TMCB_OFFSET		0
+ #define EXYNOS5422_TMCB_MASK		0x7f
+ #define EXYNOS5422_ARM_UP_OFFSET	8
+ #define EXYNOS5422_ARM_UP_MASK		0x03
+ #define EXYNOS5422_ARM_DN_OFFSET	10
+ #define EXYNOS5422_ARM_DN_MASK		0x03
+ #define EXYNOS5422_KFC_UP_OFFSET	12
+ #define EXYNOS5422_KFC_UP_MASK		0x03
+ #define EXYNOS5422_KFC_DN_OFFSET	14
+ #define EXYNOS5422_KFC_DN_MASK		0x03
-- 
2.17.1
