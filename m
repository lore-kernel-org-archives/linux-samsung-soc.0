From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH for v3.4-rc3] ARM: Samsung: add missing MMC_CAP2_BROKEN_VOLTAGE
 capability
Date: Mon, 16 Apr 2012 08:33:45 +0200
Message-ID: <1334558025-26635-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17740 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845Ab2DPGeD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Apr 2012 02:34:03 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2K009AU7KTLD40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Apr 2012 07:34:06 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2K00AG97KLLO@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Apr 2012 07:33:57 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Commit 6e8201f57c935 "mmc: core: add the capability for broken voltage"
introduced a new quirk to indicate that MMC core should ignore voltage
change errors reported by the regulators core. This is required to get
SDHCI working on UniversalC210, NURI and GONI boards again after commit
ceb6143b2df81c ("mmc: sdhci: fix vmmc handling").

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 arch/arm/mach-s5pv210/mach-goni.c          |    2 ++
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 91e5986..021dc68 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -112,6 +112,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 				MMC_CAP_ERASE),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index ef706e9..add55b4 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -747,6 +747,7 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
 	.max_width		= 8,
 	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
 				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED),
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index a8933de..3239566 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -25,6 +25,7 @@
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <linux/gpio.h>
+#include <linux/mmc/host.h>
 #include <linux/interrupt.h>
 
 #include <asm/hardware/vic.h>
@@ -765,6 +766,7 @@ static void __init goni_pmic_init(void)
 /* MoviNAND */
 static struct s3c_sdhci_platdata goni_hsmmc0_data __initdata = {
 	.max_width		= 4,
+	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
 	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
-- 
1.7.1.569.g6f426
