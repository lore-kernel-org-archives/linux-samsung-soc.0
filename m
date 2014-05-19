From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/8] drm/exynos/fimc: simplify irq masking function
Date: Mon, 19 May 2014 12:54:07 +0200
Message-ID: <1400496850-23860-6-git-send-email-a.hajda@samsung.com>
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

The name fimc_handle_irq suggests it is irq handler, but the function
is for irq mask configuration. The patch renames the function to
fimc_mask_irq and removes unused arguments.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index d40b7fb..409775f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -290,25 +290,18 @@ static void fimc_handle_jpeg(struct fimc_context *ctx, bool enable)
 	fimc_write(cfg, EXYNOS_CIGCTRL);
 }
 
-static void fimc_handle_irq(struct fimc_context *ctx, bool enable,
-		bool overflow, bool level)
+static void fimc_mask_irq(struct fimc_context *ctx, bool enable)
 {
 	u32 cfg;
 
-	DRM_DEBUG_KMS("enable[%d]overflow[%d]level[%d]\n",
-			enable, overflow, level);
+	DRM_DEBUG_KMS("enable[%d]\n", enable);
 
 	cfg = fimc_read(EXYNOS_CIGCTRL);
 	if (enable) {
-		cfg &= ~(EXYNOS_CIGCTRL_IRQ_OVFEN | EXYNOS_CIGCTRL_IRQ_LEVEL);
-		cfg |= EXYNOS_CIGCTRL_IRQ_ENABLE;
-		if (overflow)
-			cfg |= EXYNOS_CIGCTRL_IRQ_OVFEN;
-		if (level)
-			cfg |= EXYNOS_CIGCTRL_IRQ_LEVEL;
+		cfg &= ~EXYNOS_CIGCTRL_IRQ_OVFEN;
+		cfg |= EXYNOS_CIGCTRL_IRQ_ENABLE | EXYNOS_CIGCTRL_IRQ_LEVEL;
 	} else
-		cfg &= ~(EXYNOS_CIGCTRL_IRQ_OVFEN | EXYNOS_CIGCTRL_IRQ_ENABLE);
-
+		cfg &= ~EXYNOS_CIGCTRL_IRQ_ENABLE;
 	fimc_write(cfg, EXYNOS_CIGCTRL);
 }
 
@@ -1180,12 +1173,12 @@ static int fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 	/* interrupt enable */
 	if (buf_type == IPP_BUF_ENQUEUE &&
 	    fimc_dst_get_buf_seq(ctx) >= FIMC_BUF_START)
-		fimc_handle_irq(ctx, true, false, true);
+		fimc_mask_irq(ctx, true);
 
 	/* interrupt disable */
 	if (buf_type == IPP_BUF_DEQUEUE &&
 	    fimc_dst_get_buf_seq(ctx) <= FIMC_BUF_STOP)
-		fimc_handle_irq(ctx, false, false, true);
+		fimc_mask_irq(ctx, false);
 
 err_unlock:
 	mutex_unlock(&ctx->lock);
@@ -1520,7 +1513,7 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 
 	property = &c_node->property;
 
-	fimc_handle_irq(ctx, true, false, true);
+	fimc_mask_irq(ctx, true);
 
 	for_each_ipp_ops(i) {
 		config = &property->config[i];
@@ -1639,7 +1632,7 @@ static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 		break;
 	}
 
-	fimc_handle_irq(ctx, false, false, true);
+	fimc_mask_irq(ctx, false);
 
 	/* reset sequence */
 	fimc_write(0x0, EXYNOS_CIFCNTSEQ);
-- 
1.9.1
