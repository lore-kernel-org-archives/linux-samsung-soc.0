Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD543E5EC4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937514; cv=none; b=ZAZf4zckWvdAWb7x6maN24tXWX+U9DHImeRP3yKlZfcd1hwaSuXMNXFT/f0xFMlwQprSBzIVpKo5Bii1mg0Gl1IW4EceU5eeQ9KuqtNbJAECsn5CQ37FPFTCZU8WHssCNYVxLyXo/DK9vrCjaQLT8Tq7Y6wsbQh4zv64bDfXqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937514; c=relaxed/simple;
	bh=U7DYB5TLO3HaTFyKoNu0KAawqjk5SMwo6ltoLMNnF8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7SBcKXM4qOf3z0iCE+ZmPjpqrweSRqvdj065erxLPNzy2wEzXXufLoxDf/US+ozIQYfXKCayddbHPNk52tAeA6gfy51vwCWyUrGepyC4UQjU9s0eWogGHrh9qkp8RUCkL3a5pzPwbVZrJhphe4SmwPJcz7lcyVWNxERyEannw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YVs9h22i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ssp+BQUg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YVs9h22i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ssp+BQUg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YVs9h22i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ssp+BQUg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YVs9h22i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ssp+BQUg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FD136A84E;
	Thu, 23 Apr 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776937500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYJuol+7YU/+PHceO+yqgAfvdOLjBZXkYkfGRMV3HPo=;
	b=YVs9h22iqqvN6J+XreSDzaVLqfsIRnE+otwdujtxBcKNyxI9vnqX5p/jjSiV9IMWNcVdlG
	18i6IPI5RUPItdEGnUvpQ3vWj5d1rCd/oqluNdrKJHaGiRLyNwT80f68l+P8GlEb1nSPk9
	MoaChKeh7Qwh16fn9ErR3eX0KJX8VZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776937500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYJuol+7YU/+PHceO+yqgAfvdOLjBZXkYkfGRMV3HPo=;
	b=Ssp+BQUg18k0vg/Ojx6U6uaNnOU8KaZYfQ5SiUcSFca/zScnJEHAZofssAeTAuVYKRow80
	gKEeNz2jGhMRbGCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776937500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYJuol+7YU/+PHceO+yqgAfvdOLjBZXkYkfGRMV3HPo=;
	b=YVs9h22iqqvN6J+XreSDzaVLqfsIRnE+otwdujtxBcKNyxI9vnqX5p/jjSiV9IMWNcVdlG
	18i6IPI5RUPItdEGnUvpQ3vWj5d1rCd/oqluNdrKJHaGiRLyNwT80f68l+P8GlEb1nSPk9
	MoaChKeh7Qwh16fn9ErR3eX0KJX8VZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776937500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYJuol+7YU/+PHceO+yqgAfvdOLjBZXkYkfGRMV3HPo=;
	b=Ssp+BQUg18k0vg/Ojx6U6uaNnOU8KaZYfQ5SiUcSFca/zScnJEHAZofssAeTAuVYKRow80
	gKEeNz2jGhMRbGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24602593A3;
	Thu, 23 Apr 2026 09:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2KiuBxzq6Wk+QwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Apr 2026 09:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/exynos: Make exynos_drm_framebuffer_init() an internal interface
Date: Thu, 23 Apr 2026 11:37:50 +0200
Message-ID: <20260423094452.32665-6-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[samsung.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

The only caller of exynos_drm_framebuffer_init() is the helper
exynos_user_fb_create() from the same source file. Declare the
former as static.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ab0e0c74ec47..66dec2b7a5de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -55,7 +55,7 @@ static const struct drm_framebuffer_funcs exynos_drm_fb_funcs = {
 	.create_handle	= drm_gem_fb_create_handle,
 };
 
-struct drm_framebuffer *
+static struct drm_framebuffer *
 exynos_drm_framebuffer_init(struct drm_device *dev,
 			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index fdc6cb40cc9c..aeb6f29eb167 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -12,13 +12,6 @@
 
 #include "exynos_drm_gem.h"
 
-struct drm_framebuffer *
-exynos_drm_framebuffer_init(struct drm_device *dev,
-			    const struct drm_format_info *info,
-			    const struct drm_mode_fb_cmd2 *mode_cmd,
-			    struct exynos_drm_gem **exynos_gem,
-			    int count);
-
 dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
 
 void exynos_drm_mode_config_init(struct drm_device *dev);
-- 
2.53.0

