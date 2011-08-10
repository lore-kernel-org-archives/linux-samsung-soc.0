From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/2] Remove s3c24xx_dma_addr definition
Date: Wed, 10 Aug 2011 12:30:19 +0200
Message-ID: <201108101230.19931.heiko@sntech.de>
References: <201108101227.32780.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201108101227.32780.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: heiko@sntech.de
List-Id: linux-samsung-soc@vger.kernel.org

As all users of s3c24xx_dma_addr are gone now, remove it completely.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/include/plat/dma-s3c24xx.h |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/dma-s3c24xx.h b/arch/arm/plat-samsung/include/plat/dma-s3c24xx.h
index 336d5ac..ab9bce6 100644
--- a/arch/arm/plat-samsung/include/plat/dma-s3c24xx.h
+++ b/arch/arm/plat-samsung/include/plat/dma-s3c24xx.h
@@ -18,11 +18,6 @@ extern struct s3c2410_dma_chan s3c2410_chans[S3C_DMA_CHANNELS];
 #define DMA_CH_VALID		(1<<31)
 #define DMA_CH_NEVER		(1<<30)
 
-struct s3c24xx_dma_addr {
-	unsigned long		from;
-	unsigned long		to;
-};
-
 /* struct s3c24xx_dma_map
  *
  * this holds the mapping information for the channel selected
@@ -31,7 +26,6 @@ struct s3c24xx_dma_addr {
 
 struct s3c24xx_dma_map {
 	const char		*name;
-	struct s3c24xx_dma_addr  hw_addr;
 
 	unsigned long		 channels[S3C_DMA_CHANNELS];
 	unsigned long		 channels_rx[S3C_DMA_CHANNELS];
-- 
1.7.5.4
