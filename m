From: zain wang <wzz@rock-chips.com>
Subject: [PATCH v1 1/4] drm/bridge: analogix_dp: prevent runing enable_psr when disabled bridge.
Date: Thu, 29 Sep 2016 22:46:37 +0800
Message-ID: <1475160400-30782-2-git-send-email-wzz@rock-chips.com>
References: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

When disabled bridge, analogix_dp_enable_psr() may run due to timer was set
by rockchip_drm_do_flush(), in this case we should return -EBUSY.

Signed-off-by: zain wang <wzz@rock-chips.com>

---

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0f2e423..206529a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -106,6 +106,9 @@ int analogix_dp_enable_psr(struct device *dev)
 	if (!dp->psr_support)
 		return -EINVAL;
 
+	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
 	psr_vsc.sdp_header.HB0 = 0;
@@ -129,6 +132,9 @@ int analogix_dp_disable_psr(struct device *dev)
 	if (!dp->psr_support)
 		return -EINVAL;
 
+	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
 	psr_vsc.sdp_header.HB0 = 0;
@@ -1097,6 +1103,8 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
+	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+
 	if (dp->plat_data->panel) {
 		if (drm_panel_disable(dp->plat_data->panel)) {
 			DRM_ERROR("failed to disable the panel\n");
@@ -1115,8 +1123,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	ret = analogix_dp_prepare_panel(dp, false, true);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
-
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
 static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
-- 
1.9.1
