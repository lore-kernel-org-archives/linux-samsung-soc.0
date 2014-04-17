From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 1/5] drm/exynos: modify goto labels to meaningful names
Date: Thu, 17 Apr 2014 14:50:25 +0900
Message-ID: <1397713829-25776-2-git-send-email-inki.dae@samsung.com>
References: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   55 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2d27ba2..b3ba043 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -447,139 +447,138 @@ static int __init exynos_drm_init(void)
 #ifdef CONFIG_DRM_EXYNOS_DP
 	ret = platform_driver_register(&dp_driver);
 	if (ret < 0)
-		goto out_dp;
+		return ret;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DSI
 	ret = platform_driver_register(&dsi_driver);
 	if (ret < 0)
-		goto out_dsi;
+		goto err_unregister_dp_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	ret = platform_driver_register(&fimd_driver);
 	if (ret < 0)
-		goto out_fimd;
+		goto err_unregister_dsi_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	ret = platform_driver_register(&hdmi_driver);
 	if (ret < 0)
-		goto out_hdmi;
+		goto err_unregister_fimd_drv;
 	ret = platform_driver_register(&mixer_driver);
 	if (ret < 0)
-		goto out_mixer;
+		goto err_unregister_hdmi_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
 	ret = platform_driver_register(&vidi_driver);
 	if (ret < 0)
-		goto out_vidi;
+		goto err_unregister_mixer_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	ret = platform_driver_register(&g2d_driver);
 	if (ret < 0)
-		goto out_g2d;
+		goto err_unregister_vidi_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
 	ret = platform_driver_register(&fimc_driver);
 	if (ret < 0)
-		goto out_fimc;
+		goto err_unregister_g2d_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_ROTATOR
 	ret = platform_driver_register(&rotator_driver);
 	if (ret < 0)
-		goto out_rotator;
+		goto err_unregister_fimc_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_GSC
 	ret = platform_driver_register(&gsc_driver);
 	if (ret < 0)
-		goto out_gsc;
+		goto err_unregister_rotator_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	ret = platform_driver_register(&ipp_driver);
 	if (ret < 0)
-		goto out_ipp;
+		goto err_unregister_gsc_drv;
 
 	ret = exynos_platform_device_ipp_register();
 	if (ret < 0)
-		goto out_ipp_dev;
+		goto err_unregister_ipp_drv;
 #endif
 
 	ret = platform_driver_register(&exynos_drm_platform_driver);
 	if (ret < 0)
-		goto out_drm;
+		goto err_unregister_ipp_dev;
 
 	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
 				NULL, 0);
 	if (IS_ERR(exynos_drm_pdev)) {
 		ret = PTR_ERR(exynos_drm_pdev);
-		goto out;
+		goto err_unregister_drm_drv;
 	}
 
 	return 0;
 
-out:
+err_unregister_drm_drv:
 	platform_driver_unregister(&exynos_drm_platform_driver);
 
-out_drm:
+err_unregister_ipp_dev:
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
-out_ipp_dev:
+err_unregister_ipp_drv:
 	platform_driver_unregister(&ipp_driver);
-out_ipp:
+err_unregister_gsc_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_GSC
 	platform_driver_unregister(&gsc_driver);
-out_gsc:
+err_unregister_rotator_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_ROTATOR
 	platform_driver_unregister(&rotator_driver);
-out_rotator:
+err_unregister_fimc_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
 	platform_driver_unregister(&fimc_driver);
-out_fimc:
+err_unregister_g2d_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	platform_driver_unregister(&g2d_driver);
-out_g2d:
+err_unregister_vidi_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
 	platform_driver_unregister(&vidi_driver);
-out_vidi:
+err_unregister_mixer_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	platform_driver_unregister(&mixer_driver);
-out_mixer:
+err_unregister_hdmi_drv:
 	platform_driver_unregister(&hdmi_driver);
-out_hdmi:
+err_unregister_fimd_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	platform_driver_unregister(&fimd_driver);
-out_fimd:
+err_unregister_dsi_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DSI
 	platform_driver_unregister(&dsi_driver);
-out_dsi:
+err_unregister_dp_drv:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DP
 	platform_driver_unregister(&dp_driver);
-out_dp:
 #endif
 	return ret;
 }
-- 
1.7.9.5
