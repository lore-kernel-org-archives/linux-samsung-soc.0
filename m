From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add HDMI related I2C nodes for Arndale board
Date: Tue,  1 Oct 2013 10:01:01 +0530
Message-ID: <1380601861-4903-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:52615 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966Ab3JAEbT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Oct 2013 00:31:19 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr4so6496582pbb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2013 21:31:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Updated I2C nodes for HDMI-DDC and HDMI-PHY for Arndale board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..3a11fa0 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -324,7 +324,14 @@
 	};
 
 	i2c@12C80000 {
-		status = "disabled";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		samsung,i2c-slave-addr = <0x50>;
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
 	};
 
 	i2c@12C90000 {
@@ -362,6 +369,17 @@
 		status = "disabled";
 	};
 
+	i2c@12CE0000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		samsung,i2c-slave-addr = <0x38>;
+
+		hdmiphy@38 {
+			compatible = "samsung,exynos4212-hdmiphy";
+			reg = <0x38>;
+		};
+	};
+
 	i2c@121D0000 {
 		status = "disabled";
 	};
-- 
1.7.9.5
