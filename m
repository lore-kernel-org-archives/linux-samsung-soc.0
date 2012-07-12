From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 2/2] ARM: exynos5: Add devicetree node for TMU driver
Date: Thu, 12 Jul 2012 14:45:43 +0530
Message-ID: <1342084543-8302-3-git-send-email-amit.daniel@samsung.com>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43188 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753271Ab2GLJQQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:16:16 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so3440914pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 02:16:16 -0700 (PDT)
In-Reply-To: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org

This patch adds necessary source definations needed for TMU driver and
adds devicetree for exynos5.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
 arch/arm/mach-exynos/clock-exynos5.c    |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
 4 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4272b29..9a9df51 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -58,6 +58,12 @@
 		interrupts = <0 43 0>, <0 44 0>;
 	};
 
+	tmu@10060000 {
+		compatible = "samsung,exynos5-tmu";
+		reg = <0x10060000 0x100>;
+		interrupts = <0 65 0>;
+	};
+
 	serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..30798da 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -554,6 +554,11 @@ static struct clk exynos5_init_clocks_off[] = {
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
index c23d1c2..4a94752 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -89,6 +89,7 @@
 #define EXYNOS4_PA_L2CC			0x10502000
 
 #define EXYNOS4_PA_TMU			0x100C0000
+#define EXYNOS5_PA_TMU			0x10060000
 
 #define EXYNOS4_PA_MDMA0		0x10810000
 #define EXYNOS4_PA_MDMA1		0x12840000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 7b1e11a..55f0ad8 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -50,6 +50,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-tmu", EXYNOS5_PA_TMU,
+				"exynos-tmu", NULL),
 	{},
 };
 
-- 
1.7.1
