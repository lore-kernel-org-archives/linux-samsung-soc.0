From: Inki Dae <inki.dae@samsung.com>
Subject: [RFC PATCH 2/3] drm/exynos: make non kms drivers to be indenpendent
 modules
Date: Wed, 19 Nov 2014 00:26:43 +0900
Message-ID: <1416324404-28153-3-git-send-email-inki.dae@samsung.com>
References: <1416324404-28153-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26693 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757214AbaKRP0t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 10:26:49 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF8001LVQWM0920@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 00:26:46 +0900 (KST)
In-reply-to: <1416324404-28153-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch makes non kms drivers to be independent modules.
For this, it removes all register codes to non kms drivers
from exynos_drm_drv module and adds module_init/exit
for each non kms driver so that each non kms driver can be
called independently.

In addition, this patch adds non kms register/unregister functions
to exynos_drm_core module and also modifies existing codes relevant
to sub driver.

The idea is that non kms driver is registered by entry point,
module_init, of each non kms driver and sets its own sub driver
to registered non kms driver object when the sub driver is probed.
For this, this patch adds a new structure, exynos_drm_non_kms_dev,
to exynos_drm_core module.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_core.c    |  166 +++++++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   50 +-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |   28 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |   34 ++++++
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   12 ++
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |   39 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   13 +++
 8 files changed, 265 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index 4c9f972..2ce63bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -19,6 +19,13 @@
 #include "exynos_drm_fbdev.h"
 
 static LIST_HEAD(exynos_drm_subdrv_list);
+DEFINE_MUTEX(list_lock);
+
+struct exynos_drm_non_kms_dev {
+	struct list_head list;
+	struct exynos_drm_subdrv *subdrv;
+	unsigned int device_type;
+};
 
 int exynos_drm_create_enc_conn(struct drm_device *dev,
 					struct exynos_drm_display *display)
@@ -55,12 +62,66 @@ err_destroy_encoder:
 	return ret;
 }
 
+int exynos_drm_non_kms_register(unsigned int device_type)
+{
+	struct exynos_drm_non_kms_dev *dev;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->device_type = device_type;
+
+	mutex_lock(&list_lock);
+	list_add_tail(&dev->list, &exynos_drm_subdrv_list);
+	mutex_unlock(&list_lock);
+
+	return 0;
+}
+
+void exynos_drm_non_kms_unregister(unsigned int device_type)
+{
+	struct exynos_drm_non_kms_dev *dev, *next;
+
+	mutex_lock(&list_lock);
+	list_for_each_entry_safe(dev, next, &exynos_drm_subdrv_list, list) {
+		mutex_unlock(&list_lock);
+		if (dev->device_type == device_type) {
+			list_del_init(&dev->list);
+			kfree(dev);
+			mutex_lock(&list_lock);
+			break;
+		}
+		mutex_lock(&list_lock);
+	}
+	mutex_unlock(&list_lock);
+}
+
 int exynos_drm_subdrv_register(struct exynos_drm_subdrv *subdrv)
 {
+	struct exynos_drm_non_kms_dev *dev;
+
 	if (!subdrv)
 		return -EINVAL;
 
-	list_add_tail(&subdrv->list, &exynos_drm_subdrv_list);
+	mutex_lock(&list_lock);
+	if (list_empty(&exynos_drm_subdrv_list)) {
+		mutex_unlock(&list_lock);
+		return -ENODEV;
+	}
+	mutex_unlock(&list_lock);
+
+	mutex_lock(&list_lock);
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		mutex_unlock(&list_lock);
+		if (dev->device_type == subdrv->device_type) {
+			dev->subdrv = subdrv;
+			mutex_lock(&list_lock);
+			break;
+		}
+		mutex_lock(&list_lock);
+	}
+	mutex_unlock(&list_lock);
 
 	return 0;
 }
@@ -68,94 +129,151 @@ EXPORT_SYMBOL_GPL(exynos_drm_subdrv_register);
 
 int exynos_drm_subdrv_unregister(struct exynos_drm_subdrv *subdrv)
 {
+	struct exynos_drm_non_kms_dev *dev;
+
 	if (!subdrv)
 		return -EINVAL;
 
-	list_del(&subdrv->list);
+	mutex_lock(&list_lock);
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		mutex_unlock(&list_lock);
+		if (dev->device_type == subdrv->device_type) {
+			dev->subdrv = NULL;
+			break;
+		}
+		mutex_lock(&list_lock);
+	}
+	mutex_unlock(&list_lock);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(exynos_drm_subdrv_unregister);
 
-int exynos_drm_device_subdrv_probe(struct drm_device *dev)
+int exynos_drm_device_subdrv_probe(struct drm_device *drm_dev)
 {
-	struct exynos_drm_subdrv *subdrv, *n;
+	struct exynos_drm_non_kms_dev *dev, *n;
 	int err;
 
-	if (!dev)
+	if (!drm_dev)
 		return -EINVAL;
 
-	list_for_each_entry_safe(subdrv, n, &exynos_drm_subdrv_list, list) {
+	mutex_lock(&list_lock);
+	if (list_empty(&exynos_drm_subdrv_list)) {
+		mutex_unlock(&list_lock);
+		return -EPROBE_DEFER;
+	}
+
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		mutex_unlock(&list_lock);
+
+		/* Retry to probe if there is sub driver not registered yet. */
+		if (!dev->subdrv) {
+			return -EPROBE_DEFER;
+		}
+		mutex_lock(&list_lock);
+	}
+
+	list_for_each_entry_safe(dev, n, &exynos_drm_subdrv_list, list) {
+		struct exynos_drm_subdrv *subdrv = dev->subdrv;
+
+		mutex_unlock(&list_lock);
 		if (subdrv->probe) {
-			subdrv->drm_dev = dev;
+			subdrv->drm_dev = drm_dev;
 
 			/*
 			 * this probe callback would be called by sub driver
 			 * after setting of all resources to this sub driver,
 			 * such as clock, irq and register map are done.
 			 */
-			err = subdrv->probe(dev, subdrv->dev);
+			err = subdrv->probe(drm_dev, subdrv->dev);
 			if (err) {
 				DRM_DEBUG("exynos drm subdrv probe failed.\n");
-				list_del(&subdrv->list);
+				list_del_init(&dev->list);
+				mutex_lock(&list_lock);
 				continue;
 			}
 		}
+		mutex_lock(&list_lock);
 	}
+	mutex_unlock(&list_lock);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(exynos_drm_device_subdrv_probe);
 
-int exynos_drm_device_subdrv_remove(struct drm_device *dev)
+int exynos_drm_device_subdrv_remove(struct drm_device *drm_dev)
 {
-	struct exynos_drm_subdrv *subdrv;
+	struct exynos_drm_non_kms_dev *dev;
 
-	if (!dev) {
+	if (!drm_dev) {
 		WARN(1, "Unexpected drm device unregister!\n");
 		return -EINVAL;
 	}
 
-	list_for_each_entry(subdrv, &exynos_drm_subdrv_list, list) {
+	mutex_lock(&list_lock);
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		struct exynos_drm_subdrv *subdrv = dev->subdrv;
+
+		mutex_unlock(&list_lock);
 		if (subdrv->remove)
-			subdrv->remove(dev, subdrv->dev);
+			subdrv->remove(drm_dev, subdrv->dev);
+		mutex_lock(&list_lock);
 	}
+	mutex_unlock(&list_lock);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(exynos_drm_device_subdrv_remove);
 
-int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file)
+int exynos_drm_subdrv_open(struct drm_device *drm_dev, struct drm_file *file)
 {
-	struct exynos_drm_subdrv *subdrv;
+	struct exynos_drm_non_kms_dev *dev;
 	int ret;
 
-	list_for_each_entry(subdrv, &exynos_drm_subdrv_list, list) {
+	mutex_lock(&list_lock);
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		struct exynos_drm_subdrv *subdrv = dev->subdrv;
+
+		mutex_unlock(&list_lock);
 		if (subdrv->open) {
-			ret = subdrv->open(dev, subdrv->dev, file);
+			ret = subdrv->open(drm_dev, subdrv->dev, file);
 			if (ret)
 				goto err;
 		}
+		mutex_lock(&list_lock);
 	}
+	mutex_unlock(&list_lock);
 
 	return 0;
 
 err:
-	list_for_each_entry_reverse(subdrv, &subdrv->list, list) {
+	mutex_lock(&list_lock);
+	list_for_each_entry_reverse(dev, &exynos_drm_subdrv_list, list) {
+		struct exynos_drm_subdrv *subdrv = dev->subdrv;
+
+		mutex_unlock(&list_lock);
 		if (subdrv->close)
-			subdrv->close(dev, subdrv->dev, file);
+			subdrv->close(drm_dev, subdrv->dev, file);
+		mutex_lock(&list_lock);
 	}
+	mutex_lock(&list_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(exynos_drm_subdrv_open);
 
-void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file)
+void exynos_drm_subdrv_close(struct drm_device *drm_dev, struct drm_file *file)
 {
-	struct exynos_drm_subdrv *subdrv;
+	struct exynos_drm_non_kms_dev *dev;
+
+	mutex_lock(&list_lock);
+	list_for_each_entry(dev, &exynos_drm_subdrv_list, list) {
+		struct exynos_drm_subdrv *subdrv = dev->subdrv;
 
-	list_for_each_entry(subdrv, &exynos_drm_subdrv_list, list) {
+		mutex_unlock(&list_lock);
 		if (subdrv->close)
-			subdrv->close(dev, subdrv->dev, file);
+			subdrv->close(drm_dev, subdrv->dev, file);
+		mutex_lock(&list_lock);
 	}
+	mutex_unlock(&list_lock);
 }
 EXPORT_SYMBOL_GPL(exynos_drm_subdrv_close);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 02d4772..7f1186e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -539,28 +539,10 @@ static const struct component_master_ops exynos_drm_ops = {
 	.unbind		= exynos_drm_unbind,
 };
 
-static struct platform_driver *const exynos_drm_non_kms_drivers[] = {
-#ifdef CONFIG_DRM_EXYNOS_G2D
-	&g2d_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_FIMC
-	&fimc_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_ROTATOR
-	&rotator_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_GSC
-	&gsc_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	&ipp_driver,
-#endif
-};
-
 static int exynos_drm_platform_probe(struct platform_device *pdev)
 {
 	struct component_match *match;
-	int ret, i, j;
+	int ret;
 
 	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 	exynos_drm_driver.num_ioctls = ARRAY_SIZE(exynos_ioctls);
@@ -574,31 +556,13 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	for (j = 0; j < ARRAY_SIZE(exynos_drm_non_kms_drivers); ++j) {
-		ret = platform_driver_register(exynos_drm_non_kms_drivers[j]);
-		if (ret < 0)
-			goto err_del_component_master;
-	}
-
-	ret = exynos_platform_device_ipp_register();
-	if (ret < 0)
-		goto err_unregister_non_kms_drivers;
-
 	/* Probe non kms sub drivers and virtual display driver. */
 	ret = exynos_drm_device_subdrv_probe(platform_get_drvdata(pdev));
 	if (ret)
-		goto err_unregister_resources;
+		goto err_del_component_master;
 
 	return ret;
 
-err_unregister_resources:
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	exynos_platform_device_ipp_unregister();
-#endif
-err_unregister_non_kms_drivers:
-	while (--j >= 0)
-		platform_driver_unregister(exynos_drm_non_kms_drivers[j]);
-
 err_del_component_master:
 	component_master_del(&pdev->dev, &exynos_drm_ops);
 
@@ -607,17 +571,7 @@ err_del_component_master:
 
 static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
-	int i;
-
 	exynos_drm_device_subdrv_remove(platform_get_drvdata(pdev));
-
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	exynos_platform_device_ipp_unregister();
-#endif
-
-	for (i = ARRAY_SIZE(exynos_drm_non_kms_drivers) - 1; i >= 0; --i)
-		platform_driver_unregister(exynos_drm_non_kms_drivers[i]);
-
 	component_master_del(&pdev->dev, &exynos_drm_ops);
 
 	return 0;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 352a9f9..5b3305c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -41,6 +41,13 @@ enum exynos_drm_output_type {
 	EXYNOS_DISPLAY_TYPE_VIDI,
 };
 
+/* This enumerates non kms device type. */
+enum exynos_drm_non_kms_type {
+	EXYNOS_DRM_NON_KMS_NONE,
+	EXYNOS_DRM_NON_KMS_G2D,
+	EXYNOS_DRM_NON_KMS_IPP,
+};
+
 /*
  * Exynos drm common overlay structure.
  *
@@ -259,10 +266,10 @@ struct exynos_drm_private {
 /*
  * Exynos drm sub driver structure.
  *
- * @list: sub driver has its own list object to register to exynos drm driver.
  * @dev: pointer to device object for subdrv device driver.
  * @drm_dev: pointer to drm_device and this pointer would be set
  *	when sub driver calls exynos_drm_subdrv_register().
+ * @device_type: non kms device type.
  * @probe: this callback would be called by exynos drm driver after
  *     subdrv is registered to it.
  * @remove: this callback is used to release resources created
@@ -271,9 +278,9 @@ struct exynos_drm_private {
  * @close: this would be called with drm device file close.
  */
 struct exynos_drm_subdrv {
-	struct list_head list;
 	struct device *dev;
 	struct drm_device *drm_dev;
+	unsigned int device_type;
 
 	int (*probe)(struct drm_device *drm_dev, struct device *dev);
 	void (*remove)(struct drm_device *drm_dev, struct device *dev);
@@ -294,15 +301,6 @@ int exynos_drm_device_subdrv_remove(struct drm_device *dev);
 int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
-#ifdef CONFIG_DRM_EXYNOS_IPP
-int exynos_platform_device_ipp_register(void);
-void exynos_platform_device_ipp_unregister(void);
-#else
-static inline int exynos_platform_device_ipp_register(void) { return 0; }
-static inline void exynos_platform_device_ipp_unregister(void) {}
-#endif
-
-
 #ifdef CONFIG_DRM_EXYNOS_DPI
 struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
 int exynos_dpi_remove(struct device *dev);
@@ -331,11 +329,9 @@ int exynos_drm_component_add(struct device *dev,
 void exynos_drm_component_del(struct device *dev,
 				enum exynos_drm_device_type dev_type);
 
+extern int exynos_drm_non_kms_register(unsigned int device_type);
+extern void exynos_drm_non_kms_unregister(unsigned int device_type);
+
 extern struct platform_driver exynos_drm_common_hdmi_driver;
 extern struct platform_driver vidi_driver;
-extern struct platform_driver g2d_driver;
-extern struct platform_driver fimc_driver;
-extern struct platform_driver rotator_driver;
-extern struct platform_driver gsc_driver;
-extern struct platform_driver ipp_driver;
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 68d38eb..05000ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1860,3 +1860,16 @@ struct platform_driver fimc_driver = {
 	},
 };
 
+static int fimc_driver_init(void)
+{
+	return platform_driver_register(&fimc_driver);
+}
+
+static void fimc_driver_exit(void)
+{
+	platform_driver_unregister(&fimc_driver);
+}
+
+module_init(fimc_driver_init);
+module_exit(fimc_driver_exit);
+
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 6ff8599..fa37603 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1464,6 +1464,7 @@ static int g2d_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, g2d);
 
 	subdrv = &g2d->subdrv;
+	subdrv->device_type = EXYNOS_DRM_NON_KMS_G2D;
 	subdrv->dev = dev;
 	subdrv->probe = g2d_subdrv_probe;
 	subdrv->remove = g2d_subdrv_remove;
@@ -1585,3 +1586,36 @@ struct platform_driver g2d_driver = {
 		.of_match_table = exynos_g2d_match,
 	},
 };
+
+static int exynos_g2d_init(void)
+{
+	int ret;
+
+	/*
+	 * Register non kms driver only in case that g2d device node exists
+	 * and the device node is enabled.
+	 *
+	 * TODO. this code should be replaced with super device node.
+	 */
+	if (!of_machine_is_compatible("samsung,exynos5250-g2d") &&
+			!of_machine_is_compatible("samsung,exynos4212-g2d"))
+		return -ENODEV;
+
+	ret = exynos_drm_non_kms_register(EXYNOS_DRM_NON_KMS_G2D);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&g2d_driver);
+	if (ret)
+		exynos_drm_non_kms_unregister(EXYNOS_DRM_NON_KMS_G2D);
+
+	return ret;
+}
+
+static void exynos_g2d_exit(void)
+{
+	platform_driver_unregister(&g2d_driver);
+}
+
+module_init(exynos_g2d_init);
+module_exit(exynos_g2d_exit);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index c6a013f..0cbed55 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1799,3 +1799,15 @@ struct platform_driver gsc_driver = {
 	},
 };
 
+static int gsc_driver_init(void)
+{
+	return platform_driver_register(&gsc_driver);
+}
+
+static void gsc_driver_exit(void)
+{
+	platform_driver_unregister(&gsc_driver);
+}
+
+module_init(gsc_driver_init);
+module_exit(gsc_driver_exit);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 00d74b1..559ee65 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -102,7 +102,7 @@ static LIST_HEAD(exynos_drm_ippdrv_list);
 static DEFINE_MUTEX(exynos_drm_ippdrv_lock);
 static BLOCKING_NOTIFIER_HEAD(exynos_drm_ippnb_list);
 
-int exynos_platform_device_ipp_register(void)
+static int exynos_platform_device_ipp_register(void)
 {
 	struct platform_device *pdev;
 
@@ -118,7 +118,7 @@ int exynos_platform_device_ipp_register(void)
 	return 0;
 }
 
-void exynos_platform_device_ipp_unregister(void)
+static void exynos_platform_device_ipp_unregister(void)
 {
 	if (exynos_drm_ipp_pdev) {
 		platform_device_unregister(exynos_drm_ipp_pdev);
@@ -1718,6 +1718,7 @@ static int ipp_probe(struct platform_device *pdev)
 
 	/* set sub driver informations */
 	subdrv = &ctx->subdrv;
+	subdrv->device_type = EXYNOS_DRM_NON_KMS_IPP;
 	subdrv->dev = dev;
 	subdrv->probe = ipp_subdrv_probe;
 	subdrv->remove = ipp_subdrv_remove;
@@ -1773,3 +1774,37 @@ struct platform_driver ipp_driver = {
 	},
 };
 
+static int ipp_driver_init(void)
+{
+	int ret;
+
+	ret = exynos_drm_non_kms_register(EXYNOS_DRM_NON_KMS_IPP);
+	if (ret)
+		return ret;
+
+	ret = exynos_platform_device_ipp_register();
+	if (ret)
+		goto err_unregister_non_kms;
+
+	ret = platform_driver_register(&ipp_driver);
+	if (ret)
+		goto err_unregister_ipp_device;
+
+	return ret;
+
+err_unregister_ipp_device:
+	exynos_platform_device_ipp_unregister();
+err_unregister_non_kms:
+	exynos_drm_non_kms_unregister(EXYNOS_DRM_NON_KMS_IPP);
+
+	return ret;
+}
+
+static void ipp_driver_exit(void)
+{
+	platform_driver_unregister(&ipp_driver);
+}
+
+module_init(ipp_driver_init);
+module_exit(ipp_driver_exit);
+
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index b6a37d4..ffa0166 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -854,3 +854,16 @@ struct platform_driver rotator_driver = {
 		.of_match_table = exynos_rotator_match,
 	},
 };
+
+static int rotator_driver_init(void)
+{
+	return platform_driver_register(&rotator_driver);
+}
+
+static void rotator_driver_exit(void)
+{
+	platform_driver_unregister(&rotator_driver);
+}
+
+module_init(rotator_driver_init);
+module_exit(rotator_driver_exit);
-- 
1.7.9.5
