From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 10/10] drm/exynos/mixer: enable support for 1024x768 and
 1280x1024 modes
Date: Wed, 06 Sep 2017 12:37:00 +0200
Message-ID: <1504694220-15818-11-git-send-email-a.hajda@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103732eucas1p16966a1fd86daf50dc2b5217dfb90785d@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51620 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbdIFKhf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:37:35 -0400
In-reply-to: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Since HDMI can handle these modes despite of MIXER limitations lets
enable them.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 5aae82b..108dccb 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1014,6 +1014,9 @@ static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
 		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
 		return MODE_OK;
 
+	if ((w == 1024 && h == 768) || (w == 1280 && h == 1024))
+		return MODE_OK;
+
 	return MODE_BAD;
 }
 
-- 
2.7.4
