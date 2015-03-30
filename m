From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: dts: Use define for s3c-rtc clock id
Date: Mon, 30 Mar 2015 17:21:29 +0200
Message-ID: <1427728889-29158-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43461 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752847AbbC3PVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:21:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Use a define instead of raw number as a ID for "rtc_src" clock.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Patch depends on new file "dt-bindings/clock/samsung,s2mps11.h" from:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg43136.html
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 3905824cac58..d2cbc95364de 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -16,6 +16,7 @@
 #include "exynos3250.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/samsung,s2mps11.h>
 
 / {
 	model = "Samsung Rinato board";
@@ -605,7 +606,7 @@
 };
 
 &rtc {
-	clocks = <&cmu CLK_RTC>, <&s2mps14_osc 0>;
+	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
 	status = "okay";
 };
-- 
1.9.1
