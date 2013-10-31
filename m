From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma completion status
Date: Thu, 31 Oct 2013 10:48:09 +0530
Message-ID: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:60414 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904Ab3JaFTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 01:19:36 -0400
Received: by mail-ie0-f170.google.com with SMTP id at1so4231012iec.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 22:19:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dmaengine@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, kgene.kim@samsung.com, sachin.kamat@linaro.org, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vinod.koul@intel.com>

Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS.
Without this patch we get the following build error:
drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_status=E2=
=80=99:
drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=80=99 =
undeclared
(first use in this function)

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Vinod Koul <vinod.koul@intel.com>
---
 drivers/dma/s3c24xx-dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 4cb127978636..085da4fe6613 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -795,7 +795,7 @@ static enum dma_status s3c24xx_dma_tx_status(struct=
 dma_chan *chan,
=20
 	spin_lock_irqsave(&s3cchan->vc.lock, flags);
 	ret =3D dma_cookie_status(chan, cookie, txstate);
-	if (ret =3D=3D DMA_SUCCESS) {
+	if (ret =3D=3D DMA_COMPLETE) {
 		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
 		return ret;
 	}
--=20
1.7.9.5
