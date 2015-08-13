From: Alexis Ballier <aballier@gentoo.org>
Subject: [PATCH v2] ARM: dts: exynos4412-odroidu3: Enable SPI1.
Date: Thu, 13 Aug 2015 11:06:53 +0200
Message-ID: <1439456813-4918-1-git-send-email-aballier@gentoo.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:46243 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750908AbbHMJHn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 05:07:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexis Ballier <aballier@gentoo.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

SPI1 is available on IO Port #2 (as depicted on their website) in
PCB Revision 0.5 of Hardkernel Odroid U3 board.
The shield connects a 256KiB spi-nor flash on that bus.

Signed-off-by: Alexis Ballier <aballier@gentoo.org>

---

Changes in v2: Use GPIO_ACTIVE_HIGH (Krzysztof Kozlowski)

 arch/arm/boot/dts/exynos4412-odroidu3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 44684e5..8632f35 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -13,6 +13,7 @@
 
 /dts-v1/;
 #include "exynos4412-odroid-common.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Hardkernel ODROID-U3 board based on Exynos4412";
@@ -61,3 +62,10 @@
 		"Speakers", "SPKL",
 		"Speakers", "SPKR";
 };
+
+&spi_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_bus>;
+	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
-- 
2.5.0
