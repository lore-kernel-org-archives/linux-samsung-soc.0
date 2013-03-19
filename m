From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v8 1/4] ARM: dts: Add FIMD node to exynos4
Date: Tue, 19 Mar 2013 12:38:09 +0530
Message-ID: <1363676892-21296-2-git-send-email-vikas.sajjan@linaro.org>
References: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:34194 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932866Ab3CSHI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 03:08:57 -0400
Received: by mail-pb0-f48.google.com with SMTP id wy12so179847pbc.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 00:08:57 -0700 (PDT)
In-Reply-To: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com

Adds common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 9ac47d5..2480aaa 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -356,4 +356,15 @@
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
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
