From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 9/9] drm/exynos: modify goto labels to meaningful names
Date: Mon, 14 Apr 2014 15:09:54 +0900
Message-ID: <1397455794-7759-10-git-send-email-inki.dae@samsung.com>
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

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   40 +++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index cdd74e2..1d1c604 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -508,56 +508,56 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 #ifdef CONFIG_DRM_EXYNOS_DSI
 	ret = platform_driver_register(&dsi_driver);
 	if (ret < 0)
-		goto out_dsi;
+		goto err_unregister_dp;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	ret = platform_driver_register(&fimd_driver);
 	if (ret < 0)
-		goto out_fimd;
+		goto err_unregister_dsi;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	ret = platform_driver_register(&hdmi_driver);
 	if (ret < 0)
-		goto out_hdmi;
+		goto err_unregister_fimd;
 	ret = platform_driver_register(&mixer_driver);
 	if (ret < 0)
-		goto out_mixer;
+		goto err_unregister_hdmi;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	ret = platform_driver_register(&g2d_driver);
 	if (ret < 0)
-		goto out_g2d;
+		goto err_unregister_mixer;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
 	ret = platform_driver_register(&fimc_driver);
 	if (ret < 0)
-		goto out_fimc;
+		goto err_unregister_g2d;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_ROTATOR
 	ret = platform_driver_register(&rotator_driver);
 	if (ret < 0)
-		goto out_rotator;
+		goto err_unregister_fimc;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_GSC
 	ret = platform_driver_register(&gsc_driver);
 	if (ret < 0)
-		goto out_gsc;
+		goto err_unregister_rotator;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	ret = platform_driver_register(&ipp_driver);
 	if (ret < 0)
-		goto out_ipp;
+		goto err_unregister_gsc;
 
 	ret = exynos_platform_device_ipp_register();
 	if (ret < 0)
-		goto out_ipp_dev;
+		goto err_unregister_ipp;
 #endif
 
 	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
@@ -568,46 +568,46 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
-out_ipp_dev:
+err_unregister_ipp:
 	platform_driver_unregister(&ipp_driver);
-out_ipp:
+err_unregister_gsc:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_GSC
 	platform_driver_unregister(&gsc_driver);
-out_gsc:
+err_unregister_rotator:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_ROTATOR
 	platform_driver_unregister(&rotator_driver);
-out_rotator:
+err_unregister_fimc:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
 	platform_driver_unregister(&fimc_driver);
-out_fimc:
+err_unregister_g2d:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	platform_driver_unregister(&g2d_driver);
-out_g2d:
+err_unregister_mixer:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	platform_driver_unregister(&mixer_driver);
-out_mixer:
+err_unregister_hdmi:
 	platform_driver_unregister(&hdmi_driver);
-out_hdmi:
+err_unregister_fimd:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	platform_driver_unregister(&fimd_driver);
-out_fimd:
+err_unregister_dsi:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DSI
 	platform_driver_unregister(&dsi_driver);
-out_dsi:
+err_unregister_dp:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DP
-- 
1.7.9.5
