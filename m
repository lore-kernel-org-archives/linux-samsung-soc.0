From: Subash Patel <subashrp@gmail.com>
Subject: [PATCH] DRM: exynos: return NULL if exynos_pages_to_sg fails
Date: Fri, 22 Jun 2012 18:12:38 -0700
Message-ID: <1340413958-23125-1-git-send-email-subash.ramaswamy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:36604 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756848Ab2FWBNP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jun 2012 21:13:15 -0400
Received: by dady13 with SMTP id y13so3005536dad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jun 2012 18:13:15 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: olofj@chromium.org, inki.dae@samsung.com, airlied@redhat.com, Subash Patel <subash.rp@samsung.com>, Subash Patel <subash.ramaswamy@linaro.org>

From: Subash Patel <subash.rp@samsung.com>

exynos_pages_to_sg() internally calls sg_kmalloc() which can return
no pages when the system is under high memory crunch. One such instance
is chromeos-install in the chromeos. This patch adds check for the return
value of the function in subject to return NULL on failure.

Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-samsung-soc@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org
CC: inki.dae@samsung.com
CC: airlied@redhat.com
CC: olofj@chromium.org
---
 drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
index 97325c1..c908a29 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
@@ -87,6 +87,10 @@ static struct sg_table *
 	npages = buf->size / buf->page_size;
 
 	sgt = exynos_pages_to_sg(buf->pages, npages, buf->page_size);
+	if (!sgt) {
+		DRM_DEBUG_PRIME("exynos_pages_to_sg returned NULL!\n");
+		goto err_unlock;
+	}
 	nents = dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir);
 
 	DRM_DEBUG_PRIME("npages = %d buffer size = 0x%lx page_size = 0x%lx\n",
@@ -241,7 +245,7 @@ struct drm_gem_object *exynos_dmabuf_prime_import(struct drm_device *drm_dev,
 
 
 	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
-	if (IS_ERR(sgt)) {
+	if (IS_ERR_OR_NULL(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto err_buf_detach;
 	}
-- 
1.7.9.5
