From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 3/3] drm/exynos: hdmi: avoid duplicating drm_bridge_attach
Date: Wed,  2 May 2018 09:40:25 +0200
Message-ID: <20180502074025.12421-4-peda@axentia.se>
References: <20180502074025.12421-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502074025.12421-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

drm_bridge_attach takes care of these assignments, so there is no need
to open-code them a second time.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index abd84cbcf1c2..09c4bc0b1859 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -954,8 +954,6 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 	drm_mode_connector_attach_encoder(connector, encoder);
 
 	if (hdata->bridge) {
-		encoder->bridge = hdata->bridge;
-		hdata->bridge->encoder = encoder;
 		ret = drm_bridge_attach(encoder, hdata->bridge, NULL);
 		if (ret)
 			DRM_ERROR("Failed to attach bridge\n");
-- 
2.11.0
