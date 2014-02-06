From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: DTS: exynos5420: Rename hsi2c compatible to
 exynos5250-hsi2c
Date: Thu, 06 Feb 2014 17:37:57 +0530
Message-ID: <1391688477-8124-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

As per the changes submitted for the i2c-exynos5.c driver with the
compatible string being named after the first SoC it is observed on.
This patch modifes the existing hsi2c compatible strings in
arch/arm/boot/dts.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 11dd202..c5187d1 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -486,7 +486,7 @@
 	};
 
 	hsi2c_4: i2c@12CA0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CA0000 0x1000>;
 		interrupts = <0 60 0>;
 		#address-cells = <1>;
@@ -499,7 +499,7 @@
 	};
 
 	hsi2c_5: i2c@12CB0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CB0000 0x1000>;
 		interrupts = <0 61 0>;
 		#address-cells = <1>;
@@ -512,7 +512,7 @@
 	};
 
 	hsi2c_6: i2c@12CC0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CC0000 0x1000>;
 		interrupts = <0 62 0>;
 		#address-cells = <1>;
@@ -525,7 +525,7 @@
 	};
 
 	hsi2c_7: i2c@12CD0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CD0000 0x1000>;
 		interrupts = <0 63 0>;
 		#address-cells = <1>;
@@ -538,7 +538,7 @@
 	};
 
 	hsi2c_8: i2c@12E00000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E00000 0x1000>;
 		interrupts = <0 87 0>;
 		#address-cells = <1>;
@@ -551,7 +551,7 @@
 	};
 
 	hsi2c_9: i2c@12E10000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E10000 0x1000>;
 		interrupts = <0 88 0>;
 		#address-cells = <1>;
@@ -564,7 +564,7 @@
 	};
 
 	hsi2c_10: i2c@12E20000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E20000 0x1000>;
 		interrupts = <0 203 0>;
 		#address-cells = <1>;
-- 
1.7.9.5
