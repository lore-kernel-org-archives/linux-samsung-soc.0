From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Add 3 UART SoC support
Date: Mon, 25 Jan 2010 08:43:45 +0900
Message-ID: <1264376625-7147-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36673 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806Ab0AXXva (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 18:51:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds 3 UART S5P SoC support. It has UART0, UART1, and UART2.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/dev-uart.c |    2 ++
 arch/arm/plat-s5p/irq.c      |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/dev-uart.c b/arch/arm/plat-s5p/dev-uart.c
index 23c7531..a89331e 100644
--- a/arch/arm/plat-s5p/dev-uart.c
+++ b/arch/arm/plat-s5p/dev-uart.c
@@ -95,6 +95,7 @@ static struct resource s5p_uart2_resource[] = {
 };
 
 static struct resource s5p_uart3_resource[] = {
+#if CONFIG_SERIAL_SAMSUNG_UARTS > 3
 	[0] = {
 		.start	= S5P_PA_UART3,
 		.end	= S5P_PA_UART3 + S5P_SZ_UART,
@@ -115,6 +116,7 @@ static struct resource s5p_uart3_resource[] = {
 		.end	= IRQ_S5P_UART_ERR3,
 		.flags	= IORESOURCE_IRQ,
 	},
+#endif
 };
 
 struct s3c24xx_uart_resources s5p_uart_resources[] __initdata = {
diff --git a/arch/arm/plat-s5p/irq.c b/arch/arm/plat-s5p/irq.c
index eada40d..9308f34 100644
--- a/arch/arm/plat-s5p/irq.c
+++ b/arch/arm/plat-s5p/irq.c
@@ -48,11 +48,13 @@ static struct s3c_uart_irq uart_irqs[] = {
 		.base_irq	= IRQ_S5P_UART_BASE2,
 		.parent_irq	= IRQ_UART2,
 	},
+#if CONFIG_SERIAL_SAMSUNG_UARTS > 3
 	[3] = {
 		.regs		= S5P_VA_UART3,
 		.base_irq	= IRQ_S5P_UART_BASE3,
 		.parent_irq	= IRQ_UART3,
 	},
+#endif
 };
 
 void __init s5p_init_irq(u32 *vic, u32 num_vic)
-- 
1.6.2.5
