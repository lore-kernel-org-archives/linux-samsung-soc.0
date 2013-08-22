From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v6 3/3] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Thu, 22 Aug 2013 18:29:03 +0530
Message-ID: <1377176343-24859-4-git-send-email-vikas.sajjan@linaro.org>
References: <1377176343-24859-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:63405 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752902Ab3HVM72 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 08:59:28 -0400
Received: by mail-pb0-f53.google.com with SMTP id up15so1736648pbc.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 05:59:28 -0700 (PDT)
In-Reply-To: <1377176343-24859-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds RTC DT node to Exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5353e32..3f2b9c4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -180,6 +180,12 @@
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
