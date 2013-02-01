From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v3 1/5] ARM: dts: Add FIMD node to exynos4
Date: Fri,  1 Feb 2013 17:02:52 +0530
Message-ID: <1359718376-21947-2-git-send-email-vikas.sajjan@linaro.org>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:57332 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755681Ab3BALdF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 06:33:05 -0500
Received: by mail-pb0-f41.google.com with SMTP id ro12so2139135pbb.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Feb 2013 03:33:05 -0800 (PST)
In-Reply-To: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

This adds common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1347fc..57744d6 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -289,4 +289,11 @@
 			interrupts = <0 34 0>;
 		};
 	};
+
+	fimd: fimd@11c00000 {
+		compatible = "samsung,exynos4-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupts = <11 1>, <11 0>, <11 2>;
+	};
 };
-- 
1.7.9.5
