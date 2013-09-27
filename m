From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: exynos4412-origen: Add fixed voltage regulator to simple bus
Date: Fri, 27 Sep 2013 15:59:39 +0530
Message-ID: <1380277780-10903-2-git-send-email-sachin.kamat@linaro.org>
References: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:46663 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616Ab3I0K3v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 06:29:51 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so2387370pbc.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 03:29:51 -0700 (PDT)
In-Reply-To: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, sachin.kamat@linaro.org

This has been done for Arndale board vide commit aa3edb65
("ARM: dts: Put Arndale fixed voltage regulators on a simple-bus").
Replicate here for consistency and correctness.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on Kukjin's for-next branch.
Changes since v1:
* Added reg property and renamed the node
---
 arch/arm/boot/dts/exynos4412-origen.dts |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 923bcd7..9520155 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -32,13 +32,20 @@
 		reg = <0x0203F000 0x1000>;
 	};
 
-	mmc_reg: voltage-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VMEM_VDD_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&gpx1 1 0>;
-		enable-active-high;
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mmc_reg: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "VMEM_VDD_2.8V";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpx1 1 0>;
+			enable-active-high;
+		};
 	};
 
 	pinctrl@11000000 {
-- 
1.7.9.5
