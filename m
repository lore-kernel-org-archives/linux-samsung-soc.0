From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/9] soc: samsung: Add exynos chipid driver support
Date: Thu, 18 Jul 2019 16:30:36 +0200
Message-ID: <20190718143044.25066-2-s.nawrocki@samsung.com>
References: <20190718143044.25066-1-s.nawrocki@samsung.com>
 <CGME20190718143127eucas1p13b1e2c98d270140a87f09562ef46c9a3@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190718143044.25066-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, vireshk@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Pankaj Dubey <pankaj.dubey@samsung.com>

Exynos SoCs have Chipid, for identification of product IDs and SoC
revisions. This patch intends to provide initialization code for all
these functionalities, at the same time it provides some sysfs entries
for accessing these information to user-space.

This driver uses existing binding for exynos-chipid.

Changes by Bartlomiej:
- fixed return values on errors
- removed bogus kfree_const()
- added missing Exynos4210 EVT0 id
- converted code to use EXYNOS_MASK define
- fixed np use after of_node_put()
- fixed too early use of dev_info()
- made driver fail for unknown SoC-s
- added SPDX tag
- updated Copyrights

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
[m.szyprowski: for suggestion and code snippet of product_id_to_soc_id]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
[s.nawrocki: updated copyright date]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/Kconfig         |   5 ++
 drivers/soc/samsung/Makefile        |   2 +
 drivers/soc/samsung/exynos-chipid.c | 111 ++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/soc/samsung/exynos-chipid.c

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 2186285fda92..2905f5262197 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -7,6 +7,11 @@ menuconfig SOC_SAMSUNG
 
 if SOC_SAMSUNG
 
+config EXYNOS_CHIPID
+	bool "Exynos Chipid controller driver" if COMPILE_TEST
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	select SOC_BUS
+
 config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 29f294baac6e..3b6a8797416c 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
new file mode 100644
index 000000000000..78b123ee60c0
--- /dev/null
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Samsung Electronics Co., Ltd.
+ *	      http://www.samsung.com/
+ *
+ * EXYNOS - CHIP ID support
+ * Author: Pankaj Dubey <pankaj.dubey@samsung.com>
+ * Author: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#define EXYNOS_SUBREV_MASK	(0xF << 4)
+#define EXYNOS_MAINREV_MASK	(0xF << 0)
+#define EXYNOS_REV_MASK		(EXYNOS_SUBREV_MASK | EXYNOS_MAINREV_MASK)
+#define EXYNOS_MASK		0xFFFFF000
+
+static const struct exynos_soc_id {
+	const char *name;
+	unsigned int id;
+} soc_ids[] = {
+	{ "EXYNOS3250", 0xE3472000 },
+	{ "EXYNOS4210", 0x43200000 },	/* EVT0 revision */
+	{ "EXYNOS4210", 0x43210000 },
+	{ "EXYNOS4212", 0x43220000 },
+	{ "EXYNOS4412", 0xE4412000 },
+	{ "EXYNOS5250", 0x43520000 },
+	{ "EXYNOS5260", 0xE5260000 },
+	{ "EXYNOS5410", 0xE5410000 },
+	{ "EXYNOS5420", 0xE5420000 },
+	{ "EXYNOS5440", 0xE5440000 },
+	{ "EXYNOS5800", 0xE5422000 },
+	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS5433", 0xE5433000 },
+};
+
+static const char * __init product_id_to_soc_id(unsigned int product_id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(soc_ids); i++)
+		if ((product_id & EXYNOS_MASK) == soc_ids[i].id)
+			return soc_ids[i].name;
+	return NULL;
+}
+
+int __init exynos_chipid_early_init(void)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	void __iomem *exynos_chipid_base;
+	struct soc_device *soc_dev;
+	struct device_node *root;
+	struct device_node *np;
+	u32 product_id;
+	u32 revision;
+
+	/* look up for chipid node */
+	np = of_find_compatible_node(NULL, NULL, "samsung,exynos4210-chipid");
+	if (!np)
+		return -ENODEV;
+
+	exynos_chipid_base = of_iomap(np, 0);
+	of_node_put(np);
+
+	if (!exynos_chipid_base) {
+		pr_err("Failed to map SoC chipid\n");
+		return -ENXIO;
+	}
+
+	product_id = readl_relaxed(exynos_chipid_base);
+	revision = product_id & EXYNOS_REV_MASK;
+	iounmap(exynos_chipid_base);
+
+	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->family = "Samsung Exynos";
+
+	root = of_find_node_by_path("/");
+	of_property_read_string(root, "model", &soc_dev_attr->machine);
+	of_node_put(root);
+
+	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x", revision);
+	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
+	if (!soc_dev_attr->soc_id) {
+		pr_err("Unknown SoC\n");
+		return -ENODEV;
+	}
+
+	/* please note that the actual registration will be deferred */
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev)) {
+		kfree(soc_dev_attr->revision);
+		kfree(soc_dev_attr);
+		return PTR_ERR(soc_dev);
+	}
+
+	/* it is too early to use dev_info() here (soc_dev is NULL) */
+	pr_info("soc soc0: Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, product_id, revision);
+
+	return 0;
+}
+early_initcall(exynos_chipid_early_init);
-- 
2.17.1
