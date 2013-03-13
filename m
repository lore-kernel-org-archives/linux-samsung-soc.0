From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v7 1/5] ARM: dts: Add FIMD node to exynos4
Date: Wed, 13 Mar 2013 15:39:27 +0530
Message-ID: <1363169371-310-2-git-send-email-vikas.sajjan@linaro.org>
References: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:50171 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061Ab3CMKJt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 06:09:49 -0400
Received: by mail-da0-f51.google.com with SMTP id z17so351672dal.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 03:09:49 -0700 (PDT)
In-Reply-To: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

This adds common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6581bb2..26190e0 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -297,4 +297,12 @@
 			interrupts = <0 34 0>;
 		};
 	};
+
+	fimd: fimd@11c00000 {
+		compatible = "samsung,exynos4210-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <11 0>, <11 1>, <11 2>;
+	};
 };
-- 
1.7.9.5
