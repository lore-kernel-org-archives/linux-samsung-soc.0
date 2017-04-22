From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] dmaengine: s3c24xx: Fix a typo in a comment line
Date: Sat, 22 Apr 2017 23:25:31 +0200
Message-ID: <9455dbb2-0c61-6b2c-72d5-e555f78433b9@users.sourceforge.net>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:63641 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1427204AbdDVVZp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Apr 2017 17:25:45 -0400
In-Reply-To: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 23:09:03 +0200

Add a missing character in this description for a data structure member.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 967229829683..da79b2c6989f 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -159,7 +159,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transfered
+ * @at: sg currently being transferred
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
-- 
2.12.2
