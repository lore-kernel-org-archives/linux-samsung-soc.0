From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3] ARM: SAMSUNG: Delete the unnecessary variable
Date: Tue, 06 Nov 2012 10:23:38 +0530
Message-ID: <1352177618-16460-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50175 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344Ab2KFEwM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 23:52:12 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD100FL8UUVW7O0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:52:11 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD100EHTURFFSG0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:52:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

As the RCLK src clks are registered with clkdev using generic
connection id , these clk names need not to be passed through
platform data. So it is deleted.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Changes since V2:
	- Rebased on 3.7-rc3
	
 include/linux/platform_data/asoc-s3c.h |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
index aa9875f..8827259 100644
--- a/include/linux/platform_data/asoc-s3c.h
+++ b/include/linux/platform_data/asoc-s3c.h
@@ -38,12 +38,6 @@ struct samsung_i2s {
 #define QUIRK_NEED_RSTCLR	(1 << 3)
 	/* Quirks of the I2S controller */
 	u32 quirks;
-
-	/*
-	 * Array of clock names that can be used to generate I2S signals.
-	 * Also corresponds to clocks of I2SMOD[10]
-	 */
-	const char **src_clk;
 	dma_addr_t idma_addr;
 };
 
-- 
1.7.4.4
