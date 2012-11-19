From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 1/5] ARM: dts: exynos4210-trats: Update for pinctrl-samsung
 driver
Date: Mon, 19 Nov 2012 15:45:25 +0100
Message-ID: <1353336329-20818-2-git-send-email-t.figa@samsung.com>
References: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20683 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOpp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:45:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ004GPP088SI0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:44 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009O9OZWSZ80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:44 +0900 (KST)
In-reply-to: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch updates all parts of Trats dts related to pin configuration
to use new GPIO and pinctrl bindings, instead of (now unsupported on
Exynos4) legacy gpio-samsung bindings.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index a21511c..661854b 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -35,7 +35,7 @@
 		regulator-name = "VMEM_VDD_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 1 0 0>;
+		gpio = <&gpk0 2 0>;
 		enable-active-high;
 	};
 
@@ -43,16 +43,8 @@
 		bus-width = <8>;
 		non-removable;
 		broken-voltage;
-		gpios = <&gpk0 0 2 0 3>,
-			<&gpk0 1 2 0 3>,
-			<&gpk0 3 2 2 3>,
-			<&gpk0 4 2 2 3>,
-			<&gpk0 5 2 2 3>,
-			<&gpk0 6 2 2 3>,
-			<&gpk1 3 3 3 3>,
-			<&gpk1 4 3 3 3>,
-			<&gpk1 5 3 3 3>,
-			<&gpk1 6 3 3 3>;
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
+		pinctrl-names = "default";
 		vmmc-supply = <&vemmc_reg>;
 		status = "okay";
 	};
@@ -77,8 +69,8 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
 		samsung,i2c-max-bus-freq = <100000>;
-		gpios = <&gpb 6 3 3 0>,
-			<&gpb 7 3 3 0>;
+		pinctrl-0 = <&i2c5_bus>;
+		pinctrl-names = "default";
 		status = "okay";
 
 		max8997_pmic@66 {
@@ -93,9 +85,9 @@
 			max8997,pmic-ignore-gpiodvs-side-effect;
 			max8997,pmic-buck125-default-dvs-idx = <0>;
 
-			max8997,pmic-buck125-dvs-gpios = <&gpx0 5 1 0 0>,
-						         <&gpx0 6 1 0 0>,
-							 <&gpl0 0 1 0 0>;
+			max8997,pmic-buck125-dvs-gpios = <&gpx0 5 0>,
+						         <&gpx0 6 0>,
+							 <&gpl0 0 0>;
 
 			max8997,pmic-buck1-dvs-voltage = <1350000>, <1300000>,
 							 <1250000>, <1200000>,
-- 
1.8.0
