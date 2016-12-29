From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] ASoC: samsung: i2s: Provide I2S device for registered
 clocks
Date: Thu, 29 Dec 2016 12:34:07 +0100
Message-ID: <1483011247-21613-6-git-send-email-m.szyprowski@samsung.com>
References: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161229113427eucas1p21ee586b73029410d0860a22ce4a21e0c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33922 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751315AbcL2Lec (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:34:32 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIY00FQ52TH1D00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2016 11:34:29 +0000 (GMT)
In-reply-to: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds pointer to I2S device to clk_register_* functions.
This in the future allow clock framework to ensure proper runtime state
of the I2S device during all operations on the clocks provided by I2S
module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 07728b93f56e..d24b825dc298 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1191,13 +1191,13 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 		u32 val = readl(i2s->addr + I2SPSR);
 		writel(val | PSR_PSREN, i2s->addr + I2SPSR);
 
-		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(NULL,
+		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(dev,
 				"i2s_rclksrc", p_names, ARRAY_SIZE(p_names),
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->rclksrc_off,
 				1, 0, i2s->lock);
 
-		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(NULL,
+		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
 				"i2s_presc", "i2s_rclksrc",
 				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SPSR, 8, 6, 0, i2s->lock);
@@ -1208,7 +1208,7 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 	of_property_read_string_index(dev->of_node,
 				"clock-output-names", 0, &clk_name[0]);
 
-	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(NULL, clk_name[0],
+	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev, clk_name[0],
 				p_names[0], CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->cdclkcon_off,
 				CLK_GATE_SET_TO_DISABLE, i2s->lock);
-- 
1.9.1
