From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS4: Add support for 8-bit bus width in SDHCI for ORIGEN
Date: Fri, 26 Aug 2011 15:08:44 +0530
Message-ID: <1314351524-10942-4-git-send-email-tushar.behera@linaro.org>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:64801 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752763Ab1HZJlr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 05:41:47 -0400
Received: by ewy4 with SMTP id 4so1389689ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2011 02:41:46 -0700 (PDT)
In-Reply-To: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org

Platform data for SDHCI controller on ORIGEN board is missing the
support for 8-bit bus width. The platform data is extended in sync
with other EXYNOS4 machines.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ae18812..6b6cd77 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -75,11 +75,19 @@ static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
 	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
+#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
+	.max_width		= 8,
+	.host_caps		= MMC_CAP_8_BIT_DATA,
+#endif
 };
 
 static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
+#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
+	.max_width		= 8,
+	.host_caps		= MMC_CAP_8_BIT_DATA,
+#endif
 };
 
 static struct platform_device *origen_devices[] __initdata = {
-- 
1.7.4.1
