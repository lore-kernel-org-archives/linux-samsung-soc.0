From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix card insert/removal event detection on
 smdkv310 board
Date: Fri, 20 May 2011 01:54:50 +0530
Message-ID: <1305836690-890-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58572 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934077Ab1ESURk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 16:17:40 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00A00LPC0160@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:17:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00A1TLP97H@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:17:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

On SMDKV310 board, a card detect gpio pin is available that is directly
connected to the io pad of the sdhci controller. Fix incorrect value
of cd_type field in platform data for sdhci instance 0 and 2.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 1526764..edd8141 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -78,9 +78,7 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
 };
 
 static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata = {
-	.cd_type		= S3C_SDHCI_CD_GPIO,
-	.ext_cd_gpio		= EXYNOS4_GPK0(2),
-	.ext_cd_gpio_invert	= 1,
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 #ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
 	.max_width		= 8,
@@ -96,9 +94,7 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc1_pdata __initdata = {
 };
 
 static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata = {
-	.cd_type		= S3C_SDHCI_CD_GPIO,
-	.ext_cd_gpio		= EXYNOS4_GPK2(2),
-	.ext_cd_gpio_invert	= 1,
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 #ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
 	.max_width		= 8,
-- 
1.6.6.rc2
