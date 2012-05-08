From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] mtd: m25p80: Add support for Winbond W25Q80BW
Date: Wed, 09 May 2012 04:04:54 +0530
Message-ID: <1336516494-22791-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10834 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754122Ab2EHWWf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 18:22:35 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3Q00EIQ65LLH00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 07:22:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3Q0096D65FJA70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 07:22:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, mike@steroidmicros.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Winbond W25Q80BW is a 8Mbit serial flash memory device.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d24..dbd44b1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -728,6 +728,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1) },
-- 
1.6.6.rc2
