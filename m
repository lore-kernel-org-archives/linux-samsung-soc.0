From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 1/2] ARM: DT: Exynos5250: fix number of interrupt-cells in mct node
Date: Wed, 28 Aug 2013 18:12:47 +0530
Message-ID: <1377693768-16777-2-git-send-email-chander.kashyap@linaro.org>
References: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:43551 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab3H1MnF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:43:05 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so6211659pbc.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 05:43:05 -0700 (PDT)
In-Reply-To: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, t.figa@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Two cells were used to specify interrupts in mct node, while second cell
always remains unused. Hence use only one cell.
Suggested by Tomasz Figa.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..f2f178a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -102,23 +102,22 @@
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
 		interrupt-controller;
-		#interrups-cells = <2>;
+		#interrups-cells = <1>;
 		interrupt-parent = <&mct_map>;
-		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
-			     <4 0>, <5 0>;
+		interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
 		clocks = <&clock 1>, <&clock 335>;
 		clock-names = "fin_pll", "mct";
 
 		mct_map: mct-map {
-			#interrupt-cells = <2>;
+			#interrupt-cells = <1>;
 			#address-cells = <0>;
 			#size-cells = <0>;
-			interrupt-map = <0x0 0 &combiner 23 3>,
-					<0x1 0 &combiner 23 4>,
-					<0x2 0 &combiner 25 2>,
-					<0x3 0 &combiner 25 3>,
-					<0x4 0 &gic 0 120 0>,
-					<0x5 0 &gic 0 121 0>;
+			interrupt-map = <0 &combiner 23 3>,
+					<1 &combiner 23 4>,
+					<2 &combiner 25 2>,
+					<3 &combiner 25 3>,
+					<4 &gic 0 120 0>,
+					<5 &gic 0 121 0>;
 		};
 	};
 
-- 
1.7.9.5
