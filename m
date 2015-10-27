From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v2 2/4] drivers: exynos-srom: Add support for bank configuration
Date: Tue, 27 Oct 2015 11:43:53 +0300
Message-ID: <64593f31150196b2b3bd8707c77f2cfac00603c4.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11029 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754427AbbJ0IoG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 04:44:06 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWV00IMBEXEKX60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 08:44:02 +0000 (GMT)
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

Bindings are based on u-boot implementation, however they are stored in
subnodes, providing support for more than one bank.

Since the driver now does more than suspend-resume support, dependency on
CONFIG_PM is removed.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 arch/arm/mach-exynos/Kconfig      |  2 +-
 drivers/soc/samsung/Kconfig       |  2 +-
 drivers/soc/samsung/exynos-srom.c | 42 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 83c85f5..c22dc42 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -16,7 +16,7 @@ menuconfig ARCH_EXYNOS
 	select ARM_GIC
 	select COMMON_CLK_SAMSUNG
 	select EXYNOS_THERMAL
-	select EXYNOS_SROM if PM
+	select EXYNOS_SROM
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 2833b5b..ea4bc2a 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -8,6 +8,6 @@ config SOC_SAMSUNG
 
 config EXYNOS_SROM
 	bool
-	depends on ARM && ARCH_EXYNOS && PM
+	depends on ARM && ARCH_EXYNOS
 
 endmenu
diff --git a/drivers/soc/samsung/exynos-srom.c b/drivers/soc/samsung/exynos-srom.c
index 57a232d..6c8c56a 100644
--- a/drivers/soc/samsung/exynos-srom.c
+++ b/drivers/soc/samsung/exynos-srom.c
@@ -67,9 +67,46 @@ static struct exynos_srom_reg_dump *exynos_srom_alloc_reg_dump(
 	return rd;
 }
 
+static int decode_sromc(struct exynos_srom *srom, struct device_node *np)
+{
+	u32 bank, width;
+	u32 timing[7];
+	u32 bw;
+
+	if (of_property_read_u32(np, "bank", &bank))
+		return -ENXIO;
+	if (of_property_read_u32(np, "width", &width))
+		width = 1;
+	if (of_property_read_u32_array(np, "srom-timing", timing, 7)) {
+		pr_err("Could not decode SROMC configuration\n");
+		return -ENXIO;
+	}
+
+	bank *= 4; /* Convert bank into shift/offset */
+
+	bw = 1 << EXYNOS_SROM_BW__BYTEENABLE__SHIFT;
+	if (width == 2)
+		bw |= 1 << EXYNOS_SROM_BW__DATAWIDTH__SHIFT;
+	bw <<= bank;
+	bw |= __raw_readl(srom->reg_base + EXYNOS_SROM_BW) &
+	      ~(EXYNOS_SROM_BW__CS_MASK << bank);
+	__raw_writel(bw, srom->reg_base + EXYNOS_SROM_BW);
+
+	__raw_writel((timing[0] << EXYNOS_SROM_BCX__PMC__SHIFT) |
+		    (timing[1] << EXYNOS_SROM_BCX__TACP__SHIFT) |
+		    (timing[2] << EXYNOS_SROM_BCX__TCAH__SHIFT) |
+		    (timing[3] << EXYNOS_SROM_BCX__TCOH__SHIFT) |
+		    (timing[4] << EXYNOS_SROM_BCX__TACC__SHIFT) |
+		    (timing[5] << EXYNOS_SROM_BCX__TCOS__SHIFT) |
+		    (timing[6] << EXYNOS_SROM_BCX__TACS__SHIFT),
+		    srom->reg_base + EXYNOS_SROM_BC0 + bank);
+
+	return 0;
+}
+
 static int exynos_srom_probe(struct platform_device *pdev)
 {
-	struct device_node *np;
+	struct device_node *np, *child;
 	struct exynos_srom *srom;
 	struct device *dev = &pdev->dev;
 
@@ -100,6 +137,9 @@ static int exynos_srom_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	for_each_child_of_node(np, child)
+		decode_sromc(srom, child);
+
 	return 0;
 }
 
-- 
2.4.4
