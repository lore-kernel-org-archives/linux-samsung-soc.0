From: Ben Gamari <ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>
Subject: [PATCH] usb/misc/usb3503: Always read refclk frequency from DT
Date: Wed, 18 Mar 2015 14:37:45 -0400
Message-ID: <1426703865-31868-2-git-send-email-ben@smart-cactus.org>
References: <1426703865-31868-1-git-send-email-ben@smart-cactus.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426703865-31868-1-git-send-email-ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: afaerber-l3A5Bk7waGM@public.gmane.org, Ben Gamari <ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is necessary to set REF_SEL appropriately in uses where refclk is
always available.

Signed-off-by: Ben Gamari <ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>
Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/misc/usb3503.c | 47 +++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 258d2f5..64ff5b9 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -186,8 +186,31 @@ static int usb3503_probe(struct usb3503 *hub)
 		hub->mode		= pdata->initial_mode;
 	} else if (np) {
 		struct clk *clk;
+		u32 rate = 0;
 		hub->port_off_mask = 0;
 
+		if (!of_property_read_u32(np, "refclk-frequency", &rate)) {
+			switch (rate) {
+			case 38400000:
+			case 26000000:
+			case 19200000:
+			case 12000000:
+				hub->secondary_ref_clk = 0;
+				break;
+			case 24000000:
+			case 27000000:
+			case 25000000:
+			case 50000000:
+				hub->secondary_ref_clk = 1;
+				break;
+			default:
+				dev_err(dev,
+					"unsupported reference clock rate (%d)\n",
+					(int) rate);
+				return -EINVAL;
+			}
+		}
+
 		clk = devm_clk_get(dev, "refclk");
 		if (IS_ERR(clk) && PTR_ERR(clk) != -ENOENT) {
 			dev_err(dev, "unable to request refclk (%ld)\n",
@@ -196,31 +219,9 @@ static int usb3503_probe(struct usb3503 *hub)
 		}
 
 		if (!IS_ERR(clk)) {
-			u32 rate = 0;
 			hub->clk = clk;
 
-			if (!of_property_read_u32(np, "refclk-frequency",
-						 &rate)) {
-
-				switch (rate) {
-				case 38400000:
-				case 26000000:
-				case 19200000:
-				case 12000000:
-					hub->secondary_ref_clk = 0;
-					break;
-				case 24000000:
-				case 27000000:
-				case 25000000:
-				case 50000000:
-					hub->secondary_ref_clk = 1;
-					break;
-				default:
-					dev_err(dev,
-						"unsupported reference clock rate (%d)\n",
-						(int) rate);
-					return -EINVAL;
-				}
+			if (rate != 0) {
 				err = clk_set_rate(hub->clk, rate);
 				if (err) {
 					dev_err(dev,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
