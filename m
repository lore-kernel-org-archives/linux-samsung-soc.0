From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 08/11] ARM: S5P6440: Add clocks of type 'struct clk'.
Date: Thu, 13 May 2010 09:27:47 +0900
Message-ID: <1273710467-14757-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50728 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755095Ab0EMAfh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 20:35:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Add definitions of clocks of type 'struct clk'.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/clock.c |   82 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5p6440/clock.c b/arch/arm/mach-s5p6440/clock.c
index 80d18f5..26b02d4 100644
--- a/arch/arm/mach-s5p6440/clock.c
+++ b/arch/arm/mach-s5p6440/clock.c
@@ -467,7 +467,73 @@ static struct clk init_clocks_disable[] = {
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
-	}
+	}, {
+		.name		= "hclk_fimgvg",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk1_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "tsi",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk1_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "pclk_fimgvg",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 31),
+	}, {
+		.name		= "dmc0",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 30),
+	}, {
+		.name		= "etm",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 29),
+	}, {
+		.name		= "dsim",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "gps",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 25),
+	}, {
+		.name		= "pcm",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "irom",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= (1 << 25),
+	}, {
+		.name		= "dma",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= (1 << 12),
+	}, {
+		.name		= "2d",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
 };
 
 /*
@@ -504,7 +570,19 @@ static struct clk init_clocks[] = {
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
-	}
+	}, {
+		.name		= "mem",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= (1 << 21),
+	}, {
+		.name		= "intc",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= (1 << 1),
+	},
 };
 
 static struct clk clk_iis_cd_v40 = {
-- 
1.6.2.5
