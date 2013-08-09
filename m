From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH-RESEND] ARM: dts: Add arm-pmu node for exynos4412
Date: Fri, 09 Aug 2013 19:41:54 +0900
Message-ID: <1376044914-1759-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47884 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965774Ab3HIKmD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 06:42:03 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR90032RF20DLM0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Aug 2013 19:42:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The Exynos4412 has 4 cpus and each has a performance counter.
Thus, we should define 4 interrupts which are combined by irq-combiner for arm
pmu.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e743e67..cfad655 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -35,6 +35,12 @@
 			     <0 107 0>, <0 108 0>, <0 48 0>, <0 42 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+	};
+
 	mct@10050000 {
 		compatible = "samsung,exynos4412-mct";
 		reg = <0x10050000 0x800>;
-- 
1.7.9.5
