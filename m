From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: Add additional clock definitions
Date: Mon, 19 Apr 2010 20:04:20 +0900
Message-ID: <1271675060-32046-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47204 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753941Ab0DSLH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Apr 2010 07:07:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Adds additional clock definitions for S5PV210 SoC.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/s5pv210-clock.c | 1611 ++++++++++++++++++++++++++++-----
 1 files changed, 1395 insertions(+), 216 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 8d51a10..5d60578 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -51,283 +51,1505 @@ static int s5pv210_clk_ip3_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
 }
 
-static struct clk clk_h200 = {
-	.name		= "hclk200",
-	.id		= -1,
+static int s5pv210_clk_ip4_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKGATE_IP4, clk, enable);
+}
+
+static int s5pv210_clk_block_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKGATE_BLOCK, clk, enable);
+}
+
+static int s5pv210_clk_mask0_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_SRC_MASK0, clk, enable);
+}
+
+static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_SRC_MASK1, clk, enable);
+}
+
+/* MOUT APLL */
+static struct clksrc_clk clk_mout_apll = {
+	.clk	= {
+		.name		= "mout_apll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_apll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
 };
 
-static struct clk clk_h100 = {
-	.name		= "hclk100",
-	.id		= -1,
+/* MOUT MPLL */
+static struct clksrc_clk clk_mout_mpll = {
+	.clk = {
+		.name		= "mout_mpll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_mpll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 4, .size = 1 },
 };
 
-static struct clk clk_h166 = {
-	.name		= "hclk166",
-	.id		= -1,
+/* MOUT EPLL */
+static struct clksrc_clk clk_mout_epll = {
+	.clk	= {
+		.name		= "mout_epll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_epll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 8, .size = 1 },
 };
 
-static struct clk clk_h133 = {
-	.name		= "hclk133",
+
+/* SCLK HDMI27M */
+static struct clk clk_sclk_hdmi27m = {
+	.name		= "sclk_hdmi27m",
 	.id		= -1,
 };
 
-static struct clk clk_p100 = {
-	.name		= "pclk100",
-	.id		= -1,
+/* VPLL Source Clock */
+static struct clk *clkset_vpllsrc_list[] = {
+	[0] = &clk_fin_epll,
+	[1] = &clk_sclk_hdmi27m,
 };
 
-static struct clk clk_p83 = {
-	.name		= "pclk83",
-	.id		= -1,
+static struct clksrc_sources clkset_vpllsrc = {
+	.sources	= clkset_vpllsrc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_vpllsrc_list),
+};
+
+static struct clksrc_clk clk_vpllsrc = {
+	.clk		= {
+		.name		= "vpll_src",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 7),
+	},
+	.sources	= &clkset_vpllsrc,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 28, .size = 1 },
+};
+
+/* MOUT VPLL */
+static struct clk *clkset_mout_vpll_list[] = {
+	[0] = &clk_vpllsrc.clk,
+	[1] = &clk_fout_epll,
+};
+
+static struct clksrc_sources clkset_mout_vpll = {
+	.sources	= clkset_mout_vpll_list,
+	.nr_sources	= ARRAY_SIZE(clkset_vpllsrc_list),
+};
+
+static struct clksrc_clk clk_mout_vpll = {
+	.clk		= {
+		.name		= "mout_vpll",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_vpll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 12, .size = 1 },
+};
+
+/* SCLK A2M */
+static struct clksrc_clk clk_sclk_a2m = {
+	.clk = {
+		.name		= "sclk_a2m",
+		.id		= -1,
+		.parent		= &clk_mout_apll.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 4, .size = 3 },
+};
+
+/* ARMCLK */
+static struct clk *clkset_armclk_list[] = {
+	[0] = &clk_mout_apll.clk,
+	[1] = &clk_mout_mpll.clk,
+};
+
+static struct clksrc_sources clkset_armclk = {
+	.sources	= clkset_armclk_list,
+	.nr_sources	= ARRAY_SIZE(clkset_armclk_list),
+};
+
+static struct clksrc_clk clk_armclk = {
+	.clk	= {
+		.name		= "armclk",
+		.id		= -1,
+	},
+	.sources	= &clkset_armclk,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 16, .size = 1 },
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 0, .size = 3 },
+};
+
+/* HCLK200 */
+static struct clksrc_clk clk_hclk_200 = {
+	.clk	= {
+		.name		= "hclk_200",
+		.id		= -1,
+		.parent		= &clk_armclk.clk,
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 8, .size = 3 },
+};
+
+/* PCLK100 */
+static struct clksrc_clk clk_pclk_100 = {
+	.clk	= {
+		.name		= "pclk_100",
+		.id		= -1,
+		.parent		= &clk_hclk_200.clk,
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 12, .size = 3 },
+};
+
+/* MOUT166 */
+static struct clk *clkset_mout_166_list[] = {
+	[0] = &clk_mout_mpll.clk,
+	[1] = &clk_sclk_a2m.clk,
+};
+
+static struct clksrc_sources clkset_mout_166 = {
+	.sources	= clkset_mout_166_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_166_list),
+};
+
+static struct clksrc_clk clk_mout_166 = {
+	.clk	= {
+		.name		= "mout_166",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_166,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 20, .size = 1 },
+};
+
+/* HCLK166 */
+static struct clksrc_clk clk_hclk_166 = {
+	.clk	= {
+		.name		= "hclk_166",
+		.id		= -1,
+		.parent		= &clk_mout_166.clk,
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 16, .size = 4 },
+};
+
+
+/* PCLK83 */
+static struct clksrc_clk clk_pclk_83 = {
+	.clk	= {
+		.name		= "pclk_83",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 20, .size = 3 },
+};
+
+/* HCLK133 */
+static struct clksrc_clk clk_hclk_133 = {
+	.clk	= {
+		.name		= "hclk_133",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_166,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 24, .size = 1 },
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 24, .size = 4 },
+};
+
+/* PCLK66 */
+static struct clksrc_clk clk_pclk_66 = {
+	.clk	= {
+		.name		= "pclk_66",
+		.id		= -1,
+		.parent		= &clk_hclk_133.clk,
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 28, .size = 3 },
+};
+
+/* SCLK ONENAND */
+static struct clk *clkset_sclk_onenand_list[] = {
+	[0] = &clk_hclk_133.clk,
+	[1] = &clk_mout_166.clk,
+};
+
+static struct clksrc_sources clkset_sclk_onenand = {
+	.sources	= clkset_sclk_onenand_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_onenand_list),
+};
+
+/* SCLK USBPHY 0 */
+static struct clk clk_sclk_usbphy0 = {
+	.name		= "sclk_usbphy",
+	.id		= 0,
 };
 
-static struct clk clk_p66 = {
-	.name		= "pclk66",
+/* SCLK USBPHY 1 */
+static struct clk clk_sclk_usbphy1 = {
+	.name		= "sclk_usbphy",
+	.id		= 1,
+};
+
+/* SCLK HDMIPHY */
+static struct clk clk_sclk_hdmiphy = {
+	.name		= "sclk_hdmiphy",
 	.id		= -1,
 };
 
-static struct clk *sys_clks[] = {
-	&clk_h200,
-	&clk_h100,
-	&clk_h166,
-	&clk_h133,
-	&clk_p100,
-	&clk_p83,
-	&clk_p66
+/* PCMCDCLK0 */
+static struct clk clk_pcmcdclk0 = {
+	.name		= "pcmcdclk",
+	.id		= 0,
+};
+
+/* PCMCDCLK1 */
+static struct clk clk_pcmcdclk1 = {
+	.name		= "pcmcdclk",
+	.id		= 1,
+};
+
+/* SCLK DAC */
+static struct clk *clkset_sclk_dac_list[] = {
+	[0] = &clk_mout_vpll.clk,
+	[1] = &clk_sclk_hdmiphy,
+};
+
+static struct clksrc_sources clkset_sclk_dac = {
+	.sources	= clkset_sclk_dac_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_dac_list),
+};
+
+static struct clksrc_clk clk_sclk_dac = {
+	.clk		= {
+		.name		= "sclk_dac",
+		.id		= -1,
+		.ctrlbit	= (1 << 10),
+		.enable		= s5pv210_clk_ip1_ctrl,
+	},
+	.sources	= &clkset_sclk_dac,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 8, .size = 1 },
+};
+
+/* SCLK PIXEL */
+static struct clksrc_clk clk_sclk_pixel = {
+	.clk		= {
+		.name		= "sclk_pixel",
+		.id		= -1,
+		.parent		= &clk_mout_vpll.clk,
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV1, .shift = 0, .size = 4},
+};
+
+/* SCLK HDMI */
+static struct clk *clkset_sclk_hdmi_list[] = {
+	[0] = &clk_sclk_pixel.clk,
+	[1] = &clk_sclk_hdmiphy,
+};
+
+static struct clksrc_sources clkset_sclk_hdmi = {
+	.sources	= clkset_sclk_hdmi_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_hdmi_list),
+};
+
+static struct clksrc_clk clk_sclk_hdmi = {
+	.clk		= {
+		.name		= "sclk_hdmi",
+		.id		= -1,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 11),
+	},
+	.sources	= &clkset_sclk_hdmi,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 0, .size = 1 },
+};
+
+/* SCLK MIXER */
+static struct clk *clkset_sclk_mixer_list[] = {
+	[0] = &clk_sclk_dac.clk,
+	[1] = &clk_sclk_hdmi.clk,
+};
+
+static struct clksrc_sources clkset_sclk_mixer = {
+	.sources	= clkset_sclk_mixer_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_mixer_list),
+};
+
+/* Clock Source Group 1 */
+static struct clk *clkset_group1_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &clk_xusbxti,
+	[2] = &clk_sclk_hdmi27m,
+	[3] = &clk_sclk_usbphy0,
+	[4] = &clk_sclk_usbphy1,
+	[5] = &clk_sclk_hdmiphy,
+	[6] = &clk_mout_mpll.clk,
+	[7] = &clk_mout_epll.clk,
+	[8] = &clk_mout_vpll.clk,
+};
+
+static struct clksrc_sources clkset_group1 = {
+	.sources	= clkset_group1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_group1_list),
+};
+
+/* Clock sources for Audio 1 SCLK */
+static struct clk *clkset_mout_audio1_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &clk_pcmcdclk1,
+	[2] = &clk_sclk_hdmi27m,
+	[3] = &clk_sclk_usbphy0,
+	[4] = &clk_sclk_usbphy1,
+	[5] = &clk_sclk_hdmiphy,
+	[6] = &clk_mout_mpll.clk,
+	[7] = &clk_mout_epll.clk,
+	[8] = &clk_mout_vpll.clk,
+};
+
+static struct clksrc_sources clkset_mout_audio1 = {
+	.sources	= clkset_mout_audio1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_audio1_list),
+};
+
+/* Clock sources for Audio 2 SCLK */
+static struct clk *clkset_mout_audio2_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &clk_pcmcdclk0,
+	[2] = &clk_sclk_hdmi27m,
+	[3] = &clk_sclk_usbphy0,
+	[4] = &clk_sclk_usbphy1,
+	[5] = &clk_sclk_hdmiphy,
+	[6] = &clk_mout_mpll.clk,
+	[7] = &clk_mout_epll.clk,
+	[8] = &clk_mout_vpll.clk,
+};
+
+static struct clksrc_sources clkset_mout_audio2 = {
+	.sources	= clkset_mout_audio2_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_audio2_list),
+};
+
+/* Clock Source Group 2 */
+static struct clk *clkset_group2_list[] = {
+	[0] = &clk_sclk_a2m.clk,
+	[1] = &clk_mout_mpll.clk,
+	[2] = &clk_mout_epll.clk,
+	[3] = &clk_mout_vpll.clk,
+};
+
+static struct clksrc_sources clkset_group2 = {
+	.sources	= clkset_group2_list,
+	.nr_sources	= ARRAY_SIZE(clkset_group2_list),
+};
+
+/* MOUT CAM0 */
+static struct clksrc_clk clk_mout_cam0 = {
+	.clk		= {
+		.name		= "mout_cam",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 3),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 12, .size = 4 },
+};
+
+/* MOUT CAM1 */
+static struct clksrc_clk clk_mout_cam1 = {
+	.clk		= {
+		.name		= "mout_cam",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 16, .size = 4 },
+};
+
+/* MOUT FIMD */
+static struct clksrc_clk clk_mout_fimd = {
+	.clk		= {
+		.name		= "mout_fimd",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 5),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 20, .size = 4 },
+};
+
+/* MOUT MMC0 */
+static struct clksrc_clk clk_mout_mmc0 = {
+	.clk		= {
+		.name		= "mout_mmc",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 0, .size = 4 },
+};
+
+/* MOUT MMC1 */
+static struct clksrc_clk clk_mout_mmc1 = {
+	.clk		= {
+		.name		= "mout_mmc",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 9),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 4, .size = 4 },
+};
+
+/* MOUT MMC2 */
+static struct clksrc_clk clk_mout_mmc2 = {
+	.clk		= {
+		.name		= "mout_mmc",
+		.id		= 2,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 10),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 8, .size = 4 },
+};
+
+
+/* MOUT MMC3 */
+static struct clksrc_clk clk_mout_mmc3 = {
+	.clk		= {
+		.name		= "mout_mmc",
+		.id		= 3,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 11),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 12, .size = 4 },
+};
+
+/* MOUT AUDIO 0 */
+static struct clksrc_clk clk_mout_audio0 = {
+	.clk		= {
+		.name		= "mout_audio",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 24),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 0, .size = 4 },
+};
+
+/* SCLK AUDIO 0 */
+static struct clksrc_clk clk_sclk_audio0 = {
+	.clk		= {
+		.name		= "sclk_audio",
+		.id		= 0,
+		.parent		= &clk_mout_audio0.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV6, .shift = 0, .size = 4 },
+};
+
+/* MOUT AUDIO 1 */
+static struct clksrc_clk clk_mout_audio1 = {
+	.clk		= {
+		.name		= "mout_audio",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 25),
+	},
+	.sources	= &clkset_mout_audio1,
+	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 4, .size = 4 },
+};
+
+/* SCLK AUDIO 1 */
+static struct clksrc_clk clk_sclk_audio1 = {
+	.clk		= {
+		.name		= "sclk_audio",
+		.id		= 1,
+		.parent		= &clk_mout_audio1.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 5),
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV6, .shift = 4, .size = 4 },
+};
+
+/* MOUT AUDIO 2 */
+static struct clksrc_clk clk_mout_audio2 = {
+	.clk		= {
+		.name		= "mout_audio",
+		.id		= 2,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 26),
+	},
+	.sources	= &clkset_mout_audio2,
+	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 8, .size = 4 },
+};
+
+/* SCLK AUDIO 2 */
+static struct clksrc_clk clk_sclk_audio2 = {
+	.clk		= {
+		.name		= "sclk_audio",
+		.id		= 2,
+		.parent		= &clk_mout_audio2.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 6),
+	},
+	.reg_div	= { .reg = S5P_CLK_DIV6, .shift = 8, .size = 4 },
+};
+
+/* MOUT FIMC LCLK 0 */
+static struct clksrc_clk clk_mout_fimc_lclk0 = {
+	.clk		= {
+		.name		= "mout_fimc_lclk",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 2),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC3, .shift = 12, .size = 4 },
+};
+
+/* MOUT FIMC LCLK 1 */
+static struct clksrc_clk clk_mout_fimc_lclk1 = {
+	.clk		= {
+		.name		= "mout_fimc_lclk",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 3),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC3, .shift = 16, .size = 4 },
+};
+
+/* MOUT FIMC LCLK 2 */
+static struct clksrc_clk clk_mout_fimc_lclk2 = {
+	.clk		= {
+		.name		= "mout_fimc_lclk",
+		.id		= 2,
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC3, .shift = 20, .size = 4 },
+};
+
+/* MOUT CSIS */
+static struct clksrc_clk clk_mout_csis = {
+	.clk		= {
+		.name		= "mout_csis",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 6),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC1, .shift = 24, .size = 4 },
+};
+
+/* MOUT SPI 0 */
+static struct clksrc_clk clk_mout_spi0 = {
+	.clk		= {
+		.name		= "mout_spi",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 16),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC5, .shift = 0, .size = 4 },
+};
+
+/* MOUT SPI 1 */
+static struct clksrc_clk clk_mout_spi1 = {
+	.clk		= {
+		.name		= "mout_spi",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 17),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC5, .shift = 4, .size = 4 },
+};
+
+/* MOUT PWI */
+static struct clksrc_clk clk_mout_pwi = {
+	.clk		= {
+		.name		= "mout_pwi",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 29),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 20, .size = 4 },
+};
+
+/* MOUT UART 0 */
+static struct clksrc_clk clk_mout_uart0 = {
+	.clk		= {
+		.name		= "mout_uart",
+		.id		= 0,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 12),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 16, .size = 4 },
+};
+
+/* MOUT UART 1 */
+static struct clksrc_clk clk_mout_uart1 = {
+	.clk		= {
+		.name		= "mout_uart",
+		.id		= 1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 13),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 20, .size = 4 },
+};
+
+/* MOUT UART 2 */
+static struct clksrc_clk clk_mout_uart2 = {
+	.clk		= {
+		.name		= "mout_uart",
+		.id		= 2,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 14),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 24, .size = 4 },
+};
+
+/* MOUT UART 3 */
+static struct clksrc_clk clk_mout_uart3 = {
+	.clk		= {
+		.name		= "mout_uart",
+		.id		= 3,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 15),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC4, .shift = 28, .size = 4 },
+};
+
+/* MOUT PWM */
+static struct clksrc_clk clk_mout_pwm = {
+	.clk		= {
+		.name		= "mout_pwm",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 19),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC5, .shift = 12, .size = 4 },
+};
+
+/* SCLK SPDIF */
+static struct clk *clkset_sclk_spdif_list[] = {
+	[0] = &clk_sclk_audio0.clk,
+	[1] = &clk_sclk_audio1.clk,
+	[2] = &clk_sclk_audio2.clk,
+};
+
+static struct clksrc_sources clkset_sclk_spdif = {
+	.sources	= clkset_sclk_spdif_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_spdif_list),
+};
+
+/* MOUT MDNIE */
+static struct clksrc_clk clk_mout_mdnie = {
+	.clk		= {
+		.name		= "mout_mdnie",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 0),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC3, .shift = 0, .size = 4 },
+};
+
+/* MOUT MDNIE PWM */
+static struct clksrc_clk clk_mout_mdnie_pwm = {
+	.clk		= {
+		.name		= "mout_mdnie_pwm",
+		.id		= -1,
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 1),
+	},
+	.sources	= &clkset_group1,
+	.reg_src	= { .reg = S5P_CLK_SRC3, .shift = 4, .size = 4 },
+};
+
+/* COPY */
+static struct clk *clkset_copy_list[] = {
+	[6] = &clk_mout_apll.clk,
+	[7] = &clk_mout_mpll.clk,
+};
+
+static struct clksrc_sources clkset_copy = {
+	.sources	= clkset_copy_list,
+	.nr_sources	= ARRAY_SIZE(clkset_copy_list),
+};
+
+static struct clksrc_clk clk_copy = {
+	.clk		= {
+		.name		= "copy",
+		.id		= -1,
+	},
+	.sources	= &clkset_copy,
+	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 16, .size = 1 },
+	.reg_div	= { .reg = S5P_CLK_DIV6, .shift = 16, .size = 3 },
+};
+
+static struct clksrc_clk clksrcs[] = {
+	{
+		.clk	= {
+			.name		= "sclk_onenand",
+			.id		= -1,
+		},
+		.sources = &clkset_sclk_onenand,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 28, .size = 1 },
+		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 12, .size = 3 },
+	}, {
+		.clk	= {
+			.name		= "sclk_fimc",
+			.id		= -1,
+			.parent		= &clk_mout_166.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 8, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "sclk_mixer",
+			.id		= -1,
+			.enable 	= s5pv210_clk_ip1_ctrl,
+			.ctrlbit	= (1 << 9),
+		},
+		.sources = &clkset_sclk_mixer,
+		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
+	}, {
+		.clk		= {
+			.name		= "sclk_cam",
+			.id		= 0,
+			.parent		= &clk_mout_cam0.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 12, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_cam",
+			.id		= 1,
+			.parent		= &clk_mout_cam1.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 16, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_fimd",
+			.id		= -1,
+			.parent		= &clk_mout_fimd.clk,
+			.enable		= s5pv210_clk_ip1_ctrl,
+			.ctrlbit	= (1 << 0),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 20, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mmc",
+			.id		= 0,
+			.parent		= &clk_mout_mmc0.clk,
+			.enable		= s5pv210_clk_ip2_ctrl,
+			.ctrlbit	= (1 << 16),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mmc",
+			.id		= 1,
+			.parent		= &clk_mout_mmc1.clk,
+			.enable		= s5pv210_clk_ip2_ctrl,
+			.ctrlbit	= (1 << 17),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 4, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mmc",
+			.id		= 2,
+			.parent		= &clk_mout_mmc2.clk,
+			.enable		= s5pv210_clk_ip2_ctrl,
+			.ctrlbit	= (1 << 18),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 8, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mmc",
+			.id		= 3,
+			.parent		= &clk_mout_mmc3.clk,
+			.enable		= s5pv210_clk_ip2_ctrl,
+			.ctrlbit	= (1 << 19),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 12, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_fimc_lclk",
+			.id		= 0,
+			.parent		= &clk_mout_fimc_lclk0.clk,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 24),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 12, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_fimc_lclk",
+			.id		= 1,
+			.parent		= &clk_mout_fimc_lclk1.clk,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 25),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 16, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_fimc_lclk",
+			.id		= 2,
+			.parent		= &clk_mout_fimc_lclk2.clk,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 26),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 20, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_onedram",
+			.id		= -1,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 1),
+		},
+		.sources = &clkset_group2,
+		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 24, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 28, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mfc",
+			.id		= -1,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 16),
+		},
+		.sources = &clkset_group2,
+		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 4, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_g2d",
+			.id		= -1,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 12),
+		},
+		.sources = &clkset_group2,
+		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 8, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 8, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_g3d",
+			.id		= -1,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 8),
+		},
+		.sources = &clkset_group2,
+		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 0, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_csis",
+			.id		= -1,
+			.parent		= &clk_mout_csis.clk,
+			.enable		= s5pv210_clk_ip0_ctrl,
+			.ctrlbit	= (1 << 31),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 28, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_spi",
+			.id		= 0,
+			.parent		= &clk_mout_spi0.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 12),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_spi",
+			.id		= 1,
+			.parent		= &clk_mout_spi1.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 13),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 4, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_spi",
+			.id		= 2,
+			.enable		= &s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 14),
+		},
+		.sources = &clkset_group1,
+		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 8, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_pwi",
+			.id		= -1,
+			.parent		= &clk_mout_pwi.clk,
+			.enable		= &s5pv210_clk_ip4_ctrl,
+			.ctrlbit	= (1 << 2),
+		},
+		.sources = &clkset_group1,
+		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 24, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_uart",
+			.id		= 0,
+			.parent		= &clk_mout_uart0.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 17),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_uart",
+			.id		= 1,
+			.parent		= &clk_mout_uart1.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 18),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 20, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_uart",
+			.id		= 2,
+			.parent		= &clk_mout_uart2.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 19),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 24, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_uart",
+			.id		= 3,
+			.parent		= &clk_mout_uart3.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 20),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 28, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_pwm",
+			.id		= -1,
+			.parent		= &clk_mout_pwm.clk,
+			.enable		= s5pv210_clk_ip3_ctrl,
+			.ctrlbit	= (1 << 23),
+		},
+		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 12, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_spdif",
+			.id		= -1,
+			.enable		= s5pv210_clk_mask0_ctrl,
+			.ctrlbit	= (1 << 27),
+		},
+		.sources = &clkset_sclk_spdif,
+		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 12, .size = 2 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mdnie",
+			.id		= -1,
+			.parent		= &clk_mout_mdnie.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
+			.name		= "sclk_mdnie_pwm",
+			.id		= -1,
+			.parent		= &clk_mout_mdnie_pwm.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 4, .size = 7 },
+	}, {
+		.clk		= {
+			.name		= "sclk_hpm",
+			.id		= -1,
+			.parent		= &clk_copy.clk,
+		},
+		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 20, .size = 3 },
+	},
 };
 
 static struct clk init_clocks_disable[] = {
 	{
+		.name		= "csis",
+		.id		= -1,
+		.parent		= &clk_pclk_83.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 31),
+	}, {
+		.name		= "ipc",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 30),
+	}, {
 		.name		= "rot",
 		.id		= -1,
-		.parent		= &clk_h166,
+		.parent		= &clk_hclk_166.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1<<29),
+		.ctrlbit	= (1 << 29),
 	}, {
-		.name		= "otg",
+		.name		= "jpeg",
 		.id		= -1,
-		.parent		= &clk_h133,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<16),
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "fimc",
+		.id		= 2,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
+		.name		= "fimc",
+		.id		= 1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 25),
+	}, {
+		.name		= "fimc",
+		.id		= 0,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 24),
+	}, {
+		.name		= "mfc",
+		.id		= -1,
+		.parent		= &clk_hclk_200.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
+		.name		= "g2d",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 12),
+	}, {
+		.name		= "g3d",
+		.id		= -1,
+		.parent		= &clk_hclk_200.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "pdma",
+		.id		= 1,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "pdma",
+		.id		= 0,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
+		.name		= "mdma",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 2),
 	}, {
-		.name		= "usb-host",
+		.name		= "nfcon",
 		.id		= -1,
-		.parent		= &clk_h133,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<17),
+		.ctrlbit	= (1 << 28),
 	}, {
-		.name		= "lcd",
+		.name		= "sromc",
 		.id		= -1,
-		.parent		= &clk_h166,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<0),
+		.ctrlbit	= (1 << 26),
 	}, {
 		.name		= "cfcon",
 		.id		= 0,
-		.parent		= &clk_h133,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 25),
+	}, {
+		.name		= "nandxl",
+		.id		= -1,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 24),
+	}, {
+		.name		= "usbhost",
+		.id		= -1,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 17),
+	}, {
+		.name		= "usbotg",
+		.id		= -1,
+		.parent		= &clk_hclk_133.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
+		.name		= "hdmi",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 11),
+	}, {
+		.name		= "tvenc",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 10),
+	}, {
+		.name		= "mixer",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 9),
+	}, {
+		.name		= "vp",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "dsim",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "mie",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "fimd",
+		.id		= -1,
+		.parent		= &clk_hclk_166.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<25),
+		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "hsmmc",
-		.id		= 0,
-		.parent		= &clk_h133,
+		.id		= 3,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<16),
+		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "hsmmc",
-		.id		= 1,
-		.parent		= &clk_h133,
+		.id		= 2,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<17),
+		.ctrlbit	= (1 < 18),
 	}, {
 		.name		= "hsmmc",
-		.id		= 2,
-		.parent		= &clk_h133,
+		.id		= 1,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<18),
+		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "hsmmc",
-		.id		= 3,
-		.parent		= &clk_h133,
+		.id		= 0,
+		.parent		= &clk_hclk_133.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<19),
+		.ctrlbit	= (1 << 16),
 	}, {
-		.name		= "systimer",
+		.name		= "timers",
 		.id		= -1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<16),
+		.ctrlbit	= (1 << 23),
 	}, {
-		.name		= "watchdog",
+		.name		= "pcm",
+		.id		= 2,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 30),
+	}, {
+		.name		= "pcm",
+		.id		= 1,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 29),
+	}, {
+		.name		= "pcm",
+		.id		= 0,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 28),
+	},  {
+		.name		= "adc",
 		.id		= -1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<22),
+		.ctrlbit	= (1 << 24),
 	}, {
-		.name		= "rtc",
+		.name		= "pwm",
 		.id		= -1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<15),
+		.ctrlbit	= (1 << 23),
 	}, {
-		.name		= "i2c",
-		.id		= 0,
-		.parent		= &clk_p66,
+		.name		= "watchdog",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<7),
+		.ctrlbit	= (1 << 22),
 	}, {
-		.name		= "i2c",
-		.id		= 1,
-		.parent		= &clk_p66,
+		.name		= "keypad",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<8),
+		.ctrlbit	= (1 << 21),
 	}, {
-		.name		= "i2c",
-		.id		= 2,
-		.parent		= &clk_p66,
+		.name		= "systimer",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
+		.name		= "rtc",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<9),
+		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "spi",
-		.id		= 0,
-		.parent		= &clk_p66,
+		.id		= 2,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<12),
+		.ctrlbit	= (1 << 14),
 	}, {
 		.name		= "spi",
 		.id		= 1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<13),
+		.ctrlbit	= (1 << 13),
 	}, {
 		.name		= "spi",
-		.id		= 2,
-		.parent		= &clk_p66,
+		.id		= 0,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<14),
+		.ctrlbit	= (1 << 12),
 	}, {
-		.name		= "timers",
+		.name		= "i2c-hdmiphy",
 		.id		= -1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_83.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<23),
+		.ctrlbit	= (1 << 11),
 	}, {
-		.name		= "adc",
-		.id		= -1,
-		.parent		= &clk_p66,
+		.name		= "i2c",
+		.id		= 1,
+		.parent		= &clk_pclk_83.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<24),
+		.ctrlbit	= (1 << 10),
 	}, {
-		.name		= "keypad",
-		.id		= -1,
-		.parent		= &clk_p66,
+		.name		= "i2c",
+		.id		= 2,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<21),
+		.ctrlbit	= (1 << 9),
 	}, {
-		.name		= "i2s_v50",
+		.name		= "i2c",
 		.id		= 0,
-		.parent		= &clk_p,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<4),
+		.ctrlbit	= (1 << 7),
 	}, {
-		.name		= "i2s_v32",
-		.id		= 0,
-		.parent		= &clk_p,
+		.name		= "i2s",
+		.id		= 2,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 6),
+	}, {
+		.name		= "i2s",
+		.id		= 2,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<4),
+		.ctrlbit	= (1 << 6),
 	}, {
-		.name		= "i2s_v32",
+		.name		= "i2s",
 		.id		= 1,
-		.parent		= &clk_p,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<4),
-	}
+		.ctrlbit	= (1 << 5),
+	}, {
+		.name		= "i2s",
+		.id		= 0,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "ac97",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "spdif",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 0),
+	},
 };
 
 static struct clk init_clocks[] = {
 	{
 		.name		= "uart",
 		.id		= 0,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<7),
+		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "uart",
 		.id		= 1,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<8),
+		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "uart",
 		.id		= 2,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<9),
+		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "uart",
 		.id		= 3,
-		.parent		= &clk_p66,
+		.parent		= &clk_pclk_66.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<10),
-	},
-};
-
-static struct clksrc_clk clk_mout_apll = {
-	.clk	= {
-		.name		= "mout_apll",
+		.ctrlbit	= (1 << 20),
+	}, {
+		.name		= "dmc",
+		.id		= 1,
+		.parent		= &clk_hclk_200.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "dmc",
+		.id		= 0,
+		.parent		= &clk_hclk_200.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "syscon",
 		.id		= -1,
-	},
-	.sources	= &clk_src_apll,
-	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
-};
-
-static struct clksrc_clk clk_mout_epll = {
-	.clk	= {
-		.name		= "mout_epll",
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 27),
+	}, {
+		.name		= "gpio",
 		.id		= -1,
-	},
-	.sources	= &clk_src_epll,
-	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 8, .size = 1 },
-};
-
-static struct clksrc_clk clk_mout_mpll = {
-	.clk = {
-		.name		= "mout_mpll",
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
+		.name		= "chipid",
+		.id		= -1,
+		.parent		= &clk_pclk_66.clk,
+		.enable		= s5pv210_clk_ip4_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "block_intc",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 10),
+	}, {
+		.name		= "block_hsmmc",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 9),
+	}, {
+		.name		= "block_debug",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "block_security",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 7),
+	}, {
+		.name		= "block_memory",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 6),
+	}, {
+		.name		= "block_usb",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 5),
+	}, {
+		.name		= "block_tv",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "block_lcd",
 		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
+		.name		= "block_img",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "block_mfc",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "block_g3d",
+		.id		= -1,
+		.enable		= s5pv210_clk_block_ctrl,
+		.ctrlbit	= (1 << 0),
 	},
-	.sources	= &clk_src_mpll,
-	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 4, .size = 1 },
-};
-
-static struct clk *clkset_uart_list[] = {
-	[6] = &clk_mout_mpll.clk,
-	[7] = &clk_mout_epll.clk,
-};
-
-static struct clksrc_sources clkset_uart = {
-	.sources	= clkset_uart_list,
-	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
 };
 
-static struct clksrc_clk clksrcs[] = {
-	{
-		.clk	= {
-			.name		= "uclk1",
-			.id		= -1,
-			.ctrlbit	= (1<<17),
-			.enable		= s5pv210_clk_ip3_ctrl,
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 16, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
-	}
-};
-
-/* Clock initialisation code */
-static struct clksrc_clk *init_parents[] = {
+static struct clksrc_clk *sys_clksrc[] = {
 	&clk_mout_apll,
 	&clk_mout_epll,
 	&clk_mout_mpll,
+	&clk_armclk,
+	&clk_mout_166,
+	&clk_sclk_a2m,
+	&clk_hclk_200,
+	&clk_pclk_100,
+	&clk_hclk_166,
+	&clk_pclk_83,
+	&clk_hclk_133,
+	&clk_pclk_66,
+	&clk_vpllsrc,
+	&clk_mout_vpll,
+	&clk_sclk_dac,
+	&clk_sclk_pixel,
+	&clk_sclk_hdmi,
+	&clk_mout_cam0,
+	&clk_mout_cam1,
+	&clk_mout_fimd,
+	&clk_mout_mmc0,
+	&clk_mout_mmc1,
+	&clk_mout_mmc2,
+	&clk_mout_mmc3,
+	&clk_mout_audio0,
+	&clk_sclk_audio0,
+	&clk_mout_audio1,
+	&clk_sclk_audio1,
+	&clk_mout_audio2,
+	&clk_sclk_audio2,
+	&clk_mout_fimc_lclk0,
+	&clk_mout_fimc_lclk1,
+	&clk_mout_fimc_lclk2,
+	&clk_mout_csis,
+	&clk_mout_spi0,
+	&clk_mout_spi1,
+	&clk_mout_pwi,
+	&clk_mout_uart0,
+	&clk_mout_uart1,
+	&clk_mout_uart2,
+	&clk_mout_uart3,
+	&clk_mout_pwm,
+	&clk_mout_mdnie,
+	&clk_mout_mdnie_pwm,
+	&clk_copy,
 };
 
 #define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
@@ -336,17 +1558,9 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 {
 	struct clk *xtal_clk;
 	unsigned long xtal;
-	unsigned long armclk;
-	unsigned long hclk200;
-	unsigned long hclk166;
-	unsigned long hclk133;
-	unsigned long pclk100;
-	unsigned long pclk83;
-	unsigned long pclk66;
 	unsigned long apll;
 	unsigned long mpll;
 	unsigned long epll;
-	unsigned int ptr;
 	u32 clkdiv0, clkdiv1;
 
 	printk(KERN_DEBUG "%s: registering clocks\n", __func__);
@@ -369,58 +1583,24 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
 	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
 
-	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld",
+	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld\n",
 			apll, mpll, epll);
 
-	armclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_APLL);
-	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX200_MASK)
-		hclk200 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK200);
-	else
-		hclk200 = armclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK200);
-
-	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX166_MASK) {
-		hclk166 = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
-		hclk166 = hclk166 / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK166);
-	} else
-		hclk166 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK166);
-
-	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX133_MASK) {
-		hclk133 = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
-		hclk133 = hclk133 / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK133);
-	} else
-		hclk133 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK133);
-
-	pclk100 = hclk200 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK100);
-	pclk83 = hclk166 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK83);
-	pclk66 = hclk133 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK66);
-
-	printk(KERN_INFO "S5PV210: ARMCLK=%ld, HCLKM=%ld, HCLKD=%ld, \
-			HCLKP=%ld, PCLKM=%ld, PCLKD=%ld, PCLKP=%ld\n",
-	       armclk, hclk200, hclk166, hclk133, pclk100, pclk83, pclk66);
-
 	clk_fout_apll.rate = apll;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
 
-	clk_f.rate = armclk;
-	clk_h.rate = hclk133;
-	clk_p.rate = pclk66;
-	clk_p66.rate = pclk66;
-	clk_p83.rate = pclk83;
-	clk_h133.rate = hclk133;
-	clk_h166.rate = hclk166;
-	clk_h200.rate = hclk200;
-
-	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
-		s3c_set_clksrc(init_parents[ptr], true);
-
-	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_set_clksrc(&clksrcs[ptr], true);
+	clk_f.rate = clk_get_rate(&clk_armclk.clk);
+	clk_h.rate = clk_get_rate(&clk_hclk_133.clk);
+	clk_p.rate = clk_get_rate(&clk_pclk_66.clk);
 }
 
 static struct clk *clks[] __initdata = {
-	&clk_mout_epll.clk,
-	&clk_mout_mpll.clk,
+	&clk_sclk_usbphy0,
+	&clk_sclk_usbphy1,
+	&clk_sclk_hdmiphy,
+	&clk_pcmcdclk0,
+	&clk_pcmcdclk1,
 };
 
 void __init s5pv210_register_clocks(void)
@@ -436,9 +1616,8 @@ void __init s5pv210_register_clocks(void)
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
-	ret = s3c24xx_register_clocks(sys_clks, ARRAY_SIZE(sys_clks));
-	if (ret > 0)
-		printk(KERN_ERR "Failed to register system clocks\n");
+	for (ptr = 0; ptr < ARRAY_SIZE(sys_clksrc); ptr++)
+		s3c_register_clksrc(sys_clksrc[ptr], 1);
 
 	clkp = init_clocks_disable;
 	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
-- 
1.6.3.3
