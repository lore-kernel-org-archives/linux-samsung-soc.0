From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 1/2] drm/exynos: refactor drm drivers registration code
Date: Fri, 11 Apr 2014 16:11:27 +0200
Message-ID: <1397225488-6634-2-git-send-email-a.hajda@samsung.com>
References: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch removes driver registration code based on preprocessor conditionals.
Instead it uses private linker section to create array of drm drivers.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Makefile             |   2 +
 drivers/gpu/drm/exynos/exynos_dp_core.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm.lds.S     |   9 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.c     | 203 +++++-----------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  18 ++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c        |   2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c       |   2 +-
 15 files changed, 68 insertions(+), 186 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm.lds.S

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 33ae365..c8190c1 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -22,4 +22,6 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_FIMC)	+= exynos_drm_fimc.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_ROTATOR)	+= exynos_drm_rotator.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_GSC)	+= exynos_drm_gsc.o
 
+exynosdrm-y				+= exynos_drm.lds
+
 obj-$(CONFIG_DRM_EXYNOS)		+= exynosdrm.o
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index aed533b..9385e96 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1340,7 +1340,7 @@ static const struct of_device_id exynos_dp_match[] = {
 	{},
 };
 
-struct platform_driver dp_driver = {
+EXYNOS_DRM_DRV(dp_driver) = {
 	.probe		= exynos_dp_probe,
 	.remove		= exynos_dp_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm.lds.S b/drivers/gpu/drm/exynos/exynos_drm.lds.S
new file mode 100644
index 0000000..fd37dc1
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm.lds.S
@@ -0,0 +1,9 @@
+SECTIONS
+{
+	.data : {
+		. = ALIGN(8);
+		exynos_drm_drivers = .;
+		*(exynos_drm_drivers)
+		*(exynos_drm_drivers_last)
+	}
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2d27ba2..5067b32 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -430,7 +430,7 @@ static const struct dev_pm_ops exynos_drm_pm_ops = {
 			exynos_drm_runtime_resume, NULL)
 };
 
-static struct platform_driver exynos_drm_platform_driver = {
+EXYNOS_DRM_DRV_LAST(exynos_drm_drv) = {
 	.probe		= exynos_drm_platform_probe,
 	.remove		= exynos_drm_platform_remove,
 	.driver		= {
@@ -440,197 +440,64 @@ static struct platform_driver exynos_drm_platform_driver = {
 	},
 };
 
-static int __init exynos_drm_init(void)
+static int exynos_platform_device_drm_register(void)
 {
-	int ret;
-
-#ifdef CONFIG_DRM_EXYNOS_DP
-	ret = platform_driver_register(&dp_driver);
-	if (ret < 0)
-		goto out_dp;
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_DSI
-	ret = platform_driver_register(&dsi_driver);
-	if (ret < 0)
-		goto out_dsi;
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_FIMD
-	ret = platform_driver_register(&fimd_driver);
-	if (ret < 0)
-		goto out_fimd;
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_HDMI
-	ret = platform_driver_register(&hdmi_driver);
-	if (ret < 0)
-		goto out_hdmi;
-	ret = platform_driver_register(&mixer_driver);
-	if (ret < 0)
-		goto out_mixer;
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	ret = platform_driver_register(&vidi_driver);
-	if (ret < 0)
-		goto out_vidi;
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_G2D
-	ret = platform_driver_register(&g2d_driver);
-	if (ret < 0)
-		goto out_g2d;
-#endif
+	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
+							  NULL, 0);
+	if (IS_ERR(exynos_drm_pdev))
+		return PTR_ERR(exynos_drm_pdev);
 
-#ifdef CONFIG_DRM_EXYNOS_FIMC
-	ret = platform_driver_register(&fimc_driver);
-	if (ret < 0)
-		goto out_fimc;
-#endif
+	return 0;
+}
 
-#ifdef CONFIG_DRM_EXYNOS_ROTATOR
-	ret = platform_driver_register(&rotator_driver);
-	if (ret < 0)
-		goto out_rotator;
-#endif
+static void exynos_platform_device_drm_unregister(void)
+{
+	platform_device_unregister(exynos_drm_pdev);
+}
 
-#ifdef CONFIG_DRM_EXYNOS_GSC
-	ret = platform_driver_register(&gsc_driver);
-	if (ret < 0)
-		goto out_gsc;
-#endif
+extern struct platform_driver exynos_drm_drivers;
 
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	ret = platform_driver_register(&ipp_driver);
-	if (ret < 0)
-		goto out_ipp;
+static int __init exynos_drm_init(void)
+{
+	struct platform_driver *pd = &exynos_drm_drivers;
+	int ret;
 
 	ret = exynos_platform_device_ipp_register();
 	if (ret < 0)
-		goto out_ipp_dev;
-#endif
+		return ret;
 
-	ret = platform_driver_register(&exynos_drm_platform_driver);
+	ret = exynos_platform_device_drm_register();
 	if (ret < 0)
-		goto out_drm;
-
-	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
-				NULL, 0);
-	if (IS_ERR(exynos_drm_pdev)) {
-		ret = PTR_ERR(exynos_drm_pdev);
-		goto out;
+		goto err_dev;
+
+	while (pd <= &exynos_drm_drv) {
+		pr_debug("%s: registering %s\n", __func__, pd->driver.name);
+		ret = platform_driver_register(pd);
+		if (ret < 0)
+			goto err;
+		++pd;
 	}
 
 	return 0;
-
-out:
-	platform_driver_unregister(&exynos_drm_platform_driver);
-
-out_drm:
-#ifdef CONFIG_DRM_EXYNOS_IPP
+err:
+	while (pd-- > &exynos_drm_drivers)
+		platform_driver_unregister(pd);
+err_dev:
 	exynos_platform_device_ipp_unregister();
-out_ipp_dev:
-	platform_driver_unregister(&ipp_driver);
-out_ipp:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_GSC
-	platform_driver_unregister(&gsc_driver);
-out_gsc:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_ROTATOR
-	platform_driver_unregister(&rotator_driver);
-out_rotator:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_FIMC
-	platform_driver_unregister(&fimc_driver);
-out_fimc:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_G2D
-	platform_driver_unregister(&g2d_driver);
-out_g2d:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	platform_driver_unregister(&vidi_driver);
-out_vidi:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_HDMI
-	platform_driver_unregister(&mixer_driver);
-out_mixer:
-	platform_driver_unregister(&hdmi_driver);
-out_hdmi:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_FIMD
-	platform_driver_unregister(&fimd_driver);
-out_fimd:
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_DSI
-	platform_driver_unregister(&dsi_driver);
-out_dsi:
-#endif
 
-#ifdef CONFIG_DRM_EXYNOS_DP
-	platform_driver_unregister(&dp_driver);
-out_dp:
-#endif
 	return ret;
 }
 
 static void __exit exynos_drm_exit(void)
 {
-	platform_device_unregister(exynos_drm_pdev);
+	struct platform_driver *pd = &exynos_drm_drv + 1;
 
-	platform_driver_unregister(&exynos_drm_platform_driver);
+	while (--pd >= &exynos_drm_drivers)
+		platform_driver_unregister(pd);
 
-#ifdef CONFIG_DRM_EXYNOS_IPP
+	exynos_platform_device_drm_unregister();
 	exynos_platform_device_ipp_unregister();
-	platform_driver_unregister(&ipp_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_GSC
-	platform_driver_unregister(&gsc_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_ROTATOR
-	platform_driver_unregister(&rotator_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_FIMC
-	platform_driver_unregister(&fimc_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_G2D
-	platform_driver_unregister(&g2d_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_HDMI
-	platform_driver_unregister(&mixer_driver);
-	platform_driver_unregister(&hdmi_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	platform_driver_unregister(&vidi_driver);
-#endif
 
-#ifdef CONFIG_DRM_EXYNOS_FIMD
-	platform_driver_unregister(&fimd_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_DSI
-	platform_driver_unregister(&dsi_driver);
-#endif
-
-#ifdef CONFIG_DRM_EXYNOS_DP
-	platform_driver_unregister(&dp_driver);
-#endif
 }
 
 module_init(exynos_drm_init);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c5cf68..3917200 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -351,15 +351,13 @@ int exynos_platform_device_hdmi_register(void);
  */
 void exynos_platform_device_hdmi_unregister(void);
 
-/*
- * this function registers exynos drm ipp platform device.
- */
+#ifdef CONFIG_DRM_EXYNOS_IPP
 int exynos_platform_device_ipp_register(void);
-
-/*
- * this function unregisters exynos drm ipp platform device if it exists.
- */
 void exynos_platform_device_ipp_unregister(void);
+#else
+static inline int exynos_platform_device_ipp_register() { return 0; }
+static inline void exynos_platform_device_ipp_unregister() {}
+#endif
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
 int exynos_dpi_probe(struct device *dev);
@@ -369,6 +367,12 @@ static inline int exynos_dpi_probe(struct device *dev) { return 0; }
 static inline int exynos_dpi_remove(struct device *dev) { return 0; }
 #endif
 
+#define EXYNOS_DRM_DRV(name) \
+	static struct platform_driver name __section(exynos_drm_drivers)
+
+#define EXYNOS_DRM_DRV_LAST(name) \
+	static struct platform_driver name __section(exynos_drm_drivers_last)
+
 extern struct platform_driver dp_driver;
 extern struct platform_driver dsi_driver;
 extern struct platform_driver fimd_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index eb73e3b..56230e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1507,7 +1507,7 @@ static struct of_device_id exynos_dsi_of_match[] = {
 	{ }
 };
 
-struct platform_driver dsi_driver = {
+EXYNOS_DRM_DRV(dsi_driver) = {
 	.probe = exynos_dsi_probe,
 	.remove = exynos_dsi_remove,
 	.driver = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 30d76b2..0865d5d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1945,7 +1945,7 @@ static const struct of_device_id fimc_of_match[] = {
 	{ },
 };
 
-struct platform_driver fimc_driver = {
+EXYNOS_DRM_DRV(fimc_driver) = {
 	.probe		= fimc_probe,
 	.remove		= fimc_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fd6cc..a0f5037 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -937,7 +937,7 @@ static int fimd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver fimd_driver = {
+EXYNOS_DRM_DRV(fimd_driver) = {
 	.probe		= fimd_probe,
 	.remove		= fimd_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 6c1885e..2eb4676 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1541,7 +1541,7 @@ static const struct of_device_id exynos_g2d_match[] = {
 	{},
 };
 
-struct platform_driver g2d_driver = {
+EXYNOS_DRM_DRV(g2d_driver) = {
 	.probe		= g2d_probe,
 	.remove		= g2d_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index fa75059..76b15fd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1796,7 +1796,7 @@ static const struct dev_pm_ops gsc_pm_ops = {
 	SET_RUNTIME_PM_OPS(gsc_runtime_suspend, gsc_runtime_resume, NULL)
 };
 
-struct platform_driver gsc_driver = {
+EXYNOS_DRM_DRV(gsc_driver) = {
 	.probe		= gsc_probe,
 	.remove		= gsc_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 09312b8..1393486 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1973,7 +1973,7 @@ static const struct dev_pm_ops ipp_pm_ops = {
 	SET_RUNTIME_PM_OPS(ipp_runtime_suspend, ipp_runtime_resume, NULL)
 };
 
-struct platform_driver ipp_driver = {
+EXYNOS_DRM_DRV(ipp_driver) = {
 	.probe		= ipp_probe,
 	.remove		= ipp_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 7b90168..625fd9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -849,7 +849,7 @@ static const struct dev_pm_ops rotator_pm_ops = {
 									NULL)
 };
 
-struct platform_driver rotator_driver = {
+EXYNOS_DRM_DRV(rotator_driver) = {
 	.probe		= rotator_probe,
 	.remove		= rotator_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 7afead9..976a8fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -632,7 +632,7 @@ static int vidi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver vidi_driver = {
+EXYNOS_DRM_DRV(vidi_driver) = {
 	.probe		= vidi_probe,
 	.remove		= vidi_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9a6d652..3e659e9 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2175,7 +2175,7 @@ static int hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver hdmi_driver = {
+EXYNOS_DRM_DRV(hdmi_driver) = {
 	.probe		= hdmi_probe,
 	.remove		= hdmi_remove,
 	.driver		= {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ce28881..b978bde 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1250,7 +1250,7 @@ static int mixer_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver mixer_driver = {
+EXYNOS_DRM_DRV(mixer_driver) = {
 	.driver = {
 		.name = "exynos-mixer",
 		.owner = THIS_MODULE,
-- 
1.8.3.2
