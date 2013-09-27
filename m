From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: exynos4210-origen: Add fixed voltage regulator to simple bus
Date: Fri, 27 Sep 2013 15:59:38 +0530
Message-ID: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:60813 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab3I0K3t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 06:29:49 -0400
Received: by mail-pb0-f41.google.com with SMTP id rp2so2397875pbb.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 03:29:48 -0700 (PDT)
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

 arch/arm/boot/dts/exynos4210-origen.dts |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 6906e8a..a6d9c32 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,13 +32,20 @@
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
 
 	tmu@100C0000 {
-- 
1.7.9.5
