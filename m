From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 06/12] ARM: dts: add exynos4 clock controller nodes
Date: Sun, 25 Nov 2012 02:47:59 +0530
Message-ID: <1353791885-2566-7-git-send-email-thomas.abraham@linaro.org>
References: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35409 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285Ab2KXVTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 16:19:04 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so7169534pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Nov 2012 13:19:04 -0800 (PST)
In-Reply-To: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

Add clock controller nodes for Exynos4210 and Exynos4x12 SoC's.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
 arch/arm/boot/dts/exynos4x12.dtsi |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index cca1546..74e656e 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -55,6 +55,12 @@
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
index 179a62e..3b8da68 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -36,6 +36,12 @@
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
