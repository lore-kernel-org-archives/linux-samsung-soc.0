From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC V2 1/3] drm: implement chaining of drm bridges
Date: Tue, 06 May 2014 01:22:26 +0530
Message-ID: <1399319548-16567-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

As of now, we can have only one bridge hanging off the encoder.
With this patch, we allow multiple bridges to hang onto the same encoder
with the use of a simple next_bridge ptr.

The drm core calls bridge->funcs for the first bridge which
is attached to it, and its upto the individual bridge drivers
to call bridge->funcs for the next bridge in the chain.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/drm_crtc.c | 13 ++++++++++++-
 include/drm/drm_crtc.h     |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index d8b7099..fe9905f 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -918,8 +918,10 @@ EXPORT_SYMBOL(drm_connector_unplug_all);
  * Zero on success, error code on failure.
  */
 int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
-		const struct drm_bridge_funcs *funcs)
+			struct drm_encoder *encoder,
+			const struct drm_bridge_funcs *funcs)
 {
+	struct drm_bridge *temp;
 	int ret;
 
 	drm_modeset_lock_all(dev);
@@ -931,6 +933,15 @@ int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
 	bridge->dev = dev;
 	bridge->funcs = funcs;
 
+	if (encoder->bridge) {
+		temp = encoder->bridge;
+		while (temp->next_bridge)
+			temp = temp->next_bridge;
+
+		temp->next_bridge = bridge;
+	} else
+		encoder->bridge = bridge;
+
 	list_add_tail(&bridge->head, &dev->mode_config.bridge_list);
 	dev->mode_config.num_bridge++;
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index e55fccb..bb6ed88 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -619,6 +619,7 @@ struct drm_bridge_funcs {
 struct drm_bridge {
 	struct drm_device *dev;
 	struct list_head head;
+	struct drm_bridge *next_bridge;
 
 	struct drm_mode_object base;
 
@@ -862,6 +863,7 @@ extern void drm_connector_cleanup(struct drm_connector *connector);
 extern void drm_connector_unplug_all(struct drm_device *dev);
 
 extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
+			   struct drm_encoder *encoder,
 			   const struct drm_bridge_funcs *funcs);
 extern void drm_bridge_cleanup(struct drm_bridge *bridge);
 
-- 
1.8.1.2
