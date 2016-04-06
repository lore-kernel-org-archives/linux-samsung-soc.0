From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 10/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos5440
Date: Wed, 06 Apr 2016 11:00:49 +0900
Message-ID: <1459908050-16430-10-git-send-email-k.kozlowski@samsung.com>
References: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35952 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759927AbcDFCB5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2016 22:01:57 -0400
In-reply-to: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Fix following DTC warnings in Exynos5440 boards:

Warning (unit_address_vs_reg): Node /pinctrl has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /rtc has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's tag.
---
 arch/arm/boot/dts/exynos5440.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index b9342ec5b9cf..fd176819b4bf 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -132,7 +132,7 @@
 		clock-names = "spi", "spi_busclk0";
 	};
 
-	pin_ctrl: pinctrl {
+	pin_ctrl: pinctrl@E0000 {
 		compatible = "samsung,exynos5440-pinctrl";
 		reg = <0xE0000 0x1000>;
 		interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>,
@@ -205,7 +205,7 @@
 		ranges;
 	};
 
-	rtc {
+	rtc@130000 {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x130000 0x1000>;
 		interrupts = <0 17 0>, <0 16 0>;
-- 
2.5.0
