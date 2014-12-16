From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/13] drm/imx: Store correct CRTC index in events
Date: Tue, 16 Dec 2014 17:53:27 +0100
Message-ID: <1418748815-15434-5-git-send-email-thierry.reding@gmail.com>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:61913 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049AbaLPQx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 11:53:58 -0500
Received: by mail-pa0-f53.google.com with SMTP id kq14so14478842pab.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 08:53:57 -0800 (PST)
In-Reply-To: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

A negative pipe causes a special case to be triggered for drivers that
don't have proper VBLANK support. i.MX does support VBLANKs, so there is
no need for the fallback code.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/imx/ipuv3-crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index ebee59cb96d8..df3e8b6101b3 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -209,7 +209,8 @@ static void ipu_crtc_handle_pageflip(struct ipu_crtc *ipu_crtc)
 
 	spin_lock_irqsave(&drm->event_lock, flags);
 	if (ipu_crtc->page_flip_event)
-		drm_send_vblank_event(drm, -1, ipu_crtc->page_flip_event);
+		drm_send_vblank_event(drm, imx_drm_crtc_id(ipu_crtc->imx_crtc),
+				      ipu_crtc->page_flip_event);
 	ipu_crtc->page_flip_event = NULL;
 	imx_drm_crtc_vblank_put(ipu_crtc->imx_crtc);
 	spin_unlock_irqrestore(&drm->event_lock, flags);
-- 
2.1.3
