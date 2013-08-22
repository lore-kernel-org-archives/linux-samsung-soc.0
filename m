From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 3/3] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Thu, 22 Aug 2013 17:03:28 +0530
Message-ID: <1377171208-23515-4-git-send-email-vikas.sajjan@linaro.org>
References: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:50286 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753315Ab3HVLdv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 07:33:51 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so1763250pdj.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 04:33:50 -0700 (PDT)
In-Reply-To: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
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
