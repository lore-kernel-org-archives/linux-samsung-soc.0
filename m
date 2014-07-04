From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] drm/exynos: fimd: Keep power enabled during fimd_bind
Date: Fri,  4 Jul 2014 16:03:19 +0530
Message-ID: <1404469999-21147-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Under some conditions (when IOMMU is enabled), fimd_bind() accesses
hardware registers and power-domain should be enabled during that time.

fimd_bind --> fimd_mgr_initialize --> fimd_clear_channel

If the power-domain is disabled by that time, we get a boot-time crash.
It would be better to keep power-domain enabled explicitly.

Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0180034
Internal error: : 1008 [#1] PREEMPT SMP ARM
...
PC is at fimd_bind+0x84/0x134
LR is at component_bind_all+0xb4/0x1d8

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 33161ad..34275fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -888,11 +888,15 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct fimd_context *ctx = fimd_manager.ctx;
 	struct drm_device *drm_dev = data;
 
+	pm_runtime_get_sync(dev);
+
 	fimd_mgr_initialize(&fimd_manager, drm_dev);
 	exynos_drm_crtc_create(&fimd_manager);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
+	pm_runtime_put_sync(dev);
+
 	return 0;
 
 }
-- 
1.7.9.5
