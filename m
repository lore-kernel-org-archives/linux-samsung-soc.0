From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/7] ASoC: samsung: i2s: Ensure names of supplied clocks
 are unique
Date: Mon, 12 Feb 2018 17:15:33 +0100
Message-ID: <20180212161538.22669-3-s.nawrocki@samsung.com>
References: <20180212161538.22669-1-s.nawrocki@samsung.com>
        <CGME20180212161641epcas1p2418c2323e5eb99a37a89b42c246f23dd@epcas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180212161538.22669-1-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

In order to support multiple instances of the I2S IP block the platform
device name is prepended to each clock registered by the driver.
The clock-output-names property is now not used, this should not cause
any issues as, for example, CDCLK clock is referenced through DT 'clocks'
property, not by name.

This change allows to have both I2S0 and I2S1 enabled simultaneously
on exynos5433 and working properly when #clock-cells property is specified
in respective DT nodes.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes since v1:
 - added devm_kasprintf() error handling.
---
 sound/soc/samsung/i2s.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index aeba0ae890ea..5088d12faeda 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1193,11 +1193,13 @@ static void i2s_unregister_clock_provider(struct platform_device *pdev)
 
 static int i2s_register_clock_provider(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct i2s_dai *i2s = dev_get_drvdata(dev);
+	const char * const i2s_clk_desc[] = { "cdclk", "rclk_src", "prescaler" };
 	const char *clk_name[2] = { "i2s_opclk0", "i2s_opclk1" };
 	const char *p_names[2] = { NULL };
+	struct device *dev = &pdev->dev;
+	struct i2s_dai *i2s = dev_get_drvdata(dev);
 	const struct samsung_i2s_variant_regs *reg_info = i2s->variant_regs;
+	const char *i2s_clk_name[ARRAY_SIZE(i2s_clk_desc)];
 	struct clk *rclksrc;
 	int ret, i;
 
@@ -1214,30 +1216,38 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 		clk_put(rclksrc);
 	}
 
+	for (i = 0; i < ARRAY_SIZE(i2s_clk_desc); i++) {
+		i2s_clk_name[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
+						dev_name(dev), i2s_clk_desc[i]);
+		if (!i2s_clk_name[i])
+			return -ENOMEM;
+	}
+
 	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
 		/* Activate the prescaler */
 		u32 val = readl(i2s->addr + I2SPSR);
 		writel(val | PSR_PSREN, i2s->addr + I2SPSR);
 
 		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(dev,
-				"i2s_rclksrc", p_names, ARRAY_SIZE(p_names),
+				i2s_clk_name[CLK_I2S_RCLK_SRC], p_names,
+				ARRAY_SIZE(p_names),
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->rclksrc_off,
 				1, 0, i2s->lock);
 
 		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
-				"i2s_presc", "i2s_rclksrc",
+				i2s_clk_name[CLK_I2S_RCLK_PSR],
+				i2s_clk_name[CLK_I2S_RCLK_SRC],
 				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SPSR, 8, 6, 0, i2s->lock);
 
-		p_names[0] = "i2s_presc";
+		p_names[0] = i2s_clk_name[CLK_I2S_RCLK_PSR];
 		i2s->clk_data.clk_num = 2;
 	}
-	of_property_read_string_index(dev->of_node,
-				"clock-output-names", 0, &clk_name[0]);
 
-	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev, clk_name[0],
-				p_names[0], CLK_SET_RATE_PARENT,
+	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev,
+				i2s_clk_name[CLK_I2S_CDCLK], p_names[0],
+				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->cdclkcon_off,
 				CLK_GATE_SET_TO_DISABLE, i2s->lock);
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
