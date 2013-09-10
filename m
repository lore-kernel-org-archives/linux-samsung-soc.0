From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] drm/exynos: fix return value check in lowlevel_buffer_allocate()
Date: Wed, 11 Sep 2013 06:56:35 +0800
Message-ID: <CAPgLHd-vMjfQEBfun=c8j7x-FPx_pGoTvOBBwKtmF+LTQjVNQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:58892 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470Ab3IJW4g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 18:56:36 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so3212875bkb.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Sep 2013 15:56:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene.kim@samsung.com
Cc: yongjun_wei@trendmicro.com.cn, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function drm_prime_pages_to_sg() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_buf.c b/drivers/gpu/drm/exynos/exynos_drm_buf.c
index 3445a0f..e3ee833 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_buf.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_buf.c
@@ -90,9 +90,9 @@ static int lowlevel_buffer_allocate(struct drm_device *dev,
 	}
 
 	buf->sgt = drm_prime_pages_to_sg(buf->pages, nr_pages);
-	if (!buf->sgt) {
+	if (IS_ERR(buf->sgt)) {
 		DRM_ERROR("failed to get sg table.\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(buf->sgt);
 		goto err_free_attrs;
 	}
 
