From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 3/8] ARM: dts: Change i2s compatible string on exynos5250
Date: Fri, 26 Jul 2013 19:06:47 +0530
Message-ID: <1374845812-7803-4-git-send-email-padma.v@samsung.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54607 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758605Ab3GZNev (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 09:34:51 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQJ007J8PPR45R0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Jul 2013 22:34:50 +0900 (KST)
In-reply-to: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com

This patch removes quirks from i2s node and change the i2s
compatible names.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index db2ca8b..f7fbedd 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -385,7 +385,7 @@
 	};
 
 	i2s0: i2s@03830000 {
-		compatible = "samsung,i2s-v5";
+		compatible = "samsung,s5pv210-i2s";
 		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
 			&pdma0 9
@@ -395,16 +395,13 @@
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
@@ -416,7 +413,7 @@
 	};
 
 	i2s2: i2s@12D70000 {
-		compatible = "samsung,i2s-v5";
+		compatible = "samsung,s3c6410-i2s";
 		reg = <0x12D70000 0x100>;
 		dmas = <&pdma0 12
 			&pdma0 11>;
-- 
1.7.4.4
