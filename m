From: zengzhaoxiu@163.com
Subject: [PATCH] mtd: nand: s3c2410: fix bug in s3c2410_nand_correct_data()
Date: Fri,  8 Apr 2016 00:48:17 +0800
Message-ID: <1460047697-72830-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m12-16.163.com ([220.181.12.16]:41726 "EHLO m12-16.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756545AbcDGQu3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2016 12:50:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

If there is only one bit difference in the ECC, the function should return 1.
The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so the function
actually returns -1.

Here, we can use the simple expression "(diff0 & (diff0 - 1)) == 0" to determine
whether the diff0 has only one 1-bit.
---
 drivers/mtd/nand/s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 9c9397b..c9698cf 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -542,7 +542,7 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	diff0 |= (diff1 << 8);
 	diff0 |= (diff2 << 16);
 
-	if ((diff0 & ~(1<<fls(diff0))) == 0)
+	if ((diff0 & (diff0 - 1)) == 0)
 		return 1;
 
 	return -1;
-- 
2.5.5
