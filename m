Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3193375AD0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500552; cv=none; b=aS7ifVlRY9hpqOTgCWN6lLq6yQIiTp4puyccWA+OnxgBHAihQPrZsPLsgbFvjoanKWDGWg+oFqHOPX5yDcBLRreMOzxntU8+nTAjrqbRqKKJVXPdVSvllb0oquzUdgkoAXplHfrg7wq1ZnFgCe905XRC350zeW5/GZoDE/4fews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500552; c=relaxed/simple;
	bh=mX+10IKJcH3diN8ImCkheX5RY42AiJwN9nI42F1u9/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haYjhIKuRQTqanXEdi30N775F4MuDYI5H856QZY3bkjvH6p89uRWfNaqE+HHPFWbdETHhjkArpxXUzFNpyL3keOC7DHfFY/Hy3WQdZhg4h08EmGTQZD1cY0pGSG24mozbjAYsPR5tTSphmjshRWlleIxLi2GUXF0L2kzcITWITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6KTLpsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hlXugBe0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6KTLpsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hlXugBe0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6KTLpsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hlXugBe0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6KTLpsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hlXugBe0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AA7561CB8;
	Mon, 11 May 2026 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778500544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2RVlINyYGslU6oudn76Cy5rakW/EcWyHYy7RQAv15Q=;
	b=I6KTLpsSeWHAxeUl6xPWu9EE/VEe+8ijU1Egd7bgjhN8x7jljiQ8cUdnpmms6GcnDLRKhi
	kw/S0BmxOdRKua613++LLEGcsp/+toJQ9xFyBaZOe+7y3kPYENkbuB9IXhtlqml+CfYMJd
	VlaBYCDgxURxjGpZ/YKbBx+d4ugj1GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778500544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2RVlINyYGslU6oudn76Cy5rakW/EcWyHYy7RQAv15Q=;
	b=hlXugBe07MyReS8QAalQ2oB93cLGeHYsGkRp0Ziy4BGBjux6haYPAZ5fOVskSkS9pF7VId
	0f8I1kheciakRmCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778500544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2RVlINyYGslU6oudn76Cy5rakW/EcWyHYy7RQAv15Q=;
	b=I6KTLpsSeWHAxeUl6xPWu9EE/VEe+8ijU1Egd7bgjhN8x7jljiQ8cUdnpmms6GcnDLRKhi
	kw/S0BmxOdRKua613++LLEGcsp/+toJQ9xFyBaZOe+7y3kPYENkbuB9IXhtlqml+CfYMJd
	VlaBYCDgxURxjGpZ/YKbBx+d4ugj1GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778500544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2RVlINyYGslU6oudn76Cy5rakW/EcWyHYy7RQAv15Q=;
	b=hlXugBe07MyReS8QAalQ2oB93cLGeHYsGkRp0Ziy4BGBjux6haYPAZ5fOVskSkS9pF7VId
	0f8I1kheciakRmCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07D44593A3;
	Mon, 11 May 2026 11:55:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cNLGAMDDAWoERgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 11 May 2026 11:55:44 +0000
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
Subject: [PATCH v3 4/5] drm/exynos: fbdev: Use a DRM client buffer
Date: Mon, 11 May 2026 13:54:34 +0200
Message-ID: <20260511115538.57884-5-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[samsung.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

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
index 9163efd676dd..121c342dd14a 100644
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
@@ -95,19 +96,20 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
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
 
@@ -118,9 +120,17 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
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

