From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 11/11] drm/exynos/hdmi: add 85.5MHz pixel clock for v14
 HDMI PHY
Date: Fri, 29 Sep 2017 12:05:42 +0200
Message-ID: <20170929100542.12849-12-a.hajda@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100550eucas1p28b5fbc7fd3fedeafc0632a6401158dbf@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42666 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751922AbdI2KFy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 06:05:54 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Daniel Drake <drake@endlessm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Daniel Drake <drake@endlessm.com>

Configuration details from Samsung. This enables 1366x768@60Hz,
which also needs the 256px timing hack to work around a mixer
limitation.

Signed-off-by: Daniel Drake <drake@endlessm.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
[a.hajda@samsung.com: rebased onto proposed patchset]
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 11 ++++++++++-
 drivers/gpu/drm/exynos/exynos_mixer.c |  4 +++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 4b081f6cfdcb..ee45accb81c7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -296,6 +296,15 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
 			0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
 		},
 	},
+	{
+		.pixel_clock = 85500000,
+		.conf = {
+			0x01, 0xd1, 0x24, 0x11, 0x40, 0x40, 0xd0, 0x08,
+			0x84, 0xa0, 0xd6, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x90, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
 	{
 		.pixel_clock = 106500000,
 		.conf = {
@@ -1248,7 +1257,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	 * first line is distorted.
 	 */
 	if ((m->vdisplay != am->vdisplay) &&
-	    (m->hdisplay == 1280 || m->hdisplay == 1024))
+	    (m->hdisplay == 1280 || m->hdisplay == 1024 || m->hdisplay == 1366))
 		hquirk = 258;
 
 	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 85d33137cfd8..59ab31eec1bb 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1014,7 +1014,9 @@ static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
 	    (w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
 		return MODE_OK;
 
-	if ((w == 1024 && h == 768) || (w == 1280 && h == 1024))
+	if ((w == 1024 && h == 768) ||
+	    (w == 1366 && h == 768) ||
+	    (w == 1280 && h == 1024))
 		return MODE_OK;
 
 	return MODE_BAD;
-- 
2.14.1
