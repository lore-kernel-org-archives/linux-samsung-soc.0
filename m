From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: fimd: fix buffer size calculation
Date: Mon, 13 Apr 2015 09:28:59 +0200
Message-ID: <1428910167-14698-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Daniel Stone <daniels@collabora.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit adacb228d72b9529f8de0769cc33414c3012054d ("drm: Exynos: Respect
framebuffer pitch for FIMD/Mixer") changed the way of buffer size
calcularion: it replaced fb_width by fb_pitch entry. fb_pitch however
already contains '(win_data->bpp >> 3)' factor, so it should be removed
from final buffer size calculation formula. This patch fixes this issue,
solving possible IOMMU page fault caused by FIMD module accessing memory
outside of the given display buffer.

Signed-off by: Marek Szyprowski <m.szyprowski@samsung.com>
CC: stable@vger.kernel.org  # v4.0+
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0e93ed792224..f29a13e0524c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -689,7 +689,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = plane->pitch * plane->crtc_height * (plane->bpp >> 3);
+	size = plane->pitch * plane->crtc_height;
 	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
-- 
1.9.2
