From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 2/3] ARM: S3C24XX: dma-s3c2443 - do not write into arbitary bits
Date: Sun, 21 Apr 2013 20:04:03 +0200
Message-ID: <201304212004.03459.heiko@sntech.de>
References: <201304212002.31082.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54939 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751419Ab3DUSEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Apr 2013 14:04:09 -0400
In-Reply-To: <201304212002.31082.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The values read from the channel map always also contain the
DMA_CH_VALID (= 1<<31) setting, which should not get written
into the register, even if this bit is unused.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/dma-s3c2443.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/dma-s3c2443.c b/arch/arm/mach-s3c24xx/dma-s3c2443.c
index 000e4c6..e992a7c 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2443.c
@@ -130,7 +130,8 @@ static struct s3c24xx_dma_map __initdata s3c2443_dma_mappings[] = {
 static void s3c2443_dma_select(struct s3c2410_dma_chan *chan,
 			       struct s3c24xx_dma_map *map)
 {
-	writel(map->channels[0] | S3C2443_DMAREQSEL_HW,
+	unsigned long chsel = map->channels[0] & (~DMA_CH_VALID);
+	writel(chsel | S3C2443_DMAREQSEL_HW,
 	       chan->regs + S3C2443_DMA_DMAREQSEL);
 }
 
-- 
1.7.2.3
