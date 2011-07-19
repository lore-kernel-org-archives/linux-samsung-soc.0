From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/8] ARM: S5PV210: add support for TV device
Date: Tue, 19 Jul 2011 10:44:26 +0200
Message-ID: <1311065067-20324-8-git-send-email-m.szyprowski@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46451 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752575Ab1GSIoj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 04:44:39 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOK004TYOA9UQ@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:33 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOK00G6KOA83S@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
In-reply-to: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds clocks and definitions needed by TV driver
infrastructure for Samsung S5PV210 platform.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c                   |  156 +++++++++++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                     |    4 +
 arch/arm/mach-s5pv210/include/mach/irqs.h       |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h        |   16 +++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    7 +-
 5 files changed, 171 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index f41ee26..d1025e2 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -174,6 +174,17 @@ static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLK_SRC_MASK1, clk, enable);
 }
 
+static int exynos4_clk_hdmiphy_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_HDMI_PHY_CONTROL, clk, enable);
+}
+
+static int exynos4_clk_dac_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_DAC_PHY_CONTROL, clk, enable);
+}
+
+
 static struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
 	.rate		= 27000000,
@@ -330,6 +341,40 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
+		.name		= "dac",
+		.devname	= "s5p-sdo",
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 10),
+	}, {
+		.name		= "mixer",
+		.devname	= "s5p-mixer",
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 9),
+	}, {
+		.name		= "vp",
+		.devname	= "s5p-mixer",
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 8),
+	}, {
+		.name		= "hdmi",
+		.devname	= "s5pv210-hdmi",
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 11),
+	}, {
+		.name		= "hdmiphy",
+		.devname	= "s5pv210-hdmi",
+		.enable		= exynos4_clk_hdmiphy_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "dacphy",
+		.devname	= "s5p-sdo",
+		.enable		= exynos4_clk_dac_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "otg",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
@@ -600,6 +645,26 @@ static struct clksrc_sources clkset_sclk_mixer = {
 	.nr_sources	= ARRAY_SIZE(clkset_sclk_mixer_list),
 };
 
+static struct clksrc_clk clk_sclk_mixer = {
+	.clk		= {
+		.name		= "sclk_mixer",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 1),
+	},
+	.sources = &clkset_sclk_mixer,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
+};
+
+static struct clksrc_clk *sclk_tv[] = {
+	&clk_sclk_dac,
+	&clk_sclk_pixel,
+	&clk_sclk_hdmi,
+	&clk_sclk_mixer,
+	NULL,
+};
+
+/* -------------------------------------------- */
+
 static struct clk *clkset_sclk_audio0_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = &clk_pcmcdclk0,
@@ -783,14 +848,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 28, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "sclk_mixer",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 1),
-		},
-		.sources = &clkset_sclk_mixer,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
-	}, {
-		.clk	= {
 			.name		= "sclk_fimc",
 			.devname	= "s5pv210-fimc.0",
 			.enable		= s5pv210_clk_mask1_ctrl,
@@ -981,9 +1038,6 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_pclk_psys,
 	&clk_vpllsrc,
 	&clk_sclk_vpll,
-	&clk_sclk_dac,
-	&clk_sclk_pixel,
-	&clk_sclk_hdmi,
 	&clk_mout_dmc0,
 	&clk_sclk_dmc0,
 	&clk_sclk_audio0,
@@ -1068,6 +1122,81 @@ static struct clk_ops s5pv210_epll_ops = {
 	.get_rate = s5p_epll_get_rate,
 };
 
+struct vpll_div_data {
+	u32 rate;
+	u32 pdiv;
+	u32 mdiv;
+	u32 sdiv;
+	u32 k;
+	u32 mfr;
+	u32 mrr;
+	u32 vsel;
+
+};
+
+static struct vpll_div_data vpll_div[] = {
+	{  54000000, 3, 53, 3, 1024, 0, 17, 0 },
+	{ 108000000, 3, 53, 2, 1024, 0, 17, 0 },
+};
+
+static unsigned long s5pv210_vpll_get_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+static int s5pv210_vpll_set_rate(struct clk *clk, unsigned long rate)
+{
+	unsigned int vpll_con0, vpll_con1;
+	unsigned int i;
+
+	/* Return if nothing changed */
+	if (clk->rate == rate)
+		return 0;
+
+	vpll_con0 = __raw_readl(S5P_VPLL_CON0);
+	vpll_con0 &= ~(0x1 << 27 |					\
+			PLL90XX_MDIV_MASK << PLL90XX_MDIV_SHIFT |	\
+			PLL90XX_PDIV_MASK << PLL90XX_PDIV_SHIFT |	\
+			PLL90XX_SDIV_MASK << PLL90XX_SDIV_SHIFT);
+
+	vpll_con1 = __raw_readl(S5P_VPLL_CON1);
+	vpll_con1 &= ~(0x1f << 24 |	\
+			0x3f << 16 |	\
+			0xfff << 0);
+
+	for (i = 0; i < ARRAY_SIZE(vpll_div); i++) {
+		if (vpll_div[i].rate == rate) {
+			vpll_con0 |= vpll_div[i].vsel << 27;
+			vpll_con0 |= vpll_div[i].pdiv << PLL90XX_PDIV_SHIFT;
+			vpll_con0 |= vpll_div[i].mdiv << PLL90XX_MDIV_SHIFT;
+			vpll_con0 |= vpll_div[i].sdiv << PLL90XX_SDIV_SHIFT;
+
+			vpll_con1 |= vpll_div[i].mrr << 24;
+			vpll_con1 |= vpll_div[i].mfr << 16;
+			vpll_con1 |= vpll_div[i].k << 0;
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(vpll_div)) {
+		printk(KERN_ERR "%s: Invalid Clock VPLL Frequency\n",
+				__func__);
+		return -EINVAL;
+	}
+
+	__raw_writel(vpll_con0, S5P_VPLL_CON0);
+	__raw_writel(vpll_con1, S5P_VPLL_CON1);
+
+	clk->rate = rate;
+
+	return 0;
+}
+
+static struct clk_ops s5pv210_vpll_ops = {
+	.get_rate = s5pv210_vpll_get_rate,
+	.set_rate = s5pv210_vpll_set_rate,
+};
+
 void __init_or_cpufreq s5pv210_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1116,6 +1245,7 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 	clk_fout_apll.ops = &clk_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
+	clk_fout_vpll.ops = &s5pv210_vpll_ops;
 	clk_fout_vpll.rate = vpll;
 
 	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld V=%ld",
@@ -1161,6 +1291,10 @@ void __init s5pv210_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	/* register TV clocks */
+	for (ptr = 0; sclk_tv[ptr]; ++ptr)
+		s3c_register_clksrc(sclk_tv[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 2b3fa1d..3096351 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -41,6 +41,7 @@
 #include <plat/keypad-core.h>
 #include <plat/sdhci.h>
 #include <plat/reset.h>
+#include <plat/tv-core.h>
 
 /* Initial IO mappings */
 
@@ -144,6 +145,9 @@ void __init s5pv210_map_io(void)
 
 	/* Use s5pv210-keypad instead of samsung-keypad */
 	samsung_keypad_setname("s5pv210-keypad");
+
+	/* setup TV devices */
+	s5p_hdmi_setname("s5pv210-hdmi");
 }
 
 void __init s5pv210_init_clocks(int xtal)
diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index b9f9ec3..b724d1e 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -86,7 +86,7 @@
 #define IRQ_HDMI		S5P_IRQ_VIC2(12)
 #define IRQ_IIC1		S5P_IRQ_VIC2(13)
 #define IRQ_MFC			S5P_IRQ_VIC2(14)
-#define IRQ_TVENC		S5P_IRQ_VIC2(15)
+#define IRQ_SDO			S5P_IRQ_VIC2(15)
 #define IRQ_I2S0		S5P_IRQ_VIC2(16)
 #define IRQ_I2S1		S5P_IRQ_VIC2(17)
 #define IRQ_I2S2		S5P_IRQ_VIC2(18)
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index bb405b3..1f2f3aa 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -91,6 +91,12 @@
 #define S5PV210_PA_FIMC1		0xFB300000
 #define S5PV210_PA_FIMC2		0xFB400000
 
+/* TV devices */
+#define S5PV210_PA_SDO			0xF9000000
+#define S5PV210_PA_VP			0xF9100000
+#define S5PV210_PA_MIXER		0xF9200000
+#define S5PV210_PA_HDMI			0xFA100000
+
 /* Compatibiltiy Defines */
 
 #define S3C_PA_FB			S5PV210_PA_FB
@@ -112,6 +118,16 @@
 #define S5P_PA_FIMC2			S5PV210_PA_FIMC2
 #define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
 #define S5P_PA_MFC			S5PV210_PA_MFC
+
+#define S5P_PA_SDO			S5PV210_PA_SDO
+#define S5P_SZ_SDO			SZ_64K
+#define S5P_PA_VP			S5PV210_PA_VP
+#define S5P_SZ_VP			SZ_64K
+#define S5P_PA_MIXER			S5PV210_PA_MIXER
+#define S5P_SZ_MIXER			SZ_64K
+#define S5P_PA_HDMI			S5PV210_PA_HDMI
+#define S5P_SZ_HDMI			SZ_1M
+
 #define S5P_PA_ONENAND			S5PC110_PA_ONENAND
 #define S5P_PA_ONENAND_DMA		S5PC110_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			S5PV210_PA_SDRAM
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
index 78925c5..69c16f9 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
@@ -26,7 +26,9 @@
 #define S5P_MPLL_CON		S5P_CLKREG(0x108)
 #define S5P_EPLL_CON		S5P_CLKREG(0x110)
 #define S5P_EPLL_CON1		S5P_CLKREG(0x114)
-#define S5P_VPLL_CON		S5P_CLKREG(0x120)
+#define S5P_VPLL_CON0		S5P_CLKREG(0x120)
+#define S5P_VPLL_CON		S5P_VPLL_CON0
+#define S5P_VPLL_CON1		S5P_CLKREG(0x120)
 
 #define S5P_CLK_SRC0		S5P_CLKREG(0x200)
 #define S5P_CLK_SRC1		S5P_CLKREG(0x204)
@@ -144,8 +146,9 @@
 
 #define S5P_OTHERS		S5P_CLKREG(0xE000)
 #define S5P_OM_STAT		S5P_CLKREG(0xE100)
+#define S5P_HDMI_PHY_CONTROL	S5P_CLKREG(0xE804)
 #define S5P_USB_PHY_CONTROL	S5P_CLKREG(0xE80C)
-#define S5P_DAC_CONTROL		S5P_CLKREG(0xE810)
+#define S5P_DAC_PHY_CONTROL	S5P_CLKREG(0xE810)
 #define S5P_MIPI_DPHY_CONTROL(x) S5P_CLKREG(0xE814)
 #define S5P_MIPI_DPHY_ENABLE	(1 << 0)
 #define S5P_MIPI_DPHY_SRESETN	(1 << 1)
-- 
1.7.1.569.g6f426
