Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900D9C2BB48
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D74238E5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgLGTGX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 14:06:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbgLGTGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 14:06:23 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 4/4] soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
Date:   Mon,  7 Dec 2020 20:05:17 +0100
Message-Id: <20201207190517.262051-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207190517.262051-1-krzk@kernel.org>
References: <20201207190517.262051-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos Chip ID driver on Exynos SoCs has so far only informational
purpose - to expose the SoC device in sysfs.  No other drivers depend on
it so there is really no benefit of initializing it early.

The code would be the most flexible if converted to a regular driver.
However there is already another driver - Exynos ASV (Adaptive Supply
Voltage) - which binds to the device node of Chip ID.

The solution is to convert the Exynos Chip ID to a built in driver and
merge the Exynos ASV into it.

This has several benefits:
1. Although the Exynos ASV driver binds to a device node present in all
   Exynos DTS (generic compatible), it fails to probe except on the
   supported ones (only Exynos5422).  This means that the regular boot
   process has a planned/expected device probe failure.

   Merging the ASV into Chip ID will remove this probe failure because
   the final driver will always bind, just with disabled ASV features.

2. Allows to use dev_info() as the SoC bus is present (since
   core_initcall).

3. Could speed things up because of execution of Chip ID code in a SMP
   environment (after bringing up secondary CPUs, unlike early_initcall),
   This reduces the amount of work to be done early, when the kernel has
   to bring up critical devices.

5. Makes the Chip ID code defer-probe friendly,

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/Kconfig        |  1 -
 drivers/soc/samsung/Kconfig         | 12 ++---
 drivers/soc/samsung/Makefile        |  3 +-
 drivers/soc/samsung/exynos-asv.c    | 45 +++++------------
 drivers/soc/samsung/exynos-asv.h    |  2 +
 drivers/soc/samsung/exynos-chipid.c | 75 ++++++++++++++++++++---------
 6 files changed, 70 insertions(+), 68 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 56d272967fc0..5a48abac6af4 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -13,7 +13,6 @@ menuconfig ARCH_EXYNOS
 	select ARM_GIC
 	select EXYNOS_IRQ_COMBINER
 	select COMMON_CLK_SAMSUNG
-	select EXYNOS_ASV
 	select EXYNOS_CHIPID
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index fc7f48a92288..5745d7e5908e 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -7,21 +7,19 @@ menuconfig SOC_SAMSUNG
 
 if SOC_SAMSUNG
 
-config EXYNOS_ASV
-	bool "Exynos Adaptive Supply Voltage support" if COMPILE_TEST
-	depends on (ARCH_EXYNOS && EXYNOS_CHIPID) || COMPILE_TEST
-	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
-
 # There is no need to enable these drivers for ARMv8
 config EXYNOS_ASV_ARM
 	bool "Exynos ASV ARMv7-specific driver extensions" if COMPILE_TEST
-	depends on EXYNOS_ASV
+	depends on EXYNOS_CHIPID
 
 config EXYNOS_CHIPID
-	bool "Exynos Chipid controller driver" if COMPILE_TEST
+	bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || COMPILE_TEST
+	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
 	select MFD_SYSCON
 	select SOC_BUS
+	help
+	  Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
 
 config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 59e8e9453f27..0c523a8de4eb 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_EXYNOS_ASV)	+= exynos-asv.o
 obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
 
-obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o
+obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
index 5daeadc36382..d60af8acc391 100644
--- a/drivers/soc/samsung/exynos-asv.c
+++ b/drivers/soc/samsung/exynos-asv.c
@@ -2,7 +2,9 @@
 /*
  * Copyright (c) 2019 Samsung Electronics Co., Ltd.
  *	      http://www.samsung.com/
+ * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
+ * Author: Krzysztof Kozlowski <krzk@kernel.org>
  *
  * Samsung Exynos SoC Adaptive Supply Voltage support
  */
@@ -10,12 +12,7 @@
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/mfd/syscon.h>
-#include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/soc/samsung/exynos-chipid.h>
@@ -111,7 +108,7 @@ static int exynos_asv_update_opps(struct exynos_asv *asv)
 	return	0;
 }
 
-static int exynos_asv_probe(struct platform_device *pdev)
+int exynos_asv_init(struct device *dev, struct regmap *regmap)
 {
 	int (*probe_func)(struct exynos_asv *asv);
 	struct exynos_asv *asv;
@@ -119,21 +116,16 @@ static int exynos_asv_probe(struct platform_device *pdev)
 	u32 product_id = 0;
 	int ret, i;
 
-	asv = devm_kzalloc(&pdev->dev, sizeof(*asv), GFP_KERNEL);
+	asv = devm_kzalloc(dev, sizeof(*asv), GFP_KERNEL);
 	if (!asv)
 		return -ENOMEM;
 
-	asv->chipid_regmap = device_node_to_regmap(pdev->dev.of_node);
-	if (IS_ERR(asv->chipid_regmap)) {
-		dev_err(&pdev->dev, "Could not find syscon regmap\n");
-		return PTR_ERR(asv->chipid_regmap);
-	}
-
+	asv->chipid_regmap = regmap;
+	asv->dev = dev;
 	ret = regmap_read(asv->chipid_regmap, EXYNOS_CHIPID_REG_PRO_ID,
 			  &product_id);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Cannot read revision from ChipID: %d\n",
-			ret);
+		dev_err(dev, "Cannot read revision from ChipID: %d\n", ret);
 		return -ENODEV;
 	}
 
@@ -142,7 +134,9 @@ static int exynos_asv_probe(struct platform_device *pdev)
 		probe_func = exynos5422_asv_init;
 		break;
 	default:
-		return -ENODEV;
+		dev_dbg(dev, "No ASV support for this SoC\n");
+		devm_kfree(dev, asv);
+		return 0;
 	}
 
 	cpu_dev = get_cpu_device(0);
@@ -150,14 +144,11 @@ static int exynos_asv_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return -EPROBE_DEFER;
 
-	ret = of_property_read_u32(pdev->dev.of_node, "samsung,asv-bin",
+	ret = of_property_read_u32(dev->of_node, "samsung,asv-bin",
 				   &asv->of_bin);
 	if (ret < 0)
 		asv->of_bin = -EINVAL;
 
-	asv->dev = &pdev->dev;
-	dev_set_drvdata(&pdev->dev, asv);
-
 	for (i = 0; i < ARRAY_SIZE(asv->subsys); i++)
 		asv->subsys[i].asv = asv;
 
@@ -167,17 +158,3 @@ static int exynos_asv_probe(struct platform_device *pdev)
 
 	return exynos_asv_update_opps(asv);
 }
-
-static const struct of_device_id exynos_asv_of_device_ids[] = {
-	{ .compatible = "samsung,exynos4210-chipid" },
-	{}
-};
-
-static struct platform_driver exynos_asv_driver = {
-	.driver = {
-		.name = "exynos-asv",
-		.of_match_table = exynos_asv_of_device_ids,
-	},
-	.probe	= exynos_asv_probe,
-};
-module_platform_driver(exynos_asv_driver);
diff --git a/drivers/soc/samsung/exynos-asv.h b/drivers/soc/samsung/exynos-asv.h
index 3fd1f2acd999..dcbe154db31e 100644
--- a/drivers/soc/samsung/exynos-asv.h
+++ b/drivers/soc/samsung/exynos-asv.h
@@ -68,4 +68,6 @@ static inline u32 exynos_asv_opp_get_frequency(const struct exynos_asv_subsys *s
 	return __asv_get_table_entry(&subsys->table, level, 0);
 }
 
+int exynos_asv_init(struct device *dev, struct regmap *regmap);
+
 #endif /* __LINUX_SOC_EXYNOS_ASV_H */
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b4cd0cc00f45..fa6a9b9f6d70 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -2,20 +2,28 @@
 /*
  * Copyright (c) 2019 Samsung Electronics Co., Ltd.
  *	      http://www.samsung.com/
+ * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  *
  * Exynos - CHIP ID support
  * Author: Pankaj Dubey <pankaj.dubey@samsung.com>
  * Author: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
+ * Author: Krzysztof Kozlowski <krzk@kernel.org>
+ *
+ * Samsung Exynos SoC Adaptive Supply Voltage and Chip ID support
  */
 
-#include <linux/io.h>
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/soc/samsung/exynos-chipid.h>
 #include <linux/sys_soc.h>
 
+#include "exynos-asv.h"
+
 static const struct exynos_soc_id {
 	const char *name;
 	unsigned int id;
@@ -46,25 +54,17 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int __init exynos_chipid_early_init(void)
+static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	struct soc_device_attribute *soc_dev_attr;
 	struct soc_device *soc_dev;
 	struct device_node *root;
-	struct device_node *syscon;
 	struct regmap *regmap;
 	u32 product_id;
 	u32 revision;
 	int ret;
 
-	syscon = of_find_compatible_node(NULL, NULL,
-					 "samsung,exynos4210-chipid");
-	if (!syscon)
-		return -ENODEV;
-
-	regmap = device_node_to_regmap(syscon);
-	of_node_put(syscon);
-
+	regmap = device_node_to_regmap(pdev->dev.of_node);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
@@ -74,7 +74,8 @@ static int __init exynos_chipid_early_init(void)
 
 	revision = product_id & EXYNOS_REV_MASK;
 
-	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
+				    GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
@@ -84,31 +85,57 @@ static int __init exynos_chipid_early_init(void)
 	of_property_read_string(root, "model", &soc_dev_attr->machine);
 	of_node_put(root);
 
-	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x", revision);
+	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						"%x", revision);
 	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
-		ret = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev)) {
-		ret = PTR_ERR(soc_dev);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	ret = exynos_asv_init(&pdev->dev, regmap);
+	if (ret)
 		goto err;
-	}
 
-	/* it is too early to use dev_info() here (soc_dev is NULL) */
-	pr_info("soc soc0: Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		soc_dev_attr->soc_id, product_id, revision);
+	platform_set_drvdata(pdev, soc_dev);
+
+	dev_info(soc_device_to_device(soc_dev),
+		 "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		 soc_dev_attr->soc_id, product_id, revision);
 
 	return 0;
 
 err:
-	kfree(soc_dev_attr->revision);
-	kfree(soc_dev_attr);
+	soc_device_unregister(soc_dev);
+
 	return ret;
 }
 
-early_initcall(exynos_chipid_early_init);
+static int exynos_chipid_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
+
+	soc_device_unregister(soc_dev);
+
+	return 0;
+}
+
+static const struct of_device_id exynos_chipid_of_device_ids[] = {
+	{ .compatible = "samsung,exynos4210-chipid" },
+	{}
+};
+
+static struct platform_driver exynos_chipid_driver = {
+	.driver = {
+		.name = "exynos-chipid",
+		.of_match_table = exynos_chipid_of_device_ids,
+	},
+	.probe	= exynos_chipid_probe,
+	.remove	= exynos_chipid_remove,
+};
+builtin_platform_driver(exynos_chipid_driver);
-- 
2.25.1

