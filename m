From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 12/14] ASoC: samsung: i2s: Add clock provider for the I2S
 internal clocks
Date: Thu, 11 Dec 2014 18:45:50 +0100
Message-ID: <1418319952-10163-13-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42932 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRrB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:47:01 -0500
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org

This patch adds clock provider (currently only for DT platforms) for
the CODECLKO (CDCLK) gate, RCLKSRC mux and RCLK pre-scaler divider
divider clock. Those all tree clock are only available in the IIS
Multi Audio Interface (I2S0), the regular IIS Bus Interface has only
CDCLK gate clock.

The motivation behind this patch is to expose the I2S internal clocks
which are currently controlled through set_sysclk() through the clk
API, so dedicated sound machine driver per each board can be avoided.

The intention is also to fix the CDCLK gating issue reported by
Daniel Drake:
http://mailman.alsa-project.org/pipermail/alsa-devel/2014-September/081753.html

This patch also reverts commit b97c60abf9a561f86ae71bd741add02673cc1
("ASoC: samsung-i2s: Maintain CDCLK settings across i2s_{shutdown/
startup}") The problem that commit attempted to solve only affects
the Odroid X2/U3, which doesn't configure the CDCLK clock in
struct snd_soc_dai_ops hw_params callback and the issue should be
now resolved by using clk API, i.e. having the codec enabling/
disabling the CDCLK clock as required.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/sound/samsung-i2s.txt      |   18 ++-
 sound/soc/samsung/i2s.c                            |  116 ++++++++++++++++----
 2 files changed, 113 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index d188296..fb3b777 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -34,12 +34,26 @@ Required SoC Specific Properties:
   clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
   doesn't have any such mux.

-Optional SoC Specific Properties:
+Optional Properties:

 - samsung,idma-addr: Internal DMA register base address of the audio
   sub system(used in secondary sound source).
 - pinctrl-0: Should specify pin control groups used for this controller.
 - pinctrl-names: Should contain only one value - "default".
+- #clock-cells: should be 1, this property must be present if the I2S device
+  is a clock provider in terms of the common clock bindings, described in
+  ../clock/clock-bindings.txt.
+- clock-output-names: from the common clock bindings, names of the CDCLK
+  I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
+  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices recpectively.
+
+The assignment of indices for the I2Sx clock provider is as follows:
+ 0 - the CDCLK (CODECLKO) gate clock,
+ 1 - the RCLK prescaler divider clock (corresponding to the IISPSR register),
+ 2 - the RCLKSRC mux clock (corresponding to RCLKSRC bit in register IISMOD).
+
+Clocks 1, 2 are normally only available in the IIS Mutli Audio Interface (I2S0).
+

 Example:

@@ -54,6 +68,8 @@ i2s0: i2s@03830000 {
 		<&clock_audss EXYNOS_I2S_BUS>,
 		<&clock_audss EXYNOS_SCLK_I2S>;
 	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+	#clock-cells;
+	clock-output-names = "i2s_cdclk0";
 	samsung,idma-addr = <0x03000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2s0_bus>;
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 825138b..3f4d2c0 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -81,8 +82,6 @@ struct i2s_dai {
 #define DAI_OPENED	(1 << 0) /* Dai is opened */
 #define DAI_MANAGER	(1 << 1) /* Dai is the manager */
 	unsigned mode;
-	/* CDCLK pin direction: 0  - input, 1 - output */
-	unsigned int cdclk_out:1;
 	/* Driver for this DAI */
 	struct snd_soc_dai_driver i2s_dai_drv;
 	/* DMA parameters */
@@ -98,6 +97,10 @@ struct i2s_dai {
 	/* Spinlock protecting access to the device's registers */
 	spinlock_t spinlock;
 	spinlock_t *lock;
+
+	/* Below fields are only valid if this is the primary FIFO */
+	struct clk *clk_table[3];
+	struct clk_onecell_data clk_data;
 };

 /* Lock for cross i/f checks */
@@ -774,9 +777,6 @@ static int i2s_startup(struct snd_pcm_substream *substream,

 	spin_unlock_irqrestore(&lock, flags);

-	if (!is_opened(other) && i2s->cdclk_out)
-		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
-				0, SND_SOC_CLOCK_OUT);
 	return 0;
 }

@@ -786,31 +786,20 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
 	unsigned long flags;
-	const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;

 	spin_lock_irqsave(&lock, flags);

 	i2s->mode &= ~DAI_OPENED;
 	i2s->mode &= ~DAI_MANAGER;

-	if (is_opened(other)) {
+	if (is_opened(other))
 		other->mode |= DAI_MANAGER;
-	} else {
-		u32 mod = readl(i2s->addr + I2SMOD);
-		i2s->cdclk_out = !(mod & (1 << i2s_regs->cdclkcon_off));
-		if (other)
-			other->cdclk_out = i2s->cdclk_out;
-	}
+
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
 	i2s->bfs = 0;

 	spin_unlock_irqrestore(&lock, flags);
-
-	/* Gate CDCLK by default */
-	if (!is_opened(other))
-		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
-				0, SND_SOC_CLOCK_IN);
 }

 static int config_setup(struct i2s_dai *i2s)
@@ -1147,6 +1136,91 @@ static int i2s_runtime_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_RUNTIME */

+static void i2s_unregister_clocks(struct i2s_dai *i2s)
+{
+	int i;
+
+	for (i = 0; i < i2s->clk_data.clk_num; i++) {
+		if (!IS_ERR(i2s->clk_table[i]))
+			clk_unregister(i2s->clk_table[i]);
+	}
+}
+
+static void i2s_unregister_clock_provider(struct platform_device *pdev)
+{
+	struct i2s_dai *i2s = dev_get_drvdata(&pdev->dev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	i2s_unregister_clocks(i2s);
+}
+
+static int i2s_register_clock_provider(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2s_dai *i2s = dev_get_drvdata(dev);
+	const char *clk_name[2] = { "i2s_opclk0", "i2s_opclk1" };
+	const char *p_names[2] = { NULL };
+	const struct samsung_i2s_variant_regs *reg_info = i2s->variant_regs;
+	struct clk *rclksrc;
+	int ret, i;
+
+	/* Register the clock provider only if it's expected in the DTB */
+	if (!of_find_property(dev->of_node, "#clock-cells", NULL))
+		return 0;
+
+	/* Get the RCLKSRC mux clock parent clock names */
+	for (i = 0; i < ARRAY_SIZE(p_names); i++) {
+		rclksrc = clk_get(dev, clk_name[i]);
+		if (IS_ERR(rclksrc))
+			continue;
+		p_names[i] = __clk_get_name(rclksrc);
+		clk_put(rclksrc);
+	}
+	/*
+	 * Register the mux and div clocks only if both source clocks
+	 * are available, i.e. for the I2S0 instance and versions with
+	 * QUIRK_NO_MUXPSR quirk not set.
+	 */
+	if (p_names[1] && !(i2s->quirks & QUIRK_NO_MUXPSR)) {
+		/* Activate the prescaler */
+		u32 val = readl(i2s->addr + I2SPSR);
+		writel(val | PSR_PSREN, i2s->addr + I2SPSR);
+
+		i2s->clk_table[1] = clk_register_mux(NULL, "i2s_rclksrc",
+				p_names, ARRAY_SIZE(p_names),
+				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+				i2s->addr + I2SMOD, reg_info->rclksrc_off,
+				1, 0, i2s->lock);
+
+		i2s->clk_table[2] = clk_register_divider(NULL,
+				"i2s_presc", "i2s_rclksrc",
+				CLK_SET_RATE_PARENT,
+				i2s->addr + I2SPSR, 8, 6, 0, i2s->lock);
+
+		p_names[0] = "i2s_presc";
+		i2s->clk_data.clk_num = 2;
+	}
+	of_property_read_string_index(dev->of_node,
+				"clock-output-names", 0, &clk_name[0]);
+
+	i2s->clk_table[0] = clk_register_gate(NULL, clk_name[0],
+				p_names[0], CLK_SET_RATE_PARENT,
+				i2s->addr + I2SMOD, reg_info->cdclkcon_off,
+				CLK_GATE_SET_TO_DISABLE, i2s->lock);
+
+	i2s->clk_data.clk_num += 1;
+	i2s->clk_data.clks = i2s->clk_table;
+
+	ret = of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
+				  &i2s->clk_data);
+	if (ret < 0) {
+		dev_err(dev, "failed to add clock provider\n");
+		i2s_unregister_clocks(i2s);
+	}
+
+	return ret;
+}
+
 static int samsung_i2s_probe(struct platform_device *pdev)
 {
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
@@ -1297,7 +1371,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (ret != 0)
 		return ret;

-	return 0;
+	return i2s_register_clock_provider(pdev);
 }

 static int samsung_i2s_remove(struct platform_device *pdev)
@@ -1314,8 +1388,10 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 	}

-	if (!is_secondary(i2s))
+	if (!is_secondary(i2s)) {
+		i2s_unregister_clock_provider(pdev);
 		clk_disable_unprepare(i2s->clk);
+	}

 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
--
1.7.9.5
