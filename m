From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 7/7] ARM: Exynos4: Add clkdev support
Date: Fri, 27 May 2011 20:56:36 +0530
Message-ID: <1306509996-30280-8-git-send-email-thomas.ab@samsung.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11682 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258Ab1E0PT2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 11:19:28 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLV00AJ9180Y240@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:27 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLV00IAA17ZX8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:27 +0900 (KST)
In-reply-to: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Add clkdev support for Samsung's Exynos4 platform and fixes the
incorrect clock name for the dw_mmc controller.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-exynos4/clock.c               |  178 +++++++++------------------
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +
 arch/arm/mach-exynos4/time.c                |    2 +
 4 files changed, 67 insertions(+), 121 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8d010f2..452e1c1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -786,6 +786,7 @@ config ARCH_EXYNOS4
 	select ARCH_SPARSEMEM_ENABLE
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select ARCH_HAS_CPUFREQ
 	select GENERIC_CLOCKEVENTS
 	select HAVE_S3C_RTC if RTC_CLASS
diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 871f9d5..4fecbe9 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -27,24 +27,20 @@
 
 static struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
-	.id		= -1,
 	.rate		= 27000000,
 };
 
 static struct clk clk_sclk_hdmiphy = {
 	.name		= "sclk_hdmiphy",
-	.id		= -1,
 };
 
 static struct clk clk_sclk_usbphy0 = {
 	.name		= "sclk_usbphy0",
-	.id		= -1,
 	.rate		= 27000000,
 };
 
 static struct clk clk_sclk_usbphy1 = {
 	.name		= "sclk_usbphy1",
-	.id		= -1,
 };
 
 static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enable)
@@ -132,7 +128,6 @@ static int exynos4_clk_ip_perir_ctrl(struct clk *clk, int enable)
 static struct clksrc_clk clk_mout_apll = {
 	.clk	= {
 		.name		= "mout_apll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_apll,
 	.reg_src	= { .reg = S5P_CLKSRC_CPU, .shift = 0, .size = 1 },
@@ -141,7 +136,6 @@ static struct clksrc_clk clk_mout_apll = {
 static struct clksrc_clk clk_sclk_apll = {
 	.clk	= {
 		.name		= "sclk_apll",
-		.id		= -1,
 		.parent		= &clk_mout_apll.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 24, .size = 3 },
@@ -150,7 +144,6 @@ static struct clksrc_clk clk_sclk_apll = {
 static struct clksrc_clk clk_mout_epll = {
 	.clk	= {
 		.name		= "mout_epll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_epll,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 4, .size = 1 },
@@ -159,7 +152,6 @@ static struct clksrc_clk clk_mout_epll = {
 static struct clksrc_clk clk_mout_mpll = {
 	.clk = {
 		.name		= "mout_mpll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_mpll,
 	.reg_src	= { .reg = S5P_CLKSRC_CPU, .shift = 8, .size = 1 },
@@ -178,7 +170,6 @@ static struct clksrc_sources clkset_moutcore = {
 static struct clksrc_clk clk_moutcore = {
 	.clk	= {
 		.name		= "moutcore",
-		.id		= -1,
 	},
 	.sources	= &clkset_moutcore,
 	.reg_src	= { .reg = S5P_CLKSRC_CPU, .shift = 16, .size = 1 },
@@ -187,7 +178,6 @@ static struct clksrc_clk clk_moutcore = {
 static struct clksrc_clk clk_coreclk = {
 	.clk	= {
 		.name		= "core_clk",
-		.id		= -1,
 		.parent		= &clk_moutcore.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 0, .size = 3 },
@@ -196,7 +186,6 @@ static struct clksrc_clk clk_coreclk = {
 static struct clksrc_clk clk_armclk = {
 	.clk	= {
 		.name		= "armclk",
-		.id		= -1,
 		.parent		= &clk_coreclk.clk,
 	},
 };
@@ -204,7 +193,6 @@ static struct clksrc_clk clk_armclk = {
 static struct clksrc_clk clk_aclk_corem0 = {
 	.clk	= {
 		.name		= "aclk_corem0",
-		.id		= -1,
 		.parent		= &clk_coreclk.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 4, .size = 3 },
@@ -213,7 +201,6 @@ static struct clksrc_clk clk_aclk_corem0 = {
 static struct clksrc_clk clk_aclk_cores = {
 	.clk	= {
 		.name		= "aclk_cores",
-		.id		= -1,
 		.parent		= &clk_coreclk.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 4, .size = 3 },
@@ -222,7 +209,6 @@ static struct clksrc_clk clk_aclk_cores = {
 static struct clksrc_clk clk_aclk_corem1 = {
 	.clk	= {
 		.name		= "aclk_corem1",
-		.id		= -1,
 		.parent		= &clk_coreclk.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 8, .size = 3 },
@@ -231,7 +217,6 @@ static struct clksrc_clk clk_aclk_corem1 = {
 static struct clksrc_clk clk_periphclk = {
 	.clk	= {
 		.name		= "periphclk",
-		.id		= -1,
 		.parent		= &clk_coreclk.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 12, .size = 3 },
@@ -252,7 +237,6 @@ static struct clksrc_sources clkset_mout_corebus = {
 static struct clksrc_clk clk_mout_corebus = {
 	.clk	= {
 		.name		= "mout_corebus",
-		.id		= -1,
 	},
 	.sources	= &clkset_mout_corebus,
 	.reg_src	= { .reg = S5P_CLKSRC_DMC, .shift = 4, .size = 1 },
@@ -261,7 +245,6 @@ static struct clksrc_clk clk_mout_corebus = {
 static struct clksrc_clk clk_sclk_dmc = {
 	.clk	= {
 		.name		= "sclk_dmc",
-		.id		= -1,
 		.parent		= &clk_mout_corebus.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 12, .size = 3 },
@@ -270,7 +253,6 @@ static struct clksrc_clk clk_sclk_dmc = {
 static struct clksrc_clk clk_aclk_cored = {
 	.clk	= {
 		.name		= "aclk_cored",
-		.id		= -1,
 		.parent		= &clk_sclk_dmc.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 16, .size = 3 },
@@ -279,7 +261,6 @@ static struct clksrc_clk clk_aclk_cored = {
 static struct clksrc_clk clk_aclk_corep = {
 	.clk	= {
 		.name		= "aclk_corep",
-		.id		= -1,
 		.parent		= &clk_aclk_cored.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 20, .size = 3 },
@@ -288,7 +269,6 @@ static struct clksrc_clk clk_aclk_corep = {
 static struct clksrc_clk clk_aclk_acp = {
 	.clk	= {
 		.name		= "aclk_acp",
-		.id		= -1,
 		.parent		= &clk_mout_corebus.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 0, .size = 3 },
@@ -297,7 +277,6 @@ static struct clksrc_clk clk_aclk_acp = {
 static struct clksrc_clk clk_pclk_acp = {
 	.clk	= {
 		.name		= "pclk_acp",
-		.id		= -1,
 		.parent		= &clk_aclk_acp.clk,
 	},
 	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 4, .size = 3 },
@@ -318,7 +297,6 @@ static struct clksrc_sources clkset_aclk = {
 static struct clksrc_clk clk_aclk_200 = {
 	.clk	= {
 		.name		= "aclk_200",
-		.id		= -1,
 	},
 	.sources	= &clkset_aclk,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 12, .size = 1 },
@@ -328,7 +306,6 @@ static struct clksrc_clk clk_aclk_200 = {
 static struct clksrc_clk clk_aclk_100 = {
 	.clk	= {
 		.name		= "aclk_100",
-		.id		= -1,
 	},
 	.sources	= &clkset_aclk,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 16, .size = 1 },
@@ -338,7 +315,6 @@ static struct clksrc_clk clk_aclk_100 = {
 static struct clksrc_clk clk_aclk_160 = {
 	.clk	= {
 		.name		= "aclk_160",
-		.id		= -1,
 	},
 	.sources	= &clkset_aclk,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 20, .size = 1 },
@@ -348,7 +324,6 @@ static struct clksrc_clk clk_aclk_160 = {
 static struct clksrc_clk clk_aclk_133 = {
 	.clk	= {
 		.name		= "aclk_133",
-		.id		= -1,
 	},
 	.sources	= &clkset_aclk,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 24, .size = 1 },
@@ -368,7 +343,6 @@ static struct clksrc_sources clkset_vpllsrc = {
 static struct clksrc_clk clk_vpllsrc = {
 	.clk	= {
 		.name		= "vpll_src",
-		.id		= -1,
 		.enable		= exynos4_clksrc_mask_top_ctrl,
 		.ctrlbit	= (1 << 0),
 	},
@@ -389,7 +363,6 @@ static struct clksrc_sources clkset_sclk_vpll = {
 static struct clksrc_clk clk_sclk_vpll = {
 	.clk	= {
 		.name		= "sclk_vpll",
-		.id		= -1,
 	},
 	.sources	= &clkset_sclk_vpll,
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 8, .size = 1 },
@@ -398,289 +371,263 @@ static struct clksrc_clk clk_sclk_vpll = {
 static struct clk init_clocks_off[] = {
 	{
 		.name		= "timers",
-		.id		= -1,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1<<24),
 	}, {
 		.name		= "csis",
-		.id		= 0,
+		.devname	= "s5p-mipi-csis.0",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "csis",
-		.id		= 1,
+		.devname	= "s5p-mipi-csis.1",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "fimc",
-		.id		= 0,
+		.devname	= "exynos4-fimc.0",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "fimc",
-		.id		= 1,
+		.devname	= "exynos4-fimc.1",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "fimc",
-		.id		= 2,
+		.devname	= "exynos4-fimc.2",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "fimc",
-		.id		= 3,
+		.devname	= "exynos4-fimc.3",
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "fimd",
-		.id		= 0,
+		.devname	= "s5pv310-fb.0",
 		.enable		= exynos4_clk_ip_lcd0_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "fimd",
-		.id		= 1,
+		.devname	= "s5pv310-fb.1",
 		.enable		= exynos4_clk_ip_lcd1_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "sataphy",
-		.id		= -1,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "hsmmc",
-		.id		= 0,
+		.devname	= "s3c-sdhci.0",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "hsmmc",
-		.id		= 1,
+		.devname	= "s3c-sdhci.1",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "hsmmc",
-		.id		= 2,
+		.devname	= "s3c-sdhci.2",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "hsmmc",
-		.id		= 3,
+		.devname	= "s3c-sdhci.3",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
-		.name		= "hsmmc",
-		.id		= 4,
+		.name		= "dwmmc",
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "sata",
-		.id		= -1,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "pdma",
-		.id		= 0,
+		.devname	= "s3c-pl330.0",
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "pdma",
-		.id		= 1,
+		.devname	= "s3c-pl330.1",
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "adc",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "keypad",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_perir_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "rtc",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_perir_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "watchdog",
-		.id		= -1,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_perir_ctrl,
 		.ctrlbit	= (1 << 14),
 	}, {
 		.name		= "usbhost",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_fsys_ctrl ,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "otg",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 13),
 	}, {
 		.name		= "spi",
-		.id		= 0,
+		.devname	= "s3c64xx-spi.0",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "spi",
-		.id		= 1,
+		.devname	= "s3c64xx-spi.1",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
-		.id		= 2,
+		.devname	= "s3c64xx-spi.2",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "iis",
-		.id		= 0,
+		.devname	= "samsung-i2s.0",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "iis",
-		.id		= 1,
+		.devname	= "samsung-i2s.1",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 20),
 	}, {
 		.name		= "iis",
-		.id		= 2,
+		.devname	= "samsung-i2s.2",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "ac97",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
 		.name		= "fimg2d",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "i2c",
-		.id		= 0,
+		.devname	= "s3c2440-i2c.0",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "i2c",
-		.id		= 1,
+		.devname	= "s3c2440-i2c.1",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "i2c",
-		.id		= 2,
+		.devname	= "s3c2440-i2c.2",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "i2c",
-		.id		= 3,
+		.devname	= "s3c2440-i2c.3",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "i2c",
-		.id		= 4,
+		.devname	= "s3c2440-i2c.4",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "i2c",
-		.id		= 5,
+		.devname	= "s3c2440-i2c.5",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 11),
 	}, {
 		.name		= "i2c",
-		.id		= 6,
+		.devname	= "s3c2440-i2c.6",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "i2c",
-		.id		= 7,
+		.devname	= "s3c2440-i2c.7",
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 13),
 	}, {
 		.name		= "SYSMMU_MDMA",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "SYSMMU_FIMC0",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "SYSMMU_FIMC1",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "SYSMMU_FIMC2",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "SYSMMU_FIMC3",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "SYSMMU_JPEG",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 11),
 	}, {
 		.name		= "SYSMMU_FIMD0",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_lcd0_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "SYSMMU_FIMD1",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_lcd1_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "SYSMMU_PCIe",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "SYSMMU_G2D",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "SYSMMU_ROTATOR",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "SYSMMU_TV",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_tv_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "SYSMMU_MFC_L",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_mfc_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "SYSMMU_MFC_R",
-		.id		= -1,
 		.enable		= exynos4_clk_ip_mfc_ctrl,
 		.ctrlbit	= (1 << 2),
 	}
@@ -689,32 +636,32 @@ static struct clk init_clocks_off[] = {
 static struct clk init_clocks[] = {
 	{
 		.name		= "uart",
-		.id		= 0,
+		.devname	= "s5pv210-uart.0",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "uart",
-		.id		= 1,
+		.devname	= "s5pv210-uart.1",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
-		.id		= 2,
+		.devname	= "s5pv210-uart.2",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
-		.id		= 3,
+		.devname	= "s5pv210-uart.3",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
-		.id		= 4,
+		.devname	= "s5pv210-uart.4",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "uart",
-		.id		= 5,
+		.devname	= "s5pv210-uart.5",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 5),
 	}
@@ -750,7 +697,6 @@ static struct clksrc_sources clkset_mout_g2d0 = {
 static struct clksrc_clk clk_mout_g2d0 = {
 	.clk	= {
 		.name		= "mout_g2d0",
-		.id		= -1,
 	},
 	.sources	= &clkset_mout_g2d0,
 	.reg_src	= { .reg = S5P_CLKSRC_IMAGE, .shift = 0, .size = 1 },
@@ -769,7 +715,6 @@ static struct clksrc_sources clkset_mout_g2d1 = {
 static struct clksrc_clk clk_mout_g2d1 = {
 	.clk	= {
 		.name		= "mout_g2d1",
-		.id		= -1,
 	},
 	.sources	= &clkset_mout_g2d1,
 	.reg_src	= { .reg = S5P_CLKSRC_IMAGE, .shift = 4, .size = 1 },
@@ -788,7 +733,6 @@ static struct clksrc_sources clkset_mout_g2d = {
 static struct clksrc_clk clk_dout_mmc0 = {
 	.clk		= {
 		.name		= "dout_mmc0",
-		.id		= -1,
 	},
 	.sources = &clkset_group,
 	.reg_src = { .reg = S5P_CLKSRC_FSYS, .shift = 0, .size = 4 },
@@ -798,7 +742,6 @@ static struct clksrc_clk clk_dout_mmc0 = {
 static struct clksrc_clk clk_dout_mmc1 = {
 	.clk		= {
 		.name		= "dout_mmc1",
-		.id		= -1,
 	},
 	.sources = &clkset_group,
 	.reg_src = { .reg = S5P_CLKSRC_FSYS, .shift = 4, .size = 4 },
@@ -808,7 +751,6 @@ static struct clksrc_clk clk_dout_mmc1 = {
 static struct clksrc_clk clk_dout_mmc2 = {
 	.clk		= {
 		.name		= "dout_mmc2",
-		.id		= -1,
 	},
 	.sources = &clkset_group,
 	.reg_src = { .reg = S5P_CLKSRC_FSYS, .shift = 8, .size = 4 },
@@ -818,7 +760,6 @@ static struct clksrc_clk clk_dout_mmc2 = {
 static struct clksrc_clk clk_dout_mmc3 = {
 	.clk		= {
 		.name		= "dout_mmc3",
-		.id		= -1,
 	},
 	.sources = &clkset_group,
 	.reg_src = { .reg = S5P_CLKSRC_FSYS, .shift = 12, .size = 4 },
@@ -828,7 +769,6 @@ static struct clksrc_clk clk_dout_mmc3 = {
 static struct clksrc_clk clk_dout_mmc4 = {
 	.clk		= {
 		.name		= "dout_mmc4",
-		.id		= -1,
 	},
 	.sources = &clkset_group,
 	.reg_src = { .reg = S5P_CLKSRC_FSYS, .shift = 16, .size = 4 },
@@ -839,7 +779,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "uclk1",
-			.id		= 0,
+			.devname	= "s5pv210-uart.0",
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
@@ -849,7 +789,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 1,
+			.devname	= "s5pv210-uart.1",
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 4),
 		},
@@ -859,7 +799,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 2,
+			.devname	= "s5pv210-uart.2",
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 8),
 		},
@@ -869,7 +809,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 3,
+			.devname	= "s5pv210-uart.3",
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 12),
 		},
@@ -879,7 +819,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_pwm",
-			.id		= -1,
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 24),
 		},
@@ -889,7 +828,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_csis",
-			.id		= 0,
+			.devname	= "s5p-mipi-csis.0",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 24),
 		},
@@ -899,7 +838,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_csis",
-			.id		= 1,
+			.devname	= "s5p-mipi-csis.1",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 28),
 		},
@@ -909,7 +848,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
-			.id		= 0,
+			.devname	= "exynos4-fimc.0",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 16),
 		},
@@ -919,7 +858,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
-			.id		= 1,
+			.devname	= "exynos4-fimc.1",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 20),
 		},
@@ -929,7 +868,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
-			.id		= 0,
+			.devname	= "exynos4-fimc.0",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
@@ -939,7 +878,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
-			.id		= 1,
+			.devname	= "exynos4-fimc.1",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 4),
 		},
@@ -949,7 +888,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
-			.id		= 2,
+			.devname	= "exynos4-fimc.2",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 8),
 		},
@@ -959,7 +898,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
-			.id		= 3,
+			.devname	= "exynos4-fimc.3",
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 12),
 		},
@@ -969,7 +908,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimd",
-			.id		= 0,
+			.devname	= "s5pv310-fb.0",
 			.enable		= exynos4_clksrc_mask_lcd0_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
@@ -979,7 +918,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimd",
-			.id		= 1,
+			.devname	= "s5pv310-fb.1",
 			.enable		= exynos4_clksrc_mask_lcd1_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
@@ -989,7 +928,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_sata",
-			.id		= -1,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 24),
 		},
@@ -999,7 +937,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
-			.id		= 0,
+			.devname	= "s3c64xx-spi.0",
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 16),
 		},
@@ -1009,7 +947,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
-			.id		= 1,
+			.devname	= "s3c64xx-spi.1",
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 20),
 		},
@@ -1019,7 +957,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
-			.id		= 2,
+			.devname	= "s3c64xx-spi.2",
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 24),
 		},
@@ -1029,7 +967,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimg2d",
-			.id		= -1,
 		},
 		.sources = &clkset_mout_g2d,
 		.reg_src = { .reg = S5P_CLKSRC_IMAGE, .shift = 8, .size = 1 },
@@ -1037,7 +974,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 0,
+			.devname	= "s3c-sdhci.0",
 			.parent		= &clk_dout_mmc0.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 0),
@@ -1046,7 +983,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 1,
+			.devname	= "s3c-sdhci.1",
 			.parent         = &clk_dout_mmc1.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 4),
@@ -1055,7 +992,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 2,
+			.devname	= "s3c-sdhci.2",
 			.parent         = &clk_dout_mmc2.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 8),
@@ -1064,7 +1001,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 3,
+			.devname	= "s3c-sdhci.3",
 			.parent         = &clk_dout_mmc3.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 12),
@@ -1072,8 +1009,7 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_FSYS2, .shift = 24, .size = 8 },
 	}, {
 		.clk		= {
-			.name		= "sclk_mmc",
-			.id		= 4,
+			.name		= "sclk_dwmmc",
 			.parent         = &clk_dout_mmc4.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 16),
diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h b/arch/arm/mach-exynos4/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_EXYNOS4_CLKDEV_H__
+#define __MACH_EXYNOS4_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
diff --git a/arch/arm/mach-exynos4/time.c b/arch/arm/mach-exynos4/time.c
index 86b9fa0..cb63f97 100644
--- a/arch/arm/mach-exynos4/time.c
+++ b/arch/arm/mach-exynos4/time.c
@@ -262,6 +262,7 @@ static void __init exynos4_timer_resources(void)
 	clk_enable(timerclk);
 
 	tmpdev.id = 2;
+	tmpdev.dev.init_name = "s3c24xx-pwm.2";
 	tin2 = clk_get(&tmpdev.dev, "pwm-tin");
 	if (IS_ERR(tin2))
 		panic("failed to get pwm-tin2 clock for system timer");
@@ -272,6 +273,7 @@ static void __init exynos4_timer_resources(void)
 	clk_enable(tin2);
 
 	tmpdev.id = 4;
+	tmpdev.dev.init_name = "s3c24xx-pwm.4";
 	tin4 = clk_get(&tmpdev.dev, "pwm-tin");
 	if (IS_ERR(tin4))
 		panic("failed to get pwm-tin4 clock for system timer");
-- 
1.6.6.rc2
