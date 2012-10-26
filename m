From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v2 1/2] ARM: exynos4: Add devicetree node for TMU driver
Date: Fri, 26 Oct 2012 14:59:05 +0530
Message-ID: <1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
References: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53705 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757758Ab2JZJGe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 05:06:34 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCH00GUPTA5GMT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:06:33 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCH00BAFT8G5T90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:06:32 +0900 (KST)
In-reply-to: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, amit.kachhap@linaro.org, Amit Daniel Kachhap <amit.daniel@samsung.com>

From: Amit Daniel Kachhap <amit.daniel@samsung.com>

This patch adds necessary source definations needed for TMU driver and
adds devicetree node for exynos4210.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
 arch/arm/mach-exynos/clock-exynos4.c     |    4 ++++
 arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
 arch/arm/mach-exynos/include/mach/map.h  |    2 ++
 arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
 5 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 214c557..038de97 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -303,4 +303,11 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	tmu@100C0000 {
+		compatible = "samsung,exynos4210-tmu";
+		interrupt-parent = <&combiner>;
+		reg = <0x100C0000 0x100>;
+		interrupts = <2 4>;
+	};
 };
diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index fa8a134..cf121f4 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -576,6 +576,10 @@ static struct clk exynos4_init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
+		.name           = "tmu_apbif",
+		.enable         = exynos4_clk_ip_perir_ctrl,
+		.ctrlbit        = (1 << 17),
+	}, {
 		.name		= "keypad",
 		.enable		= exynos4_clk_ip_perir_ctrl,
 		.ctrlbit	= (1 << 16),
diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 35bced6..5adacd1 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -136,6 +136,9 @@
 #define EXYNOS4_IRQ_TSI			IRQ_SPI(115)
 #define EXYNOS4_IRQ_SATA		IRQ_SPI(116)
 
+#define EXYNOS4_IRQ_TMU_TRIG0		COMBINER_IRQ(2, 4)
+#define EXYNOS4_IRQ_TMU_TRIG1		COMBINER_IRQ(3, 4)
+
 #define EXYNOS4_IRQ_SYSMMU_MDMA0_0	COMBINER_IRQ(4, 0)
 #define EXYNOS4_IRQ_SYSMMU_SSS_0	COMBINER_IRQ(4, 1)
 #define EXYNOS4_IRQ_SYSMMU_FIMC0_0	COMBINER_IRQ(4, 2)
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 8480849..772acd3 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -88,6 +88,8 @@
 #define EXYNOS4_PA_TWD			0x10500600
 #define EXYNOS4_PA_L2CC			0x10502000
 
+#define EXYNOS4_PA_TMU			0x100C0000
+
 #define EXYNOS4_PA_MDMA0		0x10810000
 #define EXYNOS4_PA_MDMA1		0x12850000
 #define EXYNOS4_PA_PDMA0		0x12680000
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index eadf4b5..0746e5a 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -77,6 +77,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 				"exynos4210-spi.2", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
+				"exynos-tmu", NULL),
 	{},
 };
 
-- 
1.7.1
