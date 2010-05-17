From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 18/18] ARM: S5PV210: Add clocks of type 'struct clk'
Date: Mon, 17 May 2010 09:39:08 +0900
Message-ID: <1274056748-14779-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33554 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab0EQAq6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 May 2010 20:46:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Add peripheral device clocks of type of type 'struct clk'

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |  104 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 103 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index a2c3ab5..438b4e5 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -418,7 +418,79 @@ static struct clk init_clocks_disable[] = {
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<4),
-	}
+	}, {
+		.name		= "jpeg",
+		.id		= 1,
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "pdma",
+		.id		= 1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "pdma",
+		.id		= 0,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
+		.name		= "mdma",
+		.id		= -1,
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "nfcon",
+		.id		= -1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "nandxl",
+		.id		= -1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 24),
+	}, {
+		.name		= "vp",
+		.id		= -1,
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "dsim",
+		.id		= -1,
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "pcm",
+		.id		= 2,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 30),
+	}, {
+		.name		= "pcm",
+		.id		= 1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 29),
+	}, {
+		.name		= "pcm",
+		.id		= 0,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "ac97",
+		.id		= -1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 1),
+	},
 };
 
 static struct clk init_clocks[] = {
@@ -454,6 +526,36 @@ static struct clk init_clocks[] = {
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<10),
 	}, {
+		.name		= "syscon",
+		.id		= -1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 27),
+	}, {
+		.name		= "gpio",
+		.id		= -1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
+		.name		= "sromc",
+		.id		= -1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
+		.name		= "dmc",
+		.id		= 1,
+		.parent		= &clk_hclk_msys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "dmc",
+		.id		= 0,
+		.parent		= &clk_hclk_msys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "mout_hdmi",
 		.id		= -1,
 		.enable		= s5pv210_clk_mask0_ctrl,
-- 
1.6.2.5
