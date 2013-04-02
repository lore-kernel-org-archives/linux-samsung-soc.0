From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 7/7] ARM: dts: Add HDMI HPD and regulator node for Arndale board
Date: Tue,  2 Apr 2013 13:45:07 +0530
Message-ID: <1364890507-19261-8-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:57209 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761296Ab3DBI1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:27:15 -0400
Received: by mail-da0-f51.google.com with SMTP id g27so91270dan.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:27:14 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Added HDMI hot plug and regulator nodes to Arndale DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V3:
* Pin-control related modifications.

 arch/arm/boot/dts/exynos5250-arndale.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 5910df7..c4057ea 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -429,6 +429,13 @@
 		};
 	};
 
+	hdmi {
+		hpd-gpio = <&gpx3 7 2>;
+		vdd_osc-supply = <&ldo10_reg>;
+		vdd_pll-supply = <&ldo8_reg>;
+		vdd-supply = <&ldo8_reg>;
+	};
+
 	mmc_reg: voltage-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_33ON_2.8V";
@@ -437,4 +444,9 @@
 		gpio = <&gpx1 1 1>;
 		enable-active-high;
 	};
+
+	reg_hdmi_en: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi-en";
+	};
 };
-- 
1.7.9.5
