Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com [45.254.49.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110882C15B0;
	Tue, 10 Mar 2026 01:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106270; cv=none; b=WmInWfrTZ20thzDPwEwEzTZaZCx7Xt30JLjuA9yIcBfwS52fOFhXrJxXKAx10lDcWNSoQP8uNVjD/1DHERzbYklwwiwVURgQhdi5mqbLYwYeSEwRzWjBc1tX99u7gy9uAE7gMybaYTzGqpHV+ot4jRf1ba9qEpU/ZDmxj7RRfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106270; c=relaxed/simple;
	bh=x2yu7UY6Yola+1bq0Oh1KpCr9cE9t0DIXdTggUxeBMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VgPhYKF5b2hEXJ0aUbuiC/73GThrGokduxqHR8qIq1Wl5g5m3JMdoMW+BvlNrMM2qfzROx+ipe4iLtqgYk0FKgwWF8J7z6FEXxIYmrmqcOymXQ2ORHRuF6DioQhRawpFt3oKDfayPSF/1LO3ygxpUCS4j/n0LE9zx/bi4mT5Az0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GIDVY3lS; arc=none smtp.client-ip=45.254.49.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GIDVY3lS"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3653ae861;
	Tue, 10 Mar 2026 09:25:55 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v10 13/18] drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
Date: Tue, 10 Mar 2026 09:24:53 +0800
Message-Id: <20260310012458.169272-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310012458.169272-1-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd559c19403a3kunm2771af5030e07d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04aT1ZDTk0ZHk8eSBhJH0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=GIDVY3lS6aiM199KWVZP6jXtM/cDc3oNGnvNjf03AnlcyQ+MhvCgw6x368SIi8sHk7TPUGepNS0SMS1EnztxJ40umbf+1SmBf+wInfJ424fgTo4JZhBp58VfxYk5ZIUE/KszcA9DETB9hhPHtaPEJs9P1xoeIc2IbJFgvYlRFRQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SjS5hoz5lALYwIBYUHhAR12nD30o7Vp6mbmnlUx69mY=;
	h=date:mime-version:subject:message-id:from;

Since the panel/bridge should logically be positioned behind the
Analogix bridge in the display pipeline, it makes sense to handle
the panel/bridge parsing on the Analogix side. Therefore, we add
a new API analogix_dp_finish_probe(), which combines the panel/bridge
parsing with component addition, to do it.

In order to process component binding right after the probe completes,
the &analogix_dp_plat_data.ops is newly added to pass &component_ops,
for which the &dp_aux_ep_device_with_data.done_probing() of DP AUX bus
only supports passing &drm_dp_aux.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.
- Remame API analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP.

Changes in v9:
- Add Tested-by tag.

Changes in v10:
- Fix to use dev_err_probe() in analogix_dp_finish_probe().
- Expand the commit message.
---
 drivers/gpu/drm/bridge/analogix/Kconfig       |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 46 +++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |  2 +
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c..964122b5bd39 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -29,6 +29,7 @@ config DRM_ANALOGIX_ANX78XX
 config DRM_ANALOGIX_DP
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_DP_AUX_BUS
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 81c6e81dd352..b112df52cabf 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -20,12 +20,14 @@
 #include <linux/platform_device.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1581,6 +1583,50 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
 
+static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_device *dp = to_dp(aux);
+	struct analogix_dp_plat_data *plat_data = dp->plat_data;
+	int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
+	int ret;
+
+	/*
+	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
+	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
+	 * mode applications.
+	 */
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
+					  &plat_data->panel, &plat_data->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	return component_add(dp->dev, plat_data->ops);
+}
+
+int analogix_dp_finish_probe(struct analogix_dp_device *dp)
+{
+	int ret;
+
+	ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
+	if (ret) {
+		/*
+		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
+		 * not be called because there are no EP devices. Then the callback function
+		 * analogix_dp_aux_done_probing() will be called directly in order to support
+		 * the other valid DT configurations.
+		 *
+		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
+		 */
+		if (ret != -ENODEV)
+			return dev_err_probe(dp->dev, ret, "failed to populate aux bus\n");
+
+		return analogix_dp_aux_done_probing(&dp->aux);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
+
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
 MODULE_DESCRIPTION("Analogix DP Core Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3428ffff24c5..bae969dec63a 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	const struct component_ops *ops;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
@@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
 
 struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
 struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
+int analogix_dp_finish_probe(struct analogix_dp_device *dp);
 
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1

