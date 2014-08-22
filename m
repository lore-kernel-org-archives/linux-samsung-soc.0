From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 15/15] drm/exynos/fimc: fix source buffer registers
Date: Fri, 22 Aug 2014 09:52:26 +0200
Message-ID: <1408693946-15456-16-git-send-email-a.hajda@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

FIMC in default mode of operation uses only one input buffer,
but the driver used also second buffer, as a result only the
first frame was processed correctly. The patch fixes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index b20078e..e985253 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -720,24 +720,24 @@ static int fimc_src_set_addr(struct device *dev,
 	case IPP_BUF_ENQUEUE:
 		config = &property->config[EXYNOS_DRM_OPS_SRC];
 		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
-			EXYNOS_CIIYSA(buf_id));
+			EXYNOS_CIIYSA0);
 
 		if (config->fmt == DRM_FORMAT_YVU420) {
 			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIICBSA(buf_id));
+				EXYNOS_CIICBSA0);
 			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIICRSA(buf_id));
+				EXYNOS_CIICRSA0);
 		} else {
 			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIICBSA(buf_id));
+				EXYNOS_CIICBSA0);
 			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIICRSA(buf_id));
+				EXYNOS_CIICRSA0);
 		}
 		break;
 	case IPP_BUF_DEQUEUE:
-		fimc_write(ctx, 0x0, EXYNOS_CIIYSA(buf_id));
-		fimc_write(ctx, 0x0, EXYNOS_CIICBSA(buf_id));
-		fimc_write(ctx, 0x0, EXYNOS_CIICRSA(buf_id));
+		fimc_write(ctx, 0x0, EXYNOS_CIIYSA0);
+		fimc_write(ctx, 0x0, EXYNOS_CIICBSA0);
+		fimc_write(ctx, 0x0, EXYNOS_CIICRSA0);
 		break;
 	default:
 		/* bypass */
-- 
1.9.1
