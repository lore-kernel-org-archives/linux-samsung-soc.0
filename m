From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for gpio-buttons
Date: Thu,  7 Feb 2013 10:45:25 +0530
Message-ID: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:56974 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750793Ab3BGFYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 00:24:54 -0500
Received: by mail-pa0-f47.google.com with SMTP id bj3so1183885pad.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 21:24:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Added GPIO buttons DT node to Arndale board file.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
This series is based on for-next branch of Kukjin Kim's tree
and added on top of the below patch:
https://patchwork.kernel.org/patch/2042451/
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   48 ++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 63572f9..9ce40df 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -119,4 +119,52 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		menu {
+			label = "SW-TACT2";
+			gpios = <&gpx1 4 0 0x10000 2>;
+			linux,code = <139>;
+			gpio-key,wakeup;
+		};
+
+		home {
+			label = "SW-TACT3";
+			gpios = <&gpx1 5 0 0x10000 2>;
+			linux,code = <102>;
+			gpio-key,wakeup;
+		};
+
+		up {
+			label = "SW-TACT4";
+			gpios = <&gpx1 6 0 0x10000 2>;
+			linux,code = <103>;
+			gpio-key,wakeup;
+		};
+
+		down {
+			label = "SW-TACT5";
+			gpios = <&gpx1 7 0 0x10000 2>;
+			linux,code = <108>;
+			gpio-key,wakeup;
+		};
+
+		back {
+			label = "SW-TACT6";
+			gpios = <&gpx2 0 0 0x10000 2>;
+			linux,code = <158>;
+			gpio-key,wakeup;
+		};
+
+		wakeup {
+			label = "SW-TACT7";
+			gpios = <&gpx2 1 0 0x10000 2>;
+			linux,code = <143>;
+			gpio-key,wakeup;
+		};
+	};
 };
-- 
1.7.4.1
