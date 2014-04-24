From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add sound node for Peach-pit board
Date: Thu, 24 Apr 2014 11:46:59 +0530
Message-ID: <1398320219-23362-3-git-send-email-tushar.behera@linaro.org>
References: <1398320219-23362-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:57324 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbaDXGSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 02:18:14 -0400
Received: by mail-pd0-f176.google.com with SMTP id r10so1586853pdi.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 23:18:14 -0700 (PDT)
In-Reply-To: <1398320219-23362-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org

The audio setup on Peach-pit board is similar to Snow board, hence the
sound-card driver used on Snow board can be reused on Peach-pit board.

Peach-pit board uses MAX98090 audio codec.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index fbb0469..1043bd3 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -37,6 +37,13 @@
 	};
 
 	pinctrl@13400000 {
+		max98090_irq: max98090-irq {
+			samsung,pins = "gpx0-2";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		tpm_irq: tpm-irq {
 			samsung,pins = "gpx1-0";
 			samsung,pin-function = <0>;
@@ -143,6 +150,19 @@
 		};
 	};
 
+	i2c@12CD0000 {
+		status = "okay";
+
+		max98090: codec@10 {
+			compatible = "maxim,max98090";
+			reg = <0x10>;
+			interrupts = <2 0>;
+			interrupt-parent = <&gpx0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&max98090_irq>;
+		};
+	};
+
 	spi@12d30000 {
 		status = "okay";
 		samsung,spi-src-clk = <0>;
@@ -179,4 +199,15 @@
 	watchdog@101D0000 {
 		timeout-sec = <32>;
 	};
+
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "google,snow-audio-max98090";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98090>;
+	};
 };
-- 
1.7.9.5
