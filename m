From: jassisinghbrar@gmail.com
Subject: [PATCH 1/4] S3C64XX DSP: Added base and register defines for PCM controllers
Date: Mon,  2 Nov 2009 11:09:48 +0900
Message-ID: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57291 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753585AbZKBCMu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2009 21:12:50 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h      |    2 +
 arch/arm/plat-s3c64xx/include/plat/regs-pcm.h |   94 +++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s3c64xx/include/plat/regs-pcm.h

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h b/arch/arm/mach-s3c6400/include/mach/map.h
index fc8b223..866be31 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -48,6 +48,8 @@
 #define S3C64XX_PA_IIS1		(0x7F003000)
 #define S3C64XX_PA_TIMER	(0x7F006000)
 #define S3C64XX_PA_IIC0		(0x7F004000)
+#define S3C64XX_PA_PCM0		(0x7F009000)
+#define S3C64XX_PA_PCM1		(0x7F00A000)
 #define S3C64XX_PA_IISV4	(0x7F00D000)
 #define S3C64XX_PA_IIC1		(0x7F00F000)
 
diff --git a/arch/arm/plat-s3c64xx/include/plat/regs-pcm.h b/arch/arm/plat-s3c64xx/include/plat/regs-pcm.h
new file mode 100644
index 0000000..2a5fec9
--- /dev/null
+++ b/arch/arm/plat-s3c64xx/include/plat/regs-pcm.h
@@ -0,0 +1,95 @@
+/* linux/arch/arm/plat-s3c64xx/include/plat/regs-pcm.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * S3C64XX PCM controller register definitions
+*/
+
+#ifndef __REGS_PCM_H
+#define __REGS_PCM_H
+
+/*Register Offsets */
+#define S3C64XX_PCM_CTL	(0x00)
+#define S3C64XX_PCM_CLKCTL	(0x04)
+#define S3C64XX_PCM_TXFIFO	(0x08)
+#define S3C64XX_PCM_RXFIFO	(0x0C)
+#define S3C64XX_PCM_IRQCTL	(0x10)
+#define S3C64XX_PCM_IRQSTAT	(0x14)
+#define S3C64XX_PCM_FIFOSTAT	(0x18)
+#define S3C64XX_PCM_CLRINT	(0x20)
+
+/* PCM_CTL Bit-Fields */
+#define S3C64XX_PCM_CTL_TXDIPSTICK_MASK		(0x3f)
+#define S3C64XX_PCM_CTL_TXDIPSTICK_SHIFT	(13)
+#define S3C64XX_PCM_CTL_RXDIPSTICK_MSK		(0x3f<<7)
+#define S3C64XX_PCM_CTL_TXDMA_EN		(0x1<<6)
+#define S3C64XX_PCM_CTL_RXDMA_EN		(0x1<<5)
+#define S3C64XX_PCM_CTL_TXMSB_AFTER_FSYNC	(0x1<<4)
+#define S3C64XX_PCM_CTL_RXMSB_AFTER_FSYNC	(0x1<<3)
+#define S3C64XX_PCM_CTL_TXFIFO_EN		(0x1<<2)
+#define S3C64XX_PCM_CTL_RXFIFO_EN		(0x1<<1)
+#define S3C64XX_PCM_CTL_ENABLE			(0x1<<0)
+
+/* PCM_CLKCTL Bit-Fields */
+#define S3C64XX_PCM_CLKCTL_SERCLK_EN		(0x1<<19)
+#define S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK	(0x1<<18)
+#define S3C64XX_PCM_CLKCTL_SCLKDIV_MASK		(0x1ff)
+#define S3C64XX_PCM_CLKCTL_SYNCDIV_MASK		(0x1ff)
+#define S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT	(9)
+#define S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT	(0)
+
+/* PCM_TXFIFO Bit-Fields */
+#define S3C64XX_PCM_TXFIFO_DVALID	(0x1<<16)
+#define S3C64XX_PCM_TXFIFO_DATA_MSK	(0xffff<<0)
+
+/* PCM_RXFIFO Bit-Fields */
+#define S3C64XX_PCM_RXFIFO_DVALID	(0x1<<16)
+#define S3C64XX_PCM_RXFIFO_DATA_MSK	(0xffff<<0)
+
+/* PCM_IRQCTL Bit-Fields */
+#define S3C64XX_PCM_IRQCTL_IRQEN		(0x1<<14)
+#define S3C64XX_PCM_IRQCTL_WRDEN		(0x1<<12)
+#define S3C64XX_PCM_IRQCTL_TXEMPTYEN		(0x1<<11)
+#define S3C64XX_PCM_IRQCTL_TXALMSTEMPTYEN	(0x1<<10)
+#define S3C64XX_PCM_IRQCTL_TXFULLEN		(0x1<<9)
+#define S3C64XX_PCM_IRQCTL_TXALMSTFULLEN	(0x1<<8)
+#define S3C64XX_PCM_IRQCTL_TXSTARVEN		(0x1<<7)
+#define S3C64XX_PCM_IRQCTL_TXERROVRFLEN		(0x1<<6)
+#define S3C64XX_PCM_IRQCTL_RXEMPTEN		(0x1<<5)
+#define S3C64XX_PCM_IRQCTL_RXALMSTEMPTEN	(0x1<<4)
+#define S3C64XX_PCM_IRQCTL_RXFULLEN		(0x1<<3)
+#define S3C64XX_PCM_IRQCTL_RXALMSTFULLEN	(0x1<<2)
+#define S3C64XX_PCM_IRQCTL_RXSTARVEN		(0x1<<1)
+#define S3C64XX_PCM_IRQCTL_RXERROVRFLEN		(0x1<<0)
+
+/* PCM_IRQSTAT Bit-Fields */
+#define S3C64XX_PCM_IRQSTAT_IRQPND		(0x1<<13)
+#define S3C64XX_PCM_IRQSTAT_WRD_XFER		(0x1<<12)
+#define S3C64XX_PCM_IRQSTAT_TXEMPTY		(0x1<<11)
+#define S3C64XX_PCM_IRQSTAT_TXALMSTEMPTY	(0x1<<10)
+#define S3C64XX_PCM_IRQSTAT_TXFULL		(0x1<<9)
+#define S3C64XX_PCM_IRQSTAT_TXALMSTFULL		(0x1<<8)
+#define S3C64XX_PCM_IRQSTAT_TXSTARV		(0x1<<7)
+#define S3C64XX_PCM_IRQSTAT_TXERROVRFL		(0x1<<6)
+#define S3C64XX_PCM_IRQSTAT_RXEMPT		(0x1<<5)
+#define S3C64XX_PCM_IRQSTAT_RXALMSTEMPT		(0x1<<4)
+#define S3C64XX_PCM_IRQSTAT_RXFULL		(0x1<<3)
+#define S3C64XX_PCM_IRQSTAT_RXALMSTFULL		(0x1<<2)
+#define S3C64XX_PCM_IRQSTAT_RXSTARV		(0x1<<1)
+#define S3C64XX_PCM_IRQSTAT_RXERROVRFL		(0x1<<0)
+
+/* PCM_FIFOSTAT Bit-Fields */
+#define S3C64XX_PCM_FIFOSTAT_TXCNT_MSK		(0x3f<<14)
+#define S3C64XX_PCM_FIFOSTAT_TXFIFOEMPTY	(0x1<<13)
+#define S3C64XX_PCM_FIFOSTAT_TXFIFOALMSTEMPTY	(0x1<<12)
+#define S3C64XX_PCM_FIFOSTAT_TXFIFOFULL		(0x1<<11)
+#define S3C64XX_PCM_FIFOSTAT_TXFIFOALMSTFULL	(0x1<<10)
+#define S3C64XX_PCM_FIFOSTAT_RXCNT_MSK		(0x3f<<4)
+#define S3C64XX_PCM_FIFOSTAT_RXFIFOEMPTY	(0x1<<3)
+#define S3C64XX_PCM_FIFOSTAT_RXFIFOALMSTEMPTY	(0x1<<2)
+#define S3C64XX_PCM_FIFOSTAT_RXFIFOFULL		(0x1<<1)
+#define S3C64XX_PCM_FIFOSTAT_RXFIFOALMSTFULL	(0x1<<0)
+
+#endif /* __REGS_PCM_H */
-- 
1.6.2.5
