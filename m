From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 12/23] ohci-s3c2410: use HUB_CHAR_*
Date: Mon, 19 Jan 2015 01:44:12 +0300
Message-ID: <2189806.lsQmK0PScD@wasted.cogentembedded.com>
References: <4018572.5hhhepRR0W@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4018572.5hhhepRR0W-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix  using the  bare numbers to set the 'wHubCharacteristics' field of the Hub
Descriptor while the values are #define'd in <linux/usb/ch11.h>.

While at it, stop setting already set HUB_CHAR_INDV_PORT_LPSM once again.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/usb/host/ohci-s3c2410.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: usb/drivers/usb/host/ohci-s3c2410.c
===================================================================
--- usb.orig/drivers/usb/host/ohci-s3c2410.c
+++ usb/drivers/usb/host/ohci-s3c2410.c
@@ -249,14 +249,14 @@ static int ohci_s3c2410_hub_control(
 		 */
 
 		desc->wHubCharacteristics &= ~cpu_to_le16(HUB_CHAR_LPSM);
-		desc->wHubCharacteristics |= cpu_to_le16(0x0001);
+		desc->wHubCharacteristics |= cpu_to_le16(
+			HUB_CHAR_INDV_PORT_LPSM);
 
 		if (info->enable_oc) {
 			desc->wHubCharacteristics &= ~cpu_to_le16(
 				HUB_CHAR_OCPM);
 			desc->wHubCharacteristics |=  cpu_to_le16(
-				0x0008 |
-				0x0001);
+				HUB_CHAR_INDV_PORT_OCPM);
 		}
 
 		dev_dbg(hcd->self.controller, "wHubCharacteristics after 0x%04x\n",

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
