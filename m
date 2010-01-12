From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Move to using standard timer IRQ handling code
Date: Tue, 12 Jan 2010 05:20:56 +0000
Message-ID: <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
References: <1263273657-27986-1-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55380 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751310Ab0ALFVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 00:21:03 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUZBZ-0007Hn-68
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 05:20:57 +0000
In-Reply-To: <1263273657-27986-1-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Move to using the standard VIC/Timer IRQ handling code added previously\
to avoid duplicating code.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s5pc100/include/mach/tick.h |    2 +-
 arch/arm/plat-s5pc1xx/Kconfig             |    2 +
 arch/arm/plat-s5pc1xx/include/plat/irqs.h |   19 ++++--
 arch/arm/plat-s5pc1xx/irq.c               |   88 ++--------------------------
 4 files changed, 23 insertions(+), 88 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/tick.h b/arch/arm/mach-s5pc100/include/mach/tick.h
index d3de0f3..f338c9e 100644
--- a/arch/arm/mach-s5pc100/include/mach/tick.h
+++ b/arch/arm/mach-s5pc100/include/mach/tick.h
@@ -21,7 +21,7 @@
 static inline u32 s3c24xx_ostimer_pending(void)
 {
 	u32 pend = __raw_readl(S3C_VA_VIC0 + VIC_RAW_STATUS);
-	return pend & 1 << (IRQ_TIMER4 - S5PC1XX_IRQ_VIC0(0));
+	return pend & 1 << (IRQ_TIMER4_VIC - S5PC1XX_IRQ_VIC0(0));
 }
 
 #define TICK_MAX	(0xffffffff)
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 5d97b1c..6438bcd 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -12,11 +12,13 @@ config PLAT_S5PC1XX
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_IRQ_VIC_TIMER
 	select S3C_GPIO_TRACK
 	select S3C_GPIO_PULL_UPDOWN
 	select S3C_GPIO_CFG_S3C24XX
 	select S3C_GPIO_CFG_S3C64XX
 	select S5P_GPIO_CFG_S5PC1XX
+	select SAMSUNG_IRQ_VIC_TIMER
 	help
 	  Base platform code for any Samsung S5PC1XX device
 
diff --git a/arch/arm/plat-s5pc1xx/include/plat/irqs.h b/arch/arm/plat-s5pc1xx/include/plat/irqs.h
index ef87363..409c804 100644
--- a/arch/arm/plat-s5pc1xx/include/plat/irqs.h
+++ b/arch/arm/plat-s5pc1xx/include/plat/irqs.h
@@ -88,11 +88,11 @@
 #define IRQ_MDMA		S5PC1XX_IRQ_VIC0(18)
 #define IRQ_PDMA0		S5PC1XX_IRQ_VIC0(19)
 #define IRQ_PDMA1		S5PC1XX_IRQ_VIC0(20)
-#define IRQ_TIMER0		S5PC1XX_IRQ_VIC0(21)
-#define IRQ_TIMER1		S5PC1XX_IRQ_VIC0(22)
-#define IRQ_TIMER2		S5PC1XX_IRQ_VIC0(23)
-#define IRQ_TIMER3		S5PC1XX_IRQ_VIC0(24)
-#define IRQ_TIMER4		S5PC1XX_IRQ_VIC0(25)
+#define IRQ_TIMER0_VIC		S5PC1XX_IRQ_VIC0(21)
+#define IRQ_TIMER1_VIC		S5PC1XX_IRQ_VIC0(22)
+#define IRQ_TIMER2_VIC		S5PC1XX_IRQ_VIC0(23)
+#define IRQ_TIMER3_VIC		S5PC1XX_IRQ_VIC0(24)
+#define IRQ_TIMER4_VIC		S5PC1XX_IRQ_VIC0(25)
 #define IRQ_SYSTIMER		S5PC1XX_IRQ_VIC0(26)
 #define IRQ_WDT			S5PC1XX_IRQ_VIC0(27)
 #define IRQ_RTC_ALARM		S5PC1XX_IRQ_VIC0(28)
@@ -171,8 +171,15 @@
 #define IRQ_SDMIRQ		S5PC1XX_IRQ_VIC2(30)
 #define IRQ_SDMFIQ		S5PC1XX_IRQ_VIC2(31)
 
+#define IRQ_TIMER(x)		(IRQ_SDMFIQ + 1 + (x))
+#define IRQ_TIMER0		IRQ_TIMER(0)
+#define IRQ_TIMER1		IRQ_TIMER(1)
+#define IRQ_TIMER2		IRQ_TIMER(2)
+#define IRQ_TIMER3		IRQ_TIMER(3)
+#define IRQ_TIMER4		IRQ_TIMER(4)
+
 /* External interrupt */
-#define S3C_IRQ_EINT_BASE	(IRQ_SDMFIQ + 1)
+#define S3C_IRQ_EINT_BASE	(IRQ_SDMFIQ + 6)
 
 #define S3C_EINT(x)		(S3C_IRQ_EINT_BASE + (x - 16))
 #define IRQ_EINT(x)		(x < 16 ? IRQ_EINT0 + x : S3C_EINT(x))
diff --git a/arch/arm/plat-s5pc1xx/irq.c b/arch/arm/plat-s5pc1xx/irq.c
index e44fd04..ae233bd 100644
--- a/arch/arm/plat-s5pc1xx/irq.c
+++ b/arch/arm/plat-s5pc1xx/irq.c
@@ -20,77 +20,9 @@
 #include <asm/hardware/vic.h>
 
 #include <mach/map.h>
-#include <plat/regs-timer.h>
+#include <plat/irq-vic-timer.h>
 #include <plat/cpu.h>
 
-/* Timer interrupt handling */
-
-static void s3c_irq_demux_timer(unsigned int base_irq, unsigned int sub_irq)
-{
-	generic_handle_irq(sub_irq);
-}
-
-static void s3c_irq_demux_timer0(unsigned int irq, struct irq_desc *desc)
-{
-	s3c_irq_demux_timer(irq, IRQ_TIMER0);
-}
-
-static void s3c_irq_demux_timer1(unsigned int irq, struct irq_desc *desc)
-{
-	s3c_irq_demux_timer(irq, IRQ_TIMER1);
-}
-
-static void s3c_irq_demux_timer2(unsigned int irq, struct irq_desc *desc)
-{
-	s3c_irq_demux_timer(irq, IRQ_TIMER2);
-}
-
-static void s3c_irq_demux_timer3(unsigned int irq, struct irq_desc *desc)
-{
-	s3c_irq_demux_timer(irq, IRQ_TIMER3);
-}
-
-static void s3c_irq_demux_timer4(unsigned int irq, struct irq_desc *desc)
-{
-	s3c_irq_demux_timer(irq, IRQ_TIMER4);
-}
-
-/* We assume the IRQ_TIMER0..IRQ_TIMER4 range is continuous. */
-
-static void s3c_irq_timer_mask(unsigned int irq)
-{
-	u32 reg = __raw_readl(S3C64XX_TINT_CSTAT);
-
-	reg &= 0x1f;  /* mask out pending interrupts */
-	reg &= ~(1 << (irq - IRQ_TIMER0));
-	__raw_writel(reg, S3C64XX_TINT_CSTAT);
-}
-
-static void s3c_irq_timer_unmask(unsigned int irq)
-{
-	u32 reg = __raw_readl(S3C64XX_TINT_CSTAT);
-
-	reg &= 0x1f;  /* mask out pending interrupts */
-	reg |= 1 << (irq - IRQ_TIMER0);
-	__raw_writel(reg, S3C64XX_TINT_CSTAT);
-}
-
-static void s3c_irq_timer_ack(unsigned int irq)
-{
-	u32 reg = __raw_readl(S3C64XX_TINT_CSTAT);
-
-	reg &= 0x1f;  /* mask out pending interrupts */
-	reg |= (1 << 5) << (irq - IRQ_TIMER0);
-	__raw_writel(reg, S3C64XX_TINT_CSTAT);
-}
-
-static struct irq_chip s3c_irq_timer = {
-	.name		= "s3c-timer",
-	.mask		= s3c_irq_timer_mask,
-	.unmask		= s3c_irq_timer_unmask,
-	.ack		= s3c_irq_timer_ack,
-};
-
 struct uart_irq {
 	void __iomem	*regs;
 	unsigned int	 base_irq;
@@ -229,7 +161,7 @@ static void __init s5pc1xx_uart_irq(struct uart_irq *uirq)
 void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
 {
 	int i;
-	int uart, irq;
+	int uart;
 
 	printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
 
@@ -240,17 +172,11 @@ void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
 
 	/* add the timer sub-irqs */
 
-	set_irq_chained_handler(IRQ_TIMER0, s3c_irq_demux_timer0);
-	set_irq_chained_handler(IRQ_TIMER1, s3c_irq_demux_timer1);
-	set_irq_chained_handler(IRQ_TIMER2, s3c_irq_demux_timer2);
-	set_irq_chained_handler(IRQ_TIMER3, s3c_irq_demux_timer3);
-	set_irq_chained_handler(IRQ_TIMER4, s3c_irq_demux_timer4);
-
-	for (irq = IRQ_TIMER0; irq <= IRQ_TIMER4; irq++) {
-		set_irq_chip(irq, &s3c_irq_timer);
-		set_irq_handler(irq, handle_level_irq);
-		set_irq_flags(irq, IRQF_VALID);
-	}
+	s3c_init_vic_timer_irq(IRQ_TIMER0_VIC, IRQ_TIMER0);
+	s3c_init_vic_timer_irq(IRQ_TIMER1_VIC, IRQ_TIMER1);
+	s3c_init_vic_timer_irq(IRQ_TIMER2_VIC, IRQ_TIMER2);
+	s3c_init_vic_timer_irq(IRQ_TIMER3_VIC, IRQ_TIMER3);
+	s3c_init_vic_timer_irq(IRQ_TIMER4_VIC, IRQ_TIMER4);
 
 	for (uart = 0; uart < ARRAY_SIZE(uart_irqs); uart++)
 		s5pc1xx_uart_irq(&uart_irqs[uart]);
-- 
1.6.0.4
