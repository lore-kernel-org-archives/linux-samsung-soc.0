Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F220102F;
	Mon,  3 Feb 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738578515; cv=none; b=ac8Gqow+mzdwmzGVfKg6Bh6ryD5z6lCjI4CLDG11WUoQ29nQb17K+UkM07B4IIGv+Gbg0KKx0IgjvvQMFWiWU47AlWeiPhakcx4UBnViRguJELBhraH8QAno6vG/N5WzfOuN4jQUPKUTMdHziP7cHZR5QkYWzH4YwbKarV83aJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738578515; c=relaxed/simple;
	bh=JbXjcx3UXiAv9okkXIITxXxN3EWESzwDonKA3BHhgm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEs/hyRNr3e/6TU75ptyt2GYFWeXV0V0S5C4Qu0Yhdh8mmxt1XJTEuHu8Nnb7Z3ooX7rI4wGXndEAmwkEwOsl1jFiK5rFaaadgRqnPTfV1AJvCJftTidHNPUrqYmQQMwHDnll+TanCbesIxOkIcZLC/FBMlJ5hjd2YkUrdmuSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dXWkVxzC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vWfzdU6Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1k7KpsqE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7FxEr8g7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dXWkVxzC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vWfzdU6Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1k7KpsqE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7FxEr8g7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC21F21163;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=dXWkVxzCOh4vfr5/QkUNxX7aJ+CEq0Ra+ZmALRxRth/8dZjHyFPaXzE5IgVj8//HDZ7Jqs
	0mOA+FBj09/r85jc1npRsZG0f3ZgRNHrK7MSuMt4ZG1s7CUV4cqzTiW0oAKrnjL4lBdqxk
	Fbx+7FoKwsWcpyhByJFR4vSn5hntbUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=vWfzdU6QYVcKOSt40yuCS28fkvNAgKi1BZvwb/RzZp4am4FEc94CJh/GbpjqM7YfiehGHd
	TFyL4ZbTr3bik4AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=1k7KpsqEJhNG4ZzU7w7uzPdMzghYYJqJwRCUs6X824zXX9irrV6DXiVQZW10z0+HyMnVlL
	AtsZH4Jw5K+2yzwMOX5N9/+zTjNxvdkui5cqrI2QQGvZMCYqgGKTBeGgFBodVsyn6bp/zW
	pR/Fu/gj7X546re60pTwVRAuzXlMAcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=7FxEr8g7gAKQQGPVL5C2Em5F5mN3ggaVZZcNgBl8FcmrKYsAWNNoxUALma/nPryZL/6Bjr
	E6/L2iuTwuUYN6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 645AF13AE2;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AKUWF0eaoGfwcwAAD6G6ig
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
Subject: [PATCH 1/2] ARM: spitz: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:35 +0100
Message-ID: <20250203102818.56747-2-tzimmermann@suse.de>
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
X-Spam-Score: -5.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

This ARM architecture's source file does not require <linux/fb.h>.
Remove the include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/arm/mach-pxa/spitz.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
index 04828d8918aa3..873844194a318 100644
--- a/arch/arm/mach-pxa/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -12,7 +12,6 @@
 #endif
 
 #include "irqs.h" /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
-#include <linux/fb.h>
 
 /* Spitz/Akita GPIOs */
 
-- 
2.48.1

