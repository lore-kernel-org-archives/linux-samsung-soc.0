From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ARM: dts: wm8994: Add wm8994 regulator support on smdk5250.
Date: Tue, 28 May 2013 16:05:22 +0530
Message-ID: <1369737322-10907-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59745 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932208Ab3E1KcQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 06:32:16 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNI00J6M7WXYL01@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 May 2013 19:32:14 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com

This patch adds the required regulator supplies and properties
for wm8994 codec on smdk5250 board.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   53 +++++++++++++++++++++++++++-
 1 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index f2a025e..42fc79e 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -37,6 +37,46 @@
 		};
 	};
 
+	avdd2:fixed-regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd2-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	cpvdd:fixed-regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cpvdd-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	dbvdd:fixed-regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "dbvdd-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	spkvdd1:fixed-regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "spkvdd1-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	spkvdd2:fixed-regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "spkvdd2-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	i2c@12C70000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
@@ -47,8 +87,17 @@
 		};
 
 		wm8994: wm8994@1a {
-			 compatible = "wlf,wm8994";
-			 reg = <0x1a>;
+			compatible = "wlf,wm8994";
+			reg = <0x1a>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			AVDD2-supply = <&avdd2>;
+			CPVDD-supply = <&cpvdd>;
+			DBVDD-supply = <&dbvdd>;
+			SPKVDD1-supply = <&spkvdd1>;
+			SPKVDD2-supply = <&spkvdd2>;
 		};
 	};
 
-- 
1.7.4.4
