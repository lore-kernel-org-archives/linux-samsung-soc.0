Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E03E4C92
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937508; cv=none; b=qyv1XBnZkF4fiIDNIPK9iZgSZaQw5xE1C9yG9fZH2+MWm3CuC02WvWAenMLiZLsX3xU/eA352GiVPloFpNRDfVVJ1Fd71TpW/j2ex41AMbIs/UH3jkTE2FrE5OLs5OCNgTLquYG+aA8DxZxNFFdqsDKB6iype38e4ryf5jmArPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937508; c=relaxed/simple;
	bh=cKmQZpVz7HwB3Nt/1UfzQqO1YdJJnVOiDxL9h1diCX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIx155nKcHZkgbWXCQAhByvdzQqLa0lmJ4S7SrRLT/LSirApjIu7ZVxwjtgO2PxDg06iyaMZh6CVmYBi1JIm8gVvbPdIZHb5PPX6YYqtwvjOSi2N7ZtSphNH/r4/008cgr4tboUevm0VrqsNYw/LTV2Fq90WKeaeyb74oPCs+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D11315BCF9;
	Thu, 23 Apr 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90C52593B0;
	Thu, 23 Apr 2026 09:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wPvqIRvq6Wk+QwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Apr 2026 09:44:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/exynos: fbdev: Calculate buffer geometry with format helpers
Date: Thu, 23 Apr 2026 11:37:48 +0200
Message-ID: <20260423094452.32665-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423094452.32665-1-tzimmermann@suse.de>
References: <20260423094452.32665-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: D11315BCF9
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Replace the geometry and size calculation in exynos' fbdev emulation
with DRM format helpers. This consists of a 4CC lookup from the fbdev
parameters, format lookup, pitch calculation and size calculation.

Then allocate the GEM buffer object for the framebuffer memory from
the calculated size. Mmap provides the allocated buffer to user space,
so align the buffer size to PAGE_SIZE.

Initialize the fields screen_size and fix.smem_len in struct fb_info
from the size of the allocated buffer object. This is the real size
and can differ from the requested size.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 35 ++++++++++++-----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 1c564edd497e..9225cf1a83c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -60,11 +60,14 @@ static const struct drm_fb_helper_funcs exynos_drm_fbdev_helper_funcs = {
 int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 					struct drm_fb_helper_surface_size *sizes)
 {
-	struct exynos_drm_gem *exynos_gem;
 	struct drm_device *dev = helper->dev;
 	struct fb_info *info = helper->info;
+	u32 fourcc, pitch;
+	u64 size;
+	const struct drm_format_info *format;
+	struct exynos_drm_gem *exynos_gem;
+	struct drm_gem_object *obj;
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
-	unsigned long size;
 	int ret;
 
 	DRM_DEV_DEBUG_KMS(dev->dev,
@@ -72,23 +75,23 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 			  sizes->surface_width, sizes->surface_height,
 			  sizes->surface_bpp);
 
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = sizes->surface_width * (sizes->surface_bpp >> 3);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
+	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
+	pitch = drm_format_info_min_pitch(format, 0, sizes->surface_width);
+	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);
 
 	exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_WC, size, true);
 	if (IS_ERR(exynos_gem))
 		return PTR_ERR(exynos_gem);
+	obj = &exynos_gem->base;
+
+	mode_cmd.width = sizes->surface_width;
+	mode_cmd.height = sizes->surface_height;
+	mode_cmd.pixel_format = fourcc;
+	mode_cmd.pitches[0] = pitch;
+	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 
-	helper->fb =
-		exynos_drm_framebuffer_init(dev,
-					    drm_get_format_info(dev, mode_cmd.pixel_format,
-								mode_cmd.modifier[0]),
-					    &mode_cmd, &exynos_gem, 1);
+	helper->fb = exynos_drm_framebuffer_init(dev, format, &mode_cmd, &exynos_gem, 1);
 	if (IS_ERR(helper->fb)) {
 		DRM_DEV_ERROR(dev->dev, "failed to create drm framebuffer.\n");
 		ret = PTR_ERR(helper->fb);
@@ -102,8 +105,8 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	info->flags |= FBINFO_VIRTFB;
 	info->screen_buffer = exynos_gem->kvaddr;
-	info->screen_size = size;
-	info->fix.smem_len = size;
+	info->screen_size = obj->size;
+	info->fix.smem_len = obj->size;
 
 	return 0;
 
-- 
2.53.0

