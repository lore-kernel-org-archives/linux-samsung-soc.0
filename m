Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F42C63697
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 16:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D45B322227
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 16:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ryg5g3W0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgKSQpV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 11:45:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728140AbgKSQpU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 11:45:20 -0500
Received: from kozik-lap.mshome.net (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FAC022227;
        Thu, 19 Nov 2020 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605804319;
        bh=mXY6R0JYv9mPZeaRTe3GbHETYhXc5gsUwqUBxsCHotA=;
        h=From:To:Cc:Subject:Date:From;
        b=Ryg5g3W0Vx46s7wfUJ1y28FBctVJEX1idl4DHQUzFksXj1Cg8wwPCnCjJn9cfMsHl
         2ShZRUX6zT+y2y3tQZbrG31mNPn96KZa4XXJ+hF7rHMAlr2KeRJYXjbRfei3Vewvs+
         5MFAR2J07lASd9JAUR3+1YXzSyQwqGDeV4bbFeKo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] clk: samsung: allow compile testing of Exynos, S3C64xx and S5Pv210
Date:   Thu, 19 Nov 2020 17:45:09 +0100
Message-Id: <20201119164509.754851-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

So far all Exynos, S3C64xx and S5Pv210 clock units were selected by
respective SOC/ARCH Kconfig option.  On a kernel built for selected
SoCs, this allowed to build only limited set of matching clock drivers.
However compile testing was not possible in such case as Makefile object
depent on SOC/ARCH option.

Add separate Kconfig options for each of them to be able to compile
test.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/Kconfig  | 67 ++++++++++++++++++++++++++++++++++--
 drivers/clk/samsung/Makefile | 22 ++++++------
 include/linux/clk/samsung.h  |  4 +--
 3 files changed, 78 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 7e9c186e57ef..0441c4f73ac9 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -2,10 +2,73 @@
 # Recent Exynos platforms should just select COMMON_CLK_SAMSUNG:
 config COMMON_CLK_SAMSUNG
 	bool "Samsung Exynos clock controller support" if COMPILE_TEST
-	# Clocks on ARM64 SoCs (e.g. Exynos5433, Exynos7) are chosen by
-	# EXYNOS_ARM64_COMMON_CLK to avoid building them on ARMv7:
+	select S3C64XX_COMMON_CLK if ARM && ARCH_S3C64XX
+	select S5PV210_COMMON_CLK if ARM && ARCH_S5PV210
+	select EXYNOS_3250_COMMON_CLK if ARM && SOC_EXYNOS3250
+	select EXYNOS_4_COMMON_CLK if ARM && ARCH_EXYNOS4
+	select EXYNOS_5250_COMMON_CLK if ARM && SOC_EXYNOS5250
+	select EXYNOS_5260_COMMON_CLK if ARM && SOC_EXYNOS5260
+	select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
+	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
 	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
 
+config S3C64XX_COMMON_CLK
+	bool "Samsung S3C64xx clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung S3C64xx SoCs.
+	  Choose Y here only if you build for this SoC.
+
+config S5PV210_COMMON_CLK
+	bool "Samsung S5Pv210 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung S5Pv210 SoCs.
+	  Choose Y here only if you build for this SoC.
+
+config EXYNOS_3250_COMMON_CLK
+	bool "Samsung Exynos3250 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos3250 SoCs. Choose Y here only if you build for this SoC.
+
+config EXYNOS_4_COMMON_CLK
+	bool "Samsung Exynos4 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos4212 and Exynos4412 SoCs. Choose Y here only if you build for
+	  this SoC.
+
+config EXYNOS_5250_COMMON_CLK
+	bool "Samsung Exynos5250 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos5250 SoCs. Choose Y here only if you build for this SoC.
+
+config EXYNOS_5260_COMMON_CLK
+	bool "Samsung Exynos5260 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos5260 SoCs. Choose Y here only if you build for this SoC.
+
+config EXYNOS_5410_COMMON_CLK
+	bool "Samsung Exynos5410 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos5410 SoCs. Choose Y here only if you build for this SoC.
+
+config EXYNOS_5420_COMMON_CLK
+	bool "Samsung Exynos5420 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  Exynos5420 SoCs. Choose Y here only if you build for this SoC.
+
 config EXYNOS_ARM64_COMMON_CLK
 	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 6891b087acff..028b2e27a37e 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -4,15 +4,15 @@
 #
 
 obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
-obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
-obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
-obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4412-isp.o
-obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
-obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5-subcmu.o
-obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
-obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
-obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
-obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
+obj-$(CONFIG_EXYNOS_3250_COMMON_CLK)	+= clk-exynos3250.o
+obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4.o
+obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4412-isp.o
+obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5250.o
+obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5-subcmu.o
+obj-$(CONFIG_EXYNOS_5260_COMMON_CLK)	+= clk-exynos5260.o
+obj-$(CONFIG_EXYNOS_5410_COMMON_CLK)	+= clk-exynos5410.o
+obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5420.o
+obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5-subcmu.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
 obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
@@ -21,5 +21,5 @@ obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
 obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
 obj-$(CONFIG_S3C2443_COMMON_CLK)+= clk-s3c2443.o
-obj-$(CONFIG_ARCH_S3C64XX)	+= clk-s3c64xx.o
-obj-$(CONFIG_ARCH_S5PV210)	+= clk-s5pv210.o clk-s5pv210-audss.o
+obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
+obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
index 79097e365f7f..38b774001712 100644
--- a/include/linux/clk/samsung.h
+++ b/include/linux/clk/samsung.h
@@ -10,7 +10,7 @@
 
 struct device_node;
 
-#ifdef CONFIG_ARCH_S3C64XX
+#ifdef CONFIG_S3C64XX_COMMON_CLK
 void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 		      unsigned long xusbxti_f, bool s3c6400,
 		      void __iomem *base);
@@ -19,7 +19,7 @@ static inline void s3c64xx_clk_init(struct device_node *np,
 				    unsigned long xtal_f,
 				    unsigned long xusbxti_f,
 				    bool s3c6400, void __iomem *base) { }
-#endif /* CONFIG_ARCH_S3C64XX */
+#endif /* CONFIG_S3C64XX_COMMON_CLK */
 
 #ifdef CONFIG_S3C2410_COMMON_CLK
 void s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
-- 
2.25.1

