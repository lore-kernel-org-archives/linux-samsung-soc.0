From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC 14/17] clk: samsung: clkout: samsung: Switch to new clock
 controller API
Date: Tue, 16 Aug 2016 15:35:11 +0200
Message-ID: <1471354514-24224-15-git-send-email-k.kozlowski@samsung.com>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@osg.samsung.com>, a.hajda@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Allocate a clock controller and use new clk_register_with_ctrl() API.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 96fab6cfb202..9c57a623e741 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -26,6 +26,7 @@
 #define EXYNOS5_CLKOUT_MUX_MASK		0x1f
 
 struct exynos_clkout {
+	struct clk_ctrl *clk_ctrl;
 	struct clk_gate gate;
 	struct clk_mux mux;
 	spinlock_t slock;
@@ -66,6 +67,10 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	if (!clkout)
 		return;
 
+	clkout->clk_ctrl = clk_ctrl_register(NULL);
+	if (IS_ERR(clkout->clk_ctrl))
+		goto free_clkout;
+
 	spin_lock_init(&clkout->slock);
 
 	parent_count = 0;
@@ -84,7 +89,7 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	}
 
 	if (!parent_count)
-		goto free_clkout;
+		goto free_ctrl;
 
 	clkout->reg = of_iomap(node, 0);
 	if (!clkout->reg)
@@ -100,7 +105,7 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
 	clkout->mux.lock = &clkout->slock;
 
-	clkout->clk_table[0] = clk_register_composite(NULL, "clkout",
+	clkout->clk_table[0] = clk_register_composite(NULL, clkout->clk_ctrl, "clkout",
 				parent_names, parent_count, &clkout->mux.hw,
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
 				&clk_gate_ops, CLK_SET_RATE_PARENT
@@ -126,6 +131,8 @@ clks_put:
 	for (i = 0; i < EXYNOS_CLKOUT_PARENTS; ++i)
 		if (!IS_ERR(parents[i]))
 			clk_put(parents[i]);
+free_ctrl:
+	clk_ctrl_unregister(clkout->clk_ctrl);
 free_clkout:
 	kfree(clkout);
 
-- 
1.9.1
