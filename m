From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 13/14] drm: bridge/analogix_dp: move hpd detect to connector detect function
Date: Wed, 19 Aug 2015 09:52:19 -0500
Message-ID: <1439995939-18770-1-git-send-email-ykk@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: djkurtz@google.com, dianders@google.com, seanpaul@google.com, Takashi Iwai <tiwai@suse.de>, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v3:
- move dp hpd detect to connector detect function.

Changes in v2: None

 drivers/gpu/drm/bridge/analogix_dp_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix_dp_core.c
index 75dd44a..052b9b3 100644
--- a/drivers/gpu/drm/bridge/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix_dp_core.c
@@ -915,12 +915,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 			DRM_ERROR("failed to disable the panel\n");
 	}
 
-	ret = analogix_dp_detect_hpd(dp);
-	if (ret) {
-		/* Cable has been disconnected, we're done */
-		return;
-	}
-
 	ret = analogix_dp_handle_edid(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to handle edid\n");
@@ -953,6 +947,12 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 static enum drm_connector_status analogix_dp_detect(
 				struct drm_connector *connector, bool force)
 {
+	struct analogix_dp_device *dp = connector_to_dp(connector);
+
+	if (analogix_dp_detect_hpd(dp))
+		/* Cable has been disconnected, we're done */
+		return connector_status_disconnected;
+
 	return connector_status_connected;
 }
 
-- 
1.9.1
