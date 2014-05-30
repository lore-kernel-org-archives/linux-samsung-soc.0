From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] drm/exynos: remove unnecessary exynos_hdmi.h file
Date: Fri, 30 May 2014 11:12:08 +0900
Message-ID: <000a01cf7bac$8f805f60$ae811e20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Inki Dae' <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, kernel@stlinux.com, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, 'Dave Airlie' <airlied@redhat.com>, 'Lee Jones' <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The exynos_hdmi.h has been used for the dedicated i2c drivers
that were already removed. Thus, the unnecessary exynos_hdmi.h
should be removed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.h |   23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmi.h

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h b/drivers/gpu/drm/exynos/exynos_hdmi.h
deleted file mode 100644
index 0ddf395..0000000
--- a/drivers/gpu/drm/exynos/exynos_hdmi.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- *
- * Copyright (c) 2011 Samsung Electronics Co., Ltd.
- * Authors:
- *	Inki Dae <inki.dae@samsung.com>
- *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef _EXYNOS_HDMI_H_
-#define _EXYNOS_HDMI_H_
-
-void hdmi_attach_ddc_client(struct i2c_client *ddc);
-void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);
-
-extern struct i2c_driver hdmiphy_driver;
-extern struct i2c_driver ddc_driver;
-
-#endif
-- 
1.7.10.4
