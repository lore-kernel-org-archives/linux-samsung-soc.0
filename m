From: Subash Patel <subashrp@gmail.com>
Subject: [PATCH 2/2] DRM: Exynos: check for null in return value of dma_buf_map_attachment()
Date: Mon, 25 Jun 2012 11:22:57 -0700
Message-ID: <1340648577-28402-3-git-send-email-subash.ramaswamy@linaro.org>
References: <1340648577-28402-1-git-send-email-subash.ramaswamy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63260 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753837Ab2FYSXv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jun 2012 14:23:51 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so5671886dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jun 2012 11:23:51 -0700 (PDT)
In-Reply-To: <1340648577-28402-1-git-send-email-subash.ramaswamy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: olofj@chromium.org, inki.dae@samsung.com, airlied@redhat.com, Subash Patel <subash.rp@samsung.com>, Subash Patel <subash.ramaswamy@linaro.org>

From: Subash Patel <subash.rp@samsung.com>

dma_buf_map_attachment() can return NULL and valid sg as return
value. Hence the check for the returned scatter-gather must be using
the inline function IS_ERR_OR_NULL() in place of IS_ERR()

Change-Id: I33218480e220f6a26a1e726b336bf533a95363de
Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-samsung-soc@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org
CC: inki.dae@samsung.com
CC: airlied@redhat.com
CC: olofj@chromium.org
---
 drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
index 52cf761..c908a29 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
@@ -245,7 +245,7 @@ struct drm_gem_object *exynos_dmabuf_prime_import(struct drm_device *drm_dev,
 
 
 	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
-	if (IS_ERR(sgt)) {
+	if (IS_ERR_OR_NULL(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto err_buf_detach;
 	}
-- 
1.7.9.5
