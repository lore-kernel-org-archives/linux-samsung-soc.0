From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: exynos: Fix drive strength of sd0_xxx pin
 definitions
Date: Wed, 18 Jan 2017 11:12:19 +0530
Message-ID: <1484718141-28785-2-git-send-email-pankaj.dubey@samsung.com>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118053953epcas1p18e06184783a0edc6a2cfc3b6a9d9ce31@epcas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1484718141-28785-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

As per Exynos7 datasheet FSYS1 pinctrl block does not support drive
strength value of 0x3. This patch fixes this and update the correct
drive strength for sd0_xxx pin definitions.

Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
index 8232198..7ebb939 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
@@ -497,49 +497,49 @@
 		samsung,pins = "gpr0-0";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <0>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_cmd: sd0-cmd {
 		samsung,pins = "gpr0-1";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_ds: sd0-ds {
 		samsung,pins = "gpr0-2";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <1>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_qrdy: sd0-qrdy {
 		samsung,pins = "gpr0-3";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <1>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus1: sd0-bus-width1 {
 		samsung,pins = "gpr1-0";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus4: sd0-bus-width4 {
 		samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd0_bus8: sd0-bus-width8 {
 		samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
 		samsung,pin-function = <2>;
 		samsung,pin-pud = <3>;
-		samsung,pin-drv = <3>;
+		samsung,pin-drv = <4>;
 	};
 
 	sd1_clk: sd1-clk {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
