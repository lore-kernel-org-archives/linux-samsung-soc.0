From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add chip-id controller node on Exynos4/5 SoC
Date: Mon, 18 Feb 2013 13:24:59 +0530
Message-ID: <1361174099-18749-3-git-send-email-thomas.abraham@linaro.org>
References: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:47101 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753642Ab3BRHzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 02:55:33 -0500
Received: by mail-pb0-f53.google.com with SMTP id un1so1535385pbc.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 23:55:33 -0800 (PST)
In-Reply-To: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Add chip-id controller nodes for Exynos4 and Exynos5 SoCs.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi    |    5 +++++
 arch/arm/boot/dts/exynos5250.dtsi |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6581bb2..1a02189 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -38,6 +38,11 @@
 		i2c7 = &i2c_7;
 	};
 
+	chipid@10000000 {
+		compatible = "samsung,exynos4210-chipid";
+		reg = <0x10000000 0x100>;
+	};
+
 	pd_mfc: mfc-power-domain@10023C40 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C40 0x20>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7c3d07a..fce773e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -46,6 +46,11 @@
 		i2c8 = &i2c_8;
 	};
 
+	chipid@10000000 {
+		compatible = "samsung,exynos4210-chipid";
+		reg = <0x10000000 0x100>;
+	};
+
 	pd_gsc: gsc-power-domain@0x10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
-- 
1.7.5.4
