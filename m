From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 1/7] ARM: dts: Change i2s compatible string on exynos5250
Date: Wed, 07 Aug 2013 14:40:10 +0530
Message-ID: <1375866616-5541-2-git-send-email-padma.v@samsung.com>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44916 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757330Ab3HGJIo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 05:08:44 -0400
In-reply-to: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

This patch removes quirks from i2s node and change the i2s
compatible names.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 48c0a88..5b36121 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -393,7 +393,7 @@
 	};
 
 	i2s0: i2s@03830000 {
-		compatible = "samsung,i2s-v5";
+		compatible = "samsung,s5pv210-i2s";
 		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
 			&pdma0 9
@@ -403,16 +403,13 @@
 			<&clock_audss EXYNOS_I2S_BUS>,
 			<&clock_audss EXYNOS_SCLK_I2S>;
 		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-		samsung,supports-6ch;
-		samsung,supports-rstclr;
-		samsung,supports-secdai;
 		samsung,idma-addr = <0x03000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s0_bus>;
 	};
 
 	i2s1: i2s@12D60000 {
-		compatible = "samsung,i2s-v5";
+		compatible = "samsung,s3c6410-i2s";
 		reg = <0x12D60000 0x100>;
 		dmas = <&pdma1 12
 			&pdma1 11>;
@@ -424,7 +421,7 @@
 	};
 
 	i2s2: i2s@12D70000 {
-		compatible = "samsung,i2s-v5";
+		compatible = "samsung,s3c6410-i2s";
 		reg = <0x12D70000 0x100>;
 		dmas = <&pdma0 12
 			&pdma0 11>;
-- 
1.7.4.4
