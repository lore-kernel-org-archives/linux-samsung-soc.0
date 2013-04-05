From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v11 1/3] ARM: dts: Add FIMD node to exynos4
Date: Fri,  5 Apr 2013 15:47:40 +0530
Message-ID: <1365157062-8669-2-git-send-email-vikas.sajjan@linaro.org>
References: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:37572 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754855Ab3DEKSD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Apr 2013 06:18:03 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so1953492pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2013 03:18:02 -0700 (PDT)
In-Reply-To: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch adds a common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 800ff11..b8771c5 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -371,4 +371,16 @@
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
