From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: dts: exynos5250-snow: add pinctrl for i2c-arbitrator
Date: Mon, 14 Apr 2014 18:46:04 +0530
Message-ID: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:60770 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbaDNNQ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 09:16:57 -0400
Received: by mail-pb0-f50.google.com with SMTP id md12so8197041pbc.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 06:16:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sachin.kamat@linaro.org, joshi@samsung.com, ajaykumar.rs@samsung.com

From: Doug Anderson <dianders@chromium.org>

Added i2c-arbitrator pinctrl node to Snow board.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1ce1088..32715b3 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -39,6 +39,22 @@
 		};
 	};
 
+	pinctrl@13400000 {
+		arb_their_claim: arb-their-claim {
+			samsung,pins = "gpe0-4";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		arb_our_claim: arb-our-claim {
+			samsung,pins = "gpf0-3";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -65,6 +81,9 @@
 		wait-retry-us = <3000>;
 		wait-free-us = <50000>;
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&arb_our_claim &arb_their_claim>;
+
 		/* Use ID 104 as a hint that we're on physical bus 4 */
 		i2c_104: i2c@0 {
 			reg = <0>;
-- 
1.7.9.5
