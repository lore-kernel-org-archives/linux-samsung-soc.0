Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A8376BCD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222963; cv=none; b=kvVHr9ipFD2L/S4Cpt6mfqeb03awzE/G5rSerGtROu6gFB2byOIEeOi3JZEu7dyWCr5SIVzU8kfr+xMd31oaLDHhRkRH8wAO1nySlKV7Iozjqxo/IdkcoEG7Br0fEnbp61i3Msflz0LQRW5b+TMN0mwg8SsS3wIdbr7PpVy1Qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222963; c=relaxed/simple;
	bh=nFMr6DAJvKXbA6fyh9CsfTVmCX/Z+JFR5+9YltUcKzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buzlDpJZUfvkkozCB4hG7HZIuEnRLE9opjQA+gsryCx5Bi+K9LosVu4lFjoc3jSQURSeb6iN882HOj12bPEi1qJkPB/bjWSdPIXb7h6YeE63C0xCh3c0y+N8Q3eIaE68GRK/VTyBJ32wRJgwcewPeQRT8BV5F/hJROGGWWmEmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E2415D1FC;
	Fri,  8 May 2026 06:48:51 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0327B593A7;
	Fri,  8 May 2026 06:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YO8pO1KH/Wm1cgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 08 May 2026 06:48:50 +0000
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
Subject: [PATCH v2 4/5] drm/exynos: fbdev: Use a DRM client buffer
Date: Fri,  8 May 2026 08:46:50 +0200
Message-ID: <20260508064842.22689-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508064842.22689-1-tzimmermann@suse.de>
References: <20260508064842.22689-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 4E2415D1FC
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Rspamd-Action: no action

Replace the internal DRM framebuffer with a DRM client buffer. The
client buffer allocates the DRM framebuffer on a file and also uses
GEM object handles via the regular ADDFB2 interfaces.

Using client-buffer interfaces unifies framebuffer allocation for
DRM clients in user space and exynos' internal fbdev emulation. It
also simplifies the clean-up side of the fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 46 ++++++++++++++---------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 9225cf1a83c8..f43ce974c952 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -36,12 +36,10 @@ static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static void exynos_drm_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
 
 	drm_fb_helper_fini(fb_helper);
 
-	drm_framebuffer_remove(fb);
-
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 }
 
@@ -60,14 +58,17 @@ static const struct drm_fb_helper_funcs exynos_drm_fbdev_helper_funcs = {
 int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 					struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_client_dev *client = &helper->client;
+	struct drm_device *dev = client->dev;
+	struct drm_file *file = client->file;
 	struct fb_info *info = helper->info;
 	u32 fourcc, pitch;
 	u64 size;
 	const struct drm_format_info *format;
 	struct exynos_drm_gem *exynos_gem;
 	struct drm_gem_object *obj;
-	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
+	struct drm_client_buffer *buffer;
+	u32 handle;
 	int ret;
 
 	DRM_DEV_DEBUG_KMS(dev->dev,
@@ -85,19 +86,20 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(exynos_gem);
 	obj = &exynos_gem->base;
 
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pixel_format = fourcc;
-	mode_cmd.pitches[0] = pitch;
-	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
-
-	helper->fb = exynos_drm_framebuffer_init(dev, format, &mode_cmd, &exynos_gem, 1);
-	if (IS_ERR(helper->fb)) {
-		DRM_DEV_ERROR(dev->dev, "failed to create drm framebuffer.\n");
-		ret = PTR_ERR(helper->fb);
-		goto err_destroy_gem;
+	ret = drm_gem_handle_create(file, obj, &handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	buffer = drm_client_buffer_create(client, sizes->surface_width, sizes->surface_height,
+					  fourcc, handle, pitch);
+	if (IS_ERR(buffer)) {
+		ret = PTR_ERR(buffer);
+		goto err_drm_gem_handle_delete;
 	}
+
 	helper->funcs = &exynos_drm_fbdev_helper_funcs;
+	helper->buffer = buffer;
+	helper->fb = buffer->fb;
 
 	info->fbops = &exynos_drm_fb_ops;
 
@@ -108,9 +110,17 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	info->screen_size = obj->size;
 	info->fix.smem_len = obj->size;
 
+	/* The handle is only needed for creating the framebuffer. */
+	drm_gem_handle_delete(file, handle);
+
+	/* The framebuffer still holds a reference on the GEM object. */
+	drm_gem_object_put(obj);
+
 	return 0;
 
-err_destroy_gem:
-	exynos_drm_gem_destroy(exynos_gem);
+err_drm_gem_handle_delete:
+	drm_gem_handle_delete(file, handle);
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
 	return ret;
 }
-- 
2.54.0

