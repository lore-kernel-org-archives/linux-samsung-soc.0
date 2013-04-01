From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v10 1/3] ARM: dts: Add FIMD node to exynos4
Date: Mon,  1 Apr 2013 19:52:30 +0530
Message-ID: <1364826153-8925-2-git-send-email-vikas.sajjan@linaro.org>
References: <1364826153-8925-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:56027 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758233Ab3DAOWx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Apr 2013 10:22:53 -0400
Received: by mail-pa0-f44.google.com with SMTP id bi5so1342269pad.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2013 07:22:52 -0700 (PDT)
In-Reply-To: <1364826153-8925-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch adds a common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 9ac47d5..59e6730 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -356,4 +356,16 @@
 			#dma-requests = <1>;
 		};
 	};
+
+	fimd: fimd@11c00000 {
+		compatible = "samsung,exynos4210-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <11 0>, <11 1>, <11 2>;
+		clocks = <&clock 140>, <&clock 283>;
+		clock-names = "sclk_fimd", "fimd";
+		samsung,power-domain = <&pd_lcd0>;
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
