From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 1/5] ARM: dts: Add FIMD node to exynos4
Date: Mon, 28 Jan 2013 11:14:28 +0530
Message-ID: <1359351872-20518-2-git-send-email-vikas.sajjan@linaro.org>
References: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:51940 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436Ab3A1Fom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 00:44:42 -0500
Received: by mail-pa0-f51.google.com with SMTP id fb11so1310714pad.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 21:44:42 -0800 (PST)
In-Reply-To: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

This adds common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1347fc..96c3b4a 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -289,4 +289,11 @@
 			interrupts = <0 34 0>;
 		};
 	};
+
+	fimd@11c00000 {
+		compatible = "samsung,exynos4-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupts = <11 1>, <11 0>, <11 2>;
+	};
 };
-- 
1.7.9.5
