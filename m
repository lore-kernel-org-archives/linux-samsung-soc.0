From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 6/7] ARM: S5PV210: Add clkdev support
Date: Fri, 20 May 2011 02:48:25 +0530
Message-ID: <1305839906-1815-7-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62400 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932627Ab1ESVL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:26 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG004X4O6LW8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:25 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add clkdev support for Samsung's s5pv210 platform.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s5pv210/clock.c               |   42 ++++++++++++++++++++++++++-
 arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 ++++
 3 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b329ee4..8d010f2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -769,6 +769,7 @@ config ARCH_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select ARM_L1_CACHE_SHIFT_6
 	select ARCH_HAS_CPUFREQ
 	select GENERIC_CLOCKEVENTS
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 2d59949..747d176 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -312,12 +312,14 @@ static struct clk_ops clk_fout_apll_ops = {
 static struct clk init_clocks_off[] = {
 	{
 		.name		= "pdma",
+		.devname	= "s3c-pl330.0",
 		.id		= 0,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "pdma",
+		.devname	= "s3c-pl330.1",
 		.id		= 1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
@@ -330,18 +332,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1<<29),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5pv210-fimc.0",
 		.id		= 0,
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 24),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5pv210-fimc.1",
 		.id		= 1,
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5pv210-fimc.2",
 		.id		= 2,
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
@@ -366,30 +371,34 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1<<0),
 	}, {
 		.name		= "cfcon",
-		.id		= 0,
+		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<25),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.0",
 		.id		= 0,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<16),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.1",
 		.id		= 1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<17),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.2",
 		.id		= 2,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<18),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.3",
 		.id		= 3,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
@@ -414,36 +423,42 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1<<15),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.0",
 		.id		= 0,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<7),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.1",
 		.id		= 1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.2",
 		.id		= 2,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<9),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<12),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<13),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.2",
 		.id		= 2,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
@@ -468,18 +483,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1<<21),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<4),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.2",
 		.id		= 2,
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
@@ -503,24 +521,28 @@ static struct clk init_clocks[] = {
 		.ops		= &clk_hclk_imem_ops,
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.0",
 		.id		= 0,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.1",
 		.id		= 1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.2",
 		.id		= 2,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "uart",
+		.devname	= "s5pv210-uart.3",
 		.id		= 3,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
@@ -647,6 +669,7 @@ static struct clksrc_sources clkset_sclk_audio0 = {
 static struct clksrc_clk clk_sclk_audio0 = {
 	.clk		= {
 		.name		= "sclk_audio",
+		.devname	= "soc-audio.0",
 		.id		= 0,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 24),
@@ -676,6 +699,7 @@ static struct clksrc_sources clkset_sclk_audio1 = {
 static struct clksrc_clk clk_sclk_audio1 = {
 	.clk		= {
 		.name		= "sclk_audio",
+		.devname	= "soc-audio.1",
 		.id		= 1,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 25),
@@ -705,6 +729,7 @@ static struct clksrc_sources clkset_sclk_audio2 = {
 static struct clksrc_clk clk_sclk_audio2 = {
 	.clk		= {
 		.name		= "sclk_audio",
+		.devname	= "soc-audio.2",
 		.id		= 2,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 26),
@@ -809,6 +834,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.0",
 			.id		= 0,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 12),
@@ -819,6 +845,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.1",
 			.id		= 1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 13),
@@ -829,6 +856,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.2",
 			.id		= 2,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 14),
@@ -839,6 +867,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
+			.devname	= "s5pv210-uart.3",
 			.id		= 3,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 15),
@@ -858,6 +887,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5pv210-fimc.0",
 			.id		= 0,
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 2),
@@ -868,6 +898,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5pv210-fimc.1",
 			.id		= 1,
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 3),
@@ -878,6 +909,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5pv210-fimc.2",
 			.id		= 2,
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 4),
@@ -888,6 +920,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
+			.devname	= "s5pv210-fimc.0",
 			.id		= 0,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 3),
@@ -898,6 +931,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
+			.devname	= "s5pv210-fimc.1",
 			.id		= 1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 4),
@@ -918,6 +952,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.0",
 			.id		= 0,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 8),
@@ -928,6 +963,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.1",
 			.id		= 1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 9),
@@ -938,6 +974,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.2",
 			.id		= 2,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 10),
@@ -948,6 +985,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.3",
 			.id		= 3,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 11),
@@ -998,6 +1036,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 16),
@@ -1008,6 +1047,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 17),
diff --git a/arch/arm/mach-s5pv210/include/mach/clkdev.h b/arch/arm/mach-s5pv210/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_EXYNOS4_CLKDEV_H__
+#define __MACH_EXYNOS4_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
-- 
1.6.6.rc2
