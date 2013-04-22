From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: Add chip-id controller node on Exynos4/5 SoC
Date: Mon, 22 Apr 2013 17:05:08 +0530
Message-ID: <1366630508-26101-3-git-send-email-thomas.abraham@linaro.org>
References: <1366630508-26101-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10381 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304Ab3DVLU3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 07:20:29 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN00FEAM5SQ1E0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 20:20:27 +0900 (KST)
In-reply-to: <1366630508-26101-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de

Add chip-id controller nodes for Exynos4 and Exynos5 SoCs.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi    |    5 +++++
 arch/arm/boot/dts/exynos5250.dtsi |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index d73eaa1..efd441a 100644
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
index 6727eed..4bd9e9c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -51,6 +51,11 @@
 		pinctrl3 = &pinctrl_3;
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
1.6.6.rc2
