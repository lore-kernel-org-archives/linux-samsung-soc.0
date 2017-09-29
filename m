From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 10/11] drm/exynos/mixer: enable support for 1024x768 and
 1280x1024 modes
Date: Fri, 29 Sep 2017 12:05:41 +0200
Message-ID: <20170929100542.12849-11-a.hajda@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100549eucas1p29a39ec9db45d6009f23b89fd2d6b77f9@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50420 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752063AbdI2KFx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 06:05:53 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Since HDMI can handle these modes despite of MIXER limitations let's
enable them.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 8baa93f80106..85d33137cfd8 100644
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
2.14.1
