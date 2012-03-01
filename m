From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: Exynos: fix SDHCI caps for UniversalC210 and NURI
 boards
Date: Thu, 01 Mar 2012 09:40:19 +0100
Message-ID: <1330591221-31458-2-git-send-email-m.szyprowski@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36006 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932124Ab2CAIlG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 03:41:06 -0500
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M07004KQ6SFM350@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0700LWY6SFOY@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
In-reply-to: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Add a new quirk (introduced in 6e8201f57c935 "mmc: core: add the capability
for broken voltage" to indicate that MMC core should ignore voltage change
errors reported by the regulators core. This is required to get SDHCI
working on these boards again after commit ceb6143b2df81c ("mmc: sdhci:
fix vmmc handling").

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index a6b9162..8c0479f 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -112,6 +112,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 				MMC_CAP_DISABLE | MMC_CAP_ERASE),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
@@ -151,6 +152,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc2_data __initdata = {
 	.host_caps		= MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 				MMC_CAP_DISABLE,
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.ext_cd_gpio		= EXYNOS4_GPX3(3),	/* XEINT_27 */
 	.ext_cd_gpio_invert	= 1,
 	.cd_type		= S3C_SDHCI_CD_GPIO,
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 6017a21..908624c 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -745,6 +745,7 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 				MMC_CAP_DISABLE),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
-- 
1.7.1.569.g6f426
