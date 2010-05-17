From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/2] USB: s3c_hsotg: Add support for external USB clock
Date: Mon, 17 May 2010 20:17:48 +0200
Message-ID: <4BF1884C.2050901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:43850 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752565Ab0EQSRv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 14:17:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The PLL that drives the USB clock supports 3 input clocks: 12, 24 and 48Mhz.
This patch adds support to the USB driver for setting the correct register bit
according to the given clock.

This depends on the following patch:
[PATCH] ARM: S3C64XX: Add USB external clock definition

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/usb/gadget/s3c-hsotg.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 1f73b48..dce9366 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -23,6 +23,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -2699,6 +2700,7 @@ static void __devinit s3c_hsotg_initep(struct s3c_hsotg *hsotg,
  */
 static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 {
+	struct clk *xusbxti;
 	u32 osc;
 
 	writel(0, S3C_PHYPWR);
@@ -2706,6 +2708,23 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 
 	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
 
+	xusbxti = clk_get(hsotg->dev, "xusbxti");
+	if (xusbxti && !IS_ERR(xusbxti)) {
+		switch (clk_get_rate(xusbxti)) {
+		case 12000000:
+		    osc |= S3C_PHYCLK_CLKSEL_12M;
+		    break;
+		case 24000000:
+		    osc |= S3C_PHYCLK_CLKSEL_24M;
+		    break;
+		default:
+		case 48000000:
+		    /* default reference clock */
+		    break;
+		}
+		clk_put(xusbxti);
+	}
+
 	writel(osc | 0x10, S3C_PHYCLK);
 
 	/* issue a full set of resets to the otg and core */
-- 
1.7.1
