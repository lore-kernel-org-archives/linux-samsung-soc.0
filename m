From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 5/5] ARM: dts: exynos5250-arndale: Add HDMI HPD and regulator node
Date: Thu,  7 Feb 2013 10:45:29 +0530
Message-ID: <1360214129-4096-5-git-send-email-tushar.behera@linaro.org>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:64591 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903Ab3BGFZI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 00:25:08 -0500
Received: by mail-da0-f43.google.com with SMTP id u36so1016268dak.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 21:25:07 -0800 (PST)
In-Reply-To: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Added HDMI hot plug and regulator nodes to Arndale DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 6162a72..7b891a9 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -386,6 +386,13 @@
 		};
 	};
 
+	hdmi {
+		hpd-gpio = <&gpx3 7 0xf 1 3>;
+		vdd_osc-supply = <&ldo10_reg>;
+		vdd_pll-supply = <&ldo8_reg>;
+		vdd-supply = <&ldo8_reg>;
+	};
+
 	mmc_reg: voltage-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_33ON_2.8V";
@@ -394,4 +401,9 @@
 		gpio = <&gpx1 1 0 0 2>;
 		enable-active-high;
 	};
+
+	reg_hdmi_en: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi-en";
+	};
 };
-- 
1.7.4.1
