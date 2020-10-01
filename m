Return-Path: <SRS0=2c9Z=DI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C005C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 16:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18C3320897
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601571439;
	bh=Hf8SKH/mhCHSQXjDIXdh7bnEag8LgBD+yG95nBrWCSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nw+ykxRUMUjCfeqMop+0rckYGqah9jt1J/H7iHMFP+o0waY6BjEp+NkKqInPs3cfD
	 r8Gdym78WYrbJn5FVc8qAFwIJyFg5mIljsNrVjc7KH/JT/faE7YWYkZOxePbO3WCJu
	 aNGnLR2cw9j9PLmkBRlNqXGWh6JcLxsb3afM9Lp0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732786AbgJAQ5N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Oct 2020 12:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732622AbgJAQ5M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 12:57:12 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B38AF20897;
        Thu,  1 Oct 2020 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601571431;
        bh=Hf8SKH/mhCHSQXjDIXdh7bnEag8LgBD+yG95nBrWCSA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SRq/PxV5Oc0vAmZGwxuh5exfKDRrruSn0O7vXkZ54ef6Ekcqx9OfhFgEV6+lNfhWW
         wPxyLyOvRlv8bTNco6dNiC/gnBhgNvkP5efB3aTMr/fprW/66sf7ncpl8OmEbecVeS
         /kN2YS0eg64K6Ee066xXhBdwjj8Z4zwtbSxBwe0w=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] clk: samsung: exynos-clkout: convert to module driver
Date:   Thu,  1 Oct 2020 18:56:46 +0200
Message-Id: <20201001165646.32279-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001165646.32279-1-krzk@kernel.org>
References: <20201001165646.32279-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos clkout driver depends on board input clock (typically XXTI or
XUSBXTI), however on Exynos4 boards these clocks were modeled as part of
SoC clocks (Exynos4 clocks driver).  Obviously this is not proper, but
correcting it would break DT backward compatibility.

Both drivers - clkout and Exynos4 clocks - register the clock providers
with CLK_OF_DECLARE/OF_DECLARE_1 so their order is fragile (in the
Makefile clkout is behind Exynos4 clock).  It will work only if the
Exynos4 clock driver comes up before clkout.

A change in DTS adding input clock reference to Exynos4 clocks input
PLL, see reverted commit eaf2d2f6895d ("ARM: dts: exynos: add input
clock to CMU in Exynos4412 Odroid"), caused probe reorder: the clkout
appeared before Exynos4 clock provider.  Since clkout depends on Exynos4
clocks and does not support deferred probe, this did not work and caused
later failure of usb3503 USB hub probe which needs clkout:

    [    5.007442] usb3503 0-0008: unable to request refclk (-517)

The Exynos clkout driver is not a critical/core clock so there is
actually no problem in instantiating it later, as a regular module.
This removes specific probe ordering and adds support for probe
deferral.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 198 +++++++++++++++++-------
 1 file changed, 141 insertions(+), 57 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 34ccb1d23bc3..68af082d4716 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -9,10 +9,13 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/module.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
 
 #define EXYNOS_CLKOUT_NR_CLKS		1
 #define EXYNOS_CLKOUT_PARENTS		32
@@ -28,41 +31,103 @@ struct exynos_clkout {
 	struct clk_mux mux;
 	spinlock_t slock;
 	void __iomem *reg;
+	struct device_node *np;
 	u32 pmu_debug_save;
 	struct clk_hw_onecell_data data;
 };
 
-static struct exynos_clkout *clkout;
+struct exynos_clkout_variant {
+	u32 mux_mask;
+};
 
-static int exynos_clkout_suspend(void)
-{
-	clkout->pmu_debug_save = readl(clkout->reg + EXYNOS_PMU_DEBUG_REG);
+static const struct exynos_clkout_variant exynos_clkout_exynos4 = {
+	.mux_mask	= EXYNOS4_CLKOUT_MUX_MASK,
+};
 
-	return 0;
-}
+static const struct exynos_clkout_variant exynos_clkout_exynos5 = {
+	.mux_mask	= EXYNOS5_CLKOUT_MUX_MASK,
+};
 
-static void exynos_clkout_resume(void)
+static const struct of_device_id exynos_clkout_ids[] = {
+	{
+		.compatible = "samsung,exynos3250-pmu",
+		.data = &exynos_clkout_exynos4,
+	}, {
+		.compatible = "samsung,exynos4210-pmu",
+		.data = &exynos_clkout_exynos4,
+	}, {
+		.compatible = "samsung,exynos4412-pmu",
+		.data = &exynos_clkout_exynos4,
+	}, {
+		.compatible = "samsung,exynos5250-pmu",
+		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos5410-pmu",
+		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos5420-pmu",
+		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos5433-pmu",
+		.data = &exynos_clkout_exynos5,
+	}, { }
+};
+
+/*
+ * Device will be instantiated as child of PMU device without its own
+ * device node.  Therefore match compatibles against parent.
+ */
+static int exynos_clkout_match_parent_dev(struct device *dev, u32 *mux_mask)
 {
-	writel(clkout->pmu_debug_save, clkout->reg + EXYNOS_PMU_DEBUG_REG);
-}
+	const struct exynos_clkout_variant *variant;
+	const struct of_device_id *match;
 
-static struct syscore_ops exynos_clkout_syscore_ops = {
-	.suspend = exynos_clkout_suspend,
-	.resume = exynos_clkout_resume,
-};
+	if (!dev->parent) {
+		dev_err(dev, "not instantiated from MFD\n");
+		return -EINVAL;
+	}
+
+	match = of_match_device(exynos_clkout_ids, dev->parent);
+	if (!match) {
+		dev_err(dev, "cannot match parent device\n");
+		return -EINVAL;
+	}
+	variant = match->data;
+
+	*mux_mask = variant->mux_mask;
+	dev_err(dev, "MATCH: %x\n", variant->mux_mask);
+
+	return 0;
+}
 
-static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
+static int exynos_clkout_probe(struct platform_device *pdev)
 {
 	const char *parent_names[EXYNOS_CLKOUT_PARENTS];
 	struct clk *parents[EXYNOS_CLKOUT_PARENTS];
-	int parent_count;
-	int ret;
-	int i;
+	struct exynos_clkout *clkout;
+	int parent_count, ret, i;
+	u32 mux_mask;
 
-	clkout = kzalloc(struct_size(clkout, data.hws, EXYNOS_CLKOUT_NR_CLKS),
-			 GFP_KERNEL);
+	clkout = devm_kzalloc(&pdev->dev,
+			      struct_size(clkout, data.hws, EXYNOS_CLKOUT_NR_CLKS),
+			      GFP_KERNEL);
 	if (!clkout)
-		return;
+		return -ENOMEM;
+
+	ret = exynos_clkout_match_parent_dev(&pdev->dev, &mux_mask);
+	if (ret)
+		return ret;
+
+	clkout->np = pdev->dev.of_node;
+	if (!clkout->np) {
+		/*
+		 * pdev->dev.parent was checked by exynos_clkout_match_parent_dev()
+		 * so it is not NULL.
+		 */
+		clkout->np = pdev->dev.parent->of_node;
+	}
+
+	platform_set_drvdata(pdev, clkout);
 
 	spin_lock_init(&clkout->slock);
 
@@ -71,7 +136,7 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 		char name[] = "clkoutXX";
 
 		snprintf(name, sizeof(name), "clkout%d", i);
-		parents[i] = of_clk_get_by_name(node, name);
+		parents[i] = of_clk_get_by_name(clkout->np, name);
 		if (IS_ERR(parents[i])) {
 			parent_names[i] = "none";
 			continue;
@@ -82,11 +147,13 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	}
 
 	if (!parent_count)
-		goto free_clkout;
+		return -EINVAL;
 
-	clkout->reg = of_iomap(node, 0);
-	if (!clkout->reg)
+	clkout->reg = of_iomap(clkout->np, 0);
+	if (!clkout->reg) {
+		ret = -ENODEV;
 		goto clks_put;
+	}
 
 	clkout->gate.reg = clkout->reg + EXYNOS_PMU_DEBUG_REG;
 	clkout->gate.bit_idx = EXYNOS_CLKOUT_DISABLE_SHIFT;
@@ -103,17 +170,17 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
 				&clk_gate_ops, CLK_SET_RATE_PARENT
 				| CLK_SET_RATE_NO_REPARENT);
-	if (IS_ERR(clkout->data.hws[0]))
+	if (IS_ERR(clkout->data.hws[0])) {
+		ret = PTR_ERR(clkout->data.hws[0]);
 		goto err_unmap;
+	}
 
 	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, &clkout->data);
+	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
 	if (ret)
 		goto err_clk_unreg;
 
-	register_syscore_ops(&exynos_clkout_syscore_ops);
-
-	return;
+	return 0;
 
 err_clk_unreg:
 	clk_hw_unregister(clkout->data.hws[0]);
@@ -123,38 +190,55 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	for (i = 0; i < EXYNOS_CLKOUT_PARENTS; ++i)
 		if (!IS_ERR(parents[i]))
 			clk_put(parents[i]);
-free_clkout:
-	kfree(clkout);
 
-	pr_err("%s: failed to register clkout clock\n", __func__);
+	dev_err(&pdev->dev, "failed to register clkout clock\n");
+
+	return ret;
 }
 
-/*
- * We use CLK_OF_DECLARE_DRIVER initialization method to avoid setting
- * the OF_POPULATED flag on the pmu device tree node, so later the
- * Exynos PMU platform device can be properly probed with PMU driver.
- */
+static int exynos_clkout_remove(struct platform_device *pdev)
+{
+	struct exynos_clkout *clkout = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(clkout->np);
+	clk_hw_unregister(clkout->data.hws[0]);
+	iounmap(clkout->reg);
 
-static void __init exynos4_clkout_init(struct device_node *node)
+	return 0;
+}
+static int exynos_clkout_suspend(struct device *dev)
 {
-	exynos_clkout_init(node, EXYNOS4_CLKOUT_MUX_MASK);
+	struct exynos_clkout *clkout = dev_get_drvdata(dev);
+
+	clkout->pmu_debug_save = readl(clkout->reg + EXYNOS_PMU_DEBUG_REG);
+
+	return 0;
 }
-CLK_OF_DECLARE_DRIVER(exynos4210_clkout, "samsung,exynos4210-pmu",
-		exynos4_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos4412_clkout, "samsung,exynos4412-pmu",
-		exynos4_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos3250_clkout, "samsung,exynos3250-pmu",
-		exynos4_clkout_init);
-
-static void __init exynos5_clkout_init(struct device_node *node)
+
+static int exynos_clkout_resume(struct device *dev)
 {
-	exynos_clkout_init(node, EXYNOS5_CLKOUT_MUX_MASK);
+	struct exynos_clkout *clkout = dev_get_drvdata(dev);
+
+	writel(clkout->pmu_debug_save, clkout->reg + EXYNOS_PMU_DEBUG_REG);
+
+	return 0;
 }
-CLK_OF_DECLARE_DRIVER(exynos5250_clkout, "samsung,exynos5250-pmu",
-		exynos5_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos5410_clkout, "samsung,exynos5410-pmu",
-		exynos5_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos5420_clkout, "samsung,exynos5420-pmu",
-		exynos5_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos5433_clkout, "samsung,exynos5433-pmu",
-		exynos5_clkout_init);
+
+static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
+			 exynos_clkout_resume);
+
+static struct platform_driver exynos_clkout_driver = {
+	.driver = {
+		.name = "exynos-clkout",
+		.of_match_table = exynos_clkout_ids,
+		.pm = &exynos_clkout_pm_ops,
+	},
+	.probe = exynos_clkout_probe,
+	.remove = exynos_clkout_remove,
+};
+module_platform_driver(exynos_clkout_driver);
+
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
+MODULE_AUTHOR("Tomasz Figa <tomasz.figa@gmail.com>");
+MODULE_DESCRIPTION("Samsung Exynos clock output driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

