From: zain wang <wzz@rock-chips.com>
Subject: [PATCH v2 1/4] drm/bridge: analogix_dp: prevent runing enable_psr when disabled bridge.
Date: Fri, 30 Sep 2016 20:40:53 +0800
Message-ID: <1475239256-16083-2-git-send-email-wzz@rock-chips.com>
References: <1475239256-16083-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475239256-16083-1-git-send-email-wzz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

When disabled bridge, analogix_dp_enable_psr() may run due to timer was set
by rockchip_drm_do_flush(), in this case we should return -EBUSY.

Signed-off-by: zain wang <wzz@rock-chips.com>

---

Changes in v2:
- add spin_lock to protect dpms_mode

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++++++++++++++++---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 +
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0f2e423..b4ce16a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -98,6 +98,29 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
 	return 0;
 }
 
+static void analogix_dp_set_dpms_mode(struct analogix_dp_device *dp, int mode)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dp->dpms_mode_lock, flags);
+	dp->dpms_mode = mode;
+	spin_unlock_irqrestore(&dp->dpms_mode_lock, flags);
+
+}
+
+static int analogix_dp_get_dpms_mode(struct analogix_dp_device *dp)
+{
+	unsigned long flags;
+	int mode;
+
+	spin_lock_irqsave(&dp->dpms_mode_lock, flags);
+	mode = dp->dpms_mode;
+	spin_unlock_irqrestore(&dp->dpms_mode_lock, flags);
+
+	return mode;
+}
+
+
 int analogix_dp_enable_psr(struct device *dev)
 {
 	struct analogix_dp_device *dp = dev_get_drvdata(dev);
@@ -106,6 +129,9 @@ int analogix_dp_enable_psr(struct device *dev)
 	if (!dp->psr_support)
 		return -EINVAL;
 
+	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
 	psr_vsc.sdp_header.HB0 = 0;
@@ -129,6 +155,9 @@ int analogix_dp_disable_psr(struct device *dev)
 	if (!dp->psr_support)
 		return -EINVAL;
 
+	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
 	psr_vsc.sdp_header.HB0 = 0;
@@ -1073,7 +1102,7 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
 
-	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
+	if (analogix_dp_get_dpms_mode(dp) == DRM_MODE_DPMS_ON)
 		return;
 
 	pm_runtime_get_sync(dp->dev);
@@ -1086,7 +1115,7 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 	enable_irq(dp->irq);
 	analogix_dp_commit(dp);
 
-	dp->dpms_mode = DRM_MODE_DPMS_ON;
+	analogix_dp_set_dpms_mode(dp, DRM_MODE_DPMS_ON);
 }
 
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
@@ -1094,9 +1123,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	struct analogix_dp_device *dp = bridge->driver_private;
 	int ret;
 
-	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
 		return;
 
+	analogix_dp_set_dpms_mode(dp, DRM_MODE_DPMS_OFF);
+
 	if (dp->plat_data->panel) {
 		if (drm_panel_disable(dp->plat_data->panel)) {
 			DRM_ERROR("failed to disable the panel\n");
@@ -1115,8 +1146,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	ret = analogix_dp_prepare_panel(dp, false, true);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
-
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
 static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
@@ -1299,7 +1328,9 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 	dev_set_drvdata(dev, dp);
 
 	dp->dev = &pdev->dev;
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+
+	spin_lock_init(&dp->dpms_mode_lock);
+	analogix_dp_set_dpms_mode(dp, DRM_MODE_DPMS_OFF);
 
 	mutex_init(&dp->panel_lock);
 	dp->panel_is_modeset = false;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 5c6a288..776c844 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -166,6 +166,7 @@ struct analogix_dp_device {
 	struct link_train	link_train;
 	struct phy		*phy;
 	int			dpms_mode;
+	spinlock_t		dpms_mode_lock;
 	int			hpd_gpio;
 	bool                    force_hpd;
 	bool			psr_support;
-- 
1.9.1
