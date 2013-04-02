From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 1/7] ARM: dts: Add pin-control related changes for Arndale board
Date: Tue,  2 Apr 2013 13:45:01 +0530
Message-ID: <1364890507-19261-2-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:60151 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234Ab3DBI0v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:26:51 -0400
Received: by mail-da0-f47.google.com with SMTP id s35so91783dak.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:26:51 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
This is a new patch in the patch-set.

 arch/arm/boot/dts/exynos5250-arndale.dts |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 5de019c..7e7a61e 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -69,15 +69,12 @@
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
 
 		slot@0 {
 			reg = <0>;
 			bus-width = <8>;
-			gpios = <&gpc0 0 2 0 3>, <&gpc0 1 2 0 3>,
-				<&gpc0 3 2 3 3>, <&gpc0 4 2 3 3>,
-				<&gpc0 5 2 3 3>, <&gpc0 6 2 3 3>,
-				<&gpc1 0 2 3 3>, <&gpc1 1 2 3 3>,
-				<&gpc1 2 2 3 3>, <&gpc1 3 2 3 3>;
 		};
 	};
 
@@ -93,14 +90,12 @@
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 
 		slot@0 {
 			reg = <0>;
 			bus-width = <4>;
-			samsung,cd-pinmux-gpio = <&gpc3 2 2 3 3>;
-			gpios = <&gpc3 0 2 0 3>, <&gpc3 1 2 0 3>,
-				<&gpc3 3 2 3 3>, <&gpc3 4 2 3 3>,
-				<&gpc3 5 2 3 3>, <&gpc3 6 2 3 3>;
 		};
 	};
 
-- 
1.7.9.5
