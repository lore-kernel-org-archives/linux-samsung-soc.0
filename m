From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 05/11] ARM: dts: add exynos4 clock controller nodes
Date: Thu, 15 Nov 2012 03:37:27 +0530
Message-ID: <1352930853-12268-6-git-send-email-thomas.abraham@linaro.org>
References: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:44128 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933150Ab2KNWI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 17:08:56 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so608817pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 14:08:56 -0800 (PST)
In-Reply-To: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

Add clock controller nodes for Exynos4210 and Exynos4x12 SoC's.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
 arch/arm/boot/dts/exynos4x12.dtsi |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index d6fc306..f7daa09 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -50,6 +50,12 @@
 		samsung,mct-nr-local-irqs = <4>;
 	};
 
+	clock: clock-controller@0x10030000 {
+		compatible = "samsung,exynos4210-clock";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4210";
 		reg = <0x11400000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 7cbbd19..bcfdaac 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -35,6 +35,12 @@
 			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
 	};
 
+	clock: clock-controller@0x10030000 {
+		compatible = "samsung,exynos4412-clock";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4x12";
 		reg = <0x11400000 0x1000>;
-- 
1.7.4.4
