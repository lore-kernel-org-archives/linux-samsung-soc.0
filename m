From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v4 7/8] mfd: cros_ec: spi: Add a DT property to delay asserting the CS
Date: Tue,  2 Jun 2015 10:11:10 +0200
Message-ID: <1433232671-27679-8-git-send-email-javier.martinez@collabora.co.uk>
References: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433232671-27679-1-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gwendal Grignou <gwendal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some ECs need a little time for waking up before they can accept
SPI data at a high speed. Add a "google,cros-ec-spi-pre-delay"
property to the DT binding to configure this.

If this property isn't set, then no delay will be added. However,
if set it will cause a delay equal to the value passed to it to
be inserted at the beginning of a transaction.

Signed-off-by: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Changes since v3:
 - Split DT binding and driver change as suggested by Lee Jones.
 - Add tested-by tag from Heiko Stuebner
 - Add acked-by tag from Lee Jones.

Changes since v2: None

Changes since v1: None, new patch
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 8009c3d87f33..1777916e9e28 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -18,6 +18,10 @@ Required properties (SPI):
 - reg: SPI chip select
 
 Optional properties (SPI):
+- google,cros-ec-spi-pre-delay: Some implementations of the EC need a little
+  time to wake up from sleep before they can receive SPI transfers at a high
+  clock rate. This property specifies the delay, in usecs, between the
+  assertion of the CS to the start of the first clock pulse.
 - google,cros-ec-spi-msg-delay: Some implementations of the EC require some
   additional processing time in order to accept new transactions. If the delay
   between transactions is not long enough the EC may not be able to respond
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
