From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Fix wrong clock for Exynos4x12 ADC
Date: Thu, 11 Jun 2015 17:26:30 +0900
Message-ID: <1434011190-24563-2-git-send-email-k.kozlowski@samsung.com>
References: <1434011190-24563-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14577 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbbFKI0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 04:26:53 -0400
In-reply-to: <1434011190-24563-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The TSADC gate clock is present only in Exynos4210. It should not be
added to exynos4x12.dtsi because the register controlling it is reserved
on Exynos4x12.

Instead, the Analog to Digital Converter of Exynos4x12 uses PCLK_ADC
gate clock from different register.

By using proper clock this effectively enables usage of exynos-adc
driver on Exynos4412 boards, enables accessing sensors connected to it
on Trats2 board (ntc,ncp15wb473 AP and battery thermistors) and fixes
following warnings during boot:
[    2.248247] ERROR: could not get clock /adc@126C0000:adc(0)
[    2.248262] exynos-adc 126c0000.adc: failed getting clock, err = -2
[    2.248293] exynos-adc: probe of 126c0000.adc failed with error -2

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index b77dac61ffb5..d7738dd062b7 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -101,7 +101,7 @@
 		reg = <0x126C0000 0x100>;
 		interrupt-parent = <&combiner>;
 		interrupts = <10 3>;
-		clocks = <&clock CLK_TSADC>;
+		clocks = <&clock CLK_PCLK_ADC>;
 		clock-names = "adc";
 		#io-channel-cells = <1>;
 		io-channel-ranges;
-- 
1.9.1
