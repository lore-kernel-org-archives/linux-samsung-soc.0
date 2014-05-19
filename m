From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 8/8] drm/exynos/fimc: simplify and rename fimc_dst_get_buf_seq
Date: Mon, 19 May 2014 12:54:10 +0200
Message-ID: <1400496850-23860-9-git-send-email-a.hajda@samsung.com>
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

fimc_dst_get_buf_seq returns number of buffers
so the name should be fimc_dst_get_buf_count.
Function body has been simplified.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 9860d38..831dde9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -58,7 +58,6 @@
 #define FIMC_SHFACTOR	10
 #define FIMC_BUF_STOP	1
 #define FIMC_BUF_START	2
-#define FIMC_REG_SZ		32
 #define FIMC_WIDTH_ITU_709	1280
 #define FIMC_REFRESH_MAX	60
 #define FIMC_REFRESH_MIN	12
@@ -1123,16 +1122,13 @@ static int fimc_dst_set_size(struct device *dev, int swap,
 	return 0;
 }
 
-static int fimc_dst_get_buf_seq(struct fimc_context *ctx)
+static int fimc_dst_get_buf_count(struct fimc_context *ctx)
 {
-	u32 cfg, i, buf_num = 0;
-	u32 mask = 0x00000001;
+	u32 cfg, buf_num;
 
 	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
 
-	for (i = 0; i < FIMC_REG_SZ; i++)
-		if (cfg & (mask << i))
-			buf_num++;
+	buf_num = hweight32(cfg);
 
 	DRM_DEBUG_KMS("buf_num[%d]\n", buf_num);
 
@@ -1176,12 +1172,12 @@ static int fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 
 	/* interrupt enable */
 	if (buf_type == IPP_BUF_ENQUEUE &&
-	    fimc_dst_get_buf_seq(ctx) >= FIMC_BUF_START)
+	    fimc_dst_get_buf_count(ctx) >= FIMC_BUF_START)
 		fimc_mask_irq(ctx, true);
 
 	/* interrupt disable */
 	if (buf_type == IPP_BUF_DEQUEUE &&
-	    fimc_dst_get_buf_seq(ctx) <= FIMC_BUF_STOP)
+	    fimc_dst_get_buf_count(ctx) <= FIMC_BUF_STOP)
 		fimc_mask_irq(ctx, false);
 
 err_unlock:
-- 
1.9.1
