Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911003E3C78
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937501; cv=none; b=LoiFyde7TXqZqzv2WadF0AIh6vUHSqHJcZoB1e5QTgri4sqAnwRYrRjNsyjDfW9Snx3WLa/TasePYPiiH8vyXXbgvOyJefrnk8EFUjnkchZ8sqJkwvEagna62vEmnkktfkA8Cj7ZK6FPPOF+ejt/CZPtSSFgnHEk8HNvaeSw6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937501; c=relaxed/simple;
	bh=DgRWyGabNSCFF/RIPztrR6ijhynxHxePI6Ny4LI4GVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIvasI0LzsmASgDECmxJJh0gwP9G0l5rP6p4UsD3rcMfBz7vqBV93GkVLLbxgu7r32oIkg+hazhWonJR3yQriTmPsiyueX/dL3OeTwg41jUURGU+AiLhnDnADtnmCHKuOU+l75X18UIrgxt8kiT8vPc7nwRw2SCiV7QFd95CeKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jpii/2zg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=080eVnNl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jpii/2zg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=080eVnNl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jpii/2zg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="080eVnNl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jpii/2zg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="080eVnNl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2F986A7CA;
	Thu, 23 Apr 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776937498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=11EcTwHd1wSZu9yJgTQc+hyezdl7+B3aoqPRw33PvZQ=;
	b=Jpii/2zg4XRJPFcLVKBuQ1jIltQ+KoZGpjjIugTZI1VnTcHJSUwo8MEwAkUmhjovStqVws
	zhy3sofEXFVJvpZUYtDz94Qc4HnsbVaMmPh2ZZYezvh1raFVT4HLfAjR3ExAlsfpCk5Qri
	u/JfnN2BcBQ/pbEacLaG//q0d7j+ROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776937498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=11EcTwHd1wSZu9yJgTQc+hyezdl7+B3aoqPRw33PvZQ=;
	b=080eVnNlkwtwhDXb17WkSrqlVh5oIvf7+u/+OnLYfBRP/a5fu2wnhHvr7mY36ApvpJyDaJ
	ULo43n7Z61awdKCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776937498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=11EcTwHd1wSZu9yJgTQc+hyezdl7+B3aoqPRw33PvZQ=;
	b=Jpii/2zg4XRJPFcLVKBuQ1jIltQ+KoZGpjjIugTZI1VnTcHJSUwo8MEwAkUmhjovStqVws
	zhy3sofEXFVJvpZUYtDz94Qc4HnsbVaMmPh2ZZYezvh1raFVT4HLfAjR3ExAlsfpCk5Qri
	u/JfnN2BcBQ/pbEacLaG//q0d7j+ROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776937498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=11EcTwHd1wSZu9yJgTQc+hyezdl7+B3aoqPRw33PvZQ=;
	b=080eVnNlkwtwhDXb17WkSrqlVh5oIvf7+u/+OnLYfBRP/a5fu2wnhHvr7mY36ApvpJyDaJ
	ULo43n7Z61awdKCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4600593A3;
	Thu, 23 Apr 2026 09:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fja0Jhrq6Wk+QwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Apr 2026 09:44:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/exynos: fbdev: Use client buffers
Date: Thu, 23 Apr 2026 11:37:45 +0200
Message-ID: <20260423094452.32665-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[samsung.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

A client buffer holds the DRM framebuffer for an in-kernel DRM
client. Until now, exynos created an internal ad-hoc framebuffer for
its fbdev emulation, while by-passing the regular interfaces used by
user-space compositors.

Convert exynos' fbdev emulation to use client buffers. Replacing the
existing code with a client buffer allows for stream-lining exynos code
and later also the fbdev helpers. The new framebuffer will be registered
against the client's file and will support handles for GEM objects. It
is then just another framebuffer within the DRM ecosystem.

If all driver's fbdev-emulation helpers can be converted to use client
buffers, the emulation's framebuffer handling as a whole can possibly be
moved into shared helpers.

Patch 1 first fixes a long-standing bug.

Patches 2 to 4 convert exynos' fbdev emulation to client buffers. It
still allocates a GEM object buffer tailored towards fbdev emulation,
but size calculations now use common DRM helpers.

Patch 5 cleans up symbol visibility in exynos' fb code.

Thomas Zimmermann (5):
  drm/exynos: fbdev: Remove offset into screen_buffer
  drm/exynos: fbdev: Inline exynos_drm_fbdev_update()
  drm/exynos: fbdev: Calculate buffer geometry with format helpers
  drm/exynos: fbdev: Use a DRM client buffer
  drm/exynos: Make exynos_drm_framebuffer_init() an internal interface

 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h    |   7 --
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 100 ++++++++++------------
 3 files changed, 47 insertions(+), 62 deletions(-)

-- 
2.53.0

