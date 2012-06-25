From: Subash Patel <subashrp@gmail.com>
Subject: [PATCH 1/2] DRM: Exynos: return NULL if exynos_pages_to_sg fails
Date: Mon, 25 Jun 2012 11:16:21 -0700
Message-ID: <1340648182-28329-2-git-send-email-subash.ramaswamy@linaro.org>
References: <1340648182-28329-1-git-send-email-subash.ramaswamy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57846 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754093Ab2FYSQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jun 2012 14:16:53 -0400
Received: by pbbrp8 with SMTP id rp8so6891226pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jun 2012 11:16:53 -0700 (PDT)
In-Reply-To: <1340648182-28329-1-git-send-email-subash.ramaswamy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: subash.ramaswamy@linaro.org
Cc: Subash Patel <subash.rp@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org, inki.dae@samsung.com, airlied@redhat.com, olofj@chromium.org

From: Subash Patel <subash.rp@samsung.com>

exynos_pages_to_sg() internally calls sg_kmalloc() which can return
no pages when the system is under high memory crunch. One such instance
is chromeos-install in the chromeos. This patch adds check for the return
value of the function in subject to return NULL on failure.

Change-Id: I541ed30491a926ebe72738225041c9f2d88007bc
Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-samsung-soc@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org
CC: inki.dae@samsung.com
CC: airlied@redhat.com
CC: olofj@chromium.org
---
 drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
index 97325c1..52cf761 100644
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
-- 
1.7.9.5
