From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ARM: dts: Enable USB hub on Arndale
Date: Thu, 15 Aug 2013 00:27:00 +0100
Message-ID: <1376522821-16133-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52180 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932364Ab3HNX1m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 19:27:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The Arndale has a SMSC USB3503 connected in hardware only mode like a PHY,
support it using the usb-nop-xceiv binding.

Note that due to a regrettable decision to use a regulator to represent
the reset signal this uses a fixed voltage regulator to do that, there
is a plan to use the reset controller binding once that is merged so it
does not seem worthwhile to fix the usb-nop-xceiv driver at this point.

Signed-off-by: Mark Brown <broonie@linaro.org>
Tested-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 96d528d..2428ffd 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -539,4 +539,18 @@
 	rtc {
 		status = "okay";
 	};
+
+	usb_hub_bus {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		// SMSC USB3503 connected in hardware only mode as a PHY
+		usb_hub: usb_hub {
+			compatible = "smsc,usb3503a";
+
+			reset-gpios = <&gpx3 5 1>;
+			connect-gpios = <&gpd1 7 1>;
+		};
+	};
 };
-- 
1.8.4.rc2
