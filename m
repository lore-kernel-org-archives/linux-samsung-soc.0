From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 4/4] ARM: dts: Add MFC node for exynos 5420
Date: Wed, 14 Aug 2013 17:11:37 +0530
Message-ID: <1376480497-17572-5-git-send-email-arun.kk@samsung.com>
References: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:40711 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759898Ab3HNLlm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:41:42 -0400
In-Reply-To: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arun.kk@samsung.com

The patch adds MFC nodes for exynos 5420.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..bbf71e9 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -65,6 +65,14 @@
 		#clock-cells = <1>;
 	};
 
+	codec@11000000 {
+		compatible = "samsung,mfc-v7";
+		reg = <0x11000000 0x10000>;
+		interrupts = <0 96 0>;
+		clocks = <&clock 401>;
+		clock-names = "mfc";
+	};
+
 	mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
-- 
1.7.9.5
