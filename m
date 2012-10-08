From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 4/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos5250
Date: Mon, 08 Oct 2012 11:17:09 +0900
Message-ID: <1349662630-11607-5-git-send-email-chanho61.park@samsung.com>
References: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42860 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751660Ab2JHCRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Oct 2012 22:17:34 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBJ00AU6YCR9QB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:17:31 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBJ00IX1YD3KJK0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:17:31 +0900 (KST)
In-reply-to: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, Chanho Park <chanho61.park@samsung.com>

This patch enables arm-pmu to bind device tree for exynos5250. The exynos5250
has two pmus which have combiner irq type.

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dddfd6e..fab3eae 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -56,6 +56,12 @@
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
