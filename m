From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 3/7] ARM: dts: Add gpio-button entries for Arndale board
Date: Tue,  2 Apr 2013 13:45:03 +0530
Message-ID: <1364890507-19261-4-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:54756 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760798Ab3DBI1A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:27:00 -0400
Received: by mail-pd0-f182.google.com with SMTP id 3so112618pdj.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:26:59 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Added GPIO buttons DT node to Arndale board file.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Changes for V3:
* Removed redundant #address-cells and #size-cells
* Pin-control related modifications.


 arch/arm/boot/dts/exynos5250-arndale.dts |   46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d07a21f..03c9ad5 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -122,4 +122,50 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		menu {
+			label = "SW-TACT2";
+			gpios = <&gpx1 4 1>;
+			linux,code = <139>;
+			gpio-key,wakeup;
+		};
+
+		home {
+			label = "SW-TACT3";
+			gpios = <&gpx1 5 1>;
+			linux,code = <102>;
+			gpio-key,wakeup;
+		};
+
+		up {
+			label = "SW-TACT4";
+			gpios = <&gpx1 6 1>;
+			linux,code = <103>;
+			gpio-key,wakeup;
+		};
+
+		down {
+			label = "SW-TACT5";
+			gpios = <&gpx1 7 1>;
+			linux,code = <108>;
+			gpio-key,wakeup;
+		};
+
+		back {
+			label = "SW-TACT6";
+			gpios = <&gpx2 0 1>;
+			linux,code = <158>;
+			gpio-key,wakeup;
+		};
+
+		wakeup {
+			label = "SW-TACT7";
+			gpios = <&gpx2 1 1>;
+			linux,code = <143>;
+			gpio-key,wakeup;
+		};
+	};
 };
-- 
1.7.9.5
