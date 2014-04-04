From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 2/2] drm/exynos/fbdev: don't set mode_config.fb_base
Date: Fri,  4 Apr 2014 17:22:02 +0800
Message-ID: <1396603322-13585-2-git-send-email-djkurtz@chromium.org>
References: <1396603322-13585-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1396603322-13585-1-git-send-email-djkurtz@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

AFAICT, the fb_base of a drm_device's mode_config is never used.  It isn't
accessed by core drm, it isn't used by fbmem, and it isn't exposed to user
space.

Furthermore, it is probably supposed to be a physical address, not the
dma address mapped to the display controller, so this is just wrong.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 2dcc589..3270a36 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -121,7 +121,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 	offset = fbi->var.xoffset * (fb->bits_per_pixel >> 3);
 	offset += fbi->var.yoffset * fb->pitches[0];
 
-	dev->mode_config.fb_base = (resource_size_t)buffer->dma_addr;
 	fbi->screen_base = buffer->kvaddr + offset;
 	fbi->screen_size = size;
 
-- 
1.9.1.423.g4596e3a
