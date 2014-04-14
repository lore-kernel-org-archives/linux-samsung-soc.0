From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 8/9] drm/exynos: fix comment to exynos_drm_device_subdrv_prove
 call
Date: Mon, 14 Apr 2014 15:09:53 +0900
Message-ID: <1397455794-7759-9-git-send-email-inki.dae@samsung.com>
References: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

subdrv_probe callback of virtual display driver will be
called by exynos_drm_device_subdrv_probe() to create crtc
and encoder/connector for virtual display driver.
So it fixes comments to exynos_drm_device_subdrv probe call.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 63dabba..cdd74e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -101,7 +101,7 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_cleanup_vblank;
 
-	/* Probe non kms sub drivers. */
+	/* Probe non kms sub drivers and virtual display driver. */
 	ret = exynos_drm_device_subdrv_probe(dev);
 	if (ret)
 		goto err_unbind_all;
-- 
1.7.9.5
