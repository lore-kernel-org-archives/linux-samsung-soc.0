From: Zain Wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 6/6] drm: bridge/analogix: enable vop standby when entry PSR
Date: Tue, 18 Oct 2016 14:22:36 +0800
Message-ID: <1476771756-12045-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mika Kahola <mika.kahola-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

make VOP standby when entry PSR to save some power.

Signed-off-by: zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 29 ++++++++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h     |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 19 ++++++++++++++++
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 1c2d756..e0f3ed3 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -113,6 +113,13 @@ static void analogix_dp_psr_work(struct work_struct *work)
 	if (!crtc)
 		return;
 
+	spin_lock_irqsave(&dp->psr_lock, flags);
+	psr_state = dp->psr_state;
+	spin_unlock_irqrestore(&dp->psr_lock, flags);
+
+	if (psr_state != EDP_VSC_PSR_STATE_ACTIVE)
+		rockchip_drm_vop_set_standby(crtc, false);
+
 	vact_end = crtc->mode.vtotal - crtc->mode.vsync_start + crtc->mode.vdisplay;
 
 	ret = rockchip_drm_wait_line_flag(dp->encoder.crtc, vact_end,
@@ -122,14 +129,20 @@ static void analogix_dp_psr_work(struct work_struct *work)
 		return;
 	}
 
-	spin_lock_irqsave(&dp->psr_lock, flags);
-	psr_state = dp->psr_state;
-	spin_unlock_irqrestore(&dp->psr_lock, flags);
-
-	if (psr_state == EDP_VSC_PSR_STATE_ACTIVE)
-		analogix_dp_enable_psr(dp->dev);
-	else
-		analogix_dp_disable_psr(dp->dev);
+	if (psr_state == EDP_VSC_PSR_STATE_ACTIVE) {
+		ret = analogix_dp_enable_psr(dp->dev);
+		if (ret) {
+			dev_err(dp->dev, "failed to enable psr\n");
+			return;
+		}
+		rockchip_drm_vop_set_standby(crtc, true);
+	} else {
+		ret = analogix_dp_disable_psr(dp->dev);
+		if (ret) {
+			dev_err(dp->dev, "failed to disable psr\n");
+			return;
+		}
+	}
 }
 
 static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index fb6226c..7149c69 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -74,5 +74,6 @@ void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
 				    struct device *dev);
 int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
 				unsigned int mstimeout);
+void rockchip_drm_vop_set_standby(struct drm_crtc *crtc, bool enabled);
 
 #endif /* _ROCKCHIP_DRM_DRV_H_ */
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 1740a0b..13eabda 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1478,6 +1478,25 @@ int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
 }
 EXPORT_SYMBOL(rockchip_drm_wait_line_flag);
 
+void rockchip_drm_vop_set_standby(struct drm_crtc *crtc, bool enabled)
+{
+	struct vop *vop = to_vop(crtc);
+
+	if (!crtc || !vop->is_enabled)
+		return;
+
+	spin_lock(&vop->reg_lock);
+
+	if (enabled)
+		VOP_CTRL_SET(vop, standby, 1);
+	else
+		VOP_CTRL_SET(vop, standby, 0);
+
+	spin_unlock(&vop->reg_lock);
+
+}
+EXPORT_SYMBOL(rockchip_drm_vop_set_standby);
+
 static int vop_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-- 
1.9.1
