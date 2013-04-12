From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/7] ARM: exynos: add missing properties for combiner IRQs
Date: Fri, 12 Apr 2013 16:03:21 +0200
Message-ID: <1365775405-115297-4-git-send-email-arnd@arndb.de>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:60357 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab3DLODj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 10:03:39 -0400
In-Reply-To: <1365775405-115297-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>

The exynos combiner irqchip needs to find the parent interrupts
and needs to know their number, so add the missing properties
for exynos4 as they were already present for exynos5.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/exynos4210.dtsi | 1 +
 arch/arm/boot/dts/exynos4212.dtsi | 9 +++++++++
 arch/arm/boot/dts/exynos4412.dtsi | 9 +++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 15143bd..c102869 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -41,6 +41,7 @@
 	};
 
 	combiner:interrupt-controller@10440000 {
+		combiner-nr = <16>;
 		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
 			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
 			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 36d4299..f83c3c1 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -26,6 +26,15 @@
 		cpu-offset = <0x8000>;
 	};
 
+	interrupt-controller@10440000 {
+                combiner-nr = <18>;
+		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
+			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
+			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
+			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
+			     <0 107 0>, <0 108 0>;
+	};
+
 	mct@10050000 {
 		compatible = "samsung,exynos4412-mct";
 		reg = <0x10050000 0x800>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d75c047..4cb657e 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -26,6 +26,15 @@
 		cpu-offset = <0x4000>;
 	};
 
+	interrupt-controller@10440000 {
+		combiner-nr = <20>;
+		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
+			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
+			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
+			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
+			     <0 107 0>, <0 108 0>>, <0 48 0>, <0 42 0>;
+	};
+
 	mct@10050000 {
 		compatible = "samsung,exynos4412-mct";
 		reg = <0x10050000 0x800>;
-- 
1.8.1.2
