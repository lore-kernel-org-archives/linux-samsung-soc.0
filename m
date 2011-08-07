From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [RFC][PATCH] serial: samsung: Use single interrupt handler for s3c64xx
 and higher SoC's
Date: Sun, 07 Aug 2011 21:52:13 +0530
Message-ID: <1312734133-27727-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31812 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793Ab1HGQIi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Aug 2011 12:08:38 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPK00DE1FICG810@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 01:08:36 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPK001JXFI353@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 01:08:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, grant.likely@secretlab.ca, ben-linux@fluff.org

s3c64xx and higher SoC's include the interrupt mask and pending registers
in the uart controller, unlike the s3c24xx SoC's which have these registers
in the interrupt controller. When the mask and pending registers are part
of the uart controller, it is easier to manage interrupts with a single
interrupt rather than having to create 3 seperate tx/rx/err interrupts.

This patch modifies the tx/rx/err uart interrupt handling for s3c64xx
SoC's and higher by registering a single interrupt handler. This makes
it easier to add device tree support as well.

Suggested-by: Grant Likely <grant.likely@secretlab.ca>
CC: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
Tested on Exynos4 smdkv310 only. If this approach is acceptable, it will be
tested it on s3c64xx and all s5p SoC's (should work on all as the changes
are generic). This is a bulky patch but it will split into smaller patches
if the approach is acceptable.

 arch/arm/Kconfig                                 |    1 -
 arch/arm/plat-s5p/Kconfig                        |    1 -
 arch/arm/plat-s5p/dev-uart.c                     |   84 +++---------------
 arch/arm/plat-s5p/irq.c                          |   34 -------
 arch/arm/plat-samsung/Kconfig                    |    5 -
 arch/arm/plat-samsung/Makefile                   |    1 -
 arch/arm/plat-samsung/include/plat/regs-serial.h |    5 +
 arch/arm/plat-samsung/irq-uart.c                 |   89 ------------------
 drivers/tty/serial/samsung.c                     |  104 ++++++++++++++++++++--
 drivers/tty/serial/samsung.h                     |    1 +
 10 files changed, 113 insertions(+), 212 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/irq-uart.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 27586c4..5412822 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -705,7 +705,6 @@ config ARCH_S3C64XX
 	select ARCH_REQUIRE_GPIOLIB
 	select SAMSUNG_CLKSRC
 	select SAMSUNG_IRQ_VIC_TIMER
-	select SAMSUNG_IRQ_UART
 	select S3C_GPIO_TRACK
 	select S3C_GPIO_PULL_UPDOWN
 	select S3C_GPIO_CFG_S3C24XX
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e98f5c5..5b546a3 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -22,7 +22,6 @@ config PLAT_S5P
 	select PLAT_SAMSUNG
 	select SAMSUNG_CLKSRC
 	select SAMSUNG_IRQ_VIC_TIMER
-	select SAMSUNG_IRQ_UART
 	help
 	  Base platform code for Samsung's S5P series SoC.
 
diff --git a/arch/arm/plat-s5p/dev-uart.c b/arch/arm/plat-s5p/dev-uart.c
index afaf87f..c9308db 100644
--- a/arch/arm/plat-s5p/dev-uart.c
+++ b/arch/arm/plat-s5p/dev-uart.c
@@ -32,20 +32,10 @@ static struct resource s5p_uart0_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX0,
-		.end	= IRQ_S5P_UART_RX0,
+		.start	= IRQ_UART0,
+		.end	= IRQ_UART0,
 		.flags	= IORESOURCE_IRQ,
 	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX0,
-		.end	= IRQ_S5P_UART_TX0,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR0,
-		.end	= IRQ_S5P_UART_ERR0,
-		.flags	= IORESOURCE_IRQ,
-	}
 };
 
 static struct resource s5p_uart1_resource[] = {
@@ -55,18 +45,8 @@ static struct resource s5p_uart1_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX1,
-		.end	= IRQ_S5P_UART_RX1,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX1,
-		.end	= IRQ_S5P_UART_TX1,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR1,
-		.end	= IRQ_S5P_UART_ERR1,
+		.start	= IRQ_UART1,
+		.end	= IRQ_UART1,
 		.flags	= IORESOURCE_IRQ,
 	},
 };
@@ -78,18 +58,8 @@ static struct resource s5p_uart2_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX2,
-		.end	= IRQ_S5P_UART_RX2,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX2,
-		.end	= IRQ_S5P_UART_TX2,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR2,
-		.end	= IRQ_S5P_UART_ERR2,
+		.start	= IRQ_UART2,
+		.end	= IRQ_UART2,
 		.flags	= IORESOURCE_IRQ,
 	},
 };
@@ -102,18 +72,8 @@ static struct resource s5p_uart3_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX3,
-		.end	= IRQ_S5P_UART_RX3,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX3,
-		.end	= IRQ_S5P_UART_TX3,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR3,
-		.end	= IRQ_S5P_UART_ERR3,
+		.start	= IRQ_UART3,
+		.end	= IRQ_UART3,
 		.flags	= IORESOURCE_IRQ,
 	},
 #endif
@@ -127,18 +87,8 @@ static struct resource s5p_uart4_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX4,
-		.end	= IRQ_S5P_UART_RX4,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX4,
-		.end	= IRQ_S5P_UART_TX4,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR4,
-		.end	= IRQ_S5P_UART_ERR4,
+		.start	= IRQ_UART4,
+		.end	= IRQ_UART4,
 		.flags	= IORESOURCE_IRQ,
 	},
 #endif
@@ -152,18 +102,8 @@ static struct resource s5p_uart5_resource[] = {
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-		.start	= IRQ_S5P_UART_RX5,
-		.end	= IRQ_S5P_UART_RX5,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start	= IRQ_S5P_UART_TX5,
-		.end	= IRQ_S5P_UART_TX5,
-		.flags	= IORESOURCE_IRQ,
-	},
-	[3] = {
-		.start	= IRQ_S5P_UART_ERR5,
-		.end	= IRQ_S5P_UART_ERR5,
+		.start	= IRQ_UART5,
+		.end	= IRQ_UART5,
 		.flags	= IORESOURCE_IRQ,
 	},
 #endif
diff --git a/arch/arm/plat-s5p/irq.c b/arch/arm/plat-s5p/irq.c
index a97c089..afdaa10 100644
--- a/arch/arm/plat-s5p/irq.c
+++ b/arch/arm/plat-s5p/irq.c
@@ -17,42 +17,10 @@
 
 #include <asm/hardware/vic.h>
 
-#include <linux/serial_core.h>
 #include <mach/map.h>
 #include <plat/regs-timer.h>
-#include <plat/regs-serial.h>
 #include <plat/cpu.h>
 #include <plat/irq-vic-timer.h>
-#include <plat/irq-uart.h>
-
-/*
- * Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
- * are consecutive when looking up the interrupt in the demux routines.
- */
-static struct s3c_uart_irq uart_irqs[] = {
-	[0] = {
-		.regs		= S5P_VA_UART0,
-		.base_irq	= IRQ_S5P_UART_BASE0,
-		.parent_irq	= IRQ_UART0,
-	},
-	[1] = {
-		.regs		= S5P_VA_UART1,
-		.base_irq	= IRQ_S5P_UART_BASE1,
-		.parent_irq	= IRQ_UART1,
-	},
-	[2] = {
-		.regs		= S5P_VA_UART2,
-		.base_irq	= IRQ_S5P_UART_BASE2,
-		.parent_irq	= IRQ_UART2,
-	},
-#if CONFIG_SERIAL_SAMSUNG_UARTS > 3
-	[3] = {
-		.regs		= S5P_VA_UART3,
-		.base_irq	= IRQ_S5P_UART_BASE3,
-		.parent_irq	= IRQ_UART3,
-	},
-#endif
-};
 
 void __init s5p_init_irq(u32 *vic, u32 num_vic)
 {
@@ -65,6 +33,4 @@ void __init s5p_init_irq(u32 *vic, u32 num_vic)
 #endif
 
 	s3c_init_vic_timer_irq(5, IRQ_TIMER0);
-
-	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
 }
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 4d79519..38c5152 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -65,11 +65,6 @@ config SAMSUNG_IRQ_VIC_TIMER
        help
          Internal configuration to build the VIC timer interrupt code.
 
-config SAMSUNG_IRQ_UART
-       bool
-       help
-         Internal configuration to build the IRQ UART demux code.
-
 # options for gpio configuration support
 
 config SAMSUNG_GPIOLIB_4BIT
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 53eb15b..6a1b423 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -21,7 +21,6 @@ obj-y				+= dev-asocdma.o
 
 obj-$(CONFIG_SAMSUNG_CLKSRC)	+= clock-clksrc.o
 
-obj-$(CONFIG_SAMSUNG_IRQ_UART)	+= irq-uart.o
 obj-$(CONFIG_SAMSUNG_IRQ_VIC_TIMER) += irq-vic-timer.o
 
 # ADC
diff --git a/arch/arm/plat-samsung/include/plat/regs-serial.h b/arch/arm/plat-samsung/include/plat/regs-serial.h
index 116edfe..baa59b7 100644
--- a/arch/arm/plat-samsung/include/plat/regs-serial.h
+++ b/arch/arm/plat-samsung/include/plat/regs-serial.h
@@ -194,6 +194,11 @@
 #define S3C64XX_UINTSP		0x34
 #define S3C64XX_UINTM		0x38
 
+#define S3C64XX_UINTM_RXD	(0)
+#define S3C64XX_UINTM_TXD	(2)
+#define S3C64XX_UINTM_RXD_MSK	(1 << S3C64XX_UINTM_RXD)
+#define S3C64XX_UINTM_TXD_MSK	(1 << S3C64XX_UINTM_TXD)
+
 /* Following are specific to S5PV210 */
 #define S5PV210_UCON_CLKMASK	(1<<10)
 #define S5PV210_UCON_PCLK	(0<<10)
diff --git a/arch/arm/plat-samsung/irq-uart.c b/arch/arm/plat-samsung/irq-uart.c
deleted file mode 100644
index 657405c..0000000
--- a/arch/arm/plat-samsung/irq-uart.c
+++ /dev/null
@@ -1,89 +0,0 @@
-/* arch/arm/plat-samsung/irq-uart.c
- *	originally part of arch/arm/plat-s3c64xx/irq.c
- *
- * Copyright 2008 Openmoko, Inc.
- * Copyright 2008 Simtec Electronics
- *      Ben Dooks <ben@simtec.co.uk>
- *      http://armlinux.simtec.co.uk/
- *
- * Samsung- UART Interrupt handling
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <linux/kernel.h>
-#include <linux/interrupt.h>
-#include <linux/serial_core.h>
-#include <linux/irq.h>
-#include <linux/io.h>
-
-#include <mach/map.h>
-#include <plat/irq-uart.h>
-#include <plat/regs-serial.h>
-#include <plat/cpu.h>
-
-/* Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
- * are consecutive when looking up the interrupt in the demux routines.
- */
-static void s3c_irq_demux_uart(unsigned int irq, struct irq_desc *desc)
-{
-	struct s3c_uart_irq *uirq = desc->irq_data.handler_data;
-	u32 pend = __raw_readl(uirq->regs + S3C64XX_UINTP);
-	int base = uirq->base_irq;
-
-	if (pend & (1 << 0))
-		generic_handle_irq(base);
-	if (pend & (1 << 1))
-		generic_handle_irq(base + 1);
-	if (pend & (1 << 2))
-		generic_handle_irq(base + 2);
-	if (pend & (1 << 3))
-		generic_handle_irq(base + 3);
-}
-
-static void __init s3c_init_uart_irq(struct s3c_uart_irq *uirq)
-{
-	void __iomem *reg_base = uirq->regs;
-	struct irq_chip_generic *gc;
-	struct irq_chip_type *ct;
-
-	/* mask all interrupts at the start. */
-	__raw_writel(0xf, reg_base + S3C64XX_UINTM);
-
-	gc = irq_alloc_generic_chip("s3c-uart", 1, uirq->base_irq, reg_base,
-				    handle_level_irq);
-
-	if (!gc) {
-		pr_err("%s: irq_alloc_generic_chip for IRQ %u failed\n",
-		       __func__, uirq->base_irq);
-		return;
-	}
-
-	ct = gc->chip_types;
-	ct->chip.irq_ack = irq_gc_ack_set_bit;
-	ct->chip.irq_mask = irq_gc_mask_set_bit;
-	ct->chip.irq_unmask = irq_gc_mask_clr_bit;
-	ct->regs.ack = S3C64XX_UINTP;
-	ct->regs.mask = S3C64XX_UINTM;
-	irq_setup_generic_chip(gc, IRQ_MSK(4), IRQ_GC_INIT_MASK_CACHE,
-			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
-
-	irq_set_handler_data(uirq->parent_irq, uirq);
-	irq_set_chained_handler(uirq->parent_irq, s3c_irq_demux_uart);
-}
-
-/**
- * s3c_init_uart_irqs() - initialise UART IRQs and the necessary demuxing
- * @irq: The interrupt data for registering
- * @nr_irqs: The number of interrupt descriptions in @irq.
- *
- * Register the UART interrupts specified by @irq including the demuxing
- * routines. This supports the S3C6400 and newer style of devices.
- */
-void __init s3c_init_uart_irqs(struct s3c_uart_irq *irq, unsigned int nr_irqs)
-{
-	for (; nr_irqs > 0; nr_irqs--, irq++)
-		s3c_init_uart_irq(irq);
-}
diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 7ead421..8d0e83d 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -83,6 +83,16 @@ static int s3c24xx_serial_txempty_nofifo(struct uart_port *port)
 	return (rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE);
 }
 
+/*
+ * s3c64xx and later SoC's include the interrupt mask and status registers in
+ * the controller itself, unlike the s3c24xx SoC's which have these registers
+ * in the interrupt controller. Check if the port type is s3c64xx or higher.
+ */
+static int s3c24xx_serial_has_interrupt_mask(struct uart_port *port)
+{
+	return to_ourport(port)->info->type == PORT_S3C6400;
+}
+
 static void s3c24xx_serial_rx_enable(struct uart_port *port)
 {
 	unsigned long flags;
@@ -126,7 +136,11 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 
 	if (tx_enabled(port)) {
-		disable_irq_nosync(ourport->tx_irq);
+		if (s3c24xx_serial_has_interrupt_mask(port))
+			__set_bit(S3C64XX_UINTM_TXD,
+				portaddrl(port, S3C64XX_UINTM));
+		else
+			disable_irq_nosync(ourport->tx_irq);
 		tx_enabled(port) = 0;
 		if (port->flags & UPF_CONS_FLOW)
 			s3c24xx_serial_rx_enable(port);
@@ -141,19 +155,26 @@ static void s3c24xx_serial_start_tx(struct uart_port *port)
 		if (port->flags & UPF_CONS_FLOW)
 			s3c24xx_serial_rx_disable(port);
 
-		enable_irq(ourport->tx_irq);
+		if (s3c24xx_serial_has_interrupt_mask(port))
+			__clear_bit(S3C64XX_UINTM_TXD,
+				portaddrl(port, S3C64XX_UINTM));
+		else
+			enable_irq(ourport->tx_irq);
 		tx_enabled(port) = 1;
 	}
 }
 
-
 static void s3c24xx_serial_stop_rx(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 
 	if (rx_enabled(port)) {
 		dbg("s3c24xx_serial_stop_rx: port=%p\n", port);
-		disable_irq_nosync(ourport->rx_irq);
+		if (s3c24xx_serial_has_interrupt_mask(port))
+			__set_bit(S3C64XX_UINTM_RXD,
+				portaddrl(port, S3C64XX_UINTM));
+		else
+			disable_irq_nosync(ourport->rx_irq);
 		rx_enabled(port) = 0;
 	}
 }
@@ -320,6 +341,27 @@ static irqreturn_t s3c24xx_serial_tx_chars(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
+{
+	struct s3c24xx_uart_port *ourport = id;
+	struct uart_port *port = &ourport->port;
+	unsigned int pend = rd_regl(port, S3C64XX_UINTP);
+	unsigned long flags;
+	irqreturn_t ret = IRQ_HANDLED;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (pend & S3C64XX_UINTM_RXD_MSK) {
+		ret = s3c24xx_serial_rx_chars(irq, id);
+		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_RXD_MSK);
+	}
+	if (pend & S3C64XX_UINTM_TXD_MSK) {
+		ret = s3c24xx_serial_tx_chars(irq, id);
+		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_TXD_MSK);
+	}
+	spin_unlock_irqrestore(&port->lock, flags);
+	return ret;
+}
+
 static unsigned int s3c24xx_serial_tx_empty(struct uart_port *port)
 {
 	struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
@@ -377,18 +419,25 @@ static void s3c24xx_serial_shutdown(struct uart_port *port)
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 
 	if (ourport->tx_claimed) {
-		free_irq(ourport->tx_irq, ourport);
+		if (!s3c24xx_serial_has_interrupt_mask(port))
+			free_irq(ourport->tx_irq, ourport);
 		tx_enabled(port) = 0;
 		ourport->tx_claimed = 0;
 	}
 
 	if (ourport->rx_claimed) {
-		free_irq(ourport->rx_irq, ourport);
+		if (!s3c24xx_serial_has_interrupt_mask(port))
+			free_irq(ourport->rx_irq, ourport);
 		ourport->rx_claimed = 0;
 		rx_enabled(port) = 0;
 	}
-}
 
+	/* Clear pending interrupts and mask all interrupts */
+	if (s3c24xx_serial_has_interrupt_mask(port)) {
+		wr_regl(port, S3C64XX_UINTP, 0xf);
+		wr_regl(port, S3C64XX_UINTM, 0xf);
+	}
+}
 
 static int s3c24xx_serial_startup(struct uart_port *port)
 {
@@ -436,6 +485,33 @@ static int s3c24xx_serial_startup(struct uart_port *port)
 	return ret;
 }
 
+static int s3c64xx_serial_startup(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	int ret;
+
+	dbg("s3c64xx_serial_startup: port=%p (%08lx,%p)\n",
+	    port->mapbase, port->membase);
+
+	ret = request_irq(port->irq, s3c64xx_serial_handle_irq, IRQF_SHARED,
+			  s3c24xx_serial_portname(port), ourport);
+	if (ret) {
+		printk(KERN_ERR "cannot get irq %d\n", port->irq);
+		return ret;
+	}
+
+	/* For compatibility with s3c24xx Soc's */
+	rx_enabled(port) = 1;
+	ourport->rx_claimed = 1;
+	tx_enabled(port) = 0;
+	ourport->tx_claimed = 1;
+
+	/* Enable Rx Interrupt */
+	__clear_bit(S3C64XX_UINTM_RXD, portaddrl(port, S3C64XX_UINTM));
+	dbg("s3c64xx_serial_startup ok\n");
+	return ret;
+}
+
 /* power power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
@@ -879,7 +955,6 @@ static struct uart_ops s3c24xx_serial_ops = {
 	.verify_port	= s3c24xx_serial_verify_port,
 };
 
-
 static struct uart_driver s3c24xx_uart_drv = {
 	.owner		= THIS_MODULE,
 	.driver_name	= "s3c2410_serial",
@@ -1077,6 +1152,10 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	port->dev	= &platdev->dev;
 	ourport->info	= info;
 
+	/* Startup sequence is different for s3c64xx and higher SoC's */
+	if (s3c24xx_serial_has_interrupt_mask(port))
+		s3c24xx_serial_ops.startup = s3c64xx_serial_startup;
+
 	/* copy the info in from provided structure */
 	ourport->port.fifosize = info->fifosize;
 
@@ -1109,13 +1188,20 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 		ourport->rx_irq = ret;
 		ourport->tx_irq = ret + 1;
 	}
-	
+
 	ret = platform_get_irq(platdev, 1);
 	if (ret > 0)
 		ourport->tx_irq = ret;
 
 	ourport->clk	= clk_get(&platdev->dev, "uart");
 
+	/* Keep all interrupts masked */
+	if (s3c24xx_serial_has_interrupt_mask(port)) {
+		wr_regl(port, S3C64XX_UINTM, 0xf);
+		wr_regl(port, S3C64XX_UINTP, 0xf);
+		wr_regl(port, S3C64XX_UINTSP, 0xf);
+	}
+
 	dbg("port: map=%08x, mem=%08x, irq=%d (%d,%d), clock=%ld\n",
 	    port->mapbase, port->membase, port->irq,
 	    ourport->rx_irq, ourport->tx_irq, port->uartclk);
diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsung.h
index a69d9a5..8e87b78 100644
--- a/drivers/tty/serial/samsung.h
+++ b/drivers/tty/serial/samsung.h
@@ -61,6 +61,7 @@ struct s3c24xx_uart_port {
 /* register access controls */
 
 #define portaddr(port, reg) ((port)->membase + (reg))
+#define portaddrl(port, reg) ((unsigned long *)((port)->membase + (reg)))
 
 #define rd_regb(port, reg) (__raw_readb(portaddr(port, reg)))
 #define rd_regl(port, reg) (__raw_readl(portaddr(port, reg)))
-- 
1.6.6.rc2
