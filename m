From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: Use define for s3c-rtc clock id
Date: Fri, 03 Apr 2015 10:20:43 +0200
Message-ID: <1428049244-1152-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20584 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753309AbbDCIUy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 04:20:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Use a define instead of raw number as a ID for "rtc_src" clock.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

---

Patch depends on new file "dt-bindings/clock/samsung,s2mps11.h" from:
1. ARM: dts: Add bindings for 32kHz clocks from s2mps11
   http://www.spinics.net/lists/linux-samsung-soc/msg43345.html

Changes since v1:
1. Add Javier's reviewed-by.
---
 arch/arm/boot/dts/exynos3250-monk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 1d483c1c8b48..a5863acc5fff 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -16,6 +16,7 @@
 #include "exynos3250.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/samsung,s2mps11.h>
 
 / {
 	model = "Samsung Monk board";
@@ -432,7 +433,7 @@
 };
 
 &rtc {
-	clocks = <&cmu CLK_RTC>, <&s2mps14_osc 0>;
+	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
 	status = "okay";
 };
-- 
1.9.1
