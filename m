From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add sound node for Snow board
Date: Thu, 24 Apr 2014 11:46:58 +0530
Message-ID: <1398320219-23362-2-git-send-email-tushar.behera@linaro.org>
References: <1398320219-23362-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:39481 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbaDXGSM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 02:18:12 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so1238265pdj.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 23:18:11 -0700 (PDT)
In-Reply-To: <1398320219-23362-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org

The audio codec on Snow board, MAX98095 is connected on I2C7 bus.
Also it requires the GPX1-7 line to be pulled up.

Updated Snow DTS file to incorporate above changes and added a
sound node to instantiate the I2S-based sound card.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1bc9b50..f63df3c 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -196,6 +196,38 @@
 		};
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		max98095-en-regulator {
+			compatible = "regulator-fixed";
+			gpio = <&gpx1 7 0>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+	};
+
+	i2c@12CD0000 {
+		max98095: codec@11 {
+			compatible = "maxim,max98095";
+			reg = <0x11>;
+		};
+	};
+
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "google,snow-audio-max98095";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98095>;
+	};
+
 	usb@12110000 {
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
-- 
1.7.9.5
