From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 1/5] ARM: dts: Add FIMD node to exynos4
Date: Fri, 15 Feb 2013 12:39:56 +0530
Message-ID: <1360912200-26377-2-git-send-email-vikas.sajjan@linaro.org>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46054 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753165Ab3BOHKT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 02:10:19 -0500
Received: by mail-pb0-f46.google.com with SMTP id uo15so506815pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 23:10:18 -0800 (PST)
In-Reply-To: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This adds common FIMD device node for all Exynos4 SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6581bb2..d73b9ee 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -297,4 +297,11 @@
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
