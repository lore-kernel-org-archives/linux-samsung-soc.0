From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 11/11] USB: s3c-hsotg: Add support for external USB clock
Date: Wed,  7 Jul 2010 01:02:23 +0100
Message-ID: <1278460943-16224-12-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:34538 "EHLO ben-laptop"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754553Ab0GGL5s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 07:57:48 -0400
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>, Ben Dooks <ben-linux@fluff.org>

From: Maurus Cuelenaere <mcuelenaere@gmail.com>

The PLL that drives the USB clock supports 3 input clocks: 12, 24 and 48Mhz.
This patch adds support to the USB driver for setting the correct register bit
according to the given clock.

This depends on the following patch:
[PATCH] ARM: S3C64XX: Add USB external clock definition

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 825b6ca..a4e0b0f 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -2798,6 +2799,7 @@ static void __devinit s3c_hsotg_initep(struct s3c_hsotg *hsotg,
  */
 static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 {
+	struct clk *xusbxti;
 	u32 osc;
 
 	writel(0, S3C_PHYPWR);
@@ -2805,6 +2807,23 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 
 	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
 
+	xusbxti = clk_get(hsotg->dev, "xusbxti");
+	if (xusbxti && !IS_ERR(xusbxti)) {
+		switch (clk_get_rate(xusbxti)) {
+		case 12*MHZ:
+			osc |= S3C_PHYCLK_CLKSEL_12M;
+			break;
+		case 24*MHZ:
+			osc |= S3C_PHYCLK_CLKSEL_24M;
+			break;
+		default:
+		case 48*MHZ:
+			/* default reference clock */
+			break;
+		}
+		clk_put(xusbxti);
+	}
+
 	writel(osc | 0x10, S3C_PHYCLK);
 
 	/* issue a full set of resets to the otg and core */
-- 
1.7.0.4
