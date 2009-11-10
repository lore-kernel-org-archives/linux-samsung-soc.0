From: Ben Dooks <ben@simtec.co.uk>
Subject: [patch 3/3] S3C24XX: Add documentation for arch/arm/plat-s3c24xx/include/plat/mci.h
Date: Tue, 10 Nov 2009 23:07:29 +0000
Message-ID: <20091110230749.243409268@fluff.org.uk>
References: <20091110230726.129283187@fluff.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:39470 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758405AbZKJXHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 18:07:44 -0500
Content-Disposition: inline; filename=simtec/ready/sdmmc-add-documentation.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Simtec Linux Team <linux@simtec.co.uk>

Add documentation for the platform data structure in the SD/MMC driver
header file arch/arm/plat-s3c24xx/include/plat/mci.h.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 arch/arm/plat-s3c24xx/include/plat/mci.h |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: b/arch/arm/plat-s3c24xx/include/plat/mci.h
===================================================================
--- a/arch/arm/plat-s3c24xx/include/plat/mci.h	2009-11-03 14:03:24.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/include/plat/mci.h	2009-11-03 14:13:50.000000000 +0000
@@ -1,6 +1,31 @@
 #ifndef _ARCH_MCI_H
 #define _ARCH_MCI_H
 
+/**
+ * struct s3c24xx_mci_pdata - sd/mmc controller platform data
+ * @no_wprotect: Set this to indicate there is no write-protect switch.
+ * @no_detect: Set this if there is no detect switch.
+ * @wprotect_invert: Invert the default sense of the write protect switch.
+ * @detect_invert: Invert the default sense of the write protect switch.
+ * @use_dma: Set to allow the use of DMA.
+ * @gpio_detect: GPIO number for the card detect line.
+ * @gpio_wprotect: GPIO number for the write protect line.
+ * @ocr_avail: The mask of the available power states, non-zero to use.
+ * @set_power: Callback to control the power mode.
+ *
+ * The @gpio_detect is used for card detection when @no_wprotect is unset,
+ * and the default sense is that 0 returned from gpio_get_value() means
+ * that a card is inserted. If @detect_invert is set, then the value from
+ * gpio_get_value() is inverted, which makes 1 mean card inserted.
+ *
+ * The driver will use @gpio_wprotect to signal whether the card is write
+ * protected if @no_wprotect is not set. A 0 returned from gpio_get_value()
+ * means the card is read/write, and 1 means read-only. The @wprotect_invert
+ * will invert the value returned from gpio_get_value().
+ *
+ * Card power is set by @ocr_availa, using MCC_VDD_ constants if it is set
+ * to a non-zero value, otherwise the default of 3.2-3.4V is used.
+ */
 struct s3c24xx_mci_pdata {
 	unsigned int	no_wprotect : 1;
 	unsigned int	no_detect : 1;
