From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 04/14] drm/exynos: add TE handler to support LCD I80
 interface
Date: Thu, 17 Jul 2014 18:01:19 +0900
Message-ID: <1405587689-1466-5-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

To support LCD I80 interface, the panel should generate
Tearing Effect synchronization signal between MCU and FB
to display video images.
And the display controller should trigger to transfer
video image at this signal.
So the panel receives the TE IRQ, then calls these handler
chains to notify it to the display controller.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 ++++++++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 7 +++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 3bf091d..b68e58f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -511,3 +511,11 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 
 	return -EPERM;
 }
+
+void exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
+{
+	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+
+	if (manager->ops->te_handler)
+		manager->ops->te_handler(manager);
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 9f74b10..690dcdd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -36,4 +36,11 @@ void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 					unsigned int out_type);
 
+/*
+ * This function calls the crtc device(manager)'s te_handler() callback
+ * to trigger to transfer video image at the tearing effect synchronization
+ * signal.
+ */
+void exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 02f3b3d..13be498 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -186,6 +186,8 @@ struct exynos_drm_display {
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
+ * @te_handler: trigger to transfer video image at the tearing effect
+ *	synchronization signal if there is a page flip request.
  */
 struct exynos_drm_manager;
 struct exynos_drm_manager_ops {
@@ -204,6 +206,7 @@ struct exynos_drm_manager_ops {
 	void (*win_commit)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_enable)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_disable)(struct exynos_drm_manager *mgr, int zpos);
+	void (*te_handler)(struct exynos_drm_manager *mgr);
 };
 
 /*
-- 
1.9.0
