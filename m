From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add vmmc regulator node in exynos4412-origen.dts
Date: Thu, 17 Jan 2013 11:18:12 +0530
Message-ID: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:58542 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632Ab3AQF4s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 00:56:48 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so1252165pad.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jan 2013 21:56:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added vmmc regulator node in exynos4412-origen.dts file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index df880c4..fe70bc6 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -27,6 +27,15 @@
 		bootargs ="console=ttySAC2,115200";
 	};
 
+	mmc_reg: voltage-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VMEM_VDD_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpx1 1 0>;
+		enable-active-high;
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.4.1
