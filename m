Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074D370D4D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222971; cv=none; b=UnvHbru3dxTZXsqsg9mRryku49p4bX3ynv2e4Chh4Av/adhB1ee3VymwK/pkGmLVgnCPnKQWzX3T1lgT1UhlIbAxbVQMN8R0E4W34TjB4sdBPbcFFcz4cR+JOfiR57kXK88NRi3fbHlu8W1bb+zuMDugG8KsiJmWKRMowcaMcmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222971; c=relaxed/simple;
	bh=vRS08cqaXUu1GeWYMQXJivEE8uquc587jr/BI6noc7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+pZx5ChyV+oEQL8IvNWNrs+hdWQj1WybMQueMMA5cYYklH3SpjvfiDQ8M4RWMyGa3m33R4HwghtZ+EgqgNu5wGIKoEozW611OzazWJgZ+awIcydv+2P3F1bYbDJLcmULusX+ZLPj4zXQc6rMb3f2nD8M/sB0W4cgf+kej5iqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A19915CFB9;
	Fri,  8 May 2026 06:48:51 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5614A593A7;
	Fri,  8 May 2026 06:48:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sPqRE1OH/Wm1cgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 08 May 2026 06:48:51 +0000
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
Subject: [PATCH v2 5/5] drm/exynos: Make exynos_drm_framebuffer_init() an internal interface
Date: Fri,  8 May 2026 08:46:51 +0200
Message-ID: <20260508064842.22689-6-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: A19915CFB9
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 

The only caller of exynos_drm_framebuffer_init() is the helper
exynos_user_fb_create() from the same source file. Declare the
former as static. Tidy up the header's include statements.

v2:
- clean up the includes in the header file (Chen-Yu)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |  3 ++-
 drivers/gpu/drm/exynos/exynos_drm_fb.h    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  1 +
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ab0e0c74ec47..c6a33f550ace 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -22,6 +22,7 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fb.h"
 #include "exynos_drm_fbdev.h"
+#include "exynos_drm_gem.h"
 
 static int check_fb_gem_memory_type(struct drm_device *drm_dev,
 				    struct exynos_drm_gem *exynos_gem)
@@ -55,7 +56,7 @@ static const struct drm_framebuffer_funcs exynos_drm_fb_funcs = {
 	.create_handle	= drm_gem_fb_create_handle,
 };
 
-struct drm_framebuffer *
+static struct drm_framebuffer *
 exynos_drm_framebuffer_init(struct drm_device *dev,
 			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index fdc6cb40cc9c..74300ad9bb51 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -10,14 +10,10 @@
 #ifndef _EXYNOS_DRM_FB_H_
 #define _EXYNOS_DRM_FB_H_
 
-#include "exynos_drm_gem.h"
+#include <linux/types.h>
 
-struct drm_framebuffer *
-exynos_drm_framebuffer_init(struct drm_device *dev,
-			    const struct drm_format_info *info,
-			    const struct drm_mode_fb_cmd2 *mode_cmd,
-			    struct exynos_drm_gem **exynos_gem,
-			    int count);
+struct drm_device;
+struct drm_framebuffer;
 
 dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index f43ce974c952..247b0ec001af 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -22,6 +22,7 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fb.h"
 #include "exynos_drm_fbdev.h"
+#include "exynos_drm_gem.h"
 
 #define MAX_CONNECTOR		4
 
-- 
2.54.0

