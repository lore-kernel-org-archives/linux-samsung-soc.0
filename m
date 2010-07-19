From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 11/11] USB: s3c-hsotg: Add support for external USB clock
Date: Mon, 19 Jul 2010 09:40:50 +0100
Message-ID: <1279528850-28245-12-git-send-email-ben-linux@fluff.org>
References: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1279528850-28245-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The PLL that drives the USB clock supports 3 input clocks: 12, 24 and 48Mhz.
This patch adds support to the USB driver for setting the correct register bit
according to the given clock.

This depends on the following patch:
[PATCH] ARM: S3C64XX: Add USB external clock definition

Signed-off-by: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
