From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: Exynos: fix SDHCI device names in regulator
 definitions
Date: Thu, 01 Mar 2012 09:40:20 +0100
Message-ID: <1330591221-31458-3-git-send-email-m.szyprowski@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36006 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932184Ab2CAIlH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 03:41:07 -0500
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M07004KQ6SFM350@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0700EHX6SFRQ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
In-reply-to: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Patch 189eb7407 "ARM: EXYNOS: use 'exynos4-sdhci' as device name for sdhci
controllers" changed the names of the SDHCI devices, but the author forgot
to update the definitions for the regulator subsystem. This patch fixes
this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           |    4 ++--
 arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 8c0479f..dd26581 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -117,7 +117,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
 };
 
 static struct regulator_consumer_supply emmc_supplies[] = {
-	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
+	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
 	REGULATOR_SUPPLY("vmmc", "dw_mmc"),
 };
 
@@ -417,7 +417,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo12_[] = {
 	REGULATOR_SUPPLY("vddio", "6-003c"), /* HDC802 */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo13_[] = {
-	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.2"), /* TFLASH */
+	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.2"), /* TFLASH */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo14_[] = {
 	REGULATOR_SUPPLY("inmotor", "max8997-haptic"),
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 908624c..7cd738c 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -750,7 +750,7 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
 };
 
 static struct regulator_consumer_supply mmc0_supplies[] = {
-	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
+	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
 };
 
 static struct regulator_init_data mmc0_fixed_voltage_init_data = {
-- 
1.7.1.569.g6f426
