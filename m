From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 1/6] USB: s3c_hsotg: Add support for external USB clock
Date: Tue, 25 May 2010 05:36:48 +0100
Message-ID: <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32872 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752310Ab0EYEhF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:37:05 -0400
In-Reply-To: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Ben Dooks <ben-linux@fluff.org>

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
1.6.3.3
