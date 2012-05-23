From: Kyoungil Kim <ki0351.kim@samsung.com>
Subject: [PATCH] spi: Keep chipselect assertion during one message
Date: Wed, 23 May 2012 21:34:06 +0900
Message-ID: <00a001cd38e0$57efde60$07cf9b20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19038 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2EWMeH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 08:34:07 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4H007586WES2L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 21:34:06 +0900 (KST)
Received: from DOKI0351KIM04 ([12.23.119.96])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4H007U46WUGX90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 21:34:06 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Kyoungil Kim' <ki0351.kim@samsung.com>

During all transfers in one message, the device will not be chagned.
So we don't need to deassert chipselect during one message.

Signed-off-by: Kyoungil Kim <ki0351.kim@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 972a94c..0f79f5b 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -745,8 +745,6 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 			if (list_is_last(&xfer->transfer_list,
 						&msg->transfers))
 				cs_toggle = 1;
-			else
-				disable_cs(sdd, spi);
 		}
 
 		msg->actual_length += xfer->len;
-- 
1.7.1
