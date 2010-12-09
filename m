From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/4] ARM: S5P64X0: Add Power Management support
Date: Thu,  9 Dec 2010 17:11:55 +0900
Message-ID: <1291882317-20411-3-git-send-email-sbkim73@samsung.com>
References: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40878 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754322Ab0LII3o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 03:29:44 -0500
In-Reply-To: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Add suspend-to-ram support for SMDK6440/50

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig                   |    2 +
 arch/arm/mach-s5p64x0/Makefile                  |    1 +
 arch/arm/mach-s5p64x0/include/mach/map.h        |    1 +
 arch/arm/mach-s5p64x0/include/mach/pm-core.h    |   92 ++++++++++++
 arch/arm/mach-s5p64x0/include/mach/regs-clock.h |   31 ++++
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h  |   12 ++
 arch/arm/mach-s5p64x0/irq-pm.c                  |   93 ++++++++++++
 arch/arm/mach-s5p64x0/mach-smdk6440.c           |    4 +
 arch/arm/mach-s5p64x0/mach-smdk6450.c           |    4 +
 arch/arm/mach-s5p64x0/pm.c                      |  181 +++++++++++++++++++++++
 arch/arm/mach-s5p64x0/sleep.S                   |  129 ++++++++++++++++
 11 files changed, 550 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/pm-core.h
 create mode 100644 arch/arm/mach-s5p64x0/irq-pm.c
 create mode 100644 arch/arm/mach-s5p64x0/pm.c
 create mode 100644 arch/arm/mach-s5p64x0/sleep.S

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 164d278..f9532dd 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -36,6 +36,7 @@ config MACH_SMDK6440
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_TS
 	select S5P64X0_SETUP_I2C1
+	select SAMSUNG_WAKEMASK if PM
 	help
 	  Machine support for the Samsung SMDK6440
 
@@ -49,6 +50,7 @@ config MACH_SMDK6450
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_TS
 	select S5P64X0_SETUP_I2C1
+	select SAMSUNG_WAKEMASK if PM
 	help
 	  Machine support for the Samsung SMDK6450
 
diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index 669f470..44b563c 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o
 obj-$(CONFIG_ARCH_S5P64X0)	+= irq-eint.o
 obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o
 obj-$(CONFIG_CPU_S5P6450)	+= clock-s5p6450.o
+obj-$(CONFIG_PM)		+= pm.o sleep.o irq-pm.o
 
 # machine support
 
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index 31e5341..c961025 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -49,6 +49,7 @@
 #define S5P_PA_UART5		S5P6450_PA_UART(5)
 
 #define S5P_SZ_UART		SZ_256
+#define S3C_VA_UARTx(x)		(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
 
 #define S5P6440_PA_IIC0		(0xEC104000)
 #define S5P6440_PA_IIC1		(0xEC20F000)
diff --git a/arch/arm/mach-s5p64x0/include/mach/pm-core.h b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
new file mode 100644
index 0000000..40d9fa0
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
@@ -0,0 +1,92 @@
+/* linux/arch/arm/mach-s5p64X0/include/mach/pm-core.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5P64X0 - PM core support for arch/arm/plat-samsung/pm.c
+ *
+ * Based on PM core support for S3C64XX by Ben Dooks
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <mach/regs-gpio.h>
+
+static inline void s3c_pm_debug_init_uart(void)
+{
+	u32 tmp = __raw_readl(S5P64X0_CLK_GATE_PCLK);
+
+	tmp |= S5P64X0_CLKCON_PCLK_UART0;
+	tmp |= S5P64X0_CLKCON_PCLK_UART1;
+	tmp |= S5P64X0_CLKCON_PCLK_UART2;
+	tmp |= S5P64X0_CLKCON_PCLK_UART3;
+
+	__raw_writel(tmp, S5P64X0_CLK_GATE_PCLK);
+	udelay(10);
+}
+
+static inline void s3c_pm_arch_prepare_irqs(void)
+{
+	/* VIC should have already been taken care of */
+
+	/* clear any pending EINT0 interrupts */
+	__raw_writel(__raw_readl(S5P64X0_EINT0PEND), S5P64X0_EINT0PEND);
+}
+
+static inline void s3c_pm_arch_stop_clocks(void)
+{
+}
+
+static inline void s3c_pm_arch_show_resume_irqs(void)
+{
+}
+
+/* make these defines, we currently do not have any need to change
+ * the IRQ wake controls depending on the CPU we are running on */
+
+#define s3c_irqwake_eintallow	((1 << 16) - 1)
+#define s3c_irqwake_intallow	(0)
+
+static inline void s3c_pm_arch_update_uart(void __iomem *regs,
+					   struct pm_uart_save *save)
+{
+	u32 ucon = __raw_readl(regs + S3C2410_UCON);
+	u32 ucon_clk = ucon & S3C6400_UCON_CLKMASK;
+	u32 save_clk = save->ucon & S3C6400_UCON_CLKMASK;
+	u32 new_ucon;
+	u32 delta;
+
+	/* S5P64XX UART blocks only support level interrupts, so ensure that
+	 * when we restore unused UART blocks we force the level interrupt
+	 * settigs. */
+	save->ucon |= S3C2410_UCON_TXILEVEL | S3C2410_UCON_RXILEVEL;
+
+	/* We have a constraint on changing the clock type of the UART
+	 * between UCLKx and PCLK, so ensure that when we restore UCON
+	 * that the CLK field is correctly modified if the bootloader
+	 * has changed anything.
+	 */
+	if (ucon_clk != save_clk) {
+		new_ucon = save->ucon;
+		delta = ucon_clk ^ save_clk;
+
+		/* change from UCLKx => wrong PCLK,
+		 * either UCLK can be tested for by a bit-test
+		 * with UCLK0 */
+		if (ucon_clk & S3C6400_UCON_UCLK0 &&
+		    !(save_clk & S3C6400_UCON_UCLK0) &&
+		    delta & S3C6400_UCON_PCLK2) {
+			new_ucon &= ~S3C6400_UCON_UCLK0;
+		} else if (delta == S3C6400_UCON_PCLK2) {
+			/* as an precaution, don't change from
+			 * PCLK2 => PCLK or vice-versa */
+			new_ucon ^= S3C6400_UCON_PCLK2;
+		}
+
+		S3C_PMDBG("ucon change %04x => %04x (save=%04x)\n",
+			  ucon, new_ucon, save->ucon);
+		save->ucon = new_ucon;
+	}
+}
diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h b/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
index a133f22..1d23f9a 100644
--- a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
@@ -41,17 +41,48 @@
 #define S5P6450_DPLL_CON		S5P_CLKREG(0x50)
 #define S5P6450_DPLL_CON_K		S5P_CLKREG(0x54)
 
+#define S5P64X0_AHB_CON0		S5P_CLKREG(0x100)
 #define S5P64X0_CLK_SRC1		S5P_CLKREG(0x10C)
 
 #define S5P64X0_SYS_ID			S5P_CLKREG(0x118)
 #define S5P64X0_SYS_OTHERS		S5P_CLKREG(0x11C)
+#define S5P64X0_WAKEUP_STAT		S5P_CLKREG(0x908)
 
 #define S5P64X0_PWR_CFG			S5P_CLKREG(0x804)
+#define S5P64X0_EINT_WAKEUP_MASK	S5P_CLKREG(0x808)
+#define S5P64X0_SLEEP_CFG		S5P_CLKREG(0x818)
+#define S5P64X0_PWR_STABLE		S5P_CLKREG(0x828)
+
 #define S5P64X0_OTHERS			S5P_CLKREG(0x900)
+#define S5P64X0_INFORM0			S5P_CLKREG(0xA00)
 
 #define S5P64X0_CLKDIV0_HCLK_SHIFT	(8)
 #define S5P64X0_CLKDIV0_HCLK_MASK	(0xF << S5P64X0_CLKDIV0_HCLK_SHIFT)
 
+/* HCLK GATE Registers */
+#define S5P64X0_CLKCON_HCLK1_FIMGVG	(1<<2)
+#define S5P64X0_CLKCON_SCLK1_FIMGVG	(1<<2)
+
+/* PCLK GATE Registers */
+#define S5P64X0_CLKCON_PCLK_UART3	(1<<4)
+#define S5P64X0_CLKCON_PCLK_UART2	(1<<3)
+#define S5P64X0_CLKCON_PCLK_UART1	(1<<2)
+#define S5P64X0_CLKCON_PCLK_UART0	(1<<1)
+
+#define S5P64X0_PWRCFG_MMC1_DISABLE	(1 << 15)
+#define S5P64X0_PWRCFG_MMC0_DISABLE	(1 << 14)
+#define S5P64X0_PWRCFG_RTC_TICK_DISABLE	(1 << 11)
+#define S5P64X0_PWRCFG_RTC_ALRM_DISABLE	(1 << 10)
+#define S5P64X0_PWRCFG_CFG_WFI_MASK	(3 << 5)
+#define S5P64X0_PWRCFG_CFG_WFI_SLEEP	(3 << 5)
+
+#define S5P64X0_SLEEP_CFG_OSC_EN	(1 << 0)
+#define S5P64X0_PWR_STABLE_CNT_VAL_4	(4 << 0)
+
+#define S5P6450_OTHERS_DISABLE_INT	(1 << 31)
+#define S5P6450_OTHERS_RET_UART		(1 << 26)
+#define S5P6450_OTHERS_RET_MMC1		(1 << 25)
+#define S5P6450_OTHERS_RET_MMC0		(1 << 24)
 #define S5P64X0_OTHERS_USB_SIG_MASK	(1 << 16)
 
 /* Compatibility defines */
diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
index ce64863..eeb539d 100644
--- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
@@ -52,6 +52,18 @@
 #define S5P64X0_EINT12FLTCON		(S5P_VA_GPIO + 0x220)
 #define S5P64X0_EINT12MASK		(S5P_VA_GPIO + 0x240)
 
+#define S5P64X0_SPCON0			(S5P_VA_GPIO + 0x1A0)
+#define S5P64X0_SPCON1			(S5P_VA_GPIO + 0x2B0)
+
+#define S5P64X0_MEM0CONSLP0		(S5P_VA_GPIO + 0x1C0)
+#define S5P64X0_MEM0CONSLP1		(S5P_VA_GPIO + 0x1C4)
+#define S5P64X0_MEM0DRVCON		(S5P_VA_GPIO + 0x1D0)
+#define S5P64X0_MEM1DRVCON		(S5P_VA_GPIO + 0x1D4)
+
+#define S5P64X0_EINT12CON		(S5P_VA_GPIO + 0x200)
+#define S5P64X0_EINT12FLTCON		(S5P_VA_GPIO + 0x220)
+#define S5P64X0_EINT12MASK		(S5P_VA_GPIO + 0x240)
+
 /* for LCD */
 
 #define S5P64X0_SPCON_LCD_SEL_RGB	(1 << 0)
diff --git a/arch/arm/mach-s5p64x0/irq-pm.c b/arch/arm/mach-s5p64x0/irq-pm.c
new file mode 100644
index 0000000..32ee74c
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/irq-pm.c
@@ -0,0 +1,93 @@
+/* arch/arm/mach-s5p64x0/irq-pm.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5P64X0 - Interrupt handling Power Management
+ *
+ * Based on arch/arm/mach-s3c64xx/irq-pm.c by Ben Dooks
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/sysdev.h>
+#include <linux/serial_core.h>
+#include <linux/io.h>
+
+#include <plat/regs-serial.h>
+#include <plat/cpu.h>
+#include <plat/pm.h>
+
+#include <mach/regs-gpio.h>
+
+static struct sleep_save irq_save[] = {
+	SAVE_ITEM(S5P64X0_EINT0CON0),
+	SAVE_ITEM(S5P64X0_EINT0FLTCON0),
+	SAVE_ITEM(S5P64X0_EINT0FLTCON1),
+	SAVE_ITEM(S5P64X0_EINT0MASK),
+};
+
+static struct irq_grp_save {
+	u32	con;
+	u32	fltcon;
+	u32	mask;
+} eint_grp_save[4];
+
+static u32 irq_uart_mask[CONFIG_SERIAL_SAMSUNG_UARTS];
+
+static int s5p64x0_irq_pm_suspend(struct sys_device *dev, pm_message_t state)
+{
+	struct irq_grp_save *grp = eint_grp_save;
+	int i;
+
+	S3C_PMDBG("%s: suspending IRQs\n", __func__);
+
+	s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
+
+	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)
+		irq_uart_mask[i] = __raw_readl(S3C_VA_UARTx(i) + S3C64XX_UINTM);
+
+	for (i = 0; i < ARRAY_SIZE(eint_grp_save); i++, grp++) {
+		grp->con = __raw_readl(S5P64X0_EINT12CON + (i * 4));
+		grp->mask = __raw_readl(S5P64X0_EINT12MASK + (i * 4));
+		grp->fltcon = __raw_readl(S5P64X0_EINT12FLTCON + (i * 4));
+	}
+
+	return 0;
+}
+
+static int s5p64x0_irq_pm_resume(struct sys_device *dev)
+{
+	struct irq_grp_save *grp = eint_grp_save;
+	int i;
+
+	S3C_PMDBG("%s: resuming IRQs\n", __func__);
+
+	s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
+
+	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)
+		__raw_writel(irq_uart_mask[i], S3C_VA_UARTx(i) + S3C64XX_UINTM);
+
+	for (i = 0; i < ARRAY_SIZE(eint_grp_save); i++, grp++) {
+		__raw_writel(grp->con, S5P64X0_EINT12CON + (i * 4));
+		__raw_writel(grp->mask, S5P64X0_EINT12MASK + (i * 4));
+		__raw_writel(grp->fltcon, S5P64X0_EINT12FLTCON + (i * 4));
+	}
+
+	S3C_PMDBG("%s: IRQ configuration restored\n", __func__);
+	return 0;
+}
+
+static struct sysdev_driver s5p64x0_irq_driver = {
+	.suspend = s5p64x0_irq_pm_suspend,
+	.resume	 = s5p64x0_irq_pm_resume,
+};
+
+static int __init s5p64x0_irq_pm_init(void)
+{
+	return sysdev_driver_register(&s5p64x0_sysclass, &s5p64x0_irq_driver);
+}
+
+arch_initcall(s5p64x0_irq_pm_init);
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 87c3f03..ddf1898 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/gpio.h>
+#include <linux/sysdev.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -43,6 +44,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <plat/ts.h>
+#include <plat/pm.h>
 
 #define SMDK6440_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -147,6 +149,8 @@ static void __init smdk6440_machine_init(void)
 	i2c_register_board_info(1, smdk6440_i2c_devs1,
 			ARRAY_SIZE(smdk6440_i2c_devs1));
 
+	s3c_pm_init();
+
 	platform_add_devices(smdk6440_devices, ARRAY_SIZE(smdk6440_devices));
 }
 
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index d609f5a..969b6c3 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/gpio.h>
+#include <linux/sysdev.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -43,6 +44,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <plat/ts.h>
+#include <plat/pm.h>
 
 #define SMDK6450_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -166,6 +168,8 @@ static void __init smdk6450_machine_init(void)
 	i2c_register_board_info(1, smdk6450_i2c_devs1,
 			ARRAY_SIZE(smdk6450_i2c_devs1));
 
+	s3c_pm_init();
+
 	platform_add_devices(smdk6450_devices, ARRAY_SIZE(smdk6450_devices));
 }
 
diff --git a/arch/arm/mach-s5p64x0/pm.c b/arch/arm/mach-s5p64x0/pm.c
new file mode 100644
index 0000000..fb964af
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/pm.c
@@ -0,0 +1,181 @@
+/* linux/arch/arm/mach-s5p64x0/pm.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5P64X0 Power Management Support
+ *
+ * Based on arch/arm/mach-s3c64xx/pm.c by Ben Dooks
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/suspend.h>
+#include <linux/sysdev.h>
+#include <linux/io.h>
+
+#include <plat/pm.h>
+#include <plat/cpu.h>
+#include <plat/regs-timer.h>
+#include <plat/wakeup-mask.h>
+
+#include <mach/regs-clock.h>
+#include <mach/regs-gpio.h>
+#include <mach/irqs.h>
+
+static struct sleep_save core_save[] = {
+	SAVE_ITEM(S5P64X0_APLL_CON),
+	SAVE_ITEM(S5P64X0_MPLL_CON),
+	SAVE_ITEM(S5P64X0_EPLL_CON),
+	SAVE_ITEM(S5P64X0_EPLL_CON_K),
+	SAVE_ITEM(S5P64X0_CLK_SRC0),
+	SAVE_ITEM(S5P64X0_CLK_SRC1),
+	SAVE_ITEM(S5P64X0_CLK_DIV0),
+	SAVE_ITEM(S5P64X0_CLK_DIV1),
+	SAVE_ITEM(S5P64X0_CLK_DIV2),
+	SAVE_ITEM(S5P64X0_CLK_DIV3),
+	SAVE_ITEM(S5P64X0_CLK_GATE_MEM0),
+	SAVE_ITEM(S5P64X0_CLK_GATE_HCLK1),
+	SAVE_ITEM(S5P64X0_CLK_GATE_SCLK1),
+
+	SAVE_ITEM(S5P6450_DPLL_CON),
+	SAVE_ITEM(S5P6450_DPLL_CON_K),
+
+	SAVE_ITEM(S3C64XX_TINT_CSTAT),
+};
+
+static struct sleep_save misc_save[] = {
+	SAVE_ITEM(S5P64X0_AHB_CON0),
+
+	SAVE_ITEM(S5P64X0_SPCON0),
+	SAVE_ITEM(S5P64X0_SPCON1),
+
+	SAVE_ITEM(S5P64X0_MEM0CONSLP0),
+	SAVE_ITEM(S5P64X0_MEM0CONSLP1),
+	SAVE_ITEM(S5P64X0_MEM0DRVCON),
+	SAVE_ITEM(S5P64X0_MEM1DRVCON),
+};
+
+void s3c_pm_configure_extint(void)
+{
+	__raw_writel(s3c_irqwake_eintmask, S5P64X0_EINT_WAKEUP_MASK);
+}
+
+void s3c_pm_restore_core(void)
+{
+	__raw_writel(0, S5P64X0_EINT_WAKEUP_MASK);
+
+	s3c_pm_do_restore(core_save, ARRAY_SIZE(core_save));
+	s3c_pm_do_restore(misc_save, ARRAY_SIZE(misc_save));
+}
+
+void s3c_pm_save_core(void)
+{
+	s3c_pm_do_save(misc_save, ARRAY_SIZE(misc_save));
+	s3c_pm_do_save(core_save, ARRAY_SIZE(core_save));
+}
+
+static void s5p64x0_cpu_suspend(void)
+{
+	unsigned long tmp;
+
+	/* issue the standby signal into the pm unit. Note, we
+	 * issue a write-buffer drain just in case */
+
+	tmp = 0;
+
+	asm("b 1f\n\t"
+	    ".align 5\n\t"
+	    "1:\n\t"
+	    "mcr p15, 0, %0, c7, c10, 5\n\t"
+	    "mcr p15, 0, %0, c7, c10, 4\n\t"
+	    "mcr p15, 0, %0, c7, c0, 4" : : "r" (tmp));
+
+	/* we should never get past here */
+
+	panic("sleep resumed to originator?");
+}
+
+/* mapping of interrupts to parts of the wakeup mask */
+static struct samsung_wakeup_mask wake_irqs[] = {
+	{ .irq = IRQ_RTC_ALARM,	.bit = S5P64X0_PWRCFG_RTC_ALRM_DISABLE, },
+	{ .irq = IRQ_RTC_TIC,	.bit = S5P64X0_PWRCFG_RTC_TICK_DISABLE, },
+	{ .irq = IRQ_HSMMC0,	.bit = S5P64X0_PWRCFG_MMC0_DISABLE, },
+	{ .irq = IRQ_HSMMC1,	.bit = S5P64X0_PWRCFG_MMC1_DISABLE, },
+};
+
+static void s5p64x0_pm_prepare(void)
+{
+	unsigned long tmp;
+
+	samsung_sync_wakemask(S5P64X0_PWR_CFG,
+			wake_irqs, ARRAY_SIZE(wake_irqs));
+
+	/* store the resume address in INFORM0 register */
+	__raw_writel(virt_to_phys(s3c_cpu_resume), S5P64X0_INFORM0);
+
+	/* setup clock gating for FIMGVG block */
+	__raw_writel((__raw_readl(S5P64X0_CLK_GATE_HCLK1) | \
+		(S5P64X0_CLKCON_HCLK1_FIMGVG)), S5P64X0_CLK_GATE_HCLK1);
+	__raw_writel((__raw_readl(S5P64X0_CLK_GATE_SCLK1) | \
+		(S5P64X0_CLKCON_SCLK1_FIMGVG)), S5P64X0_CLK_GATE_SCLK1);
+
+	/* Configure the stabilization counter with wait time required */
+	__raw_writel(S5P64X0_PWR_STABLE_CNT_VAL_4, S5P64X0_PWR_STABLE);
+
+	/* set WFI to SLEEP mode configuration */
+	tmp = __raw_readl(S5P64X0_SLEEP_CFG);
+	tmp &= ~(S5P64X0_SLEEP_CFG_OSC_EN);
+	__raw_writel(tmp, S5P64X0_SLEEP_CFG);
+
+	tmp = __raw_readl(S5P64X0_PWR_CFG);
+	tmp &= ~S5P64X0_PWRCFG_CFG_WFI_MASK;
+	tmp |= S5P64X0_PWRCFG_CFG_WFI_SLEEP;
+	__raw_writel(tmp, S5P64X0_PWR_CFG);
+
+	/* set OTHERS register to disable interrupt before going to
+	 * sleep. This register is present only in S5P6450.
+	 */
+	tmp = __raw_readl(S5P64X0_OTHERS);
+	tmp |= S5P6450_OTHERS_DISABLE_INT;
+	__raw_writel(tmp, S5P64X0_OTHERS);
+
+	/* ensure previous wakeup state is cleared before sleeping */
+	__raw_writel(__raw_readl(S5P64X0_WAKEUP_STAT), S5P64X0_WAKEUP_STAT);
+
+}
+
+static int s5p64x0_pm_add(struct sys_device *sysdev)
+{
+	pm_cpu_prep = s5p64x0_pm_prepare;
+	pm_cpu_sleep = s5p64x0_cpu_suspend;
+	pm_uart_udivslot = 1;
+
+	return 0;
+}
+
+static int s5p64x0_pm_resume(struct sys_device *dev)
+{
+	u32 tmp;
+
+	tmp = __raw_readl(S5P64X0_OTHERS);
+	tmp |= (S5P6450_OTHERS_RET_MMC0 | S5P6450_OTHERS_RET_MMC1 | \
+			S5P6450_OTHERS_RET_UART);
+	__raw_writel(tmp , S5P64X0_OTHERS);
+
+	return 0;
+}
+
+static struct sysdev_driver s5p64x0_pm_driver = {
+	.add		= s5p64x0_pm_add,
+	.resume		= s5p64x0_pm_resume,
+};
+
+static __init int s5p64x0_pm_drvinit(void)
+{
+	return sysdev_driver_register(&s5p64x0_sysclass, &s5p64x0_pm_driver);
+}
+
+arch_initcall(s5p64x0_pm_drvinit);
diff --git a/arch/arm/mach-s5p64x0/sleep.S b/arch/arm/mach-s5p64x0/sleep.S
new file mode 100644
index 0000000..d2bab06
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/sleep.S
@@ -0,0 +1,129 @@
+/* linux/arch/arm/mach-s5p64x0/sleep.S
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *             http://www.samsung.com
+ *
+ * S5P64X0 Power Manager (Suspend-to-RAM) code
+ * Based on S3C64XX sleep code by:
+ *     Ben Dooks, (c) 2008 Simtec Electronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+*/
+
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+#include <asm/memory.h>
+#include <mach/map.h>
+
+	.text
+
+	/* s3c_cpu_save
+	 *
+	 * Save enough processor state to allow the restart of the pm.c
+	 * code after resume.
+	 *
+	 * entry:
+	 *	r0 = pointer to the save block
+	*/
+
+ENTRY(s3c_cpu_save)
+	stmfd	sp!, { r4 - r12, lr }
+
+	mrc	p15, 0, r4, c13, c0, 0	@ FCSE/PID
+	mrc	p15, 0, r5, c3, c0, 0	@ Domain ID
+	mrc	p15, 0, r6, c2, c0, 0	@ Translation Table BASE0
+	mrc	p15, 0, r7, c2, c0, 1	@ Translation Table BASE1
+	mrc	p15, 0, r8, c2, c0, 2	@ Translation Table Control
+	mrc	p15, 0, r9, c1, c0, 0	@ Control register
+	mrc	p15, 0, r10, c1, c0, 1	@ Auxiliary control register
+	mrc	p15, 0, r11, c1, c0, 2	@ Co-processor access controls
+
+	stmia	r0, { r4 - r13 }	@ Save CP registers and SP
+
+	@@ save our state to ram
+	bl	s3c_pm_cb_flushcache
+
+	@@ call final suspend code
+	ldr	r0, =pm_cpu_sleep
+	ldr	pc, [r0]
+
+	@@ return to the caller, after the MMU is turned on.
+	@@ restore the last bits of the stack and return.
+resume_with_mmu:
+	ldmfd	sp!, { r4 - r12, pc }	@ return, from sp from s3c_cpu_save
+
+	.data
+
+	/* the next bit is code, but it requires easy access to the
+	 * s3c_sleep_save_phys data before the MMU is switched on, so
+	 * we store the code that needs this variable in the .data where
+	 * the value can be written to (the .text segment is RO).
+	*/
+
+	.global	s3c_sleep_save_phys
+s3c_sleep_save_phys:
+	.word	0
+
+       /* sleep magic, to allow the bootloader to check for an valid
+        * image to resume to. Must be the first word before the
+        * s3c_cpu_resume entry.
+       */
+
+       .word   0x2bedf00d
+
+       /* s3c_cpu_resume
+        *
+        * resume code entry for bootloader to call
+        *
+        * we must put this code here in the data segment as we have no
+        * other way of restoring the stack pointer after sleep, and we
+        * must not write to the code segment (code is read-only)
+       */
+
+
+ENTRY(s3c_cpu_resume)
+	msr	cpsr_c, #PSR_I_BIT | PSR_F_BIT | SVC_MODE
+
+	/* __v6_setup from arch/arm/mm/proc-v6.S, ensure that the caches
+	 * are thoroughly cleaned just in case the bootloader didn't do it
+	 * for us. */
+	mov	r0, #0
+	mcr	p15, 0, r0, c7, c14, 0		@ clean+invalidate D cache
+	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
+	mcr	p15, 0, r0, c7, c15, 0		@ clean+invalidate cache
+	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
+	@@mcr	p15, 0, r0, c8, c7, 0		@ invalidate I + D TLBs
+	@@mcr	p15, 0, r0, c7, c7, 0		@ Invalidate I + D caches
+
+	ldr	r0, s3c_sleep_save_phys
+	ldmia	r0, { r4 - r13 }
+
+	mcr	p15, 0, r4, c13, c0, 0	@ FCSE/PID
+	mcr	p15, 0, r5, c3, c0, 0	@ Domain ID
+	mcr	p15, 0, r6, c2, c0, 0	@ Translation Table BASE0
+	mcr	p15, 0, r7, c2, c0, 1	@ Translation Table BASE1
+	mcr	p15, 0, r8, c2, c0, 2	@ Translation Table Control
+	mcr	p15, 0, r10, c1, c0, 1	@ Auxiliary control register
+
+	mov	r0, #0			@ restore copro access controls
+	mcr	p15, 0, r11, c1, c0, 2	@ Co-processor access controls
+	mcr 	p15, 0, r0, c7, c5, 4
+
+	ldr	r2, =resume_with_mmu
+	mcr	p15, 0, r9, c1, c0, 0		/* turn mmu back on */
+	nop
+	mov	pc, r2				/* jump back */
+
+	.end
-- 
1.6.6.1
