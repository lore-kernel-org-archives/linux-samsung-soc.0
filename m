From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Fix nand partition table for s3c24XX
Date: Mon, 19 Jul 2010 08:25:15 +0900
Message-ID: <1279495515-17265-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43249 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757592Ab0GRXfi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Jul 2010 19:35:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Atul Dahiya <atul.dahiya@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

This patch fixes the partition table as existing partition table have last
partition size fixed and can't utilize available memory proprly if size is
more than 64M.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/plat-s3c24xx/common-smdk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/common-smdk.c b/arch/arm/plat-s3c24xx/common-smdk.c
index 7b44d0c..bcc43f3 100644
--- a/arch/arm/plat-s3c24xx/common-smdk.c
+++ b/arch/arm/plat-s3c24xx/common-smdk.c
@@ -147,7 +147,7 @@ static struct mtd_partition smdk_default_nand_part[] = {
 	[7] = {
 		.name	= "S3C2410 flash partition 7",
 		.offset = SZ_1M * 48,
-		.size	= SZ_16M,
+		.size	= MTDPART_SIZ_FULL,
 	}
 };
 
-- 
1.6.2.5
