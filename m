From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: Fix error value in
 exynos_drm_crtc_get_by_type()
Date: Tue, 12 Dec 2017 13:01:15 +0100
Message-ID: <20171212120115.21718-1-m.szyprowski@samsung.com>
References: <CGME20171212120127eucas1p24ffba2df81ab778b50015dcd53fe2576@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37767 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751547AbdLLMBa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 07:01:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>

EPERM is not the correct error value when the driver is not able to get
its resources. Change it to ENODEV.

Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index dc01342e759a..eea90251808f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -228,7 +228,7 @@ struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *drm_dev,
 		if (to_exynos_crtc(crtc)->type == out_type)
 			return to_exynos_crtc(crtc);
 
-	return ERR_PTR(-EPERM);
+	return ERR_PTR(-ENODEV);
 }
 
 int exynos_drm_set_possible_crtcs(struct drm_encoder *encoder,
-- 
2.15.0
