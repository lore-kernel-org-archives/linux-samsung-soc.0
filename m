From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 7/7] ARM: dts: Add pin state information for DP HPD support to Exynos5420
Date: Tue, 30 Jul 2013 16:49:38 +0530
Message-ID: <1375183178-8201-8-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:62852 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab3G3LUc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:32 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so632926pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:31 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Add pin state information for DP HPD support that requires pin configuration
support using pinctrl interface.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 5848c42..e695aba 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -59,6 +59,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		dp_hpd: dp_hpd {
+			samsung,pins = "gpx0-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samaung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@13410000 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 80aa3d4..123e523 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -32,6 +32,8 @@
 	};
 
 	dp-controller@145b0000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hpd>;
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
 		samsung,ycbcr-coeff = <0>;
-- 
1.7.9.5
