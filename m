From: snawrocki@kernel.org
Subject: [PATCH] ARM: S3C24XX: Fix NAND ECC mode for mini2440 board
Date: Wed, 16 Aug 2017 22:31:01 +0200
Message-ID: <1502915461-8625-1-git-send-email-snawrocki@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752376AbdHPUbS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 16:31:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <snawrocki@kernel.org>, Sergio Prado <sergio.prado@e-labworks.com>

From: Sylwester Nawrocki <snawrocki@kernel.org>

After commit e9f66ae23c "mtd: s3c2410: make ecc mode configurable
via platform data" booting of the mini2440 board is broken, since
for this board we have CONFIG_MTD_NAND_S3C2410_HWECC set. The console
gets flooded with errors reported by the mtd subsystem.
This patch changes ecc_mode to NAND_ECC_HW which restores proper
operation of the NAND flash memory.

Cc: Sergio Prado <sergio.prado@e-labworks.com>
Fixes: e9f66ae23c "mtd: s3c2410: make ecc mode configurable via platform data"
Signed-off-by: Sylwester Nawrocki <snawrocki@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-mini2440.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 98bff4b..3e75efd 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -289,7 +289,7 @@
 	.nr_sets	= ARRAY_SIZE(mini2440_nand_sets),
 	.sets		= mini2440_nand_sets,
 	.ignore_unset_ecc = 1,
-	.ecc_mode       = NAND_ECC_SOFT,
+	.ecc_mode       = NAND_ECC_HW,
 };
 
 /* DM9000AEP 10/100 ethernet controller */
-- 
1.9.1
