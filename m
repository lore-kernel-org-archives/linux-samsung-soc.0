From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] dmaengine: pl330: report BURST residue granularity
Date: Tue, 19 Jun 2018 15:20:50 +0200
Message-ID: <20180619132105eucas1p2d65cbd799e60a8ab1849c4ae716275c4~5klprrrtK1347113471eucas1p2M@eucas1p2.samsung.com>
References: <CGME20180619132105eucas1p2d65cbd799e60a8ab1849c4ae716275c4@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Vinod Koul <vinod.koul@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

The reported residue is already calculated in BURST unit granularity, so
advertise this capability properly to other devices in the system.

Fixes: aee4d1fac887 ("dmaengine: pl330: improve pl330_tx_status() function")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/dma/pl330.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index defcdde4d358..de0957fe9668 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -3033,7 +3033,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	pd->src_addr_widths = PL330_DMA_BUSWIDTHS;
 	pd->dst_addr_widths = PL330_DMA_BUSWIDTHS;
 	pd->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
-	pd->residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
+	pd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 	pd->max_burst = ((pl330->quirks & PL330_QUIRK_BROKEN_NO_FLUSHP) ?
 			 1 : PL330_MAX_BURST);
 
-- 
2.17.1
