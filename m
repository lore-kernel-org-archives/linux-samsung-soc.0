From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 3/7] ARM: dts: Add i2c bus 1 and it's audio codec child node on
 smdk5420
Date: Wed, 07 Aug 2013 14:20:37 +0530
Message-ID: <1375865442-5323-6-git-send-email-padma.v@samsung.com>
References: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10521 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757240Ab3HGItc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 04:49:32 -0400
In-reply-to: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

This patch adds i2c bus 1 and wm8994 codec node on i2c bus1 and the
required regulator supplies and properties on smdk5420 board.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   58 +++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index d05de7a..e86c1ae 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -68,4 +68,62 @@
 			bus-width = <4>;
 		};
 	};
+
+	avdd2: fixed-regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd2-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	cpvdd: fixed-regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cpvdd-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	dbvdd: fixed-regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "dbvdd-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	spkvdd: fixed-regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "spkvdd-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	i2c@12C70000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+
+		eeprom@51 {
+			compatible = "samsung,s524ad0xd1";
+			reg = <0x51>;
+		};
+
+		wm8994: wm8994@1a {
+			compatible = "wlf,wm8994";
+			reg = <0x1a>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			AVDD2-supply = <&avdd2>;
+			CPVDD-supply = <&cpvdd>;
+			DBVDD-supply = <&dbvdd>;
+			SPKVDD1-supply = <&spkvdd>;
+			SPKVDD2-supply = <&spkvdd>;
+		};
+	};
+
 };
-- 
1.7.4.4
