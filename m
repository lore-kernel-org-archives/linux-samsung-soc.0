From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Fix mismatched value for SD4 pull
 up/down configuration on exynos4210
Date: Thu, 01 Sep 2016 10:37:01 +0200
Message-ID: <1472719022-27226-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23598 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752170AbcIAIhP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 04:37:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: javier@osg.samsung.com, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

The pinctrl pull up/down register on exynos4210 is 2-bit wide for each
pin and it accepts only values of 0, 1 and 3.  The pins sd4-bus-width8
were configured with value of 4.  The driver does not validate the value
so this overflow effectively set a bit 1 in adjacent pins thus
configuring them to pull down.

The author's intention was probably to set drive strength of 4x.  All
other bus-widths pins are configured with pull up and drive strength of
4x.  Fix this one with same pattern.

Fixes: 87711d8c7c70 ("ARM: dts: Add pinctrl node entries for SAMSUNG EXYNOS4210 SoC")
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index 8046340e50ac..d9b6d25e4abe 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -649,7 +649,7 @@
 		sd4_bus8: sd4-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 		};
 
-- 
1.9.1
