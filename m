From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 01/24] drm/bridge: allow optionally specifying an .owner device
Date: Fri, 27 Apr 2018 00:31:16 +0200
Message-ID: <20180426223139.16740-2-peda@axentia.se>
References: <20180426223139.16740-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426223139.16740-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@collabora.com>, Martin Donnelly <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.>
List-Id: linux-samsung-soc@vger.kernel.org

Bridge drivers can now (temporarily, in a transition phase) select if
they want to provide a full owner or keep just providing an of_node.

By providing a full owner device, the bridge drivers no longer need
to provide an of_node since that node is available via the owner
device.

When all bridge drivers provide an owner device, that will become
mandatory and the .of_node member will be removed.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/drm_bridge.c | 3 ++-
 include/drm/drm_bridge.h     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1638bfe9627c..67147673fdeb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -365,7 +365,8 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	mutex_lock(&bridge_lock);
 
 	list_for_each_entry(bridge, &bridge_list, list) {
-		if (bridge->of_node == np) {
+		if ((bridge->owner && bridge->owner->of_node == np) ||
+		    bridge->of_node == np) {
 			mutex_unlock(&bridge_lock);
 			return bridge;
 		}
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3270fec46979..c28a75ad0ae2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -254,6 +254,7 @@ struct drm_bridge_timings {
 
 /**
  * struct drm_bridge - central DRM bridge control structure
+ * @owner: device that owns the bridge
  * @dev: DRM device this bridge belongs to
  * @encoder: encoder to which this bridge is connected
  * @next: the next bridge in the encoder chain
@@ -265,6 +266,7 @@ struct drm_bridge_timings {
  * @driver_private: pointer to the bridge driver's internal context
  */
 struct drm_bridge {
+	struct device *owner;
 	struct drm_device *dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *next;
-- 
2.11.0
