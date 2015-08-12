From: Alexis Ballier <aballier@gentoo.org>
Subject: [PATCH] ARM: dts: exynos4412-odroidu3: Enable SPI1.
Date: Wed, 12 Aug 2015 13:27:51 +0200
Message-ID: <1439378871-28117-1-git-send-email-aballier@gentoo.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:33560 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751611AbbHLL23 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 07:28:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexis Ballier <aballier@gentoo.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

SPI1 is available on IO Port #2 (as depicted on their website) in
PCB Revision 0.5 of Hardkernel Odroid U3 board.
The shield connects a 256KiB spi-nor flash on that bus.

Signed-off-by: Alexis Ballier <aballier@gentoo.org>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 44684e5..37698e4 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -61,3 +61,10 @@
 		"Speakers", "SPKL",
 		"Speakers", "SPKR";
 };
+
+&spi_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_bus>;
+	cs-gpios = <&gpb 5 0>;
+	status = "okay";
+};
-- 
2.5.0
