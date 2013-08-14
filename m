From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 3/3] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Wed, 14 Aug 2013 19:28:30 +0530
Message-ID: <1376488710-12124-4-git-send-email-vikas.sajjan@linaro.org>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:51162 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757454Ab3HNN6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 09:58:53 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so9333490pbc.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 06:58:53 -0700 (PDT)
In-Reply-To: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds RTC DT node to Exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..713bb5a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -126,6 +126,12 @@
 		interrupts = <0 47 0>;
 	};
 
+	rtc@101E0000 {
+		clocks = <&clock 317>;
+		clock-names = "rtc";
+		status = "okay";
+	};
+
 	serial@12C00000 {
 		clocks = <&clock 257>, <&clock 128>;
 		clock-names = "uart", "clk_uart_baud0";
-- 
1.7.9.5
