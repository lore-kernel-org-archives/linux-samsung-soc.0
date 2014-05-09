From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: remove unnecessary dedicated i2c drivers
Date: Fri, 09 May 2014 19:46:59 +0900
Message-ID: <1399632419-8251-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63628 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945AbaEIKrX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 06:47:23 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5A00B0ZZAX4980@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 May 2014 19:47:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, inki.dae@samsung.com
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, sw0312.kim@samsung.com

The i2c drivers for ddc and hdmiphy are already removed from build
and instead, i2c clients registered via devicetree are used. So this
patch removes the unnecessary i2c drivers.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_ddc.c     |   63 ------------------------------
 drivers/gpu/drm/exynos/exynos_hdmiphy.c |   65 -------------------------------
 2 files changed, 0 insertions(+), 128 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_ddc.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy.c

diff --git a/drivers/gpu/drm/exynos/exynos_ddc.c b/drivers/gpu/drm/exynos/exynos_ddc.c
deleted file mode 100644
index 6a8c84e..0000000
--- a/drivers/gpu/drm/exynos/exynos_ddc.c
+++ /dev/null
@@ -1,63 +0,0 @@
-/*
- * Copyright (C) 2011 Samsung Electronics Co.Ltd
- * Authors:
- *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *	Inki Dae <inki.dae@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- */
-
-#include <drm/drmP.h>
-
-#include <linux/kernel.h>
-#include <linux/i2c.h>
-#include <linux/of.h>
-
-#include "exynos_drm_drv.h"
-#include "exynos_hdmi.h"
-
-static int s5p_ddc_probe(struct i2c_client *client,
-			const struct i2c_device_id *dev_id)
-{
-	hdmi_attach_ddc_client(client);
-
-	dev_info(&client->adapter->dev,
-		"attached %s into i2c adapter successfully\n",
-		client->name);
-
-	return 0;
-}
-
-static int s5p_ddc_remove(struct i2c_client *client)
-{
-	dev_info(&client->adapter->dev,
-		"detached %s from i2c adapter successfully\n",
-		client->name);
-
-	return 0;
-}
-
-static struct of_device_id hdmiddc_match_types[] = {
-	{
-		.compatible = "samsung,exynos5-hdmiddc",
-	}, {
-		.compatible = "samsung,exynos4210-hdmiddc",
-	}, {
-		/* end node */
-	}
-};
-
-struct i2c_driver ddc_driver = {
-	.driver = {
-		.name = "exynos-hdmiddc",
-		.owner = THIS_MODULE,
-		.of_match_table = hdmiddc_match_types,
-	},
-	.probe		= s5p_ddc_probe,
-	.remove		= s5p_ddc_remove,
-	.command		= NULL,
-};
diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
deleted file mode 100644
index 59abb14..0000000
--- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * Copyright (C) 2011 Samsung Electronics Co.Ltd
- * Authors:
- *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *	Inki Dae <inki.dae@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- */
-
-#include <drm/drmP.h>
-
-#include <linux/kernel.h>
-#include <linux/i2c.h>
-#include <linux/of.h>
-
-#include "exynos_drm_drv.h"
-#include "exynos_hdmi.h"
-
-
-static int hdmiphy_probe(struct i2c_client *client,
-	const struct i2c_device_id *id)
-{
-	hdmi_attach_hdmiphy_client(client);
-
-	dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
-		"into i2c adapter successfully\n");
-
-	return 0;
-}
-
-static int hdmiphy_remove(struct i2c_client *client)
-{
-	dev_info(&client->adapter->dev, "detached s5p_hdmiphy "
-		"from i2c adapter successfully\n");
-
-	return 0;
-}
-
-static struct of_device_id hdmiphy_match_types[] = {
-	{
-		.compatible = "samsung,exynos5-hdmiphy",
-	}, {
-		.compatible = "samsung,exynos4210-hdmiphy",
-	}, {
-		.compatible = "samsung,exynos4212-hdmiphy",
-	}, {
-		/* end node */
-	}
-};
-
-struct i2c_driver hdmiphy_driver = {
-	.driver = {
-		.name	= "exynos-hdmiphy",
-		.owner	= THIS_MODULE,
-		.of_match_table = hdmiphy_match_types,
-	},
-	.probe		= hdmiphy_probe,
-	.remove		= hdmiphy_remove,
-	.command		= NULL,
-};
-EXPORT_SYMBOL(hdmiphy_driver);
-- 
1.7.4.1
