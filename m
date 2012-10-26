From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v2 2/2] ARM: exynos5: Add devicetree node for TMU driver
Date: Fri, 26 Oct 2012 14:59:06 +0530
Message-ID: <1351243746-4173-3-git-send-email-amit.daniel@samsung.com>
References: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
 <1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53765 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757908Ab2JZJHE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 05:07:04 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCH00GW8TB8GMT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:07:03 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCH00BAFT8G5T90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:07:02 +0900 (KST)
In-reply-to: <1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, amit.kachhap@linaro.org, Amit Daniel Kachhap <amit.daniel@samsung.com>

From: Amit Daniel Kachhap <amit.daniel@samsung.com>

This patch adds necessary source definations needed for TMU driver and
adds devicetree node for exynos5250.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
 arch/arm/mach-exynos/clock-exynos5.c    |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
 4 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 49546bc..670dfdb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -74,6 +74,12 @@
 		interrupts = <0 43 0>, <0 44 0>;
 	};
 
+	tmu@10060000 {
+		compatible = "samsung,exynos5250-tmu";
+		reg = <0x10060000 0x100>;
+		interrupts = <0 65 0>;
+	};
+
 	serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 2ca9391..d4ae64e 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -616,6 +616,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peric_ctrl,
 		.ctrlbit	= (1 << 24),
 	}, {
+		.name		= "tmu_apbif",
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.enable		= exynos5_clk_ip_peris_ctrl,
+		.ctrlbit	= (1 << 21),
+	}, {
 		.name		= "rtc",
 		.parent		= &exynos5_clk_aclk_66.clk,
 		.enable		= exynos5_clk_ip_peris_ctrl,
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 772acd3..2a28ef9 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -89,6 +89,7 @@
 #define EXYNOS4_PA_L2CC			0x10502000
 
 #define EXYNOS4_PA_TMU			0x100C0000
+#define EXYNOS5_PA_TMU			0x10060000
 
 #define EXYNOS4_PA_MDMA0		0x10810000
 #define EXYNOS4_PA_MDMA1		0x12850000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index b7f1154..f8d5a9b 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -76,6 +76,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
 				"exynos-gsc.3", NULL),
 	OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-tmu", EXYNOS5_PA_TMU,
+				"exynos-tmu", NULL),
 	{},
 };
 
-- 
1.7.1
