From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: Exynos4: fix SDHCI support on NURI & UniversalC210
 boards
Date: Fri, 06 Apr 2012 09:43:23 +0200
Message-ID: <1333698206-12348-2-git-send-email-m.szyprowski@samsung.com>
References: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43559 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754048Ab2DFHni (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 03:43:38 -0400
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2100006S4TC620@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:41 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2100FZ7S4KK4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:37 +0100 (BST)
In-reply-to: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Some patches for s3c-sdhci driver which changed support for Exynos4 SoC
have not been merged to v3.4-rc1, while some of their followups have been
applied to mach-universal.c and mach-nuri.c. This patch reverts that
changes and add missing MMC_CAP2_BROKEN_VOLTAGE capability which got lost
together with s3c-sdhci changes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           |    5 +++--
 arch/arm/mach-exynos/mach-universal_c210.c |    3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index b3982c8..b3966f0 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -112,12 +112,13 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 				MMC_CAP_ERASE),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
 static struct regulator_consumer_supply emmc_supplies[] = {
-	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
+	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
 	REGULATOR_SUPPLY("vmmc", "dw_mmc"),
 };
 
@@ -417,7 +418,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo12_[] = {
 	REGULATOR_SUPPLY("vddio", "6-003c"), /* HDC802 */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo13_[] = {
-	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.2"), /* TFLASH */
+	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.2"), /* TFLASH */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo14_[] = {
 	REGULATOR_SUPPLY("inmotor", "max8997-haptic"),
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 6bb9dbd..e10c87f 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -746,12 +746,13 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
 	.max_width		= 8,
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
 static struct regulator_consumer_supply mmc0_supplies[] = {
-	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
+	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
 };
 
 static struct regulator_init_data mmc0_fixed_voltage_init_data = {
-- 
1.7.1.569.g6f426
