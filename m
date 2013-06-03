From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2] ARM: dts: wm8994: Add wm8994 regulator support on smdk5250.
Date: Mon, 03 Jun 2013 10:52:34 +0530
Message-ID: <1370236954-16863-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35510 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042Ab3FCFT6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 01:19:58 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNS00CMRXGU47D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Jun 2013 14:19:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com

This patch adds the required regulator supplies and properties
for wm8994 codec on smdk5250 board.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Changes since V1:
	- Clubbed the same supply regulators as suggested by Mark.

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   37 +++++++++++++++++++++++++++-
 1 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index f2a025e..dc2ec25 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -37,6 +37,30 @@
 		};
 	};
 
+	vdd:fixed-regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	dbvdd:fixed-regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "dbvdd-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	spkvdd:fixed-regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "spkvdd-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	i2c@12C70000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
@@ -47,8 +71,17 @@
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
+			AVDD2-supply = <&vdd>;
+			CPVDD-supply = <&vdd>;
+			DBVDD-supply = <&dbvdd>;
+			SPKVDD1-supply = <&spkvdd>;
+			SPKVDD2-supply = <&spkvdd>;
 		};
 	};
 
-- 
1.7.4.4
