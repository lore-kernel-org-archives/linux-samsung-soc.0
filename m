From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 4/5] ARM: SAMSUNG: Add clkdev support for exynos4
Date: Mon, 28 Mar 2011 16:37:39 +0530
Message-ID: <1301310460-20974-5-git-send-email-thomas.ab@samsung.com>
References: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40227 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751111Ab1C1LHw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2011 07:07:52 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIR00BO0LKS82A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:40 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIR00B5JLKIZA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:39 +0900 (KST)
In-reply-to: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Add clkdev support for Samsung's Exynos4 platforms.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-exynos4/clock.c               |   57 +++++++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
 arch/arm/mach-exynos4/time.c                |    2 +
 arch/arm/plat-samsung/pwm-clock.c           |   10 +++++
 5 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 93d595a..66f50f8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -779,6 +779,7 @@ config ARCH_EXYNOS4
 	select ARCH_SPARSEMEM_ENABLE
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select ARCH_HAS_CPUFREQ
 	select GENERIC_CLOCKEVENTS
 	select HAVE_S3C_RTC if RTC_CLASS
diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 871f9d5..8e4dbf6 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -404,41 +404,49 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1<<24),
 	}, {
 		.name		= "csis",
+		.devname	= "s5p-mipi-csis.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "csis",
+		.devname	= "s5p-mipi-csis.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "fimc",
+		.devname	= "exynos4-fimc.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "fimc",
+		.devname	= "exynos4-fimc.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "fimc",
+		.devname	= "exynos4-fimc.2",
 		.id		= 2,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "fimc",
+		.devname	= "exynos4-fimc.3",
 		.id		= 3,
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "fimd",
+		.devname	= "s5pv310-fb.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_lcd0_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "fimd",
+		.devname	= "s5pv310-fb.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_lcd1_ctrl,
 		.ctrlbit	= (1 << 0),
@@ -450,30 +458,35 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.0",
 		.id		= 0,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.1",
 		.id		= 1,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.2",
 		.id		= 2,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.3",
 		.id		= 3,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.4",
 		.id		= 4,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
@@ -486,11 +499,13 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "pdma",
+		.devname	= "s3c-pl330.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "pdma",
+		.devname	= "s3c-pl330.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 1),
@@ -527,31 +542,37 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 13),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.2",
 		.id		= 2,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 20),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.2",
 		.id		= 2,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 21),
@@ -567,48 +588,56 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.0",
 		.id		= 0,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.1",
 		.id		= 1,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.2",
 		.id		= 2,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.3",
 		.id		= 3,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.4",
 		.id		= 4,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.5",
 		.id		= 5,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 11),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.6",
 		.id		= 6,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c-i2c.7",
 		.id		= 7,
 		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_peril_ctrl,
@@ -689,31 +718,37 @@ static struct clk init_clocks_off[] = {
 static struct clk init_clocks[] = {
 	{
 		.name		= "uart",
+		.devname	= "s5pv210-uart.0",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.1",
 		.id		= 1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.2",
 		.id		= 2,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.3",
 		.id		= 3,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.4",
 		.id		= 4,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.5",
 		.id		= 5,
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 5),
@@ -839,6 +874,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 0),
@@ -849,6 +885,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 4),
@@ -859,6 +896,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.2",
 			.id		= 2,
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 8),
@@ -869,6 +907,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.3",
 			.id		= 3,
 			.enable		= exynos4_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 12),
@@ -889,6 +928,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_csis",
+			.devname	= "s5p-mipi-csis.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 24),
@@ -899,6 +939,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_csis",
+			.devname	= "s5p-mipi-csis.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 28),
@@ -909,6 +950,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
+			.devname	= "exynos4-fimc.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 16),
@@ -919,6 +961,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
+			.devname	= "exynos4-fimc.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 20),
@@ -929,6 +972,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
+			.devname	= "exynos4-fimc.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 0),
@@ -939,6 +983,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
+			.devname	= "exynos4-fimc.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 4),
@@ -949,6 +994,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
+			.devname	= "exynos4-fimc.2",
 			.id		= 2,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 8),
@@ -959,6 +1005,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimc",
+			.devname	= "exynos4-fimc.3",
 			.id		= 3,
 			.enable		= exynos4_clksrc_mask_cam_ctrl,
 			.ctrlbit	= (1 << 12),
@@ -969,6 +1016,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimd",
+			.devname	= "s5pv310-fb.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_lcd0_ctrl,
 			.ctrlbit	= (1 << 0),
@@ -979,6 +1027,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimd",
+			.devname	= "s5pv310-fb.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_lcd1_ctrl,
 			.ctrlbit	= (1 << 0),
@@ -999,6 +1048,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 16),
@@ -1009,6 +1059,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 20),
@@ -1019,6 +1070,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.2",
 			.id		= 2,
 			.enable		= exynos4_clksrc_mask_peril1_ctrl,
 			.ctrlbit	= (1 << 24),
@@ -1037,6 +1089,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "s3c-sdhci.0",
 			.id		= 0,
 			.parent		= &clk_dout_mmc0.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
@@ -1046,6 +1099,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "s3c-sdhci.1",
 			.id		= 1,
 			.parent         = &clk_dout_mmc1.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
@@ -1055,6 +1109,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "s3c-sdhci.2",
 			.id		= 2,
 			.parent         = &clk_dout_mmc2.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
@@ -1064,6 +1119,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "s3c-sdhci.3",
 			.id		= 3,
 			.parent         = &clk_dout_mmc3.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
@@ -1073,6 +1129,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "s3c-sdhci.4",
 			.id		= 4,
 			.parent         = &clk_dout_mmc4.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
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
diff --git a/arch/arm/plat-samsung/pwm-clock.c b/arch/arm/plat-samsung/pwm-clock.c
index 46c9381..f1bba88 100644
--- a/arch/arm/plat-samsung/pwm-clock.c
+++ b/arch/arm/plat-samsung/pwm-clock.c
@@ -268,6 +268,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[0]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.0",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[0],
 		},
@@ -275,6 +276,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[1]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.1",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[0],
 		}
@@ -282,6 +284,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[2]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.2",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -289,6 +292,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[3]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.3",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -296,6 +300,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[4]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.4",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -361,26 +366,31 @@ static struct clk_ops clk_tin_ops = {
 static struct clk clk_tin[] = {
 	[0]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.0",
 		.id	= 0,
 		.ops	= &clk_tin_ops,
 	},
 	[1]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.1",
 		.id	= 1,
 		.ops	= &clk_tin_ops,
 	},
 	[2]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.2",
 		.id	= 2,
 		.ops	= &clk_tin_ops,
 	},
 	[3]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.3",
 		.id	= 3,
 		.ops	= &clk_tin_ops,
 	},
 	[4]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.4",
 		.id	= 4,
 		.ops	= &clk_tin_ops,
 	},
-- 
1.6.6.rc2
