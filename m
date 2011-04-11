From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 3/4] arm: exynos4: add s5p-tv
Date: Mon, 11 Apr 2011 14:18:54 +0200
Message-ID: <1302524335-29083-4-git-send-email-t.stanislaws@samsung.com>
References: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10456 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754455Ab1DKMTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 08:19:13 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LJH00I7LM80VS@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:12 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LJH0056QM7YIC@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:10 +0100 (BST)
In-reply-to: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

exynos4: fix and clean code for TV power
exynos4: tv: fix clock setup
exynos4: tv: integrate with Power Domain driver
exynos4: tv: register fix
exynos4: tv: add port HDMI_EN1 gpio to regulator api
exynos4: tv: use hdmiphy as clock
exynos4: tv: moved TV setup to separete function
exynos4: hdmi: removed control for clocks and regulators
exynos4: mixer: removed control for clocks and regulators
exynos4: tv: fix regulator name to tv_core
exynos4: phy: add phy for DAC
exynos4: clk: add set/get rate for fout_vpll
exynos4: tv: fix platform data
exynos4: tv: add SDO to platform devices
exynos4: tv: add vdet regulator for SDO
exynos4: clock: fix TV clock gating
exynos4: tv: remove usage of platform data
---
 arch/arm/mach-exynos4/Kconfig                   |    5 +
 arch/arm/mach-exynos4/Makefile                  |    1 +
 arch/arm/mach-exynos4/clock.c                   |  217 ++++++++++++++++++++++-
 arch/arm/mach-exynos4/dev-tv.c                  |  114 ++++++++++++
 arch/arm/mach-exynos4/include/mach/irqs.h       |    4 +
 arch/arm/mach-exynos4/include/mach/map.h        |   26 +++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    1 +
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
 arch/arm/plat-samsung/include/plat/devs.h       |    5 +
 9 files changed, 378 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/dev-tv.c

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 544a594..0f830b8 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -35,6 +35,11 @@ config EXYNOS4_DEV_SYSMMU
 	help
 	  Common setup code for SYSTEM MMU in EXYNOS4
 
+config EXYNOS4_DEV_TV
+	bool
+	help
+	  Compile in platform device definition for TV interface
+
 config EXYNOS4_SETUP_I2C1
 	bool
 	help
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 9be104f..61c9cfe 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -42,6 +42,7 @@ obj-y					+= dev-audio.o
 obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
 obj-$(CONFIG_EXYNOS4_DEV_PD)		+= dev-pd.o
 obj-$(CONFIG_EXYNOS4_DEV_SYSMMU)	+= dev-sysmmu.o
+obj-$(CONFIG_EXYNOS4_DEV_TV)		+= dev-tv.o
 
 obj-$(CONFIG_EXYNOS4_SETUP_FIMC)	+= setup-fimc.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C1)	+= setup-i2c1.o
diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 40a231a..84347f5 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -87,6 +87,11 @@ static int exynos4_clk_ip_mfc_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP_MFC, clk, enable);
 }
 
+static int exynos4_clksrc_mask_tv_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKSRC_MASK_TV, clk, enable);
+}
+
 static int exynos4_clk_ip_cam_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLKGATE_IP_CAM, clk, enable);
@@ -132,6 +137,16 @@ static int exynos4_clk_ip_dmc_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP_DMC, clk, enable);
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
 /* Core list of CMU_CPU side */
 
 static struct clksrc_clk clk_mout_apll = {
@@ -478,6 +493,36 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
+		.name           = "dac",
+		.id             = -1,
+		.enable         = exynos4_clk_ip_tv_ctrl,
+		.ctrlbit        = (1 << 2),
+	}, {
+		.name           = "mixer",
+		.id             = -1,
+		.enable         = exynos4_clk_ip_tv_ctrl,
+		.ctrlbit        = (1 << 1),
+	}, {
+		.name           = "vp",
+		.id             = -1,
+		.enable         = exynos4_clk_ip_tv_ctrl,
+		.ctrlbit        = (1 << 0),
+	}, {
+		.name           = "hdmi",
+		.id             = -1,
+		.enable         = exynos4_clk_ip_tv_ctrl,
+		.ctrlbit        = (1 << 3),
+	}, {
+		.name		= "hdmiphy",
+		.id		= -1,
+		.enable		= exynos4_clk_hdmiphy_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "dacphy",
+		.id		= -1,
+		.enable		= exynos4_clk_dac_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "hsmmc",
 		.id		= 4,
 		.parent		= &clk_aclk_133.clk,
@@ -801,6 +846,93 @@ static struct clksrc_sources clkset_mout_g2d = {
 	.nr_sources	= ARRAY_SIZE(clkset_mout_g2d_list),
 };
 
+/* --------------------------------------
+ *         TV subsystem CLOCKS
+ * --------------------------------------
+ */
+
+static struct clk *clkset_sclk_dac_list[] = {
+	[0] = &clk_sclk_vpll.clk,
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
+		.enable		= exynos4_clksrc_mask_tv_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
+	.sources = &clkset_sclk_dac,
+	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 8, .size = 1 },
+};
+
+static struct clksrc_clk clk_sclk_pixel  = {
+	.clk		= {
+		.name		= "sclk_pixel",
+		.id		= -1,
+		.parent = &clk_sclk_vpll.clk,
+	},
+	.reg_div = { .reg = S5P_CLKDIV_TV, .shift = 0, .size = 4 },
+};
+
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
+		.enable		= exynos4_clksrc_mask_tv_ctrl,
+		.ctrlbit	= (1 << 0),
+	},
+	.sources = &clkset_sclk_hdmi,
+	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 0, .size = 1 },
+};
+
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
+static struct clksrc_clk clk_sclk_mixer = {
+	.clk		= {
+		.name		= "sclk_mixer",
+		.id		= -1,
+		.enable		= exynos4_clksrc_mask_tv_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.sources = &clkset_sclk_mixer,
+	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 4, .size = 1 },
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
 static struct clksrc_clk clk_dout_mmc0 = {
 	.clk		= {
 		.name		= "dout_mmc0",
@@ -1141,6 +1273,81 @@ static struct clk_ops exynos4_fout_apll_ops = {
 	.get_rate = exynos4_fout_apll_get_rate,
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
+static unsigned long exynos4_vpll_get_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+static int exynos4_vpll_set_rate(struct clk *clk, unsigned long rate)
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
+static struct clk_ops exynos4_vpll_ops = {
+	.get_rate = exynos4_vpll_get_rate,
+	.set_rate = exynos4_vpll_set_rate,
+};
+
 void __init_or_cpufreq exynos4_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1183,6 +1390,7 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 	clk_fout_apll.ops = &exynos4_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
+	clk_fout_vpll.ops = &exynos4_vpll_ops;
 	clk_fout_vpll.rate = vpll;
 
 	printk(KERN_INFO "EXYNOS4: PLL settings, A=%ld, M=%ld, E=%ld V=%ld",
@@ -1210,7 +1418,10 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 }
 
 static struct clk *clks[] __initdata = {
-	/* Nothing here yet */
+	&clk_sclk_hdmi27m,
+	&clk_sclk_hdmiphy,
+	&clk_sclk_usbphy0,
+	&clk_sclk_usbphy1,
 };
 
 void __init exynos4_register_clocks(void)
@@ -1222,6 +1433,10 @@ void __init exynos4_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	/* register TV clocks */
+	for (ptr = 0; sclk_tv[ptr]; ++ptr)
+		s3c_register_clksrc(sclk_tv[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
diff --git a/arch/arm/mach-exynos4/dev-tv.c b/arch/arm/mach-exynos4/dev-tv.c
new file mode 100644
index 0000000..09115d1
--- /dev/null
+++ b/arch/arm/mach-exynos4/dev-tv.c
@@ -0,0 +1,114 @@
+/* linux/arch/arm/mach-exynos4/dev-tv.c
+ *
+ * Copyright 20i10 Samsung Electronics
+ *      Tomasz Stanislawski <t.stanislaws@samsung.com>
+ *
+ * S5P series device definition for TV device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <mach/gpio.h>
+#include <plat/gpio-cfg.h>
+#include <mach/regs-clock.h>
+#include <mach/regs-pmu.h>
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+#include <linux/fb.h>
+#include <linux/gfp.h>
+#include <linux/dma-mapping.h>
+#include <linux/clk.h>
+#include <linux/regulator/consumer.h>
+#include <linux/delay.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+/* HDMI interface */
+static struct resource s5p_hdmi_resources[] = {
+	[0] = {
+		.start  = S5P_PA_HDMI,
+		.end    = S5P_PA_HDMI + S5P_SZ_HDMI - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_HDMI,
+		.end    = IRQ_HDMI,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_hdmi = {
+	.name           = "s5p-hdmi",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_hdmi_resources),
+	.resource       = s5p_hdmi_resources,
+};
+EXPORT_SYMBOL(s5p_device_hdmi);
+
+/* MIXER */
+static struct resource s5p_mixer_resources[] = {
+	[0] = {
+		.start  = S5P_PA_MIXER,
+		.end    = S5P_PA_MIXER + S5P_SZ_MIXER - 1,
+		.flags  = IORESOURCE_MEM,
+		.name	= "mxr"
+	},
+	[1] = {
+		.start  = S5P_PA_VP,
+		.end    = S5P_PA_VP + S5P_SZ_VP - 1,
+		.flags  = IORESOURCE_MEM,
+		.name	= "vp"
+	},
+	[2] = {
+		.start  = IRQ_MIXER,
+		.end    = IRQ_MIXER,
+		.flags  = IORESOURCE_IRQ,
+		.name	= "irq"
+	},
+};
+
+struct platform_device s5p_device_mixer = {
+	.name           = "s5p-mixer",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_mixer_resources),
+	.resource       = s5p_mixer_resources,
+	.dev		= {
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+		.dma_mask = &s5p_device_mixer.dev.coherent_dma_mask,
+	}
+};
+EXPORT_SYMBOL(s5p_device_mixer);
+
+/* HDMI interface */
+static struct resource s5p_sdo_resources[] = {
+	[0] = {
+		.start  = S5P_PA_SDO,
+		.end    = S5P_PA_SDO + S5P_SZ_SDO - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_SDO,
+		.end    = IRQ_SDO,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_sdo = {
+	.name           = "s5p-sdo",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_sdo_resources),
+	.resource       = s5p_sdo_resources,
+	.dev		= {
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+		.dma_mask = &s5p_device_sdo.dev.coherent_dma_mask,
+	}
+};
+EXPORT_SYMBOL(s5p_device_sdo);
diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index dd048f8..7a687f1 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -124,6 +124,10 @@
 
 #define IRQ_MCT_L1		COMBINER_IRQ(35, 3)
 
+/* Set the default NR_IRQS */
+#define IRQ_MIXER		COMBINER_IRQ(36, 0)
+#define IRQ_SDO			COMBINER_IRQ(36, 1)
+
 #define IRQ_EINT4		COMBINER_IRQ(37, 0)
 #define IRQ_EINT5		COMBINER_IRQ(37, 1)
 #define IRQ_EINT6		COMBINER_IRQ(37, 2)
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index ff98626..1bd8c45 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -160,4 +160,30 @@
 
 #define S5P_SZ_UART			SZ_256
 
+/* CEC */
+#define S5PV210_PA_CEC		(0x100B0000)
+#define S5P_PA_CEC		S5PV210_PA_CEC
+#define S5P_SZ_CEC		SZ_4K
+
+/* TVOUT */
+#define S5PV210_PA_SDO		(0x12C20000)
+#define S5P_PA_SDO		S5PV210_PA_SDO
+#define S5P_SZ_SDO		SZ_64K
+
+#define S5PV210_PA_VP		(0x12C00000)
+#define S5P_PA_VP		S5PV210_PA_VP
+#define S5P_SZ_VP		SZ_64K
+
+#define S5PV210_PA_MIXER	(0x12C10000)
+#define S5P_PA_MIXER		S5PV210_PA_MIXER
+#define S5P_SZ_MIXER		SZ_64K
+
+#define S5PV210_PA_HDMI		(0x12D00000)
+#define S5P_PA_HDMI		S5PV210_PA_HDMI
+#define S5P_SZ_HDMI		SZ_1M
+
+#define S5PV210_I2C_HDMI_PHY	(0x138E0000)
+#define S5P_I2C_HDMI_PHY	S5PV210_I2C_HDMI_PHY
+#define S5P_I2C_HDMI_SZ_PHY	SZ_1K
+
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/arm/mach-exynos4/include/mach/regs-clock.h
index 2c1472b..b7e1bda 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
@@ -33,6 +33,7 @@
 #define S5P_CLKSRC_TOP0			S5P_CLKREG(0x0C210)
 #define S5P_CLKSRC_TOP1			S5P_CLKREG(0x0C214)
 #define S5P_CLKSRC_CAM			S5P_CLKREG(0x0C220)
+#define S5P_CLKSRC_TV			S5P_CLKREG(0x0C224)
 #define S5P_CLKSRC_MFC			S5P_CLKREG(0x0C228)
 #define S5P_CLKSRC_IMAGE		S5P_CLKREG(0x0C230)
 #define S5P_CLKSRC_LCD0			S5P_CLKREG(0x0C234)
diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
index 62b0014..6bfb451 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
@@ -33,6 +33,12 @@
 #define S5P_EINT_WAKEUP_MASK			S5P_PMUREG(0x0604)
 #define S5P_WAKEUP_MASK				S5P_PMUREG(0x0608)
 
+#define S5P_HDMI_PHY_CONTROL			S5P_PMUREG(0x0700)
+#define S5P_HDMI_PHY_ENABLE			(1 << 0)
+
+#define S5P_DAC_PHY_CONTROL			S5P_PMUREG(0x070C)
+#define S5P_DAC_PHY_ENABLE			(1 << 0)
+
 #define S5P_MIPI_DPHY_CONTROL(n)		S5P_PMUREG(0x0710 + (n) * 4)
 #define S5P_MIPI_DPHY_ENABLE			(1 << 0)
 #define S5P_MIPI_DPHY_SRESETN			(1 << 1)
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index d240fd3..fb5bd9f 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -140,6 +140,11 @@ extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
 
+/* TV devices */
+extern struct platform_device s5p_device_hdmi;
+extern struct platform_device s5p_device_mixer;
+extern struct platform_device s5p_device_sdo;
+
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
-- 
1.7.4.3
