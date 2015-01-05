From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH 3/3] ARM: dts: Add sound nodes for
 exynos4412-trats2
Date: Mon, 05 Jan 2015 20:25:17 +0900
Message-ID: <1420457117-11030-4-git-send-email-ideal.song@samsung.com>
References: <1420457117-11030-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18397 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753221AbbAELZl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 06:25:41 -0500
In-reply-to: <1420457117-11030-1-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, s.nawrocki@samsung.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch add WM1811 audio codec, I2S interface and the sound
machine nodes to enable audio on exynos4412-trats2 board.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 29231b4..2943ce7 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -203,6 +203,23 @@
 		};
 	};
 
+	i2c@138A0000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-slave-addr = <0x10>;
+		samsung,i2c-max-bus-freq = <100000>;
+		pinctrl-0 = <&i2c4_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		wm1811: wm1811@1a {
+			compatible = "wlf,wm1811";
+			reg = <0x1a>;
+			DCVDD-supply = <&ldo3_reg>;
+			DBVDD1-supply = <&ldo3_reg>;
+			wlf,ldo1ena = <&gpj0 4 0>;
+		};
+	};
+
 	i2c@138D0000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
@@ -838,6 +855,27 @@
 		};
 	};
 
+	i2s0: i2s@03830000 {
+		pinctrl-0 = <&i2s0_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	sound {
+		compatible = "samsung,trats2-audio";
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
+		assigned-clocks = <&pmu_system_controller 0>;
+		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
+		samsung,i2s-controller = <&i2s0>;
+		samsung,model = "wm1811";
+		samsung,audio-routing =
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP";
+	};
+
 	exynos-usbphy@125B0000 {
 		status = "okay";
 	};
-- 
2.0.0.390.gcb682f8
