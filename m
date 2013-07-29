From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 4/7] ARM: dts: Add FIMD DT node to exynos5420 DTS files
Date: Mon, 29 Jul 2013 19:19:28 +0530
Message-ID: <1375105771-8106-5-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:45769 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755095Ab3G2NuC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:50:02 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so2577983pde.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:50:02 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds FIMD DT node to exynos5420 based SMDK. Also adds display-timimg
information node.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   18 ++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..7c2f477 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,22 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	fimd {
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
index bd6b310..1f659f4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -180,4 +180,12 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	fimd {
+		samsung,power-domain = <&disp_pd>;
+		clocks = <&clock 147>, <&clock 421>;
+		clock-names = "sclk_fimd", "fimd";
+		status = "okay";
+	};
+
 };
-- 
1.7.9.5
