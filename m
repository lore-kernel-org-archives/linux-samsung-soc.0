Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062E200BB8;
	Mon,  3 Feb 2025 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738578516; cv=none; b=qNxywJ4g/Gk8q38tKtUKH300J2ah1vvQKCYorceRWT7meUmTylxnwADkGpvQyS+Rr3n5ZtZiQ9F5HwLY/IFQXD5DfDn8KPcJciudp93xYS0KP93DxEGs56vEKjfrldR0ja6DsKoOePZ/SScShdTNPqf5ApMk2hP7xyeGDH6GnFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738578516; c=relaxed/simple;
	bh=MlNHsg/gxgAAeqVoARH0hmwihkHAT7u67iNVvdULCo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulEDyUxT9KGKmuGa61Iu8/inR+15qZH/5isqB8WvE2YLzCW0KpUOlA7xZUgg2ono5E9w18iDh9Bdc1mteq1E/WjPh++jT3EpPcZQbUzN6h70fjCnUsekvyUYH+2sUWaDpmjJ/P3Cik8AqzDI4AEYJwib6RBqD4BjHJGSoo3Diks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y2kiDFQh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E7nPughJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RczhdfHq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Z4iZ2UX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y2kiDFQh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E7nPughJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RczhdfHq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Z4iZ2UX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16B7A1F38F;
	Mon,  3 Feb 2025 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=y2kiDFQh8FS3sbgOBnGNwjNbNhvzHozDVPNByMSsLI5hhktN7HD3g3Rs78FdOHVqLUCabZ
	WA2M50OvnJZRHfgkg+kpvoQ7f4la2J08ZFruuH8+6tHeLwdQAVFd3TZ0noD2sxqM6qVx1z
	LuxR6TfoRRR6ptID0HLfH1QRbgYpf8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=E7nPughJi/dc4KRWyhWU6/OxAN6M77uRCJxXzxoh/538KKb0mbmg/bB4m1ZpDJtePB9fUQ
	rd/AEKkpz1iRvNDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=RczhdfHqsN2OXR8RcctDeOQQ82NtnYSEUoBvHRO2Qd5cM8p/W+p8EN0+ah+lgv3LUtYuyx
	y68Aof83rkUtmUwYjIdp506ITcBQaZ0ge4t+vIWq9sYOgDUok4yjK+Cr5/sbiLyaoDcCvc
	XuEMkk2lURlYwzl3Myy79Pcb2zBFMGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=+Z4iZ2UX4gDee8pSXAKTRqP9nttA0DS8kDHhHWfG1yTmeTXoEUYlc2RDKj8orPNBcAt9CC
	WgemUkcuG4U5zyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD6A613AF1;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id APrsLEeaoGfwcwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 03 Feb 2025 10:28:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux@armlinux.org.uk,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] ARM: s3c: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:36 +0100
Message-ID: <20250203102818.56747-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203102818.56747-1-tzimmermann@suse.de>
References: <20250203102818.56747-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,samsung.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-Spam-Score: -5.30
X-Spam-Flag: NO

These ARM architecture's source files do not require <linux/fb.h>.
Remove the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 8c26d592d2a3f..bab2abd8a34ae 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -19,7 +19,6 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/dma-mapping.h>
-#include <linux/fb.h>
 #include <linux/gfp.h>
 #include <linux/mmc/host.h>
 #include <linux/ioport.h>
diff --git a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
index cfa34b55ca214..c3269cd6a8486 100644
--- a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
@@ -9,7 +9,6 @@
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/fb.h>
 #include <linux/gpio.h>
 
 #include "fb.h"
-- 
2.48.1

