From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] dma: pl08x: Use correct specifier for size_t values
Date: Fri,  1 Aug 2014 18:09:48 +0100
Message-ID: <1406912988-13562-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39911 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602AbaHARWH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 13:22:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

When printing size_t values we should use the %zd or %zx format specifier
in order to ensure the value is displayed correctly and avoid warnings from
sparse.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/dma/amba-pl08x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 8114731..8ff32b1 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -1040,7 +1040,7 @@ static int pl08x_fill_llis_for_desc(struct pl08x_driver_data *pl08x,
 
 		if (early_bytes) {
 			dev_vdbg(&pl08x->adev->dev,
-				"%s byte width LLIs (remain 0x%08x)\n",
+				"%s byte width LLIs (remain 0x%08zx)\n",
 				__func__, bd.remainder);
 			prep_byte_width_lli(pl08x, &bd, &cctl, early_bytes,
 				num_llis++, &total_bytes);
@@ -1662,7 +1662,7 @@ static struct dma_async_tx_descriptor *pl08x_prep_dma_cyclic(
 	dma_addr_t slave_addr;
 
 	dev_dbg(&pl08x->adev->dev,
-		"%s prepare cyclic transaction of %d/%d bytes %s %s\n",
+		"%s prepare cyclic transaction of %zd/%zd bytes %s %s\n",
 		__func__, period_len, buf_len,
 		direction == DMA_MEM_TO_DEV ? "to" : "from",
 		plchan->name);
-- 
2.0.0
