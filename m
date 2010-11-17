From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/2] ARM: S3C24XX: Fix Demux error in UART3 irqs on S3C2443 and S3C2416
Date: Wed, 17 Nov 2010 09:47:23 +0900
Message-ID: <1289954843-27844-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36997 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933479Ab0KQA7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 19:59:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

IRQ_S3C2443_UART3 is being used as the base when it should actually
be IRQ_S3C2443_RX3 on S3C2443 and S3C2416 for the UART3.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s3c2416/irq.c |    2 +-
 arch/arm/mach-s3c2443/irq.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
index 084d121..7844857 100644
--- a/arch/arm/mach-s3c2416/irq.c
+++ b/arch/arm/mach-s3c2416/irq.c
@@ -168,7 +168,7 @@ static struct irq_chip s3c2416_irq_dma = {
 
 static void s3c2416_irq_demux_uart3(unsigned int irq, struct irq_desc *desc)
 {
-	s3c2416_irq_demux(IRQ_S3C2443_UART3, 3);
+	s3c2416_irq_demux(IRQ_S3C2443_RX3, 3);
 }
 
 #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
diff --git a/arch/arm/mach-s3c2443/irq.c b/arch/arm/mach-s3c2443/irq.c
index 0e0d693..df2b8db 100644
--- a/arch/arm/mach-s3c2443/irq.c
+++ b/arch/arm/mach-s3c2443/irq.c
@@ -166,7 +166,7 @@ static struct irq_chip s3c2443_irq_dma = {
 
 static void s3c2443_irq_demux_uart3(unsigned int irq, struct irq_desc *desc)
 {
-	s3c2443_irq_demux(IRQ_S3C2443_UART3, 3);
+	s3c2443_irq_demux(IRQ_S3C2443_RX3, 3);
 }
 
 #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
-- 
1.6.2.5
