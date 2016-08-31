From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: exynos: Add missing unit name to memory nodes in Exynos4 DTS
Date: Wed, 31 Aug 2016 14:14:38 +0200
Message-ID: <1472645679-5696-7-git-send-email-javier@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472645679-5696-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the following DTC warnings:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---

 arch/arm/boot/dts/exynos4210-origen.dts         | 2 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts       | 2 +-
 arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 +-
 arch/arm/boot/dts/exynos4412-odroidx2.dts       | 2 +-
 arch/arm/boot/dts/exynos4412-origen.dts         | 2 +-
 arch/arm/boot/dts/exynos4412-smdk4412.dts       | 2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts       | 2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts         | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 6b2c41a87a3e..a2c6a13fe67b 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -24,7 +24,7 @@
 	model = "Insignal Origen evaluation board based on Exynos4210";
 	compatible = "insignal,origen", "samsung,exynos4210", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x10000000
 		       0x50000000 0x10000000
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 3c759baeadcc..af6ef3e6214d 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -23,7 +23,7 @@
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
 	compatible = "samsung,smdkv310", "samsung,exynos4210", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 5f7ddb0627fb..0ca1b4d355f2 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -20,7 +20,7 @@
 	model = "Samsung Trats based on Exynos4210";
 	compatible = "samsung,trats", "samsung,exynos4210", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x10000000
 			0x50000000 0x10000000
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 30d938e17c9f..f1172be318cd 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -20,7 +20,7 @@
 	model = "Samsung Universal C210 based on Exynos4210 rev0";
 	compatible = "samsung,universal_c210", "samsung,exynos4210", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x10000000
 			0x50000000 0x10000000>;
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index cc1b87e09534..99634c54dca9 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -18,7 +18,7 @@
 	model = "Hardkernel ODROID-U3 board based on Exynos4412";
 	compatible = "hardkernel,odroid-u3", "samsung,exynos4412", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7FF00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 518ca57837be..d0a07673ae8b 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -18,7 +18,7 @@
 	model = "Hardkernel ODROID-X board based on Exynos4412";
 	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x3FF00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx2.dts b/arch/arm/boot/dts/exynos4412-odroidx2.dts
index 92cdeea1cfb3..4d228858f172 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx2.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx2.dts
@@ -17,7 +17,7 @@
 	model = "Hardkernel ODROID-X2 board based on Exynos4412";
 	compatible = "hardkernel,odroid-x2", "samsung,exynos4412", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7FF00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 9156a35a6117..54a9f6906ed2 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -22,7 +22,7 @@
 	model = "Insignal Origen evaluation board based on Exynos4412";
 	compatible = "insignal,origen4412", "samsung,exynos4412", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 2e868c4c307e..2e208d84ff6a 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -20,7 +20,7 @@
 	model = "Samsung SMDK evaluation board based on Exynos4412";
 	compatible = "samsung,smdk4412", "samsung,exynos4412", "samsung,exynos4";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index ad60f3840e24..5504398e6e37 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -23,7 +23,7 @@
 		stdout-path = &serial_0;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index e1380bae8ee3..41ecd6d465a7 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -30,7 +30,7 @@
 		i2c12 = &i2c_max77693_fuel;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x40000000>;
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
