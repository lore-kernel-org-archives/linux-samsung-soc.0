From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/4] Doc/devicetree: bindings: Update bindings information for
 USB3.0 DRD PHY
Date: Thu, 11 Dec 2014 17:32:44 +0530
Message-ID: <1418299367-2412-2-git-send-email-gautam.vivek@samsung.com>
References: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1418299367-2412-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing VBUS-supply information and consumer usage information for
USB 3.0 DRD PHY.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/samsung-phy.txt |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index d5bad92..0090ad1 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -148,6 +148,9 @@ Required properties:
 		      control pmu registers for power isolation.
 - #phy-cells : from the generic PHY bindings, must be 1;
 
+Optional properties:
+- vbus-supply : Reference to regulator node which supplies VBUS on the PHY.
+
 For "samsung,exynos5250-usbdrd-phy" and "samsung,exynos5420-usbdrd-phy"
 compatible PHYs, the second cell in the PHY specifier identifies the
 PHY id, which is interpreted as follows:
@@ -164,6 +167,12 @@ Example:
 		#phy-cells = <1>;
 	};
 
+Then the PHY can be used in other nodes such as:
+	phy-consumer@12340000 {
+		phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
 - aliases: For SoCs like Exynos5420 having multiple USB 3.0 DRD PHY controllers,
 	   'usbdrd_phy' nodes should have numbered alias in the aliases node,
 	   in the form of usbdrdphyN, N = 0, 1... (depending on number of
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
