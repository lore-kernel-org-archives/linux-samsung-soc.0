From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH v3] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Mon, 11 May 2015 17:26:05 +0200
Message-ID: <5550CA0D.3050003@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:48113 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754463AbbEKP0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 11:26:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, Markus Reichl <m.reichl@fivetechno.de>, 'Jaehoon Chung' <jh80.chung@samsung.com>

HS400 timing values are added for exynos5422-odroidxu3 board.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Jaehoon Chung <jh80.chung@samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes since v2:
1. Rebased onto linux-samsung/for-next
2. Added Acked-by tag
Changes since v1:
1. Dropped num_slots
2. Rebased onto 4.1-rc3
3. Added Acked-by tag
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index cb649b1..8dd8e8e 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -312,10 +312,14 @@
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+	samsung,read-strobe-delay = <90>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 };
 
 &mmc_2 {
--
1.9.1 
