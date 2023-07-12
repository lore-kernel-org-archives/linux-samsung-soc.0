Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED384EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjGLJrW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 Jul 2023 05:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjGLJrV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jul 2023 05:47:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671B0B0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jul 2023 02:47:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRB-0001Gg-5W; Wed, 12 Jul 2023 11:47:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWR9-00Dr3b-JG; Wed, 12 Jul 2023 11:47:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWR8-004GSS-N0; Wed, 12 Jul 2023 11:47:06 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH RFC v1 09/52] drm/exynos: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date:   Wed, 12 Jul 2023 11:46:19 +0200
Message-Id: <20230712094702.1770121-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=In6DzNoxBPTC0Au6RuM9kPD7DeunayqwfIlc13LkkCE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZgjJgmUR+QGukfFuwXwIjGVgj/9Sd/gPGUE ib0KqT+xZCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52YAAKCRCPgPtYfRL+ Tpn+B/9NvoE0bF4V4KSRrj62VIl+cdlzSYRZutuJR4qQSbUs7fAdV3AwbILSOxHt00RJ2ukS6Jl cCZMqwKGL9Gk8bnxD0m7FUuF5bZcuGIM4A78MaQ1cAO2rN54A0Zt0TeJnCILEmDuPD4cvvMU7cg YSu0PTvKasROy047/h94j/Qcr39qqAsBwwcag1r4fF3UznMUkRsu3VLlin9TVrrlrKMDGje7h/D xO4GS1JwJu7zDLU455pLsfEuAmwiG9cJ1YfPC99Co7en3t6QE7IeYnmm+JPuD6O48lzId1EHl8s 4CpdzdsW2nQpoS14eYn89nB1TWp+9q/6NvLO3HulEYjcoUPk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4153f302de7c..c1e2c14ab07d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -40,9 +40,9 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -129,9 +129,9 @@ void exynos_crtc_handle_event(struct exynos_drm_crtc *exynos_crtc)
 
 	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 	drm_crtc_arm_vblank_event(crtc, event);
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 }
 
 static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3..1a8cb7b6af57 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -115,7 +115,7 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	exynos_state->crtc.w = actual_w;
 	exynos_state->crtc.h = actual_h;
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev,
+	DRM_DEV_DEBUG_KMS(crtc->drm_dev->dev,
 			  "plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			  exynos_state->crtc.x, exynos_state->crtc.y,
 			  exynos_state->crtc.w, exynos_state->crtc.h);
@@ -224,7 +224,7 @@ exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 	if (width_ok && height_ok)
 		return 0;
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev, "scaling mode is not supported");
+	DRM_DEV_DEBUG_KMS(crtc->drm_dev->dev, "scaling mode is not supported");
 	return -ENOTSUPP;
 }
 
-- 
2.39.2

