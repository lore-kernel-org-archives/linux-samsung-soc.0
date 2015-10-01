From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RESEND] drm/exynos: Staticize local function in exynos_drm_gem.c
Date: Thu, 01 Oct 2015 14:21:40 +0900
Message-ID: <1443676900-32215-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52542 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbbJAFV5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Oct 2015 01:21:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

The exynos_drm_gem_mmap_buffer() is not used outside so make it static.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index f12fbc36b120..ba9cadb9acef 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -313,7 +313,7 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 	drm_gem_object_unreference_unlocked(obj);
 }
 
-int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem_obj *exynos_gem_obj,
+static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem_obj *exynos_gem_obj,
 				      struct vm_area_struct *vma)
 {
 	struct drm_device *drm_dev = exynos_gem_obj->base.dev;
-- 
1.9.1
