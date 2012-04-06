From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: add support for GATE BLOCK clocks
Date: Fri, 06 Apr 2012 10:00:50 +0200
Message-ID: <1333699250-16420-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25765 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754571Ab2DFIAz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 04:00:55 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M21008DFSWZUC20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 09:00:35 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M210095CSXH09@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 09:00:53 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

EXYNOS4_CLKGATE_BLOCK register can be used to disable the respective
multimedia block hardware planes. It acts similar to the power domains.
This patch adds transparent support for this method of gating of
multimedia blocks. New clocks are added as parents to the respective
block bus clocks. This patch has been tested on NURI and UniversalC210
boards, which have bootloader which disable all multimedia blocks with
both GATE BLOCK method and power domains.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos4.c |   54 ++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 4287311..a2f8b2e 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -213,6 +213,11 @@ static int exynos4_clk_dac_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_DAC_PHY_CONTROL, clk, enable);
 }
 
+static int exynos4_clk_gate_block_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(EXYNOS4_CLKGATE_BLOCK, clk, enable);
+}
+
 /* Core list of CMU_CPU side */
 
 static struct clksrc_clk exynos4_clk_mout_apll = {
@@ -459,6 +464,37 @@ static struct clksrc_clk exynos4_clk_sclk_vpll = {
 	.reg_src = { .reg = EXYNOS4_CLKSRC_TOP0, .shift = 8, .size = 1 },
 };
 
+static struct clk exynos4_clk_gate_cam = {
+	.name		= "cam",
+	.enable		= exynos4_clk_gate_block_ctrl,
+	.ctrlbit	= (1 << 0),
+};
+
+static struct clk exynos4_clk_gate_tv = {
+	.name		= "tv",
+	.enable		= exynos4_clk_gate_block_ctrl,
+	.ctrlbit	= (1 << 1),
+};
+
+static struct clk exynos4_clk_gate_mfc = {
+	.name		= "mfc",
+	.enable		= exynos4_clk_gate_block_ctrl,
+	.ctrlbit	= (1 << 2),
+};
+
+static struct clk exynos4_clk_gate_lcd0 = {
+	.name		= "lcd0",
+	.enable		= exynos4_clk_gate_block_ctrl,
+	.ctrlbit	= (1 << 4),
+};
+
+static struct clk *exynos4_gate_clocks[] = {
+	&exynos4_clk_gate_cam,
+	&exynos4_clk_gate_tv,
+	&exynos4_clk_gate_mfc,
+	&exynos4_clk_gate_lcd0,
+};
+
 static struct clk exynos4_init_clocks_off[] = {
 	{
 		.name		= "timers",
@@ -470,36 +506,43 @@ static struct clk exynos4_init_clocks_off[] = {
 		.devname	= "s5p-mipi-csis.0",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 4),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "csis",
 		.devname	= "s5p-mipi-csis.1",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 5),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "jpeg",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 6),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "fimc",
 		.devname	= "exynos4-fimc.0",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "fimc",
 		.devname	= "exynos4-fimc.1",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 1),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "fimc",
 		.devname	= "exynos4-fimc.2",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 2),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "fimc",
 		.devname	= "exynos4-fimc.3",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
+		.parent		= &exynos4_clk_gate_cam,
 	}, {
 		.name		= "hsmmc",
 		.devname	= "s3c-sdhci.0",
@@ -534,31 +577,37 @@ static struct clk exynos4_init_clocks_off[] = {
 		.devname	= "s5p-sdo",
 		.enable		= exynos4_clk_ip_tv_ctrl,
 		.ctrlbit	= (1 << 2),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "mixer",
 		.devname	= "s5p-mixer",
 		.enable		= exynos4_clk_ip_tv_ctrl,
 		.ctrlbit	= (1 << 1),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "vp",
 		.devname	= "s5p-mixer",
 		.enable		= exynos4_clk_ip_tv_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "hdmi",
 		.devname	= "exynos4-hdmi",
 		.enable		= exynos4_clk_ip_tv_ctrl,
 		.ctrlbit	= (1 << 3),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "hdmiphy",
 		.devname	= "exynos4-hdmi",
 		.enable		= exynos4_clk_hdmiphy_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "dacphy",
 		.devname	= "s5p-sdo",
 		.enable		= exynos4_clk_dac_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_tv,
 	}, {
 		.name		= "adc",
 		.enable		= exynos4_clk_ip_peril_ctrl,
@@ -623,11 +672,13 @@ static struct clk exynos4_init_clocks_off[] = {
 		.name		= "fimg2d",
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_lcd0,
 	}, {
 		.name		= "mfc",
 		.devname	= "s5p-mfc",
 		.enable		= exynos4_clk_ip_mfc_ctrl,
 		.ctrlbit	= (1 << 0),
+		.parent		= &exynos4_clk_gate_mfc,
 	}, {
 		.name		= "i2c",
 		.devname	= "s3c2440-i2c.0",
@@ -795,6 +846,7 @@ static struct clk exynos4_clk_fimd0 = {
 	.devname	= "exynos4-fb.0",
 	.enable		= exynos4_clk_ip_lcd0_ctrl,
 	.ctrlbit	= (1 << 0),
+	.parent		= &exynos4_clk_gate_lcd0,
 };
 
 struct clk *exynos4_clkset_group_list[] = {
@@ -1565,6 +1617,8 @@ void __init exynos4_register_clocks(void)
 	s3c_register_clksrc(exynos4_clksrcs, ARRAY_SIZE(exynos4_clksrcs));
 	s3c_register_clocks(exynos4_init_clocks_on, ARRAY_SIZE(exynos4_init_clocks_on));
 
+	s3c24xx_register_clocks(exynos4_gate_clocks, ARRAY_SIZE(exynos4_gate_clocks));
+
 	s3c24xx_register_clocks(exynos4_clk_cdev, ARRAY_SIZE(exynos4_clk_cdev));
 	for (ptr = 0; ptr < ARRAY_SIZE(exynos4_clk_cdev); ptr++)
 		s3c_disable_clocks(exynos4_clk_cdev[ptr], 1);
-- 
1.7.1.569.g6f426
