From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] ARM: dts: exynos5420: add ADC device tree node
Date: Thu, 01 Aug 2013 14:58:41 +0530
Message-ID: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61560 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258Ab3HAJdo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Aug 2013 05:33:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org

From: Jaehoon Kim <jh228.kim@samsung.com>

Add device tree node for ADC in exynos5420.dtsi

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..074e1bc 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -145,4 +145,15 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	adc: adc@12D10000 {
+		compatible = "samsung,exynos-adc-v2";
+		reg = <0x12D10000 0x100>, <0x10040720 0x4>;
+		interrupts = <0 106 0>;
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		clocks = <&clock 270>;
+		clock-names = "adc";
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
