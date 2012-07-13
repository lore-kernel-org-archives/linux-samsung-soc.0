From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2] ARM: Exynos: Add device tree node for Exynos4 interrupt
 combiner controller
Date: Fri, 13 Jul 2012 11:26:39 +0530
Message-ID: <1342158999-3924-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42831 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030207Ab2GMFmp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 01:42:45 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7300E2H3U10C90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 14:42:43 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7300BC13V0ZG50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 14:42:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Add node for Exynos4 interrupt combiner controller.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index a1dd2ee..0e4f659 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -33,6 +33,17 @@
 		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
 	};
 
+	combiner:interrupt-controller@10440000 {
+		compatible = "samsung,exynos4210-combiner";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		reg = <0x10440000 0x1000>;
+		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
+			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
+			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
+			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
+	};
+
 	watchdog@10060000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x10060000 0x100>;
-- 
1.6.6.rc2
