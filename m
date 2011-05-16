From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix card insert/removal event detection on
 smdkv310 board
Date: Mon, 16 May 2011 19:36:01 +0530
Message-ID: <1305554761-2954-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29162 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755165Ab1EPN6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 09:58:46 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLA004MYK5RC3K0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 22:58:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLA00KXCK5RVQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 22:58:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

On SMDKV310 board, a card detect gpio pin is available that is directly
connected to the io pad of the sdhci controller. Fix incorrect value
of cd_type field in platform data for sdhci instance 0 and 2.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 1526764..f6b1c7e 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -78,7 +78,7 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
 };
 
 static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata = {
-	.cd_type		= S3C_SDHCI_CD_GPIO,
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.ext_cd_gpio		= EXYNOS4_GPK0(2),
 	.ext_cd_gpio_invert	= 1,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
@@ -96,7 +96,7 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc1_pdata __initdata = {
 };
 
 static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata = {
-	.cd_type		= S3C_SDHCI_CD_GPIO,
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 	.ext_cd_gpio		= EXYNOS4_GPK2(2),
 	.ext_cd_gpio_invert	= 1,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
-- 
1.6.6.rc2
