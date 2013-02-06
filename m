From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/7] ARM: dts: Add G2D node to exynos4x12.dtsi
Date: Wed,  6 Feb 2013 17:21:14 +0530
Message-ID: <1360151477-26460-5-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:54914 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMBF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:01:05 -0500
Received: by mail-pa0-f50.google.com with SMTP id fa11so763869pad.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:01:04 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added G2D DT node to exynos4x12.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 022a839..f9247b9 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -36,6 +36,13 @@
 			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
 	};
 
+	g2d@10800000 {
+		compatible = "samsung,exynos4212-g2d";
+		reg = <0x10800000 0x1000>;
+		interrupts = <0 89 0>;
+		status = "disabled";
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x11400000 0x1000>;
-- 
1.7.4.1
