From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Use stdout non-deprecated property and add
 serial options to Odroid XU/XU3/XU4
Date: Wed, 17 Aug 2016 09:34:58 +0200
Message-ID: <1471419298-10414-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19069 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753860AbcHQHfP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 03:35:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

The "linux,stdout-path" is deprecated.

Add serial options so the console can be properly configured when
bootloader does not pass "console" parameter to command line.  Without
options and lack of "console", the serial output dies during boot (just
after probing sound).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index f6d135245a4b..a5ae76c1838f 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -26,7 +26,7 @@
 	};
 
 	chosen {
-		linux,stdout-path = &serial_2;
+		stdout-path = "serial2:115200n8";
 	};
 
 	emmc_pwrseq: pwrseq {
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index d56253049ccb..d04490d40b07 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -26,7 +26,7 @@
 	};
 
 	chosen {
-		linux,stdout-path = &serial_2;
+		stdout-path = "serial2:115200n8";
 	};
 
 	firmware@02073000 {
-- 
1.9.1
