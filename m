From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v4 08/13] ARM: dts: exynos4: Use labels for overriding nodes in Exynos4412
Date: Mon, 11 May 2015 22:42:48 +0900
Message-ID: <1431351773-2031-9-git-send-email-k.kozlowski.k@gmail.com>
References: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:35535 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932206AbbEKNor (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 09:44:47 -0400
In-Reply-To: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 68ad43b391ae..b78ada70bd05 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -54,19 +54,19 @@
 		};
 	};
 
-	combiner: interrupt-controller@10440000 {
-		samsung,combiner-nr = <20>;
-	};
-
 	pmu {
 		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
 	};
+};
 
-	gic: interrupt-controller@10490000 {
-		cpu-offset = <0x4000>;
-	};
+&pmu_system_controller {
+	compatible = "samsung,exynos4412-pmu", "syscon";
+};
 
-	pmu_system_controller: system-controller@10020000 {
-		compatible = "samsung,exynos4412-pmu", "syscon";
-	};
+&combiner {
+	samsung,combiner-nr = <20>;
+};
+
+&gic {
+	cpu-offset = <0x4000>;
 };
-- 
2.1.4
