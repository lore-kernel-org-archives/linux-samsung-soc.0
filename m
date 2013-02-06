From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/7] ARM: dts: Add G2D node to exynos4210.dtsi
Date: Wed,  6 Feb 2013 17:21:11 +0530
Message-ID: <1360151477-26460-2-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:48220 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:00:56 -0500
Received: by mail-da0-f41.google.com with SMTP id e20so628474dak.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:00:56 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added G2D DT node to Exynos4210.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 79ba247..3410d5f 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -47,6 +47,14 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
 	};
 
+	g2d@12800000 {
+		compatible = "samsung,s5pv210-g2d";
+		reg = <0x12800000 0x1000>;
+		interrupts = <0 89 0>;
+		samsung,power-domain = <&pd_lcd0>;
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
-- 
1.7.4.1
