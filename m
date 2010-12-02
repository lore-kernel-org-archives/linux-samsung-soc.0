From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/4] mach-s5pv210: Add MIPI-CSI DPHY clock definition
Date: Thu, 02 Dec 2010 17:37:42 +0100
Message-ID: <1291307862-8125-5-git-send-email-s.nawrocki@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56047 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757776Ab0LBQjU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 11:39:20 -0500
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LCT00GBZ7LHTR@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:39:18 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCT005D17LGV7@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:39:16 +0000 (GMT)
In-reply-to: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

MIPI DPHY control register requires special handling since
it is shared between CSI (camera serial interface) and DSI
(display serial interface). By creating this clock
a serialized interface is provided for mipi-csi and mipi-dsi
drivers, so DPHYs may be safely controlled by both drivers.
Similarly dsim_dphy clock could be added for mipi-dsim.

---

I am not quite sure about "csis_dphy" clock, perhaps power domain
handling code would better place for MIPI DPHY control.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 019c3a6..14e42ca 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -185,6 +185,19 @@ static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLK_SRC_MASK1, clk, enable);
 }
 
+static int s5pv210_clk_mipi_dphy_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_MIPI_DPHY_CONTROL, clk, enable);
+}
+
+/* The common parent clock for mipi-csi/dsi clocks. */
+static struct clk clk_vp_mipi_dphy = {
+	.name		= "vpclk_csis_dphy",
+	.id		= -1,
+	.enable		= s5pv210_clk_mipi_dphy_ctrl,
+	.ctrlbit	= (1 << 0),
+};
+
 static struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
 	.id		= -1,
@@ -323,6 +336,18 @@ static struct clk init_clocks_disable[] = {
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
+		.name		= "csis",
+		.id		= -1,
+		.parent		= &clk_pclk_dsys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 31),
+	}, {
+		.name		= "csis_dphy",
+		.id		= -1,
+		.parent		= &clk_vp_mipi_dphy,
+		.enable		= s5pv210_clk_mipi_dphy_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
 		.name		= "rot",
 		.id		= -1,
 		.parent		= &clk_hclk_dsys.clk,
-- 
1.7.1
