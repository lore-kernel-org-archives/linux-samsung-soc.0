From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Use common UART IRQ handling code
Date: Tue, 12 Jan 2010 05:20:57 +0000
Message-ID: <1263273657-27986-3-git-send-email-ben@trinity.fluff.org>
References: <1263273657-27986-1-git-send-email-ben@trinity.fluff.org>
 <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55379 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751245Ab0ALFVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 00:21:03 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUZBZ-0007Hp-7Y
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 05:20:57 +0000
In-Reply-To: <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Use the common UART IRQ handling code for the S5PC100 system.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/Kconfig |    1 +
 arch/arm/plat-s5pc1xx/irq.c   |  116 +---------------------------------------
 2 files changed, 4 insertions(+), 113 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 6438bcd..b7f442b 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -12,6 +12,7 @@ config PLAT_S5PC1XX
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_IRQ_UART
 	select SAMSUNG_IRQ_VIC_TIMER
 	select S3C_GPIO_TRACK
 	select S3C_GPIO_PULL_UPDOWN
diff --git a/arch/arm/plat-s5pc1xx/irq.c b/arch/arm/plat-s5pc1xx/irq.c
index ae233bd..bfc5248 100644
--- a/arch/arm/plat-s5pc1xx/irq.c
+++ b/arch/arm/plat-s5pc1xx/irq.c
@@ -21,18 +21,13 @@
 
 #include <mach/map.h>
 #include <plat/irq-vic-timer.h>
+#include <plat/irq-uart.h>
 #include <plat/cpu.h>
 
-struct uart_irq {
-	void __iomem	*regs;
-	unsigned int	 base_irq;
-	unsigned int	 parent_irq;
-};
-
 /* Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
  * are consecutive when looking up the interrupt in the demux routines.
  */
-static struct uart_irq uart_irqs[] = {
+static struct s3c_uart_irq uart_irqs[] = {
 	[0] = {
 		.regs		= (void *)S3C_VA_UART0,
 		.base_irq	= IRQ_S3CUART_BASE0,
@@ -55,113 +50,9 @@ static struct uart_irq uart_irqs[] = {
 	},
 };
 
-static inline void __iomem *s3c_irq_uart_base(unsigned int irq)
-{
-	struct uart_irq *uirq = get_irq_chip_data(irq);
-	return uirq->regs;
-}
-
-static inline unsigned int s3c_irq_uart_bit(unsigned int irq)
-{
-	return irq & 3;
-}
-
-/* UART interrupt registers, not worth adding to seperate include header */
-#define S3C64XX_UINTP	0x30
-#define S3C64XX_UINTSP	0x34
-#define S3C64XX_UINTM	0x38
-
-static void s3c_irq_uart_mask(unsigned int irq)
-{
-	void __iomem *regs = s3c_irq_uart_base(irq);
-	unsigned int bit = s3c_irq_uart_bit(irq);
-	u32 reg;
-
-	reg = __raw_readl(regs + S3C64XX_UINTM);
-	reg |= (1 << bit);
-	__raw_writel(reg, regs + S3C64XX_UINTM);
-}
-
-static void s3c_irq_uart_maskack(unsigned int irq)
-{
-	void __iomem *regs = s3c_irq_uart_base(irq);
-	unsigned int bit = s3c_irq_uart_bit(irq);
-	u32 reg;
-
-	reg = __raw_readl(regs + S3C64XX_UINTM);
-	reg |= (1 << bit);
-	__raw_writel(reg, regs + S3C64XX_UINTM);
-	__raw_writel(1 << bit, regs + S3C64XX_UINTP);
-}
-
-static void s3c_irq_uart_unmask(unsigned int irq)
-{
-	void __iomem *regs = s3c_irq_uart_base(irq);
-	unsigned int bit = s3c_irq_uart_bit(irq);
-	u32 reg;
-
-	reg = __raw_readl(regs + S3C64XX_UINTM);
-	reg &= ~(1 << bit);
-	__raw_writel(reg, regs + S3C64XX_UINTM);
-}
-
-static void s3c_irq_uart_ack(unsigned int irq)
-{
-	void __iomem *regs = s3c_irq_uart_base(irq);
-	unsigned int bit = s3c_irq_uart_bit(irq);
-
-	__raw_writel(1 << bit, regs + S3C64XX_UINTP);
-}
-
-static void s3c_irq_demux_uart(unsigned int irq, struct irq_desc *desc)
-{
-	struct uart_irq *uirq = &uart_irqs[irq - IRQ_UART0];
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
-static struct irq_chip s3c_irq_uart = {
-	.name		= "s3c-uart",
-	.mask		= s3c_irq_uart_mask,
-	.unmask		= s3c_irq_uart_unmask,
-	.mask_ack	= s3c_irq_uart_maskack,
-	.ack		= s3c_irq_uart_ack,
-};
-
-static void __init s5pc1xx_uart_irq(struct uart_irq *uirq)
-{
-	void __iomem *reg_base = uirq->regs;
-	unsigned int irq;
-	int offs;
-
-	/* mask all interrupts at the start. */
-	__raw_writel(0xf, reg_base + S3C64XX_UINTM);
-
-	for (offs = 0; offs < 3; offs++) {
-		irq = uirq->base_irq + offs;
-
-		set_irq_chip(irq, &s3c_irq_uart);
-		set_irq_chip_data(irq, uirq);
-		set_irq_handler(irq, handle_level_irq);
-		set_irq_flags(irq, IRQF_VALID);
-	}
-
-	set_irq_chained_handler(uirq->parent_irq, s3c_irq_demux_uart);
-}
-
 void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
 {
 	int i;
-	int uart;
 
 	printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
 
@@ -178,8 +69,7 @@ void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
 	s3c_init_vic_timer_irq(IRQ_TIMER3_VIC, IRQ_TIMER3);
 	s3c_init_vic_timer_irq(IRQ_TIMER4_VIC, IRQ_TIMER4);
 
-	for (uart = 0; uart < ARRAY_SIZE(uart_irqs); uart++)
-		s5pc1xx_uart_irq(&uart_irqs[uart]);
+	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
 }
 
 
-- 
1.6.0.4
