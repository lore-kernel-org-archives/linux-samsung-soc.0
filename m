From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: S5P: add support for tv device
Date: Mon, 25 Jul 2011 09:55:45 +0200
Message-ID: <1311580547-9468-3-git-send-email-m.szyprowski@samsung.com>
References: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48342 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751781Ab1GYHzy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 03:55:54 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOV00BGSQ14XE@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOV002VOQ127P@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:51 +0100 (BST)
In-reply-to: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds all the resources for TV drivers and devices for Samsung
Exynos4 and S5PV210 platforms.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[m.szyprowski: moved common vpll code to plat-s5p/clocks-vpll.c,
squashed Exynos4 and S5PV210 patches and rewrote commit message]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig                   |    1 +
 arch/arm/mach-exynos4/clock.c                   |  134 ++++++++++++++++++++++-
 arch/arm/mach-exynos4/cpu.c                     |    2 +
 arch/arm/mach-exynos4/include/mach/irqs.h       |    4 +-
 arch/arm/mach-exynos4/include/mach/map.h        |    8 ++
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
 arch/arm/mach-s5pv210/Kconfig                   |    1 +
 arch/arm/mach-s5pv210/clock.c                   |   81 ++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                     |    4 +
 arch/arm/mach-s5pv210/include/mach/irqs.h       |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h        |   10 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    9 +-
 arch/arm/plat-s5p/Kconfig                       |   10 ++
 arch/arm/plat-s5p/Makefile                      |    2 +
 arch/arm/plat-s5p/clock-vpll.c                  |   93 ++++++++++++++++
 arch/arm/plat-s5p/dev-tv.c                      |  100 +++++++++++++++++
 arch/arm/plat-s5p/include/plat/s5p-clock.h      |    4 +
 arch/arm/plat-samsung/include/plat/devs.h       |    5 +
 arch/arm/plat-samsung/include/plat/tv-core.h    |   44 ++++++++
 19 files changed, 504 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/plat-s5p/clock-vpll.c
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 9d62e13..7b468c2 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,6 +12,7 @@ if ARCH_EXYNOS4
 config CPU_EXYNOS4210
 	bool
 	select S3C_PL330_DMA
+	select S5P_CLOCK_VPLL
 	help
 	  Enable EXYNOS4210 CPU support
 
diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 953bdad..8639f4a 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -83,6 +83,11 @@ static int exynos4_clk_ip_mfc_ctrl(struct clk *clk, int enable)
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
@@ -123,6 +128,16 @@ static int exynos4_clk_ip_perir_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP_PERIR, clk, enable);
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
@@ -449,6 +464,36 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
+		.name		= "dac",
+		.devname	= "s5p-sdo",
+		.enable		= exynos4_clk_ip_tv_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "mixer",
+		.devname	= "s5p-mixer",
+		.enable		= exynos4_clk_ip_tv_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "vp",
+		.devname	= "s5p-mixer",
+		.enable		= exynos4_clk_ip_tv_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "hdmi",
+		.devname	= "exynos4-hdmi",
+		.enable		= exynos4_clk_ip_tv_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
+		.name		= "hdmiphy",
+		.devname	= "exynos4-hdmi",
+		.enable		= exynos4_clk_hdmiphy_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "dacphy",
+		.devname	= "s5p-sdo",
+		.enable		= exynos4_clk_dac_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "sata",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
@@ -788,6 +833,81 @@ static struct clksrc_sources clkset_mout_mfc = {
 	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc_list),
 };
 
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
+		.enable		= exynos4_clksrc_mask_tv_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
+	.sources = &clkset_sclk_dac,
+	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 8, .size = 1 },
+};
+
+static struct clksrc_clk clk_sclk_pixel = {
+	.clk		= {
+		.name		= "sclk_pixel",
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
+};
+
 static struct clksrc_clk clk_dout_mmc0 = {
 	.clk		= {
 		.name		= "dout_mmc0",
@@ -1129,6 +1249,11 @@ static struct clk_ops exynos4_fout_apll_ops = {
 	.get_rate = exynos4_fout_apll_get_rate,
 };
 
+static struct clk_ops exynos4_vpll_ops = {
+	.get_rate = s5p_vpll_get_rate,
+	.set_rate = s5p_vpll_set_rate,
+};
+
 void __init_or_cpufreq exynos4_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1171,6 +1296,7 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 	clk_fout_apll.ops = &exynos4_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
+	clk_fout_vpll.ops = &exynos4_vpll_ops;
 	clk_fout_vpll.rate = vpll;
 
 	printk(KERN_INFO "EXYNOS4: PLL settings, A=%ld, M=%ld, E=%ld V=%ld",
@@ -1198,7 +1324,10 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 }
 
 static struct clk *clks[] __initdata = {
-	/* Nothing here yet */
+	&clk_sclk_hdmi27m,
+	&clk_sclk_hdmiphy,
+	&clk_sclk_usbphy0,
+	&clk_sclk_usbphy1,
 };
 
 void __init exynos4_register_clocks(void)
@@ -1210,6 +1339,9 @@ void __init exynos4_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(sclk_tv); ptr++)
+		s3c_register_clksrc(sclk_tv[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 2d8a40c..a8571fb 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -28,6 +28,7 @@
 #include <plat/fb-core.h>
 #include <plat/fimc-core.h>
 #include <plat/iic-core.h>
+#include <plat/tv-core.h>
 
 #include <mach/regs-irq.h>
 
@@ -156,6 +157,7 @@ void __init exynos4_map_io(void)
 	s3c_i2c2_setname("s3c2440-i2c");
 
 	s5p_fb_setname(0, "exynos4-fb");
+	s5p_hdmi_setname("exynos4-hdmi");
 }
 
 void __init exynos4_init_clocks(int xtal)
diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index c56645f..92e8d09 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -94,9 +94,11 @@
 #define IRQ_2D			IRQ_SPI(89)
 #define IRQ_PCIE		IRQ_SPI(90)
 
+#define IRQ_MIXER		IRQ_SPI(91)
+#define IRQ_HDMI		IRQ_SPI(92)
 #define IRQ_IIC_HDMIPHY		IRQ_SPI(93)
-
 #define IRQ_MFC			IRQ_SPI(94)
+#define IRQ_SDO			IRQ_SPI(95)
 
 #define IRQ_AUDIO_SS		IRQ_SPI(96)
 #define IRQ_I2S0		IRQ_SPI(97)
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 380feb9..fad70e2 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -112,6 +112,10 @@
 
 #define EXYNOS4_PA_UART			0x13800000
 
+#define EXYNOS4_PA_SDO			0x12C20000
+#define EXYNOS4_PA_VP			0x12C00000
+#define EXYNOS4_PA_MIXER		0x12C10000
+#define EXYNOS4_PA_HDMI			0x12D00000
 #define EXYNOS4_PA_IIC_HDMIPHY		0x138E0000
 
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
@@ -163,6 +167,10 @@
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 #define S5P_PA_EHCI			EXYNOS4_PA_EHCI
 
+#define S5P_PA_SDO			EXYNOS4_PA_SDO
+#define S5P_PA_VP			EXYNOS4_PA_VP
+#define S5P_PA_MIXER			EXYNOS4_PA_MIXER
+#define S5P_PA_HDMI			EXYNOS4_PA_HDMI
 #define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
 
 #define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
index fa49bbb..faf9b98 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
@@ -33,9 +33,15 @@
 #define S5P_EINT_WAKEUP_MASK			S5P_PMUREG(0x0604)
 #define S5P_WAKEUP_MASK				S5P_PMUREG(0x0608)
 
+#define S5P_HDMI_PHY_CONTROL			S5P_PMUREG(0x0700)
+#define S5P_HDMI_PHY_ENABLE			(1 << 0)
+
 #define S5P_USBHOST_PHY_CONTROL			S5P_PMUREG(0x0708)
 #define S5P_USBHOST_PHY_ENABLE			(1 << 0)
 
+#define S5P_DAC_PHY_CONTROL			S5P_PMUREG(0x070C)
+#define S5P_DAC_PHY_ENABLE			(1 << 0)
+
 #define S5P_MIPI_DPHY_CONTROL(n)		S5P_PMUREG(0x0710 + (n) * 4)
 #define S5P_MIPI_DPHY_ENABLE			(1 << 0)
 #define S5P_MIPI_DPHY_SRESETN			(1 << 1)
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 69dd87c..65c878c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,6 +14,7 @@ config CPU_S5PV210
 	select S3C_PL330_DMA
 	select S5P_EXT_INT
 	select S5P_HRT
+	select S5P_CLOCK_VPLL
 	select S5PV210_PM if PM
 	help
 	  Enable S5PV210 CPU support
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 90a1966..4fa43ef 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -174,6 +174,16 @@ static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
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
 static struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
 	.rate		= 27000000,
@@ -330,6 +340,40 @@ static struct clk init_clocks_off[] = {
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
@@ -600,6 +644,23 @@ static struct clksrc_sources clkset_sclk_mixer = {
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
+};
+
 static struct clk *clkset_sclk_audio0_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = &clk_pcmcdclk0,
@@ -783,14 +844,6 @@ static struct clksrc_clk clksrcs[] = {
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
@@ -981,9 +1034,6 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_pclk_psys,
 	&clk_vpllsrc,
 	&clk_sclk_vpll,
-	&clk_sclk_dac,
-	&clk_sclk_pixel,
-	&clk_sclk_hdmi,
 	&clk_mout_dmc0,
 	&clk_sclk_dmc0,
 	&clk_sclk_audio0,
@@ -1068,6 +1118,11 @@ static struct clk_ops s5pv210_epll_ops = {
 	.get_rate = s5p_epll_get_rate,
 };
 
+static struct clk_ops s5pv210_vpll_ops = {
+	.get_rate = s5p_vpll_get_rate,
+	.set_rate = s5p_vpll_set_rate,
+};
+
 void __init_or_cpufreq s5pv210_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1116,6 +1171,7 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 	clk_fout_apll.ops = &clk_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
+	clk_fout_vpll.ops = &s5pv210_vpll_ops;
 	clk_fout_vpll.rate = vpll;
 
 	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld V=%ld",
@@ -1161,6 +1217,9 @@ void __init s5pv210_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(sclk_tv); ptr++)
+		s3c_register_clksrc(sclk_tv[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 79907ec..6b8cdcc 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -41,6 +41,7 @@
 #include <plat/keypad-core.h>
 #include <plat/sdhci.h>
 #include <plat/reset.h>
+#include <plat/tv-core.h>
 
 /* Initial IO mappings */
 
@@ -143,6 +144,9 @@ void __init s5pv210_map_io(void)
 
 	/* Use s5pv210-keypad instead of samsung-keypad */
 	samsung_keypad_setname("s5pv210-keypad");
+
+	/* setup TV devices */
+	s5p_hdmi_setname("s5pv210-hdmi");
 }
 
 void __init s5pv210_init_clocks(int xtal)
diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index c1da0a7..5e0de3a 100644
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
index a420654..7ff609f 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -90,6 +90,10 @@
 #define S5PV210_PA_FIMC1		0xFB300000
 #define S5PV210_PA_FIMC2		0xFB400000
 
+#define S5PV210_PA_SDO			0xF9000000
+#define S5PV210_PA_VP			0xF9100000
+#define S5PV210_PA_MIXER		0xF9200000
+#define S5PV210_PA_HDMI			0xFA100000
 #define S5PV210_PA_IIC_HDMIPHY		0xFA900000
 
 /* Compatibiltiy Defines */
@@ -113,6 +117,12 @@
 #define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
 #define S5P_PA_MFC			S5PV210_PA_MFC
 #define S5P_PA_IIC_HDMIPHY		S5PV210_PA_IIC_HDMIPHY
+
+#define S5P_PA_SDO			S5PV210_PA_SDO
+#define S5P_PA_VP			S5PV210_PA_VP
+#define S5P_PA_MIXER			S5PV210_PA_MIXER
+#define S5P_PA_HDMI			S5PV210_PA_HDMI
+
 #define S5P_PA_ONENAND			S5PC110_PA_ONENAND
 #define S5P_PA_ONENAND_DMA		S5PC110_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			S5PV210_PA_SDRAM
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
index 78925c5..116a76b 100644
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
@@ -118,6 +120,8 @@
 #define S5P_CLKDIV6_ONEDRAM_SHIFT       (28)
 #define S5P_CLKDIV6_ONEDRAM_MASK        (0xF << S5P_CLKDIV6_ONEDRAM_SHIFT)
 
+#define S5P_VPLLCON0_LOCKED_SHIFT	(29)
+
 #define S5P_SWRESET		S5P_CLKREG(0x2000)
 
 #define S5P_ARM_MCS_CON		S5P_CLKREG(0x6100)
@@ -144,8 +148,9 @@
 
 #define S5P_OTHERS		S5P_CLKREG(0xE000)
 #define S5P_OM_STAT		S5P_CLKREG(0xE100)
+#define S5P_HDMI_PHY_CONTROL	S5P_CLKREG(0xE804)
 #define S5P_USB_PHY_CONTROL	S5P_CLKREG(0xE80C)
-#define S5P_DAC_CONTROL		S5P_CLKREG(0xE810)
+#define S5P_DAC_PHY_CONTROL	S5P_CLKREG(0xE810)
 #define S5P_MIPI_DPHY_CONTROL(x) S5P_CLKREG(0xE814)
 #define S5P_MIPI_DPHY_ENABLE	(1 << 0)
 #define S5P_MIPI_DPHY_SRESETN	(1 << 1)
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 143e036..70d6ae7 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -26,6 +26,11 @@ config PLAT_S5P
 	help
 	  Base platform code for Samsung's S5P series SoC.
 
+config S5P_CLOCK_VPLL
+	bool
+	help
+	  Common code for the VPLL clock support code.
+
 config S5P_EXT_INT
 	bool
 	help
@@ -101,6 +106,11 @@ config S5P_DEV_CSIS1
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
 
+config S5P_DEV_TV
+	bool
+	help
+	  Compile in platform device definition for TV interface
+
 config S5P_DEV_USB_EHCI
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 1dd10dc..c386d60 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -17,6 +17,7 @@ obj-y				+= dev-uart.o
 obj-y				+= cpu.o
 obj-y				+= clock.o
 obj-y				+= irq.o
+obj-$(CONFIG_S5P_CLOCK_VPLL)	+= clock-vpll.o
 obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
 obj-$(CONFIG_S5P_GPIO_INT)	+= irq-gpioint.o
 obj-$(CONFIG_S5P_SYSTEM_MMU)	+= sysmmu.o
@@ -35,5 +36,6 @@ obj-$(CONFIG_S5P_DEV_I2C_HDMIPHY) += dev-i2c-hdmiphy.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
+obj-$(CONFIG_S5P_DEV_TV)	+= dev-tv.o
 obj-$(CONFIG_S5P_DEV_USB_EHCI)	+= dev-ehci.o
 obj-$(CONFIG_S5P_SETUP_MIPIPHY)	+= setup-mipiphy.o
diff --git a/arch/arm/plat-s5p/clock-vpll.c b/arch/arm/plat-s5p/clock-vpll.c
new file mode 100644
index 0000000..b570f56
--- /dev/null
+++ b/arch/arm/plat-s5p/clock-vpll.c
@@ -0,0 +1,93 @@
+/*
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P - Common VPLL clock support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include <mach/regs-clock.h>
+
+#include <plat/clock.h>
+#include <plat/pll.h>
+#include <plat/s5p-clock.h>
+
+struct vpll_div_data {
+	u32 rate;
+	u32 pdiv;
+	u32 mdiv;
+	u32 sdiv;
+	u32 k;
+	u32 mfr;
+	u32 mrr;
+	u32 vsel;
+};
+
+static struct vpll_div_data vpll_div[] = {
+	{  54000000, 3, 53, 3, 1024, 0, 17, 0 },
+	{ 108000000, 3, 53, 2, 1024, 0, 17, 0 },
+};
+
+unsigned long s5p_vpll_get_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+int s5p_vpll_set_rate(struct clk *clk, unsigned long rate)
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
+	/* Wait for VPLL lock */
+	while (!(__raw_readl(S5P_VPLL_CON0) & (1 << S5P_VPLLCON0_LOCKED_SHIFT)))
+		continue;
+
+	clk->rate = rate;
+	return 0;
+}
diff --git a/arch/arm/plat-s5p/dev-tv.c b/arch/arm/plat-s5p/dev-tv.c
new file mode 100644
index 0000000..0e44342
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-tv.c
@@ -0,0 +1,100 @@
+/* linux/arch/arm/plat-s5p/dev-tv.c
+ *
+ * Copyright (C) 2011 Samsung Electronics Co.Ltd
+ * Author: Tomasz Stanislawski <t.stanislaws@samsung.com>
+ *
+ * S5P series device definition for TV device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/dma-mapping.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/devs.h>
+
+/* HDMI interface */
+static struct resource s5p_hdmi_resources[] = {
+	[0] = {
+		.start	= S5P_PA_HDMI,
+		.end	= S5P_PA_HDMI + SZ_1M - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_HDMI,
+		.end	= IRQ_HDMI,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_hdmi = {
+	.name		= "s5p-hdmi",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s5p_hdmi_resources),
+	.resource	= s5p_hdmi_resources,
+};
+EXPORT_SYMBOL(s5p_device_hdmi);
+
+/* MIXER */
+static struct resource s5p_mixer_resources[] = {
+	[0] = {
+		.start	= S5P_PA_MIXER,
+		.end	= S5P_PA_MIXER + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+		.name	= "mxr"
+	},
+	[1] = {
+		.start	= S5P_PA_VP,
+		.end	= S5P_PA_VP + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+		.name	= "vp"
+	},
+	[2] = {
+		.start	= IRQ_MIXER,
+		.end	= IRQ_MIXER,
+		.flags	= IORESOURCE_IRQ,
+		.name	= "irq"
+	}
+};
+
+struct platform_device s5p_device_mixer = {
+	.name		= "s5p-mixer",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s5p_mixer_resources),
+	.resource	= s5p_mixer_resources,
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
+		.start	= S5P_PA_SDO,
+		.end	= S5P_PA_SDO + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_SDO,
+		.end	= IRQ_SDO,
+		.flags	= IORESOURCE_IRQ,
+	}
+};
+
+struct platform_device s5p_device_sdo = {
+	.name		= "s5p-sdo",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s5p_sdo_resources),
+	.resource	= s5p_sdo_resources,
+	.dev		= {
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+		.dma_mask = &s5p_device_sdo.dev.coherent_dma_mask,
+	}
+};
+EXPORT_SYMBOL(s5p_device_sdo);
diff --git a/arch/arm/plat-s5p/include/plat/s5p-clock.h b/arch/arm/plat-s5p/include/plat/s5p-clock.h
index 769b5bd..7cb2ffc 100644
--- a/arch/arm/plat-s5p/include/plat/s5p-clock.h
+++ b/arch/arm/plat-s5p/include/plat/s5p-clock.h
@@ -47,6 +47,10 @@ extern int s5p_gatectrl(void __iomem *reg, struct clk *clk, int enable);
 extern int s5p_epll_enable(struct clk *clk, int enable);
 extern unsigned long s5p_epll_get_rate(struct clk *clk);
 
+/* Common VPLL operations for S5P platform */
+extern unsigned long s5p_vpll_get_rate(struct clk *clk);
+extern int s5p_vpll_set_rate(struct clk *clk, unsigned long rate);
+
 /* SPDIF clk operations common for S5PC100/V210/C110 and Exynos4 */
 extern int s5p_spdif_set_rate(struct clk *clk, unsigned long rate);
 extern unsigned long s5p_spdif_get_rate(struct clk *clk);
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index b15805f..ee5014a 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -143,6 +143,11 @@ extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5p_device_mfc;
 extern struct platform_device s5p_device_mfc_l;
 extern struct platform_device s5p_device_mfc_r;
+
+extern struct platform_device s5p_device_hdmi;
+extern struct platform_device s5p_device_mixer;
+extern struct platform_device s5p_device_sdo;
+
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
diff --git a/arch/arm/plat-samsung/include/plat/tv-core.h b/arch/arm/plat-samsung/include/plat/tv-core.h
new file mode 100644
index 0000000..3bc34f3
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/tv-core.h
@@ -0,0 +1,44 @@
+/*
+ * arch/arm/plat-samsung/include/plat/tv.h
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *	Tomasz Stanislawski <t.stanislaws@samsung.com>
+ *
+ * Samsung TV driver core functions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __SAMSUNG_PLAT_TV_H
+#define __SAMSUNG_PLAT_TV_H __FILE__
+
+/*
+ * These functions are only for use with the core support code, such as
+ * the CPU-specific initialization code.
+ */
+
+/* Re-define device name to differentiate the subsystem in various SoCs. */
+static inline void s5p_hdmi_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_hdmi.name = name;
+#endif
+}
+
+static inline void s5p_mixer_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_mixer.name = name;
+#endif
+}
+
+static inline void s5p_sdo_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_sdo.name = name;
+#endif
+}
+
+#endif /* __SAMSUNG_PLAT_TV_H */
-- 
1.7.1.569.g6f426
