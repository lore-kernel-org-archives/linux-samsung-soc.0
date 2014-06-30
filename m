From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] mtd: s3c2410: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 30 Jun 2014 22:12:16 +0300
Message-ID: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:59465 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756160AbaF3TOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:14:37 -0400
Received: by mail-wi0-f174.google.com with SMTP id bs8so6622548wib.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:14:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/mtd/nand/s3c2410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 79acbb8..6b97bf1 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -208,10 +208,10 @@ static void s3c2410_nand_clk_set_state(struct s3c2410_nand_info *info,
 
 	if (info->clk_state == CLOCK_ENABLE) {
 		if (new_state != CLOCK_ENABLE)
-			clk_disable(info->clk);
+			clk_disable_unprepare(info->clk);
 	} else {
 		if (new_state == CLOCK_ENABLE)
-			clk_enable(info->clk);
+			clk_prepare_enable(info->clk);
 	}
 
 	info->clk_state = new_state;
-- 
2.0.0
