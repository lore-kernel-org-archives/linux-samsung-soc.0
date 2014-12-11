From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] arm: dts: exynos5250: Remove vbus gpio property from usb
 2.0 host
Date: Thu, 11 Dec 2014 17:32:47 +0530
Message-ID: <1418299367-2412-5-git-send-email-gautam.vivek@samsung.com>
References: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1418299367-2412-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Now that we can use the VBUS regulator for USB 2.0 phy, we can
remove the vbus-gpio property from usb 2.0 host to avoid
duplicate gpio settings.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ----
 arch/arm/boot/dts/exynos5250-snow.dts     |    4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 85e74df..281b962 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -372,10 +372,6 @@
 		enable-active-high;
 	};
 
-	usb@12110000 {
-		samsung,vbus-gpio = <&gpx2 6 0>;
-	};
-
 	dp-controller@145B0000 {
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 8085750..ee966c3 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -296,10 +296,6 @@
 		enable-active-high;
 	};
 
-	usb@12110000 {
-		samsung,vbus-gpio = <&gpx1 1 0>;
-	};
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
