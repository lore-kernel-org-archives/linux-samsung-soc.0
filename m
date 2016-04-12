From: zengzhaoxiu@163.com
Subject: [PATCH] mtd: nand: s3c2410: fix bug in s3c2410_nand_correct_data()
Date: Tue, 12 Apr 2016 15:30:35 +0800
Message-ID: <1460446235-987-1-git-send-email-zengzhaoxiu@163.com>
References: <20160411094901.74e68f91@bbrezillon>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m50-134.163.com ([123.125.50.134]:33603 "EHLO m50-134.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755917AbcDLHc1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 03:32:27 -0400
In-Reply-To: <20160411094901.74e68f91@bbrezillon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: kgene@kernel.org, k.kozlowski@samsung.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

If there is only one bit difference in the ECC, the function should return 1.
The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so the function
actually returns -1.

Signed-off-by: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
---
 drivers/mtd/nand/s3c2410.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 9c9397b..86ffb73 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -542,7 +542,8 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	diff0 |= (diff1 << 8);
 	diff0 |= (diff2 << 16);
 
-	if ((diff0 & ~(1<<fls(diff0))) == 0)
+	/* equal to "(diff0 & ~(1 << __ffs(diff0)))" */
+	if ((diff0 & (diff0 - 1)) == 0)
 		return 1;
 
 	return -1;
-- 
2.5.0
