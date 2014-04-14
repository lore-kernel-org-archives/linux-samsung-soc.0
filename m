From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Mon, 14 Apr 2014 18:46:07 +0530
Message-ID: <1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:47529 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754259AbaDNNRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 09:17:06 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so8112779pdb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 06:17:06 -0700 (PDT)
In-Reply-To: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sachin.kamat@linaro.org, joshi@samsung.com, ajaykumar.rs@samsung.com

From: Doug Anderson <dianders@chromium.org>

Added nodes for ptn3460 driver to Snow board.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index a38fd18..52ae335 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -32,6 +32,13 @@
 			samsung,pin-drv = <0>;
 		};
 
+		ptn3460_gpios: ptn3460-gpios {
+			samsung,pins = "gpy2-5", "gpx1-5";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		sd3_clk: sd3-clk {
 			samsung,pin-drv = <0>;
 		};
@@ -324,4 +331,16 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	i2c_7: i2c@12CD0000 {
+		ptn3460-bridge@20 {
+			compatible = "nxp,ptn3460";
+			reg = <0x20>;
+			powerdown-gpio = <&gpy2 5 0>;
+			reset-gpio = <&gpx1 5 0>;
+			edid-emulation = <5>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ptn3460_gpios>;
+		};
+	};
 };
-- 
1.7.9.5
