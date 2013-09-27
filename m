From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: dts: Add reg property to regulator nodes in exynos5250-arndale
Date: Fri, 27 Sep 2013 15:59:40 +0530
Message-ID: <1380277780-10903-3-git-send-email-sachin.kamat@linaro.org>
References: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:51358 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619Ab3I0K3y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 06:29:54 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so2419305pdi.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 03:29:53 -0700 (PDT)
In-Reply-To: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, sachin.kamat@linaro.org

For consistency and correctness, since this is a bus, even if not
physical, it is worth to add 'reg' property and unit-address to subnodes.
The 'reg' property would merely be an index. Also for consistency, use
"regulator" as node name as used most commonly across other dts files.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..0c42547 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -482,13 +482,15 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		main_dc_reg: fixedregulator@1 {
+		main_dc_reg: regulator@0 {
 			compatible = "regulator-fixed";
+			reg = <0>;
 			regulator-name = "MAIN_DC";
 		};
 
-		mmc_reg: voltage-regulator {
+		mmc_reg: regulator@1 {
 			compatible = "regulator-fixed";
+			reg = <1>;
 			regulator-name = "VDD_33ON_2.8V";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
@@ -496,8 +498,9 @@
 			enable-active-high;
 		};
 
-		reg_hdmi_en: fixedregulator@0 {
+		reg_hdmi_en: regulator@2 {
 			compatible = "regulator-fixed";
+			reg = <2>;
 			regulator-name = "hdmi-en";
 		};
 	};
-- 
1.7.9.5
