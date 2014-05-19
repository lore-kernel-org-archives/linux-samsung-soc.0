From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/8] drm/exynos/fimc: replace mutex by spinlock
Date: Mon, 19 May 2014 12:54:09 +0200
Message-ID: <1400496850-23860-8-git-send-email-a.hajda@samsung.com>
References: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: open list <linux-kernel@vger.kernel.org>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Function fimc_dst_set_buf_seq is called by irq handler
so it should not use mutexes. This patch fixes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 7a66f18..9860d38 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -18,6 +18,7 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/spinlock.h>
 
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
@@ -158,7 +159,7 @@ struct fimc_context {
 	struct exynos_drm_ippdrv	ippdrv;
 	struct resource	*regs_res;
 	void __iomem	*regs;
-	struct mutex	lock;
+	spinlock_t	lock;
 	struct clk	*clocks[FIMC_CLKS_MAX];
 	u32		clk_frequency;
 	struct regmap	*sysreg;
@@ -1146,10 +1147,11 @@ static int fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 	u32 cfg;
 	u32 mask = 0x00000001 << buf_id;
 	int ret = 0;
+	unsigned long flags;
 
 	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
 
-	mutex_lock(&ctx->lock);
+	spin_lock_irqsave(&ctx->lock, flags);
 
 	/* mask register set */
 	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
@@ -1183,7 +1185,7 @@ static int fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 		fimc_mask_irq(ctx, false);
 
 err_unlock:
-	mutex_unlock(&ctx->lock);
+	spin_unlock_irqrestore(&ctx->lock, flags);
 	return ret;
 }
 
@@ -1794,7 +1796,7 @@ static int fimc_probe(struct platform_device *pdev)
 
 	DRM_DEBUG_KMS("id[%d]ippdrv[0x%x]\n", ctx->id, (int)ippdrv);
 
-	mutex_init(&ctx->lock);
+	spin_lock_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
 	pm_runtime_set_active(dev);
@@ -1825,7 +1827,6 @@ static int fimc_remove(struct platform_device *pdev)
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 
 	exynos_drm_ippdrv_unregister(ippdrv);
-	mutex_destroy(&ctx->lock);
 
 	fimc_put_clocks(ctx);
 	pm_runtime_set_suspended(dev);
-- 
1.9.1
