From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v5 5/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos421x
Date: Wed, 24 Oct 2012 14:34:54 +0900
Message-ID: <1351056894-5790-6-git-send-email-chanho61.park@samsung.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18377 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab2JXFf0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 01:35:26 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCD00E8UU70QON0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 14:35:24 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCD0053YU6W5670@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 14:35:24 +0900 (KST)
In-reply-to: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kyungmin.park@samsung.com, sachin.kamat@linaro.org, thomas.abraham@linaro.org, will.deacon@arm.com, Chanho Park <chanho61.park@samsung.com>

This patch adds a arm-pmu node to bind device tree for exynos4210.
The exynos4210 and 4212 have two cpus which includes a pmu. In contrast, the
exynos4412 has 4 cpus and pmus. We need to define two more pmus for this type
board. However, supporting arm-pmu for the exynos4412 will handle it later
because there is no dts support for 4412 based board.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 214c557..90f9aed 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -42,6 +42,12 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>;
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4210";
 		reg = <0x11400000 0x1000>;
-- 
1.7.9.5
