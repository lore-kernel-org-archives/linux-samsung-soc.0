From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/2] ARM: S3C24XX: Fix UART3 submask on S3C2416 and S3C2443
Date: Wed, 17 Nov 2010 09:47:48 +0900
Message-ID: <1289954868-27876-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37000 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933482Ab0KQA7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 19:59:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

The UART3 submask should be 0x7 (SUBSRCPND[26:24]).

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s3c2416/irq.c |    3 +--
 arch/arm/mach-s3c2443/irq.c |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
index 7844857..00174da 100644
--- a/arch/arm/mach-s3c2416/irq.c
+++ b/arch/arm/mach-s3c2416/irq.c
@@ -172,8 +172,7 @@ static void s3c2416_irq_demux_uart3(unsigned int irq, struct irq_desc *desc)
 }
 
 #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
-#define SUBMSK_UART3	(0xf << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
-
+#define SUBMSK_UART3	(0x7 << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
 
 static void s3c2416_irq_uart3_mask(unsigned int irqno)
 {
diff --git a/arch/arm/mach-s3c2443/irq.c b/arch/arm/mach-s3c2443/irq.c
index df2b8db..8934247 100644
--- a/arch/arm/mach-s3c2443/irq.c
+++ b/arch/arm/mach-s3c2443/irq.c
@@ -170,8 +170,7 @@ static void s3c2443_irq_demux_uart3(unsigned int irq, struct irq_desc *desc)
 }
 
 #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
-#define SUBMSK_UART3	(0xf << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
-
+#define SUBMSK_UART3	(0x7 << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
 
 static void s3c2443_irq_uart3_mask(unsigned int irqno)
 {
-- 
1.6.2.5
