Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842A820011F;
	Mon,  3 Feb 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738578515; cv=none; b=WhpuTjEjj3m06Jb8KRmAV7WCG7TbXyCJeK5i+Ofob/o2+NaMa6tliq+cZ9s51JBZgJ3mw3JLQwA1jgFF3M36Uh0M5+9n/ljd8lfR1suP+SAMDFeWMfHxVrS31333+raSivq1IoxKZnp7bCtMtDRpAQ/ou4Upo5Il0Y2o+oIBDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738578515; c=relaxed/simple;
	bh=Y9l6sqcG29o265hhC5jEILeo6TbOctqjNsVCEZ3i84o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=te37FVvEZnbvnF6Ggb9YwkXAvNokXh9majMBhF2LQNJQ94ks4Y6Il2uXw2ixh7Zgx1EQSGCasamjrxeduyZifUjcgbShGgCoyfSwLLnv7TyUnjvGKZKtA14/RC9ISrD3CfehOJiS3xzCSa701BRu4ZTsoB7GaRgs1RO+ySBI5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0BPqwhRe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wAJdm17y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KLkKU5Ea; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EWzRnuZB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0BPqwhRe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wAJdm17y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KLkKU5Ea";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EWzRnuZB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 610D72115F;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=0BPqwhReali1Kgk7afvprXocp6uKtXGAQkkNI1/z8YmSYQ35wCmTZt3HR1PYS6vKwsyexa
	R+c7ILz5W2lUey79wvlICZWkzhJu2QmldUsExeHjFVdbHCGRS7Iw+cGThkG6dzrvsbfqHs
	2C1bdH3XmIbpBOJyGrLEz3+KwFwdTuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=wAJdm17yhyvmcwtOZrS8YS3iUlSSp2l0LNgy9HpwoYgJp+SP3Kdiy3uYDrRkHrY+bSQCZi
	AT6hyF3IZXg8CLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=KLkKU5Ea/cSCNQW9X7kyEccU2O7llJyKJFia/W8NxVjKDyApnmWvZ+30MNuoUXLonTKq2q
	q4awUEPEBFG+XBxhmzIBTBE9hVaYV8tGYp/w1GqhDdUw11PP70kCz2HOOTnPDZZfF08dt5
	L4NJCfi+ity91EWMTxSD2XsNrZY1oyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=EWzRnuZByfyd4DujPbuL7CxpPZZ4Sw4AkoF/qIW4cv8HmZTcigz/kAZeEWaN8Q1GlHUsDd
	qRKNRGNknVaEIbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 094ED13A96;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NOSxAEeaoGfwcwAAD6G6ig
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
Subject: [PATCH 0/2] arm: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:34 +0100
Message-ID: <20250203102818.56747-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,samsung.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Several source files for ARM do not require <linux/fb.h>. Remove the
include statements.

Thomas Zimmermann (2):
  ARM: spitz: Do not include <linux/fb.h>
  ARM: s3c: Do not include <linux/fb.h>

 arch/arm/mach-pxa/spitz.h                  | 1 -
 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 3 files changed, 3 deletions(-)

-- 
2.48.1

