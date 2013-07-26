From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 7/8] ARM: dts: wm8994: Add wm8994 support on smdk5420
Date: Fri, 26 Jul 2013 19:06:51 +0530
Message-ID: <1374845812-7803-8-git-send-email-padma.v@samsung.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54640 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758650Ab3GZNe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 09:34:58 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQJ007J8PPR45R0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Jul 2013 22:34:57 +0900 (KST)
In-reply-to: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com

This patch adds wm8994 codec node on i2c bus1 and the required
regulator supplies and properties on smdk5420 board.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   50 +++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index d05de7a..28a6855 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -68,4 +68,54 @@
 			bus-width = <4>;
 		};
 	};
+
+	vdd: fixed-regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	dbvdd: fixed-regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "dbvdd-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	spkvdd: fixed-regulator@2 {
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
+			AVDD2-supply = <&vdd>;
+			CPVDD-supply = <&vdd>;
+			DBVDD-supply = <&dbvdd>;
+			SPKVDD1-supply = <&spkvdd>;
+			SPKVDD2-supply = <&spkvdd>;
+		};
+	};
+
 };
-- 
1.7.4.4
