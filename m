From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC PATCH 14/16] ARM: dts: exynos4210: Remove legacy gpio nodes
Date: Fri, 28 Sep 2012 16:28:45 +0200
Message-ID: <1348842527-22460-15-git-send-email-t.figa@samsung.com>
References: <1348842527-22460-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16752 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757673Ab2I1OaN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 10:30:13 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB2009Y9DKZWD10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 23:30:12 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB200E7BDK3XB70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 23:30:11 +0900 (KST)
In-reply-to: <1348842527-22460-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch removes the legacy gpio nodes as the gpio driver is going to
be replaced with the new pinctrl driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 229 --------------------------------------
 1 file changed, 229 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index a4bd0c9..ecbc707 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -250,233 +250,4 @@
 			interrupts = <0 36 0>;
 		};
 	};
-
-	gpio-controllers {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		gpio-controller;
-		ranges;
-
-		gpa0: gpio-controller@11400000 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400000 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpa1: gpio-controller@11400020 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400020 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpb: gpio-controller@11400040 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400040 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpc0: gpio-controller@11400060 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400060 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpc1: gpio-controller@11400080 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400080 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpd0: gpio-controller@114000A0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114000A0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpd1: gpio-controller@114000C0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114000C0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpe0: gpio-controller@114000E0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114000E0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpe1: gpio-controller@11400100 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400100 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpe2: gpio-controller@11400120 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400120 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpe3: gpio-controller@11400140 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400140 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpe4: gpio-controller@11400160 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400160 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpf0: gpio-controller@11400180 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11400180 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpf1: gpio-controller@114001A0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114001A0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpf2: gpio-controller@114001C0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114001C0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpf3: gpio-controller@114001E0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x114001E0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpj0: gpio-controller@11000000 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000000 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpj1: gpio-controller@11000020 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000020 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpk0: gpio-controller@11000040 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000040 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpk1: gpio-controller@11000060 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000060 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpk2: gpio-controller@11000080 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000080 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpk3: gpio-controller@110000A0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110000A0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpl0: gpio-controller@110000C0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110000C0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpl1: gpio-controller@110000E0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110000E0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpl2: gpio-controller@11000100 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000100 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy0: gpio-controller@11000120 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000120 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy1: gpio-controller@11000140 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000140 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy2: gpio-controller@11000160 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000160 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy3: gpio-controller@11000180 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000180 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy4: gpio-controller@110001A0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110001A0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy5: gpio-controller@110001C0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110001C0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpy6: gpio-controller@110001E0 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x110001E0 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpx0: gpio-controller@11000C00 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000C00 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpx1: gpio-controller@11000C20 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000C20 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpx2: gpio-controller@11000C40 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000C40 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpx3: gpio-controller@11000C60 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x11000C60 0x20>;
-			#gpio-cells = <4>;
-		};
-
-		gpz: gpio-controller@03860000 {
-			compatible = "samsung,exynos4-gpio";
-			reg = <0x03860000 0x20>;
-			#gpio-cells = <4>;
-		};
-	};
 };
-- 
1.7.12
