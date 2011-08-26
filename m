From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS4: Fix sdhci card detection for ORIGEN
Date: Fri, 26 Aug 2011 15:08:42 +0530
Message-ID: <1314351524-10942-2-git-send-email-tushar.behera@linaro.org>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:58318 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab1HZJlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 05:41:39 -0400
Received: by mail-pz0-f42.google.com with SMTP id 37so3982659pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2011 02:41:39 -0700 (PDT)
In-Reply-To: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org

Fix incorrect value of cd_type field in platform data for sdhci
device.

Based on "ARM: EXYNOS4: Fix card detection for sdhci 0 and 2".
commit a0d8efedb203b5b908dd46cea38201761e2380f9

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..e280270 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -73,9 +73,7 @@ static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 };
 
 static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
-	.cd_type		= S3C_SDHCI_CD_GPIO,
-	.ext_cd_gpio		= EXYNOS4_GPK2(2),
-	.ext_cd_gpio_invert	= 1,
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
-- 
1.7.4.1
