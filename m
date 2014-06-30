From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 16/17] [media] exynos4-is: removes s5pc100 related fimc codes
Date: Tue, 01 Jul 2014 06:32:26 +0900
Message-ID: <1404163947-3105-17-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62589 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753195AbaF3NTW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z00B85GZVLEB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:07 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>

This patch removes s5pc100 related fimc codes because of no more support
S5PC100 SoC in mainline.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>
---
 Documentation/video4linux/fimc.txt            |    2 +-
 drivers/media/platform/exynos4-is/fimc-core.c |   15 ---------------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/Documentation/video4linux/fimc.txt b/Documentation/video4linux/fimc.txt
index e0c6b8b..1441fcf 100644
--- a/Documentation/video4linux/fimc.txt
+++ b/Documentation/video4linux/fimc.txt
@@ -15,7 +15,7 @@ drivers/media/platform/exynos4-is directory.
 1. Supported SoCs
 =================
 
-S5PC100 (mem-to-mem only), S5PV210, EXYNOS4210
+S5PV210, EXYNOS4210
 
 2. Supported features
 =====================
diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
index b70fd99..5c800b4 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -1204,18 +1204,6 @@ static const struct fimc_variant fimc2_variant_s5pv210 = {
 	.pix_limit	 = &s5p_pix_limit[2],
 };
 
-/* S5PC100 */
-static const struct fimc_drvdata fimc_drvdata_s5p = {
-	.variant = {
-		[0] = &fimc0_variant_s5p,
-		[1] = &fimc0_variant_s5p,
-		[2] = &fimc2_variant_s5p,
-	},
-	.num_entities	= 3,
-	.lclk_frequency = 133000000UL,
-	.out_buf_count	= 4,
-};
-
 /* S5PV210, S5PC110 */
 static const struct fimc_drvdata fimc_drvdata_s5pv210 = {
 	.variant = {
@@ -1251,9 +1239,6 @@ static const struct fimc_drvdata fimc_drvdata_exynos4x12 = {
 
 static const struct platform_device_id fimc_driver_ids[] = {
 	{
-		.name		= "s5p-fimc",
-		.driver_data	= (unsigned long)&fimc_drvdata_s5p,
-	}, {
 		.name		= "s5pv210-fimc",
 		.driver_data	= (unsigned long)&fimc_drvdata_s5pv210,
 	}, {
-- 
1.7.10.4
