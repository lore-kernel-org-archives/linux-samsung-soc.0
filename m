From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
Date: Mon,  4 Oct 2010 20:52:34 +0900
Message-ID: <1286193154-17201-1-git-send-email-sw.youn@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39768 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752968Ab0JDMMp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 08:12:45 -0400
In-Reply-To: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, Seungwhan Youn <sw.youn@samsung.com>

This patch add SCLK_SPDIF clock to support source clock of S/PDIF
on S5PV210.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |   62 +++++++++++++++++++++++++++++++++++------
 1 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index d562670..195a088 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -431,6 +431,12 @@ static struct clk init_clocks_disable[] = {
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 6),
+	}, {
+		.name		= "spdif",
+		.id		= -1,
+		.parent		= &clk_p,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 0),
 	},
 };
 
@@ -660,6 +666,53 @@ static struct clksrc_sources clkset_sclk_spdif = {
 	.nr_sources	= ARRAY_SIZE(clkset_sclk_spdif_list),
 };
 
+static int s5pv210_spdif_set_rate(struct clk *clk, unsigned long rate)
+{
+	struct clk *pclk;
+	int ret;
+
+	pclk = clk_get_parent(clk);
+	if (IS_ERR(pclk))
+		return -EINVAL;
+
+	ret = pclk->ops->set_rate(pclk, rate);
+	clk_put(pclk);
+
+	return ret;
+}
+
+static unsigned long s5pv210_spdif_get_rate(struct clk *clk)
+{
+	struct clk *pclk;
+	int rate;
+
+	pclk = clk_get_parent(clk);
+	if (IS_ERR(pclk))
+		return -EINVAL;
+
+	rate = pclk->ops->get_rate(clk);
+	clk_put(pclk);
+
+	return rate;
+}
+
+static struct clk_ops s5pv210_sclk_spdif_ops = {
+	.set_rate	= s5pv210_spdif_set_rate,
+	.get_rate	= s5pv210_spdif_get_rate,
+};
+
+static struct clksrc_clk clk_sclk_spdif = {
+	.clk		= {
+		.name		= "sclk_spdif",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 27),
+		.ops		= &s5pv210_sclk_spdif_ops,
+	},
+	.sources = &clkset_sclk_spdif,
+	.reg_src = { .reg = S5P_CLK_SRC6, .shift = 12, .size = 2 },
+};
+
 static struct clk *clkset_group2_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = &clk_xusbxti,
@@ -744,15 +797,6 @@ static struct clksrc_clk clksrcs[] = {
 		.sources = &clkset_sclk_mixer,
 		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
 	}, {
-		.clk		= {
-			.name		= "sclk_spdif",
-			.id		= -1,
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 27),
-		},
-		.sources = &clkset_sclk_spdif,
-		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 12, .size = 2 },
-	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
 			.id		= 0,
-- 
1.6.2.5
