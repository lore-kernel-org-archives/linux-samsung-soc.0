From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/6] ARM: S5P6442: Add clock support for S5P6442 CPU.
Date: Mon, 25 Jan 2010 08:54:02 +0900
Message-ID: <1264377242-9170-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48335 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479Ab0AYABa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 19:01:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds clock support for S5P6442. This patch adds the clock
register definitions and the various system clocks in S5P6442.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/regs-clock.h |  103 +++++++++
 arch/arm/mach-s5p6442/s5p6442-clock.c           |  256 +++++++++++++++++++++++
 2 files changed, 359 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p6442/include/mach/regs-clock.h
 create mode 100644 arch/arm/mach-s5p6442/s5p6442-clock.c

diff --git a/arch/arm/mach-s5p6442/include/mach/regs-clock.h b/arch/arm/mach-s5p6442/include/mach/regs-clock.h
new file mode 100644
index 0000000..19dd2f5
--- /dev/null
+++ b/arch/arm/mach-s5p6442/include/mach/regs-clock.h
@@ -0,0 +1,103 @@
+/* linux/arch/arm/mach-s5p6442/include/mach/regs-clock.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P6442 - Clock register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_REGS_CLOCK_H
+#define __ASM_ARCH_REGS_CLOCK_H __FILE__
+
+#include <mach/map.h>
+
+#define S5P_CLKREG(x)		(S5P_VA_SYSCON + (x))
+
+#define S5P_APLL_LOCK		S5P_CLKREG(0x00)
+#define S5P_MPLL_LOCK		S5P_CLKREG(0x08)
+#define S5P_EPLL_LOCK		S5P_CLKREG(0x10)
+#define S5P_VPLL_LOCK		S5P_CLKREG(0x20)
+
+#define S5P_APLL_CON		S5P_CLKREG(0x100)
+#define S5P_MPLL_CON		S5P_CLKREG(0x108)
+#define S5P_EPLL_CON		S5P_CLKREG(0x110)
+#define S5P_VPLL_CON		S5P_CLKREG(0x120)
+
+#define S5P_CLK_SRC0		S5P_CLKREG(0x200)
+#define S5P_CLK_SRC1		S5P_CLKREG(0x204)
+#define S5P_CLK_SRC2		S5P_CLKREG(0x208)
+#define S5P_CLK_SRC3		S5P_CLKREG(0x20C)
+#define S5P_CLK_SRC4		S5P_CLKREG(0x210)
+#define S5P_CLK_SRC5		S5P_CLKREG(0x214)
+#define S5P_CLK_SRC6		S5P_CLKREG(0x218)
+
+#define S5P_CLK_SRC_MASK0	S5P_CLKREG(0x280)
+#define S5P_CLK_SRC_MASK1	S5P_CLKREG(0x284)
+
+#define S5P_CLK_DIV0		S5P_CLKREG(0x300)
+#define S5P_CLK_DIV1		S5P_CLKREG(0x304)
+#define S5P_CLK_DIV2		S5P_CLKREG(0x308)
+#define S5P_CLK_DIV3		S5P_CLKREG(0x30C)
+#define S5P_CLK_DIV4		S5P_CLKREG(0x310)
+#define S5P_CLK_DIV5		S5P_CLKREG(0x314)
+#define S5P_CLK_DIV6		S5P_CLKREG(0x318)
+
+#define S5P_CLKGATE_IP3		S5P_CLKREG(0x46C)
+
+/* CLK_OUT */
+#define S5P_CLK_OUT_SHIFT	(12)
+#define S5P_CLK_OUT_MASK	(0x1F << S5P_CLK_OUT_SHIFT)
+#define S5P_CLK_OUT		S5P_CLKREG(0x500)
+
+#define S5P_CLK_DIV_STAT0	S5P_CLKREG(0x1000)
+#define S5P_CLK_DIV_STAT1	S5P_CLKREG(0x1004)
+
+#define S5P_CLK_MUX_STAT0	S5P_CLKREG(0x1100)
+#define S5P_CLK_MUX_STAT1	S5P_CLKREG(0x1104)
+
+#define S5P_MDNIE_SEL		S5P_CLKREG(0x7008)
+
+/* Register Bit definition */
+#define S5P_EPLL_EN     		(1<<31)
+#define S5P_EPLL_MASK   		0xffffffff
+#define S5P_EPLLVAL(_m, _p, _s)   	((_m) << 16 | ((_p) << 8) | ((_s)))
+
+/* CLKDIV0 */
+#define S5P_CLKDIV0_APLL_SHIFT		(0)
+#define S5P_CLKDIV0_APLL_MASK		(0x7 << S5P_CLKDIV0_APLL_SHIFT)
+#define S5P_CLKDIV0_A2M_SHIFT		(4)
+#define S5P_CLKDIV0_A2M_MASK		(0x7 << S5P_CLKDIV0_A2M_SHIFT)
+#define S5P_CLKDIV0_D0CLK_SHIFT		(16)
+#define S5P_CLKDIV0_D0CLK_MASK		(0xF << S5P_CLKDIV0_D0CLK_SHIFT)
+#define S5P_CLKDIV0_P0CLK_SHIFT		(20)
+#define S5P_CLKDIV0_P0CLK_MASK		(0x7 << S5P_CLKDIV0_P0CLK_SHIFT)
+#define S5P_CLKDIV0_D1CLK_SHIFT		(24)
+#define S5P_CLKDIV0_D1CLK_MASK		(0xF << S5P_CLKDIV0_D1CLK_SHIFT)
+#define S5P_CLKDIV0_P1CLK_SHIFT		(28)
+#define S5P_CLKDIV0_P1CLK_MASK		(0x7 << S5P_CLKDIV0_P1CLK_SHIFT)
+
+/* Clock MUX status Registers */
+#define S5P_CLK_MUX_STAT0_APLL_SHIFT	(0)
+#define S5P_CLK_MUX_STAT0_APLL_MASK	(0x7 << S5P_CLK_MUX_STAT0_APLL_SHIFT)
+#define S5P_CLK_MUX_STAT0_MPLL_SHIFT	(4)
+#define S5P_CLK_MUX_STAT0_MPLL_MASK	(0x7 << S5P_CLK_MUX_STAT0_MPLL_SHIFT)
+#define S5P_CLK_MUX_STAT0_EPLL_SHIFT	(8)
+#define S5P_CLK_MUX_STAT0_EPLL_MASK	(0x7 << S5P_CLK_MUX_STAT0_EPLL_SHIFT)
+#define S5P_CLK_MUX_STAT0_VPLL_SHIFT	(12)
+#define S5P_CLK_MUX_STAT0_VPLL_MASK	(0x7 << S5P_CLK_MUX_STAT0_VPLL_SHIFT)
+#define S5P_CLK_MUX_STAT0_MUXARM_SHIFT	(16)
+#define S5P_CLK_MUX_STAT0_MUXARM_MASK	(0x7 << S5P_CLK_MUX_STAT0_MUXARM_SHIFT)
+#define S5P_CLK_MUX_STAT0_MUXD0_SHIFT	(20)
+#define S5P_CLK_MUX_STAT0_MUXD0_MASK	(0x7 << S5P_CLK_MUX_STAT0_MUXD0_SHIFT)
+#define S5P_CLK_MUX_STAT0_MUXD1_SHIFT	(24)
+#define S5P_CLK_MUX_STAT0_MUXD1_MASK	(0x7 << S5P_CLK_MUX_STAT0_MUXD1_SHIFT)
+#define S5P_CLK_MUX_STAT1_D1SYNC_SHIFT	(24)
+#define S5P_CLK_MUX_STAT1_D1SYNC_MASK	(0x7 << S5P_CLK_MUX_STAT1_D1SYNC_SHIFT)
+#define S5P_CLK_MUX_STAT1_D0SYNC_SHIFT	(28)
+#define S5P_CLK_MUX_STAT1_D0SYNC_MASK	(0x7 << S5P_CLK_MUX_STAT1_D0SYNC_SHIFT)
+
+#endif /*  __ASM_ARCH_REGS_CLOCK_H */
diff --git a/arch/arm/mach-s5p6442/s5p6442-clock.c b/arch/arm/mach-s5p6442/s5p6442-clock.c
new file mode 100644
index 0000000..ff179b3
--- /dev/null
+++ b/arch/arm/mach-s5p6442/s5p6442-clock.c
@@ -0,0 +1,256 @@
+/* arch/arm/mach-s5p6442/s5p6442-clock.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P6442 - Clock support
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
+#include <mach/map.h>
+
+#include <plat/cpu-freq.h>
+#include <mach/regs-clock.h>
+#include <plat/clock.h>
+#include <plat/cpu.h>
+#include <plat/pll.h>
+#include <plat/s5p-clock.h>
+#include <plat/clock-clksrc.h>
+#include <plat/s5p6442.h>
+
+struct clk clk_pd1 = {
+	.name		= "pclkd1",
+	.id		= -1,
+	.ops		= &clk_ops_def_setrate,
+};
+
+struct clksrc_clk clk_mout_apll = {
+	.clk	= {
+		.name		= "mout_apll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_apll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
+};
+
+struct clksrc_clk clk_mout_epll = {
+	.clk	= {
+		.name		= "mout_epll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_epll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 8, .size = 1 },
+};
+
+struct clksrc_clk clk_mout_mpll = {
+	.clk = {
+		.name		= "mout_mpll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_mpll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 4, .size = 1 },
+};
+
+int s5p6442_clk_ip3_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
+}
+
+/* Clock initialisation code */
+static struct clksrc_clk *init_parents[] = {
+	&clk_mout_apll,
+	&clk_mout_epll,
+	&clk_mout_mpll,
+};
+
+#define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
+void __init_or_cpufreq s5p6442_setup_clocks(void)
+{
+	struct clk *xtal_clk;
+	unsigned long xtal;
+	unsigned long fclk;
+	unsigned long a2m;
+	unsigned long epll;
+	unsigned long apll;
+	unsigned long mpll;
+	unsigned int ptr;
+	unsigned long hclkd0 = 0;
+	unsigned long hclkd1 = 0;
+	unsigned long pclkd0 = 0;
+	unsigned long pclkd1 = 0;
+	u32 clkdiv0;
+	u32 clkdiv3;
+	u32 mux_stat0;
+	u32 mux_stat1;
+
+	printk(KERN_DEBUG "%s: registering clocks\n", __func__);
+
+	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
+	printk(KERN_DEBUG "%s: clkdiv0 = %08x\n", __func__, clkdiv0);
+
+	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
+	printk(KERN_DEBUG "%s: clkdiv3 = %08x\n", __func__, clkdiv3);
+
+	xtal_clk = clk_get(NULL, "xtal");
+	BUG_ON(IS_ERR(xtal_clk));
+
+	xtal = clk_get_rate(xtal_clk);
+	clk_put(xtal_clk);
+
+	printk(KERN_DEBUG "%s: xtal is %ld\n", __func__, xtal);
+
+	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4508);
+	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
+	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
+
+	printk(KERN_INFO "S5P64XX: PLL settings, A=%ld.%ldMHz, M=%ld.%ldMHz," \
+							" E=%ld.%ldMHz\n",
+			   print_mhz(apll), print_mhz(mpll), print_mhz(epll));
+
+	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_APLL);
+
+	mux_stat1 = __raw_readl(S5P_CLK_MUX_STAT1);
+	mux_stat0 = __raw_readl(S5P_CLK_MUX_STAT0);
+
+	switch ((mux_stat1 & S5P_CLK_MUX_STAT1_D0SYNC_MASK) >> \
+					S5P_CLK_MUX_STAT1_D0SYNC_SHIFT) {
+	case 0x1:	/* Asynchronous mode */
+		switch ((mux_stat0 & S5P_CLK_MUX_STAT0_MUXD0_MASK) \
+					>> S5P_CLK_MUX_STAT0_MUXD0_SHIFT) {
+		case 0x1:	/* MPLL source */
+			hclkd0 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_D0CLK);
+			pclkd0 = hclkd0 / GET_DIV(clkdiv0, S5P_CLKDIV0_P0CLK);
+			break;
+		case 0x2:	/* A2M source */
+			a2m = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
+			hclkd0 = a2m / GET_DIV(clkdiv0, S5P_CLKDIV0_D0CLK);
+			pclkd0 = hclkd0 / GET_DIV(clkdiv0, S5P_CLKDIV0_P0CLK);
+			break;
+		default:
+			break;
+
+		}
+
+		switch ((mux_stat0 & S5P_CLK_MUX_STAT0_MUXD1_MASK) >> \
+						S5P_CLK_MUX_STAT0_MUXD1_SHIFT) {
+		case 0x1:	/* MPLL source */
+			hclkd1 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_D1CLK);
+			pclkd1 = hclkd0 / GET_DIV(clkdiv0, S5P_CLKDIV0_P1CLK);
+			break;
+		case 0x2:	/* A2M source */
+			a2m = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
+			hclkd1 = a2m / GET_DIV(clkdiv0, S5P_CLKDIV0_D1CLK);
+			pclkd1 = hclkd0 / GET_DIV(clkdiv0, S5P_CLKDIV0_P1CLK);
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case 0x2:	/* Synchronous mode */
+		hclkd0 = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_D0CLK);
+		pclkd0 = hclkd0 / GET_DIV(clkdiv0, S5P_CLKDIV0_P0CLK);
+		hclkd1 = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_D1CLK);
+		pclkd1 = hclkd1 / GET_DIV(clkdiv0, S5P_CLKDIV0_P1CLK);
+		break;
+	default:
+		printk(KERN_ERR "failed to get sync/async mode status register\n");
+		break;
+	}
+
+	printk(KERN_INFO "S5P64XX: HCLKD0=%ld.%ldMHz, HCLKD1=%ld.%ldMHz," \
+				" PCLKD0=%ld.%ldMHz, PCLKD1=%ld.%ldMHz\n",
+			       print_mhz(hclkd0), print_mhz(hclkd1),
+			       print_mhz(pclkd0), print_mhz(pclkd1));
+
+	clk_fout_mpll.rate = mpll;
+	clk_fout_epll.rate = epll;
+	clk_fout_apll.rate = apll;
+
+	clk_f.rate = fclk;
+	clk_pd1.rate = pclkd1;
+
+	/* For backward compatibility */
+	clk_h.rate = hclkd1;
+	clk_p.rate = pclkd1;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
+		s3c_set_clksrc(init_parents[ptr], true);
+}
+
+static struct clk init_clocks[] = {
+	{
+		.name		= "systimer",
+		.id		= -1,
+		.parent		= &clk_pd1,
+		.enable		= s5p6442_clk_ip3_ctrl,
+		.ctrlbit	= (1<<16),
+	}, {
+		.name		= "uart",
+		.id		= 0,
+		.parent		= &clk_pd1,
+		.enable		= s5p6442_clk_ip3_ctrl,
+		.ctrlbit	= (1<<17),
+	}, {
+		.name		= "uart",
+		.id		= 1,
+		.parent		= &clk_pd1,
+		.enable		= s5p6442_clk_ip3_ctrl,
+		.ctrlbit	= (1<<18),
+	}, {
+		.name		= "uart",
+		.id		= 2,
+		.parent		= &clk_pd1,
+		.enable		= s5p6442_clk_ip3_ctrl,
+		.ctrlbit	= (1<<19),
+	}, {
+		.name		= "timers",
+		.id		= -1,
+		.parent		= &clk_pd1,
+		.enable		= s5p6442_clk_ip3_ctrl,
+		.ctrlbit	= (1<<23),
+	},
+};
+
+static struct clk *clks[] __initdata = {
+	&clk_ext,
+	&clk_epll,
+	&clk_pd1,
+	&clk_mout_epll.clk,
+	&clk_mout_mpll.clk,
+};
+
+void __init s5p6442_register_clocks(void)
+{
+	struct clk *clkp;
+	int ret;
+	int ptr;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clks); ptr++) {
+		clkp = clks[ptr];
+		ret = s3c24xx_register_clock(clkp);
+		if (ret < 0) {
+			printk(KERN_ERR "Failed to register clock %s (%d)\n",
+			       clkp->name, ret);
+		}
+	}
+
+	clkp = init_clocks;
+	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks); ptr++, clkp++)
+		ret = s3c24xx_register_clock(clkp);
+
+	s3c_pwmclk_init();
+}
-- 
1.6.2.5
