From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/9] drm/modes: add polarization handling to mode conversion
Date: Mon, 17 Mar 2014 11:27:23 +0100
Message-ID: <1395052045-23848-8-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:33353 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaCQK2E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 06:28:04 -0400
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Denis Carikli <denis@eukrea.com>

The patch adds conversion of DISPLAY_FLAGS_DE_* and DISPLAY_FLAGS_PIXDATA_*
flags to pol_flags in drm_display_mode_from_videomode function.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/drm_modes.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index b073315..5dbff8d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -537,6 +537,17 @@ int drm_display_mode_from_videomode(const struct videomode *vm,
 		dmode->flags |= DRM_MODE_FLAG_DBLSCAN;
 	if (vm->flags & DISPLAY_FLAGS_DOUBLECLK)
 		dmode->flags |= DRM_MODE_FLAG_DBLCLK;
+
+	dmode->pol_flags = 0;
+	if (vm->flags & DISPLAY_FLAGS_DE_LOW)
+		dmode->pol_flags |= DRM_MODE_FLAG_POL_DE_NEGEDGE;
+	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
+		dmode->pol_flags |= DRM_MODE_FLAG_POL_DE_POSEDGE;
+	if (vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+		dmode->pol_flags |= DRM_MODE_FLAG_POL_PIXDATA_NEGEDGE;
+	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
+		dmode->pol_flags |= DRM_MODE_FLAG_POL_PIXDATA_POSEDGE;
+
 	drm_mode_set_name(dmode);
 
 	return 0;
-- 
1.8.3.2
