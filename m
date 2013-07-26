From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos4210-origen: Add fixed voltage regulator to simple bus
Date: Fri, 26 Jul 2013 16:00:56 +0530
Message-ID: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:51238 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751983Ab3GZKrX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 06:47:23 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so1505732pad.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 03:47:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, kgene@kernel.org

This has been done for Arndale board vide commit aa3edb65
("ARM: dts: Put Arndale fixed voltage regulators on a simple-bus").
Replicate here for consistency and correctness.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 5537af8..ae2653e 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,13 +32,19 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
 	};
 
-	mmc_reg: voltage-regulator {
-	        compatible = "regulator-fixed";
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
 
 	tmu@100C0000 {
-- 
1.7.9.5
