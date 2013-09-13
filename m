From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Fri, 13 Sep 2013 13:09:53 +0100
Message-ID: <1379074196-9834-1-git-send-email-broonie@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Rather than requiring each board to explicitly disable the I2S controllers
it is not using instead require boards to enable those that they are using.

This is required for audio operation on Arndale, one of the unused I2S
controllers is pinmuxed with the LDO enable GPIOs for the WM1811A.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  | 4 ++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 8 --------
 arch/arm/boot/dts/exynos5250.dtsi         | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..4687fa0 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -412,6 +412,10 @@
 		status = "disabled";
 	};
 
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
 	spi_0: spi@12d20000 {
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 2538b32..f86d567 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -231,14 +231,6 @@
 		status = "okay";
 	};
 
-	i2s1: i2s@12D60000 {
-		status = "disabled";
-	};
-
-	i2s2: i2s@12D70000 {
-		status = "disabled";
-	};
-
 	sound {
 		compatible = "samsung,smdk-wm8994";
 
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7d7cc77..c863113 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -417,6 +417,7 @@
 
 	i2s0: i2s@03830000 {
 		compatible = "samsung,s5pv210-i2s";
+		status = "disabled";
 		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
 			&pdma0 9
@@ -433,6 +434,7 @@
 
 	i2s1: i2s@12D60000 {
 		compatible = "samsung,s3c6410-i2s";
+		status = "disabled";
 		reg = <0x12D60000 0x100>;
 		dmas = <&pdma1 12
 			&pdma1 11>;
@@ -445,6 +447,7 @@
 
 	i2s2: i2s@12D70000 {
 		compatible = "samsung,s3c6410-i2s";
+		status = "disabled";
 		reg = <0x12D70000 0x100>;
 		dmas = <&pdma0 12
 			&pdma0 11>;
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
