From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 09/14] drm: bridge/analogix_dp: add platform device type support
Date: Wed, 19 Aug 2015 09:51:28 -0500
Message-ID: <1439995888-18548-1-git-send-email-ykk@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439995728-18046-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v3: None
Changes in v2:
- Add GNU license v2 declared and samsung copyright

 drivers/gpu/drm/exynos/analogix_dp-exynos.c     |  1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c |  1 +
 include/drm/bridge/analogix_dp.h                | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/exynos/analogix_dp-exynos.c b/drivers/gpu/drm/exynos/analogix_dp-exynos.c
index 17da2c8..b160159 100644
--- a/drivers/gpu/drm/exynos/analogix_dp-exynos.c
+++ b/drivers/gpu/drm/exynos/analogix_dp-exynos.c
@@ -220,6 +220,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	dp->dev = dev;
 	dp->drm_dev = drm_dev;
 
+	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index cebff9e..f2c5c26 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -267,6 +267,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	dp->plat_data.dev_type = RK3288_DP;
 	dp->plat_data.attach = NULL;
 	dp->plat_data.get_modes = NULL;
 	dp->plat_data.power_on = rockchip_dp_poweron;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 8b4ffad..7209a64 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -1,9 +1,25 @@
+/*
+ * Analogix Core DP (Display Port) interface driver.
+ *
+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
 #ifndef _ANALOGIX_DP_H_
 #define _ANALOGIX_DP_H_
 
 #include <drm/drm_crtc.h>
 
+enum analogix_dp_devtype {
+	EXYNOS_DP,
+	RK3288_DP,
+};
+
 struct analogix_dp_plat_data {
+	enum analogix_dp_devtype dev_type;
 	struct drm_panel *panel;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
