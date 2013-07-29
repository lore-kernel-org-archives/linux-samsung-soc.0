From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 2/7] ARM: dts: Update FIMD DT node for Exynos5 SoCs
Date: Mon, 29 Jul 2013 19:19:26 +0530
Message-ID: <1375105771-8106-3-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:36593 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453Ab3G2Nty (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:49:54 -0400
Received: by mail-pd0-f171.google.com with SMTP id y14so5429593pdi.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:49:53 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Moves the properties of FIMD DT node which are common across Exynos5 based
SoCs like Exynos5250 and Exxynos5420 to exynos5.dtsi

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |   10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |    6 +-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..80a4630 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -108,4 +108,14 @@
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
+
+	fimd {
+		compatible = "samsung,exynos5250-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <18 4>, <18 5>, <18 6>;
+		status = "disabled";
+	};
+
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..20c32fc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -631,12 +631,8 @@
 	};
 
 	fimd {
-		compatible = "samsung,exynos5250-fimd";
-		interrupt-parent = <&combiner>;
-		reg = <0x14400000 0x40000>;
-		interrupt-names = "fifo", "vsync", "lcd_sys";
-		interrupts = <18 4>, <18 5>, <18 6>;
 		clocks = <&clock 133>, <&clock 339>;
 		clock-names = "sclk_fimd", "fimd";
+		status = "okay";
 	};
 };
-- 
1.7.9.5
