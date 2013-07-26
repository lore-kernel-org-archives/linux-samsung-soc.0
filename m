From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: exynos4412-origen: Add fixed voltage regulator to simple bus
Date: Fri, 26 Jul 2013 16:00:57 +0530
Message-ID: <1374834657-29088-2-git-send-email-sachin.kamat@linaro.org>
References: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:45440 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751983Ab3GZKr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 06:47:26 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx1so2855677pab.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 03:47:25 -0700 (PDT)
In-Reply-To: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, kgene@kernel.org

This has been done for Arndale board vide commit aa3edb65
("ARM: dts: Put Arndale fixed voltage regulators on a simple-bus").
Replicate here for consistency and correctness.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 829fd1fb..cf4cdf2 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -27,13 +27,19 @@
 		bootargs ="console=ttySAC2,115200";
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
+		mmc_reg: voltage-regulator {
+			compatible = "regulator-fixed";
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
