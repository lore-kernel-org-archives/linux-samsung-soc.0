From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 12/17] drm/exynos/fimc: avoid clearing overflow bits
Date: Thu, 28 Aug 2014 11:07:36 +0200
Message-ID: <1409216861-12452-13-git-send-email-a.hajda@samsung.com>
References: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
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

Overflow bits shall be cleared by H/W.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 34367ff..6dc9c41 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -341,9 +341,6 @@ static bool fimc_check_ovf(struct fimc_context *ctx)
 		fimc_set_bits(ctx, EXYNOS_CIWDOFST,
 			EXYNOS_CIWDOFST_CLROVFIY | EXYNOS_CIWDOFST_CLROVFICB |
 			EXYNOS_CIWDOFST_CLROVFICR);
-		fimc_clear_bits(ctx, EXYNOS_CIWDOFST,
-			EXYNOS_CIWDOFST_CLROVFIY | EXYNOS_CIWDOFST_CLROVFICB |
-			EXYNOS_CIWDOFST_CLROVFICR);
 
 		dev_err(ippdrv->dev, "occurred overflow at %d, status 0x%x.\n",
 			ctx->id, status);
-- 
1.9.1
