From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] arm64: dts: exynos: Remove address node from usb parent node
Date: Wed, 18 Jan 2017 11:16:48 +0530
Message-ID: <1484718408-28933-1-git-send-email-pankaj.dubey@samsung.com>
References: <CGME20170118054410epcas1p4df5c5631e0b13081662eb8fff5e383b3@epcas1p4.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Address node does not required to be put after parent't node,
so remove address node from usb parent node.

Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 68f764e..0d7a55d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1285,7 +1285,7 @@
 			status = "disabled";
 		};
 
-		usbdrd30: usb@15400000  {
+		usbdrd30: usb3-0 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>;
@@ -1332,7 +1332,7 @@
 			status = "disabled";
 		};
 
-		usbhost30: usb@15a00000 {
+		usbhost30: usbhost3-0 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
