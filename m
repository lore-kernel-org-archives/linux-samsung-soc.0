From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 4/4] ARM: dts: Add S5M8767 clock nodes on Arndale board
Date: Thu, 31 Oct 2013 12:18:44 +0530
Message-ID: <1383202124-1775-5-git-send-email-tushar.behera@linaro.org>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:58804 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753384Ab3JaGuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 02:50:23 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so2053872pab.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 23:50:22 -0700 (PDT)
In-Reply-To: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, lee.jones@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index b77a37e..34b305d 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -70,6 +70,13 @@
 			s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>,
 							<&gpx2 4 0>,
 							<&gpx2 5 0>;
+
+			s5m8767_osc: clocks {
+				#clock-cells = <1>;
+				clock-output-names = "s5m8767_ap",
+						"s5m8767_cp", "s5m8767_bt";
+			};
+
 			regulators {
 				ldo1_reg: LDO1 {
 					regulator-name = "VDD_ALIVE_1.0V";
-- 
1.7.9.5
