Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF0374178
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500552; cv=none; b=fDjNJsNhH2n7JVwEeHLUpuxBAhxgqO2dOYlpYRoE/N1xg4JWjWXeMcCHbOCDWb5PHoRGXxaMJ4d9dD1B2xuqAPl2mOVRecoq3hNibbMgv8bMePDLgT7tVPv9dpnzh7/YUQmQAjHFW/VVagF7Sfg+oMA+0Ygo4+ffovKjhTQEJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500552; c=relaxed/simple;
	bh=hSrZy6li3cZ74X6+K/gIfRTTiR1I7cEqV78C27wxXjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2rmahWNmffBaCKvdrW5lnCI8lcjf9870lsCC2WF+H/AJlqWy76y1umQNIqt/4Xw/DWCw+Ch5EqrCgT7T30LQt4kqiM1hr12LFS2hFsuICDViW9RudBJpeFh6Lfa5hJ3QI5BkEbRlTr7HVpZSYTXpHkzp/5+XYI6TXMs9KwD5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB14C75A92;
	Mon, 11 May 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68010593A3;
	Mon, 11 May 2026 11:55:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MH4qGL/DAWoERgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 11 May 2026 11:55:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	m.szyprowski@samsung.com,
	wens@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/5] drm/exynos: fbdev: Inline exynos_drm_fbdev_update()
Date: Mon, 11 May 2026 13:54:32 +0200
Message-ID: <20260511115538.57884-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511115538.57884-1-tzimmermann@suse.de>
References: <20260511115538.57884-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: AB14C75A92
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 

Inline exynos_drm_fbdev_update() into its only caller. Prepares the
code for using DRM client buffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 35 ++++++-----------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index d283ded266d5..1c564edd497e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -54,26 +54,6 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.fb_destroy	= exynos_drm_fb_destroy,
 };
 
-static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
-				   struct drm_fb_helper_surface_size *sizes,
-				   struct exynos_drm_gem *exynos_gem)
-{
-	struct fb_info *fbi = helper->info;
-	struct drm_framebuffer *fb = helper->fb;
-	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
-
-	fbi->fbops = &exynos_drm_fb_ops;
-
-	drm_fb_helper_fill_info(fbi, helper, sizes);
-
-	fbi->flags |= FBINFO_VIRTFB;
-	fbi->screen_buffer = exynos_gem->kvaddr;
-	fbi->screen_size = size;
-	fbi->fix.smem_len = size;
-
-	return 0;
-}
-
 static const struct drm_fb_helper_funcs exynos_drm_fbdev_helper_funcs = {
 };
 
@@ -82,6 +62,7 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 {
 	struct exynos_drm_gem *exynos_gem;
 	struct drm_device *dev = helper->dev;
+	struct fb_info *info = helper->info;
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
 	unsigned long size;
 	int ret;
@@ -115,15 +96,17 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	}
 	helper->funcs = &exynos_drm_fbdev_helper_funcs;
 
-	ret = exynos_drm_fbdev_update(helper, sizes, exynos_gem);
-	if (ret < 0)
-		goto err_destroy_framebuffer;
+	info->fbops = &exynos_drm_fb_ops;
+
+	drm_fb_helper_fill_info(info, helper, sizes);
+
+	info->flags |= FBINFO_VIRTFB;
+	info->screen_buffer = exynos_gem->kvaddr;
+	info->screen_size = size;
+	info->fix.smem_len = size;
 
 	return 0;
 
-err_destroy_framebuffer:
-	drm_framebuffer_cleanup(helper->fb);
-	helper->fb = NULL;
 err_destroy_gem:
 	exynos_drm_gem_destroy(exynos_gem);
 	return ret;
-- 
2.54.0

