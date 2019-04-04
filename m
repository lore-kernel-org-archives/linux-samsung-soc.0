From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 2/8] soc: samsung: Exynos chipid driver update
Date: Thu, 04 Apr 2019 19:17:29 +0200
Message-ID: <20190404171735.12815-3-s.nawrocki@samsung.com>
References: <20190404171735.12815-1-s.nawrocki@samsung.com>
        <CGME20190404172229epcas2p25a819e37035b26ccf53613e880bdcacf@epcas2p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190404171735.12815-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds definition of selected CHIP ID register offsets
and register bit field definitions for Exynos5422 SoC.

exynos_chipid_read() helper function is added to allow reading
the CHIP ID block registers.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/exynos-chipid.c | 16 +++++-----
 drivers/soc/samsung/exynos-chipid.h | 48 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 7 deletions(-)
 create mode 100644 drivers/soc/samsung/exynos-chipid.h

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5cb018807817..4920f0ef2c55 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -16,10 +16,7 @@
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
-#define EXYNOS_SUBREV_MASK	(0xF << 4)
-#define EXYNOS_MAINREV_MASK	(0xF << 0)
-#define EXYNOS_REV_MASK		(EXYNOS_SUBREV_MASK | EXYNOS_MAINREV_MASK)
-#define EXYNOS_MASK		0xFFFFF000
+#include "exynos-chipid.h"
 
 static const struct exynos_soc_id {
 	const char *name;
@@ -40,6 +37,13 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5433", 0xE5433000 },
 };
 
+static void __iomem *exynos_chipid_base;
+
+unsigned int exynos_chipid_read(unsigned int offset)
+{
+	return readl_relaxed(exynos_chipid_base + offset);
+}
+
 static const char * __init product_id_to_soc_id(unsigned int product_id)
 {
 	int i;
@@ -53,7 +57,6 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
 int __init exynos_chipid_early_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
-	void __iomem *exynos_chipid_base;
 	struct soc_device *soc_dev;
 	struct device_node *root;
 	struct device_node *np;
@@ -73,9 +76,8 @@ int __init exynos_chipid_early_init(void)
 		return -ENXIO;
 	}
 
-	product_id = readl_relaxed(exynos_chipid_base);
+	product_id = exynos_chipid_read(EXYNOS_CHIPID_REG_PRO_ID);
 	revision = product_id & EXYNOS_REV_MASK;
-	iounmap(exynos_chipid_base);
 
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
diff --git a/drivers/soc/samsung/exynos-chipid.h b/drivers/soc/samsung/exynos-chipid.h
new file mode 100644
index 000000000000..826a12c25fa2
--- /dev/null
+++ b/drivers/soc/samsung/exynos-chipid.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Samsung Electronics Co., Ltd.
+ *	      http://www.samsung.com/
+ *
+ * EXYNOS - CHIP ID support
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
+#define EXYNOS_CHIPID_AUX_INFO		0x1c
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
+
+unsigned int exynos_chipid_read(unsigned int offset);
-- 
2.17.1
