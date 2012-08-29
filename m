From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 4/4] ARM: EXYNOS: Add arm-pmu DT binding for exynos5250
Date: Wed, 29 Aug 2012 10:14:57 +0900
Message-ID: <1346202897-27306-5-git-send-email-chanho61.park@samsung.com>
References: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14164 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab2H2BPY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 21:15:24 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9H00MHFSPQEE30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:22 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9H00IO5ST8BV20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:22 +0900 (KST)
In-reply-to: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, Chanho Park <chanho61.park@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch enables arm-pmu to bind device tree for exynos5250. The exynos5250
has two pmus which have combiner irq type.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 004aaa8..45746cbf 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -52,6 +52,12 @@
 			     <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a15-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <1 2>, <22 4>;
+	};
+
 	watchdog {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x101D0000 0x100>;
-- 
1.7.9.5
