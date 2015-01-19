From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: DTS: Exynos: add 'dr_mode' property to hsotg devices
Date: Mon, 19 Jan 2015 15:32:45 +0100
Message-ID: <1421677965-30821-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

All currently supported boards use hsotg/dwc2 controller in device
('peripheral') mode, so add property which sets correct operation mode.
This patch fixes support in recent changes in dwc2 driver, which added
support for dual-role devices.

Suggested-by: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos3250-monk.dts           | 1 +
 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/s5pv210-aquila.dts            | 1 +
 arch/arm/boot/dts/s5pv210-goni.dts              | 1 +
 arch/arm/boot/dts/s5pv210-smdkv210.dts          | 1 +
 9 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 5e4a471faee1..683596844ef3 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -140,6 +140,7 @@
 &hsotg {
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index c7f4fab6dfd9..5121954579ad 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -131,6 +131,7 @@
 &hsotg {
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 720836205546..1c0c7be02616 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -91,6 +91,7 @@
 	hsotg@12480000 {
 		vusb_d-supply = <&vusb_reg>;
 		vusb_a-supply = <&vusbdac_reg>;
+		dr_mode = "peripheral";
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 01f7d3cfdd02..1d7643288569 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -71,6 +71,7 @@
 	hsotg@12480000 {
 		vusb_d-supply = <&ldo3_reg>;
 		vusb_a-supply = <&ldo8_reg>;
+		dr_mode = "peripheral";
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 4a11e84b036e..9329135342a6 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -401,6 +401,7 @@
 	};
 
 	hsotg@12480000 {
+		dr_mode = "peripheral";
 		status = "okay";
 		vusb_d-supply = <&ldo15_reg>;
 		vusb_a-supply = <&ldo12_reg>;
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 29231b452643..c81c4769411d 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -845,6 +845,7 @@
 	hsotg@12480000 {
 		vusb_d-supply = <&ldo15_reg>;
 		vusb_a-supply = <&ldo12_reg>;
+		dr_mode = "peripheral";
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/s5pv210-aquila.dts b/arch/arm/boot/dts/s5pv210-aquila.dts
index aa31b84a707a..f00cea7aca2f 100644
--- a/arch/arm/boot/dts/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/s5pv210-aquila.dts
@@ -355,6 +355,7 @@
 &hsotg {
 	vusb_a-supply = <&ldo3_reg>;
 	vusb_d-supply = <&ldo8_reg>;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/s5pv210-goni.dts b/arch/arm/boot/dts/s5pv210-goni.dts
index 6387c77a6f7b..a3d4643b202e 100644
--- a/arch/arm/boot/dts/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/s5pv210-goni.dts
@@ -333,6 +333,7 @@
 &hsotg {
 	vusb_a-supply = <&ldo3_reg>;
 	vusb_d-supply = <&ldo8_reg>;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index cb8521899ec8..da7d210df670 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -181,6 +181,7 @@
 };
 
 &hsotg {
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
