From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 4/7] ARM: dts: Add FIMD DT node to exynos5420 DTS files
Date: Tue, 30 Jul 2013 16:49:35 +0530
Message-ID: <1375183178-8201-5-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:54020 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab3G3LUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:14 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so7071185pab.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:13 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds FIMD DT node to exynos5420 based SMDK. Also adds display-timimg
information node.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   19 +++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |    7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..0c0249c 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,23 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	fimd@14400000 {
+		status = "okay";
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing@0 {
+				clock-frequency = <50000>;
+				hactive = <2560>;
+				vactive = <1600>;
+				hfront-porch = <48>;
+				hback-porch = <80>;
+				hsync-len = <32>;
+				vback-porch = <16>;
+				vfront-porch = <8>;
+				vsync-len = <6>;
+			};
+		};
+	};
+
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 884d8f4..2f98c89 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -180,4 +180,11 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	fimd@14400000 {
+		samsung,power-domain = <&disp_pd>;
+		clocks = <&clock 147>, <&clock 421>;
+		clock-names = "sclk_fimd", "fimd";
+	};
+
 };
-- 
1.7.9.5
