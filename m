From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6440: Move CPU related file
Date: Thu, 21 Jan 2010 19:13:03 +0900
Message-ID: <1264068783-16233-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41244 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755078Ab0AUKUo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2010 05:20:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch moves S5P6440 CPU related files into mach-s5p6440
from arch/arm/plat-s5p directory.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/Kconfig         |   10 +
 arch/arm/mach-s5p6440/Makefile        |    2 +
 arch/arm/mach-s5p6440/s5p6440-clock.c |  698 +++++++++++++++++++++++++++++++++
 arch/arm/mach-s5p6440/s5p6440-init.c  |   50 +++
 arch/arm/plat-s5p/Kconfig             |   16 -
 arch/arm/plat-s5p/Makefile            |    5 -
 arch/arm/plat-s5p/s5p6440-clock.c     |  698 ---------------------------------
 arch/arm/plat-s5p/s5p6440-init.c      |   50 ---
 8 files changed, 760 insertions(+), 769 deletions(-)
 create mode 100644 arch/arm/mach-s5p6440/s5p6440-clock.c
 create mode 100644 arch/arm/mach-s5p6440/s5p6440-init.c
 delete mode 100644 arch/arm/plat-s5p/s5p6440-clock.c
 delete mode 100644 arch/arm/plat-s5p/s5p6440-init.c

diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kconfig
index 3aa2462..36d3596 100644
--- a/arch/arm/mach-s5p6440/Kconfig
+++ b/arch/arm/mach-s5p6440/Kconfig
@@ -14,6 +14,16 @@ config CPU_S5P6440
 	help
 	  Enable S5P6440 CPU support
 
+config CPU_S5P6440_INIT
+	bool
+	help
+	  Initialization code for the S5P6440.
+
+config CPU_S5P6440_CLOCK
+	bool
+	help
+	  Clock support code for the S5P6440.
+
 config MACH_SMDK6440
 	bool "SMDK6440"
 	select CPU_S5P6440
diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index a79b130..bfc12aa 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -13,6 +13,8 @@ obj-				:=
 # Core support for S5P6440 system
 
 obj-$(CONFIG_CPU_S5P6440)	+= cpu.o s5p6440-gpio.o
+obj-$(CONFIG_CPU_S5P6440_INIT)	+= s5p6440-init.o
+obj-$(CONFIG_CPU_S5P6440_CLOCK)	+= s5p6440-clock.o
 
 # machine support
 
diff --git a/arch/arm/mach-s5p6440/s5p6440-clock.c b/arch/arm/mach-s5p6440/s5p6440-clock.c
new file mode 100644
index 0000000..1250a2c
--- /dev/null
+++ b/arch/arm/mach-s5p6440/s5p6440-clock.c
@@ -0,0 +1,698 @@
+/* linux/arch/arm/mach-s5p6440/s5p6440-clock.c
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P6440 - Clock support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/sysdev.h>
+#include <linux/io.h>
+
+#include <mach/hardware.h>
+#include <mach/map.h>
+
+#include <plat/cpu-freq.h>
+#include <mach/regs-clock.h>
+#include <plat/clock.h>
+#include <plat/cpu.h>
+#include <plat/clock-clksrc.h>
+#include <plat/s5p-clock.h>
+#include <plat/pll.h>
+#include <plat/s5p6440.h>
+
+/* APLL Mux output clock */
+static struct clksrc_clk clk_mout_apll = {
+	.clk    = {
+		.name           = "mout_apll",
+		.id             = -1,
+	},
+	.sources        = &clk_src_apll,
+	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
+};
+
+static int s5p6440_epll_enable(struct clk *clk, int enable)
+{
+	unsigned int ctrlbit = clk->ctrlbit;
+	unsigned int epll_con = __raw_readl(S5P_EPLL_CON) & ~ctrlbit;
+
+	if (enable)
+		__raw_writel(epll_con | ctrlbit, S5P_EPLL_CON);
+	else
+		__raw_writel(epll_con, S5P_EPLL_CON);
+
+	return 0;
+}
+
+static unsigned long s5p6440_epll_get_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+static u32 epll_div[][5] = {
+	{ 36000000,	0,	48, 1, 4 },
+	{ 48000000,	0,	32, 1, 3 },
+	{ 60000000,	0,	40, 1, 3 },
+	{ 72000000,	0,	48, 1, 3 },
+	{ 84000000,	0,	28, 1, 2 },
+	{ 96000000,	0,	32, 1, 2 },
+	{ 32768000,	45264,	43, 1, 4 },
+	{ 45158000,	6903,	30, 1, 3 },
+	{ 49152000,	50332,	32, 1, 3 },
+	{ 67738000,	10398,	45, 1, 3 },
+	{ 73728000,	9961,	49, 1, 3 }
+};
+
+static int s5p6440_epll_set_rate(struct clk *clk, unsigned long rate)
+{
+	unsigned int epll_con, epll_con_k;
+	unsigned int i;
+
+	if (clk->rate == rate)	/* Return if nothing changed */
+		return 0;
+
+	epll_con = __raw_readl(S5P_EPLL_CON);
+	epll_con_k = __raw_readl(S5P_EPLL_CON_K);
+
+	epll_con_k &= ~(PLL90XX_KDIV_MASK);
+	epll_con &= ~(PLL90XX_MDIV_MASK | PLL90XX_PDIV_MASK | PLL90XX_SDIV_MASK);
+
+	for (i = 0; i < ARRAY_SIZE(epll_div); i++) {
+		 if (epll_div[i][0] == rate) {
+			epll_con_k |= (epll_div[i][1] << PLL90XX_KDIV_SHIFT);
+			epll_con |= (epll_div[i][2] << PLL90XX_MDIV_SHIFT) |
+				    (epll_div[i][3] << PLL90XX_PDIV_SHIFT) |
+				    (epll_div[i][4] << PLL90XX_SDIV_SHIFT);
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(epll_div)) {
+		printk(KERN_ERR "%s: Invalid Clock EPLL Frequency\n", __func__);
+		return -EINVAL;
+	}
+
+	__raw_writel(epll_con, S5P_EPLL_CON);
+	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
+
+	clk->rate = rate;
+
+	return 0;
+}
+
+static struct clk_ops s5p6440_epll_ops = {
+	.get_rate = s5p6440_epll_get_rate,
+	.set_rate = s5p6440_epll_set_rate,
+};
+
+static struct clksrc_clk clk_mout_epll = {
+	.clk    = {
+		.name           = "mout_epll",
+		.id             = -1,
+	},
+	.sources        = &clk_src_epll,
+	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 2, .size = 1 },
+};
+
+static struct clksrc_clk clk_mout_mpll = {
+	.clk = {
+		.name           = "mout_mpll",
+		.id             = -1,
+	},
+	.sources        = &clk_src_mpll,
+	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 1, .size = 1 },
+};
+
+static struct clk clk_h_low = {
+	.name		= "hclk_low",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+	.ops		= &clk_ops_def_setrate,
+};
+
+static struct clk clk_p_low = {
+	.name		= "pclk_low",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+	.ops		= &clk_ops_def_setrate,
+};
+
+enum perf_level {
+	L0 = 532*1000,
+	L1 = 266*1000,
+	L2 = 133*1000,
+};
+
+static const u32 clock_table[][3] = {
+	/*{ARM_CLK, DIVarm, DIVhclk}*/
+	{L0 * 1000, (0 << ARM_DIV_RATIO_SHIFT), (3 << S5P_CLKDIV0_HCLK_SHIFT)},
+	{L1 * 1000, (1 << ARM_DIV_RATIO_SHIFT), (1 << S5P_CLKDIV0_HCLK_SHIFT)},
+	{L2 * 1000, (3 << ARM_DIV_RATIO_SHIFT), (0 << S5P_CLKDIV0_HCLK_SHIFT)},
+};
+
+static unsigned long s5p6440_armclk_get_rate(struct clk *clk)
+{
+	unsigned long rate = clk_get_rate(clk->parent);
+	u32 clkdiv;
+
+	/* divisor mask starts at bit0, so no need to shift */
+	clkdiv = __raw_readl(ARM_CLK_DIV) & ARM_DIV_MASK;
+
+	return rate / (clkdiv + 1);
+}
+
+static unsigned long s5p6440_armclk_round_rate(struct clk *clk,
+						unsigned long rate)
+{
+	u32 iter;
+
+	for (iter = 1 ; iter < ARRAY_SIZE(clock_table) ; iter++) {
+		if (rate > clock_table[iter][0])
+			return clock_table[iter-1][0];
+	}
+
+	return clock_table[ARRAY_SIZE(clock_table) - 1][0];
+}
+
+static int s5p6440_armclk_set_rate(struct clk *clk, unsigned long rate)
+{
+	u32 round_tmp;
+	u32 iter;
+	u32 clk_div0_tmp;
+	u32 cur_rate = clk->ops->get_rate(clk);
+	unsigned long flags;
+
+	round_tmp = clk->ops->round_rate(clk, rate);
+	if (round_tmp == cur_rate)
+		return 0;
+
+
+	for (iter = 0 ; iter < ARRAY_SIZE(clock_table) ; iter++) {
+		if (round_tmp == clock_table[iter][0])
+			break;
+	}
+
+	if (iter >= ARRAY_SIZE(clock_table))
+		iter = ARRAY_SIZE(clock_table) - 1;
+
+	local_irq_save(flags);
+	if (cur_rate > round_tmp) {
+		/* Frequency Down */
+		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) & ~(ARM_DIV_MASK);
+		clk_div0_tmp |= clock_table[iter][1];
+		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
+
+		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) &
+				~(S5P_CLKDIV0_HCLK_MASK);
+		clk_div0_tmp |= clock_table[iter][2];
+		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
+
+
+	} else {
+		/* Frequency Up */
+		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) &
+				~(S5P_CLKDIV0_HCLK_MASK);
+		clk_div0_tmp |= clock_table[iter][2];
+		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
+
+		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) & ~(ARM_DIV_MASK);
+		clk_div0_tmp |= clock_table[iter][1];
+		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
+		}
+	local_irq_restore(flags);
+
+	clk->rate = clock_table[iter][0];
+
+	return 0;
+}
+
+static struct clk_ops s5p6440_clkarm_ops = {
+	.get_rate	= s5p6440_armclk_get_rate,
+	.set_rate	= s5p6440_armclk_set_rate,
+	.round_rate	= s5p6440_armclk_round_rate,
+};
+
+static unsigned long s5p6440_clk_doutmpll_get_rate(struct clk *clk)
+{
+	unsigned long rate = clk_get_rate(clk->parent);
+
+	if (__raw_readl(S5P_CLK_DIV0) & S5P_CLKDIV0_MPLL_MASK)
+		rate /= 2;
+
+	return rate;
+}
+
+static struct clk clk_dout_mpll = {
+	.name		= "dout_mpll",
+	.id		= -1,
+	.parent		= &clk_mout_mpll.clk,
+	.ops            = &(struct clk_ops) {
+		.get_rate	= s5p6440_clk_doutmpll_get_rate,
+	},
+};
+
+int s5p6440_clk48m_ctrl(struct clk *clk, int enable)
+{
+	unsigned long flags;
+	u32 val;
+
+	/* can't rely on clock lock, this register has other usages */
+	local_irq_save(flags);
+
+	val = __raw_readl(S5P_OTHERS);
+	if (enable)
+		val |= S5P_OTHERS_USB_SIG_MASK;
+	else
+		val &= ~S5P_OTHERS_USB_SIG_MASK;
+
+	__raw_writel(val, S5P_OTHERS);
+
+	local_irq_restore(flags);
+
+	return 0;
+}
+
+static int s5p6440_pclk_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_PCLK, clk, enable);
+}
+
+static int s5p6440_hclk0_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_HCLK0, clk, enable);
+}
+
+static int s5p6440_hclk1_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_HCLK1, clk, enable);
+}
+
+static int s5p6440_sclk_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_SCLK0, clk, enable);
+}
+
+static int s5p6440_mem_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_MEM0, clk, enable);
+}
+
+/*
+ * The following clocks will be disabled during clock initialization. It is
+ * recommended to keep the following clocks disabled until the driver requests
+ * for enabling the clock.
+ */
+static struct clk init_clocks_disable[] = {
+	{
+		.name		= "nand",
+		.id		= -1,
+		.parent		= &clk_h,
+		.enable		= s5p6440_mem_ctrl,
+		.ctrlbit	= S5P_CLKCON_MEM0_HCLK_NFCON,
+	}, {
+		.name		= "adc",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_TSADC,
+	}, {
+		.name		= "i2c",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_IIC0,
+	}, {
+		.name		= "i2s_v40",
+		.id		= 0,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_IIS2,
+	}, {
+		.name		= "spi",
+		.id		= 0,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_SPI0,
+	}, {
+		.name		= "spi",
+		.id		= 1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_SPI1,
+	}, {
+		.name		= "sclk_spi_48",
+		.id		= 0,
+		.parent		= &clk_48m,
+		.enable		= s5p6440_sclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_SCLK0_SPI0_48,
+	}, {
+		.name		= "sclk_spi_48",
+		.id		= 1,
+		.parent		= &clk_48m,
+		.enable		= s5p6440_sclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_SCLK0_SPI1_48,
+	}, {
+		.name		= "mmc_48m",
+		.id		= 0,
+		.parent		= &clk_48m,
+		.enable		= s5p6440_sclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_SCLK0_MMC0_48,
+	}, {
+		.name		= "mmc_48m",
+		.id		= 1,
+		.parent		= &clk_48m,
+		.enable		= s5p6440_sclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_SCLK0_MMC1_48,
+	}, {
+		.name		= "mmc_48m",
+		.id		= 2,
+		.parent		= &clk_48m,
+		.enable		= s5p6440_sclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_SCLK0_MMC2_48,
+	}, {
+		.name    	= "otg",
+		.id	   	= -1,
+		.parent  	= &clk_h_low,
+		.enable  	= s5p6440_hclk0_ctrl,
+		.ctrlbit 	= S5P_CLKCON_HCLK0_USB
+	}, {
+		.name    	= "post",
+		.id	   	= -1,
+		.parent  	= &clk_h_low,
+		.enable  	= s5p6440_hclk0_ctrl,
+		.ctrlbit 	= S5P_CLKCON_HCLK0_POST0
+	}, {
+		.name		= "lcd",
+		.id		= -1,
+		.parent		= &clk_h_low,
+		.enable		= s5p6440_hclk1_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK1_DISPCON,
+	}, {
+		.name		= "hsmmc",
+		.id		= 0,
+		.parent		= &clk_h_low,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC0,
+	}, {
+		.name		= "hsmmc",
+		.id		= 1,
+		.parent		= &clk_h_low,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC1,
+	}, {
+		.name		= "hsmmc",
+		.id		= 2,
+		.parent		= &clk_h_low,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC2,
+	}, {
+		.name		= "rtc",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_RTC,
+	}, {
+		.name		= "watchdog",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_WDT,
+	}, {
+		.name		= "timers",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
+	}
+};
+
+/*
+ * The following clocks will be enabled during clock initialization.
+ */
+static struct clk init_clocks[] = {
+	{
+		.name		= "gpio",
+		.id		= -1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_GPIO,
+	}, {
+		.name		= "uart",
+		.id		= 0,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_UART0,
+	}, {
+		.name		= "uart",
+		.id		= 1,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_UART1,
+	}, {
+		.name		= "uart",
+		.id		= 2,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_UART2,
+	}, {
+		.name		= "uart",
+		.id		= 3,
+		.parent		= &clk_p_low,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
+	}
+};
+
+static struct clk clk_iis_cd_v40 = {
+	.name		= "iis_cdclk_v40",
+	.id		= -1,
+};
+
+static struct clk clk_pcm_cd = {
+	.name		= "pcm_cdclk",
+	.id		= -1,
+};
+
+static struct clk *clkset_spi_mmc_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_fin_epll,
+};
+
+static struct clksrc_sources clkset_spi_mmc = {
+	.sources	= clkset_spi_mmc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_spi_mmc_list),
+};
+
+static struct clk *clkset_uart_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll
+};
+
+static struct clksrc_sources clkset_uart = {
+	.sources	= clkset_uart_list,
+	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
+};
+
+static struct clksrc_clk clksrcs[] = {
+	{
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 0,
+			.ctrlbit        = S5P_CLKCON_SCLK0_MMC0,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_spi_mmc,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 18, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 0, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 1,
+			.ctrlbit        = S5P_CLKCON_SCLK0_MMC1,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_spi_mmc,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 20, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 4, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 2,
+			.ctrlbit        = S5P_CLKCON_SCLK0_MMC2,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_spi_mmc,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 22, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 8, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "uclk1",
+			.id		= -1,
+			.ctrlbit        = S5P_CLKCON_SCLK0_UART,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_uart,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 13, .size = 1 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 16, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "spi_epll",
+			.id		= 0,
+			.ctrlbit        = S5P_CLKCON_SCLK0_SPI0,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_spi_mmc,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 14, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "spi_epll",
+			.id		= 1,
+			.ctrlbit        = S5P_CLKCON_SCLK0_SPI1,
+			.enable		= s5p6440_sclk_ctrl,
+		},
+		.sources = &clkset_spi_mmc,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 16, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
+	}
+};
+
+/* Clock initialisation code */
+static struct clksrc_clk *init_parents[] = {
+	&clk_mout_apll,
+	&clk_mout_epll,
+	&clk_mout_mpll,
+};
+
+void __init_or_cpufreq s5p6440_setup_clocks(void)
+{
+	struct clk *xtal_clk;
+	unsigned long xtal;
+	unsigned long fclk;
+	unsigned long hclk;
+	unsigned long hclk_low;
+	unsigned long pclk;
+	unsigned long pclk_low;
+	unsigned long epll;
+	unsigned long apll;
+	unsigned long mpll;
+	unsigned int ptr;
+	u32 clkdiv0;
+	u32 clkdiv3;
+
+	/* Set S5P6440 functions for clk_fout_epll */
+	clk_fout_epll.enable = s5p6440_epll_enable;
+	clk_fout_epll.ops = &s5p6440_epll_ops;
+
+	/* Set S5P6440 functions for arm clock */
+	clk_arm.parent = &clk_mout_apll.clk;
+	clk_arm.ops = &s5p6440_clkarm_ops;
+	clk_48m.enable = s5p6440_clk48m_ctrl;
+
+	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
+	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
+
+	xtal_clk = clk_get(NULL, "ext_xtal");
+	BUG_ON(IS_ERR(xtal_clk));
+
+	xtal = clk_get_rate(xtal_clk);
+	clk_put(xtal_clk);
+
+	epll = s5p_get_pll90xx(xtal, __raw_readl(S5P_EPLL_CON),
+				__raw_readl(S5P_EPLL_CON_K));
+	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
+	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4502);
+
+	printk(KERN_INFO "S5P6440: PLL settings, A=%ld.%ldMHz, M=%ld.%ldMHz," \
+			" E=%ld.%ldMHz\n",
+			print_mhz(apll), print_mhz(mpll), print_mhz(epll));
+
+	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_ARM);
+	hclk = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK);
+	pclk = hclk / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK);
+
+	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
+		/* Asynchronous mode */
+		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
+	} else {
+		/* Synchronous mode */
+		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
+	}
+
+	pclk_low = hclk_low / GET_DIV(clkdiv3, S5P_CLKDIV3_PCLK_LOW);
+
+	printk(KERN_INFO "S5P6440: HCLK=%ld.%ldMHz, HCLK_LOW=%ld.%ldMHz," \
+			" PCLK=%ld.%ldMHz, PCLK_LOW=%ld.%ldMHz\n",
+			print_mhz(hclk), print_mhz(hclk_low),
+			print_mhz(pclk), print_mhz(pclk_low));
+
+	clk_fout_mpll.rate = mpll;
+	clk_fout_epll.rate = epll;
+	clk_fout_apll.rate = apll;
+
+	clk_f.rate = fclk;
+	clk_h.rate = hclk;
+	clk_p.rate = pclk;
+	clk_h_low.rate = hclk_low;
+	clk_p_low.rate = pclk_low;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
+		s3c_set_clksrc(init_parents[ptr], true);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
+		s3c_set_clksrc(&clksrcs[ptr], true);
+}
+
+static struct clk *clks[] __initdata = {
+	&clk_ext,
+	&clk_mout_epll.clk,
+	&clk_mout_mpll.clk,
+	&clk_dout_mpll,
+	&clk_iis_cd_v40,
+	&clk_pcm_cd,
+	&clk_p_low,
+	&clk_h_low,
+};
+
+void __init s5p6440_register_clocks(void)
+{
+	struct clk *clkp;
+	int ret;
+	int ptr;
+
+	ret = s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
+	if (ret > 0)
+		printk(KERN_ERR "Failed to register %u clocks\n", ret);
+
+	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
+
+	clkp = init_clocks_disable;
+	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
+
+		ret = s3c24xx_register_clock(clkp);
+		if (ret < 0) {
+			printk(KERN_ERR "Failed to register clock %s (%d)\n",
+			       clkp->name, ret);
+		}
+		(clkp->enable)(clkp, 0);
+	}
+
+	s3c_pwmclk_init();
+}
diff --git a/arch/arm/mach-s5p6440/s5p6440-init.c b/arch/arm/mach-s5p6440/s5p6440-init.c
new file mode 100644
index 0000000..56b1e18
--- /dev/null
+++ b/arch/arm/mach-s5p6440/s5p6440-init.c
@@ -0,0 +1,50 @@
+/* linux/arch/arm/mach-s5p6440/s5p6440-init.c
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/serial_core.h>
+
+#include <plat/cpu.h>
+#include <plat/devs.h>
+#include <plat/s5p6440.h>
+#include <plat/regs-serial.h>
+
+static struct s3c24xx_uart_clksrc s5p6440_serial_clocks[] = {
+	[0] = {
+		.name		= "pclk_low",
+		.divisor	= 1,
+		.min_baud	= 0,
+		.max_baud	= 0,
+	},
+	[1] = {
+		.name		= "uclk1",
+		.divisor	= 1,
+		.min_baud	= 0,
+		.max_baud	= 0,
+	},
+};
+
+/* uart registration process */
+void __init s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, int no)
+{
+	struct s3c2410_uartcfg *tcfg = cfg;
+	u32 ucnt;
+
+	for (ucnt = 0; ucnt < no; ucnt++, tcfg++) {
+		if (!tcfg->clocks) {
+			tcfg->clocks = s5p6440_serial_clocks;
+			tcfg->clocks_size = ARRAY_SIZE(s5p6440_serial_clocks);
+		}
+	}
+
+	s3c24xx_init_uartdevs("s3c6400-uart", s5p_uart_resources, cfg, no);
+}
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e7c31e7..fca6dad 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -24,19 +24,3 @@ config PLAT_S5P
 	select SAMSUNG_IRQ_UART
 	help
 	  Base platform code for Samsung's S5P series SoC.
-
-if (PLAT_S5P && ARCH_S5P6440)
-
-# Configuration options shared by all S5P64XX implementations
-
-config CPU_S5P6440_INIT
-	bool
-	help
-	 Initialisation code for the S5P6440.
-
-config CPU_S5P6440_CLOCK
-	bool
-	help
-	  Clock support code for the S5P6440.
-
-endif
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 92b6474..a7c54b3 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -17,8 +17,3 @@ obj-y				+= cpu.o
 obj-y				+= clock.o
 obj-y				+= irq.o
 obj-y				+= setup-i2c0.o
-
-# CPU support
-
-obj-$(CONFIG_CPU_S5P6440_INIT)	+= s5p6440-init.o
-obj-$(CONFIG_CPU_S5P6440_CLOCK)	+= s5p6440-clock.o
diff --git a/arch/arm/plat-s5p/s5p6440-clock.c b/arch/arm/plat-s5p/s5p6440-clock.c
deleted file mode 100644
index 2f412f8..0000000
--- a/arch/arm/plat-s5p/s5p6440-clock.c
+++ /dev/null
@@ -1,698 +0,0 @@
-/* linux/arch/arm/plat-s5p/s5p6440-clock.c
- *
- * Copyright (c) 2009 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * S5P6440 - Clock support
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
-#include <linux/errno.h>
-#include <linux/err.h>
-#include <linux/clk.h>
-#include <linux/sysdev.h>
-#include <linux/io.h>
-
-#include <mach/hardware.h>
-#include <mach/map.h>
-
-#include <plat/cpu-freq.h>
-#include <mach/regs-clock.h>
-#include <plat/clock.h>
-#include <plat/cpu.h>
-#include <plat/clock-clksrc.h>
-#include <plat/s5p-clock.h>
-#include <plat/pll.h>
-#include <plat/s5p6440.h>
-
-/* APLL Mux output clock */
-static struct clksrc_clk clk_mout_apll = {
-	.clk    = {
-		.name           = "mout_apll",
-		.id             = -1,
-	},
-	.sources        = &clk_src_apll,
-	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
-};
-
-static int s5p6440_epll_enable(struct clk *clk, int enable)
-{
-	unsigned int ctrlbit = clk->ctrlbit;
-	unsigned int epll_con = __raw_readl(S5P_EPLL_CON) & ~ctrlbit;
-
-	if (enable)
-		__raw_writel(epll_con | ctrlbit, S5P_EPLL_CON);
-	else
-		__raw_writel(epll_con, S5P_EPLL_CON);
-
-	return 0;
-}
-
-static unsigned long s5p6440_epll_get_rate(struct clk *clk)
-{
-	return clk->rate;
-}
-
-static u32 epll_div[][5] = {
-	{ 36000000,	0,	48, 1, 4 },
-	{ 48000000,	0,	32, 1, 3 },
-	{ 60000000,	0,	40, 1, 3 },
-	{ 72000000,	0,	48, 1, 3 },
-	{ 84000000,	0,	28, 1, 2 },
-	{ 96000000,	0,	32, 1, 2 },
-	{ 32768000,	45264,	43, 1, 4 },
-	{ 45158000,	6903,	30, 1, 3 },
-	{ 49152000,	50332,	32, 1, 3 },
-	{ 67738000,	10398,	45, 1, 3 },
-	{ 73728000,	9961,	49, 1, 3 }
-};
-
-static int s5p6440_epll_set_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned int epll_con, epll_con_k;
-	unsigned int i;
-
-	if (clk->rate == rate)	/* Return if nothing changed */
-		return 0;
-
-	epll_con = __raw_readl(S5P_EPLL_CON);
-	epll_con_k = __raw_readl(S5P_EPLL_CON_K);
-
-	epll_con_k &= ~(PLL90XX_KDIV_MASK);
-	epll_con &= ~(PLL90XX_MDIV_MASK | PLL90XX_PDIV_MASK | PLL90XX_SDIV_MASK);
-
-	for (i = 0; i < ARRAY_SIZE(epll_div); i++) {
-		 if (epll_div[i][0] == rate) {
-			epll_con_k |= (epll_div[i][1] << PLL90XX_KDIV_SHIFT);
-			epll_con |= (epll_div[i][2] << PLL90XX_MDIV_SHIFT) |
-				    (epll_div[i][3] << PLL90XX_PDIV_SHIFT) |
-				    (epll_div[i][4] << PLL90XX_SDIV_SHIFT);
-			break;
-		}
-	}
-
-	if (i == ARRAY_SIZE(epll_div)) {
-		printk(KERN_ERR "%s: Invalid Clock EPLL Frequency\n", __func__);
-		return -EINVAL;
-	}
-
-	__raw_writel(epll_con, S5P_EPLL_CON);
-	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
-
-	clk->rate = rate;
-
-	return 0;
-}
-
-static struct clk_ops s5p6440_epll_ops = {
-	.get_rate = s5p6440_epll_get_rate,
-	.set_rate = s5p6440_epll_set_rate,
-};
-
-static struct clksrc_clk clk_mout_epll = {
-	.clk    = {
-		.name           = "mout_epll",
-		.id             = -1,
-	},
-	.sources        = &clk_src_epll,
-	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 2, .size = 1 },
-};
-
-static struct clksrc_clk clk_mout_mpll = {
-	.clk = {
-		.name           = "mout_mpll",
-		.id             = -1,
-	},
-	.sources        = &clk_src_mpll,
-	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 1, .size = 1 },
-};
-
-static struct clk clk_h_low = {
-	.name		= "hclk_low",
-	.id		= -1,
-	.rate		= 0,
-	.parent		= NULL,
-	.ctrlbit	= 0,
-	.ops		= &clk_ops_def_setrate,
-};
-
-static struct clk clk_p_low = {
-	.name		= "pclk_low",
-	.id		= -1,
-	.rate		= 0,
-	.parent		= NULL,
-	.ctrlbit	= 0,
-	.ops		= &clk_ops_def_setrate,
-};
-
-enum perf_level {
-	L0 = 532*1000,
-	L1 = 266*1000,
-	L2 = 133*1000,
-};
-
-static const u32 clock_table[][3] = {
-	/*{ARM_CLK, DIVarm, DIVhclk}*/
-	{L0 * 1000, (0 << ARM_DIV_RATIO_SHIFT), (3 << S5P_CLKDIV0_HCLK_SHIFT)},
-	{L1 * 1000, (1 << ARM_DIV_RATIO_SHIFT), (1 << S5P_CLKDIV0_HCLK_SHIFT)},
-	{L2 * 1000, (3 << ARM_DIV_RATIO_SHIFT), (0 << S5P_CLKDIV0_HCLK_SHIFT)},
-};
-
-static unsigned long s5p6440_armclk_get_rate(struct clk *clk)
-{
-	unsigned long rate = clk_get_rate(clk->parent);
-	u32 clkdiv;
-
-	/* divisor mask starts at bit0, so no need to shift */
-	clkdiv = __raw_readl(ARM_CLK_DIV) & ARM_DIV_MASK;
-
-	return rate / (clkdiv + 1);
-}
-
-static unsigned long s5p6440_armclk_round_rate(struct clk *clk,
-						unsigned long rate)
-{
-	u32 iter;
-
-	for (iter = 1 ; iter < ARRAY_SIZE(clock_table) ; iter++) {
-		if (rate > clock_table[iter][0])
-			return clock_table[iter-1][0];
-	}
-
-	return clock_table[ARRAY_SIZE(clock_table) - 1][0];
-}
-
-static int s5p6440_armclk_set_rate(struct clk *clk, unsigned long rate)
-{
-	u32 round_tmp;
-	u32 iter;
-	u32 clk_div0_tmp;
-	u32 cur_rate = clk->ops->get_rate(clk);
-	unsigned long flags;
-
-	round_tmp = clk->ops->round_rate(clk, rate);
-	if (round_tmp == cur_rate)
-		return 0;
-
-
-	for (iter = 0 ; iter < ARRAY_SIZE(clock_table) ; iter++) {
-		if (round_tmp == clock_table[iter][0])
-			break;
-	}
-
-	if (iter >= ARRAY_SIZE(clock_table))
-		iter = ARRAY_SIZE(clock_table) - 1;
-
-	local_irq_save(flags);
-	if (cur_rate > round_tmp) {
-		/* Frequency Down */
-		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) & ~(ARM_DIV_MASK);
-		clk_div0_tmp |= clock_table[iter][1];
-		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
-
-		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) &
-				~(S5P_CLKDIV0_HCLK_MASK);
-		clk_div0_tmp |= clock_table[iter][2];
-		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
-
-
-	} else {
-		/* Frequency Up */
-		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) &
-				~(S5P_CLKDIV0_HCLK_MASK);
-		clk_div0_tmp |= clock_table[iter][2];
-		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
-
-		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) & ~(ARM_DIV_MASK);
-		clk_div0_tmp |= clock_table[iter][1];
-		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
-		}
-	local_irq_restore(flags);
-
-	clk->rate = clock_table[iter][0];
-
-	return 0;
-}
-
-static struct clk_ops s5p6440_clkarm_ops = {
-	.get_rate	= s5p6440_armclk_get_rate,
-	.set_rate	= s5p6440_armclk_set_rate,
-	.round_rate	= s5p6440_armclk_round_rate,
-};
-
-static unsigned long s5p6440_clk_doutmpll_get_rate(struct clk *clk)
-{
-	unsigned long rate = clk_get_rate(clk->parent);
-
-	if (__raw_readl(S5P_CLK_DIV0) & S5P_CLKDIV0_MPLL_MASK)
-		rate /= 2;
-
-	return rate;
-}
-
-static struct clk clk_dout_mpll = {
-	.name		= "dout_mpll",
-	.id		= -1,
-	.parent		= &clk_mout_mpll.clk,
-	.ops            = &(struct clk_ops) {
-		.get_rate	= s5p6440_clk_doutmpll_get_rate,
-	},
-};
-
-int s5p6440_clk48m_ctrl(struct clk *clk, int enable)
-{
-	unsigned long flags;
-	u32 val;
-
-	/* can't rely on clock lock, this register has other usages */
-	local_irq_save(flags);
-
-	val = __raw_readl(S5P_OTHERS);
-	if (enable)
-		val |= S5P_OTHERS_USB_SIG_MASK;
-	else
-		val &= ~S5P_OTHERS_USB_SIG_MASK;
-
-	__raw_writel(val, S5P_OTHERS);
-
-	local_irq_restore(flags);
-
-	return 0;
-}
-
-static int s5p6440_pclk_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLK_GATE_PCLK, clk, enable);
-}
-
-static int s5p6440_hclk0_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLK_GATE_HCLK0, clk, enable);
-}
-
-static int s5p6440_hclk1_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLK_GATE_HCLK1, clk, enable);
-}
-
-static int s5p6440_sclk_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLK_GATE_SCLK0, clk, enable);
-}
-
-static int s5p6440_mem_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLK_GATE_MEM0, clk, enable);
-}
-
-/*
- * The following clocks will be disabled during clock initialization. It is
- * recommended to keep the following clocks disabled until the driver requests
- * for enabling the clock.
- */
-static struct clk init_clocks_disable[] = {
-	{
-		.name		= "nand",
-		.id		= -1,
-		.parent		= &clk_h,
-		.enable		= s5p6440_mem_ctrl,
-		.ctrlbit	= S5P_CLKCON_MEM0_HCLK_NFCON,
-	}, {
-		.name		= "adc",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_TSADC,
-	}, {
-		.name		= "i2c",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_IIC0,
-	}, {
-		.name		= "i2s_v40",
-		.id		= 0,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_IIS2,
-	}, {
-		.name		= "spi",
-		.id		= 0,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_SPI0,
-	}, {
-		.name		= "spi",
-		.id		= 1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_SPI1,
-	}, {
-		.name		= "sclk_spi_48",
-		.id		= 0,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_SPI0_48,
-	}, {
-		.name		= "sclk_spi_48",
-		.id		= 1,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_SPI1_48,
-	}, {
-		.name		= "mmc_48m",
-		.id		= 0,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_MMC0_48,
-	}, {
-		.name		= "mmc_48m",
-		.id		= 1,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_MMC1_48,
-	}, {
-		.name		= "mmc_48m",
-		.id		= 2,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_MMC2_48,
-	}, {
-		.name    	= "otg",
-		.id	   	= -1,
-		.parent  	= &clk_h_low,
-		.enable  	= s5p6440_hclk0_ctrl,
-		.ctrlbit 	= S5P_CLKCON_HCLK0_USB
-	}, {
-		.name    	= "post",
-		.id	   	= -1,
-		.parent  	= &clk_h_low,
-		.enable  	= s5p6440_hclk0_ctrl,
-		.ctrlbit 	= S5P_CLKCON_HCLK0_POST0
-	}, {
-		.name		= "lcd",
-		.id		= -1,
-		.parent		= &clk_h_low,
-		.enable		= s5p6440_hclk1_ctrl,
-		.ctrlbit	= S5P_CLKCON_HCLK1_DISPCON,
-	}, {
-		.name		= "hsmmc",
-		.id		= 0,
-		.parent		= &clk_h_low,
-		.enable		= s5p6440_hclk0_ctrl,
-		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC0,
-	}, {
-		.name		= "hsmmc",
-		.id		= 1,
-		.parent		= &clk_h_low,
-		.enable		= s5p6440_hclk0_ctrl,
-		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC1,
-	}, {
-		.name		= "hsmmc",
-		.id		= 2,
-		.parent		= &clk_h_low,
-		.enable		= s5p6440_hclk0_ctrl,
-		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC2,
-	}, {
-		.name		= "rtc",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_RTC,
-	}, {
-		.name		= "watchdog",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_WDT,
-	}, {
-		.name		= "timers",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
-	}
-};
-
-/*
- * The following clocks will be enabled during clock initialization.
- */
-static struct clk init_clocks[] = {
-	{
-		.name		= "gpio",
-		.id		= -1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_GPIO,
-	}, {
-		.name		= "uart",
-		.id		= 0,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_UART0,
-	}, {
-		.name		= "uart",
-		.id		= 1,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_UART1,
-	}, {
-		.name		= "uart",
-		.id		= 2,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_UART2,
-	}, {
-		.name		= "uart",
-		.id		= 3,
-		.parent		= &clk_p_low,
-		.enable		= s5p6440_pclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
-	}
-};
-
-static struct clk clk_iis_cd_v40 = {
-	.name		= "iis_cdclk_v40",
-	.id		= -1,
-};
-
-static struct clk clk_pcm_cd = {
-	.name		= "pcm_cdclk",
-	.id		= -1,
-};
-
-static struct clk *clkset_spi_mmc_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_fin_epll,
-};
-
-static struct clksrc_sources clkset_spi_mmc = {
-	.sources	= clkset_spi_mmc_list,
-	.nr_sources	= ARRAY_SIZE(clkset_spi_mmc_list),
-};
-
-static struct clk *clkset_uart_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll
-};
-
-static struct clksrc_sources clkset_uart = {
-	.sources	= clkset_uart_list,
-	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
-};
-
-static struct clksrc_clk clksrcs[] = {
-	{
-		.clk	= {
-			.name		= "mmc_bus",
-			.id		= 0,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC0,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_spi_mmc,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 18, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "mmc_bus",
-			.id		= 1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC1,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_spi_mmc,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 20, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 4, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "mmc_bus",
-			.id		= 2,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC2,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_spi_mmc,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 22, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 8, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "uclk1",
-			.id		= -1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_UART,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 13, .size = 1 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 16, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "spi_epll",
-			.id		= 0,
-			.ctrlbit        = S5P_CLKCON_SCLK0_SPI0,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_spi_mmc,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 14, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "spi_epll",
-			.id		= 1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_SPI1,
-			.enable		= s5p6440_sclk_ctrl,
-		},
-		.sources = &clkset_spi_mmc,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 16, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
-	}
-};
-
-/* Clock initialisation code */
-static struct clksrc_clk *init_parents[] = {
-	&clk_mout_apll,
-	&clk_mout_epll,
-	&clk_mout_mpll,
-};
-
-void __init_or_cpufreq s5p6440_setup_clocks(void)
-{
-	struct clk *xtal_clk;
-	unsigned long xtal;
-	unsigned long fclk;
-	unsigned long hclk;
-	unsigned long hclk_low;
-	unsigned long pclk;
-	unsigned long pclk_low;
-	unsigned long epll;
-	unsigned long apll;
-	unsigned long mpll;
-	unsigned int ptr;
-	u32 clkdiv0;
-	u32 clkdiv3;
-
-	/* Set S5P6440 functions for clk_fout_epll */
-	clk_fout_epll.enable = s5p6440_epll_enable;
-	clk_fout_epll.ops = &s5p6440_epll_ops;
-
-	/* Set S5P6440 functions for arm clock */
-	clk_arm.parent = &clk_mout_apll.clk;
-	clk_arm.ops = &s5p6440_clkarm_ops;
-	clk_48m.enable = s5p6440_clk48m_ctrl;
-
-	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
-	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
-
-	xtal_clk = clk_get(NULL, "ext_xtal");
-	BUG_ON(IS_ERR(xtal_clk));
-
-	xtal = clk_get_rate(xtal_clk);
-	clk_put(xtal_clk);
-
-	epll = s5p_get_pll90xx(xtal, __raw_readl(S5P_EPLL_CON),
-				__raw_readl(S5P_EPLL_CON_K));
-	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
-	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4502);
-
-	printk(KERN_INFO "S5P6440: PLL settings, A=%ld.%ldMHz, M=%ld.%ldMHz," \
-			" E=%ld.%ldMHz\n",
-			print_mhz(apll), print_mhz(mpll), print_mhz(epll));
-
-	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_ARM);
-	hclk = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK);
-	pclk = hclk / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK);
-
-	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
-		/* Asynchronous mode */
-		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
-	} else {
-		/* Synchronous mode */
-		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
-	}
-
-	pclk_low = hclk_low / GET_DIV(clkdiv3, S5P_CLKDIV3_PCLK_LOW);
-
-	printk(KERN_INFO "S5P6440: HCLK=%ld.%ldMHz, HCLK_LOW=%ld.%ldMHz," \
-			" PCLK=%ld.%ldMHz, PCLK_LOW=%ld.%ldMHz\n",
-			print_mhz(hclk), print_mhz(hclk_low),
-			print_mhz(pclk), print_mhz(pclk_low));
-
-	clk_fout_mpll.rate = mpll;
-	clk_fout_epll.rate = epll;
-	clk_fout_apll.rate = apll;
-
-	clk_f.rate = fclk;
-	clk_h.rate = hclk;
-	clk_p.rate = pclk;
-	clk_h_low.rate = hclk_low;
-	clk_p_low.rate = pclk_low;
-
-	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
-		s3c_set_clksrc(init_parents[ptr], true);
-
-	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_set_clksrc(&clksrcs[ptr], true);
-}
-
-static struct clk *clks[] __initdata = {
-	&clk_ext,
-	&clk_mout_epll.clk,
-	&clk_mout_mpll.clk,
-	&clk_dout_mpll,
-	&clk_iis_cd_v40,
-	&clk_pcm_cd,
-	&clk_p_low,
-	&clk_h_low,
-};
-
-void __init s5p6440_register_clocks(void)
-{
-	struct clk *clkp;
-	int ret;
-	int ptr;
-
-	ret = s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
-	if (ret > 0)
-		printk(KERN_ERR "Failed to register %u clocks\n", ret);
-
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
-	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
-
-	clkp = init_clocks_disable;
-	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
-
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
-		(clkp->enable)(clkp, 0);
-	}
-
-	s3c_pwmclk_init();
-}
diff --git a/arch/arm/plat-s5p/s5p6440-init.c b/arch/arm/plat-s5p/s5p6440-init.c
deleted file mode 100644
index 9017825..0000000
--- a/arch/arm/plat-s5p/s5p6440-init.c
+++ /dev/null
@@ -1,50 +0,0 @@
-/* linux/arch/arm/plat-s5p/s5p6440-init.c
- *
- * Copyright (c) 2009 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/serial_core.h>
-
-#include <plat/cpu.h>
-#include <plat/devs.h>
-#include <plat/s5p6440.h>
-#include <plat/regs-serial.h>
-
-static struct s3c24xx_uart_clksrc s5p6440_serial_clocks[] = {
-	[0] = {
-		.name		= "pclk_low",
-		.divisor	= 1,
-		.min_baud	= 0,
-		.max_baud	= 0,
-	},
-	[1] = {
-		.name		= "uclk1",
-		.divisor	= 1,
-		.min_baud	= 0,
-		.max_baud	= 0,
-	},
-};
-
-/* uart registration process */
-void __init s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, int no)
-{
-	struct s3c2410_uartcfg *tcfg = cfg;
-	u32 ucnt;
-
-	for (ucnt = 0; ucnt < no; ucnt++, tcfg++) {
-		if (!tcfg->clocks) {
-			tcfg->clocks = s5p6440_serial_clocks;
-			tcfg->clocks_size = ARRAY_SIZE(s5p6440_serial_clocks);
-		}
-	}
-
-	s3c24xx_init_uartdevs("s3c6400-uart", s5p_uart_resources, cfg, no);
-}
-- 
1.6.2.5
