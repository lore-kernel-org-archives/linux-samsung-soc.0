Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63568362137
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003984; cv=none; b=dlp2Q9PGjY8MYKb8W7ZdW0Xb6yXA68+ZnP9d8CMJRzVpb2CGzV7A6dKvrLM/f+nfmAOMwNC70hOY8uOIdR9bO1uzmnx1652DGc2XJ3qbWYdZ4053NcDB5q6HHkIoJ5c6E+TXL89GgdDppWM96vcxxKG+gh5JdqWb1pS6m9zYT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003984; c=relaxed/simple;
	bh=a/5VJy34H0a3YmpXDQg4RHMoRD1nfV8oGhU09Jy89UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vi2C2XV4xM4riNyLoGN2SGetCaj8Dx6hVjGksT4VVti0+5IcPS/8OY406lkj8o4pQ5vtr4T+BjIqPQ1JF69hRy7L/detaqRw6/OPGlfP+Yodqsf8AKqIjfUy03njAJENVetNZElTm37Utoz68Lfej1eoXgRbOOM82LaWT1gdF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eblfM+W0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eblfM+W0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso6804975e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003979; x=1789608779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=eblfM+W0tES7e2p8PyrGkKNIUdoEi0nqWrujNEKri3F7Yq7PU10sQMdFxa2S/bYW3Y
         Mdsef5EWxOw+t19bIiY+YFQmIU7A8l7azWrfoZ48SKX2crzuttvew7FPXwe5drOZNaaH
         rMI25uoSerN6QmA2j6thpAhND7hx/DxgMXI6IWiQh/3wdNpNpHiRWyD08pZChR9AyF4F
         RTAMZecjQ2/1K/PV9AAn8oHfy3F5a4JOS4vn2CINwTnIbH3sihFCZtRpYlmE07DlN059
         mW+cY5rn/u7TN236POtCtetvxH83cm8nNUZklliWRXB7w+9uIXYHdGzV2VfU8zMWgGKb
         JPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003979; x=1789608779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=gtFK2cDH3eE/W403ZnYf2tzQXvcMxGeH9BSSx9/VBGRDcP+6UV7vSuB1OlfhJ0bMhZ
         i5YN8tku4Sx1YVwWhQeNSgFMs7xZSCUTjokk8MlPsPNMvITDlEl0cZa1sKg5kvDQZ8JZ
         HWoys/sK5V4sfrRA8NfIos30+C8IwuNI47XulaQJna1eCnDbwf2PRP4VEwnmR1AUVQaZ
         OvGR4JBGqEVGeR0L7GsFGv8bgDtSQYqT0WpImbtT+IonqaZi15npQF7z7qQalFkNpqWG
         mkEGSzc/CUXDP5j1/kf6CY29HBkDpC2CZKeDInEkl0/oxS5QbB9el+YQdwTigYW7CO/x
         otaw==
X-Forwarded-Encrypted: i=1; AKwUvBw6dtoAm5tAZkHNId1P15JYrWu8zmf5gnyk6ye32L3ZQnWYouLzKkBzeZujEW/PImMHOlw64ycu8ixkideEsXwJFw==@vger.kernel.org
X-Gm-Message-State: AFuF++mCM7LUteM42Qagm0KFnBFWnZq8gzqesHZY4hrlaxZ2Pnd8Npp/
	lfRXNAh+79ZXaiwjRBLLiSDxi2djtD9HLyKaKSv5sSn2gEFBWU8NYA6T
X-Gm-Gg: AYBFou22QnG0MlAkOWpIPt7xVe5D++fPuGcUnjAjE+vTuxg7UfLQRM7uvcY+5Kj25VT
	8Jc2Ey6uunL2v1BPurM6uvE5zDETJhYuYraSA61d4ubXcuZxjQ0h3lQJuXntFljFYneycyUXLD2
	WibbYsxGxCS1Q8FYWFVDvZHCkQzIrSQKFdlpyqbIR/9EBu7R2PdQ/bd43BRRyj7NZZyJ3MEWjH7
	jTKH3pCQadf4tvUQFUfP400jWUzkZLd/5XpZIb6FgwpsBqhemLotFimRrZxunENfl2hjtVt9DtS
	zRH2+g0t04NQViR5F6Rtcm2jHctVDehwi//oMdMMb/O90D6NorOmax17XM2tSjGIHxT7I+VqpAe
	NgDtA/8GV8XFUqpczRW+Wv/v+hsjj1wzi7H/tAC6EbBGYVZoO7Yqr+9cw9NS0iKr1llc+lqvMml
	X1NFoGCFR3sSd7nR9WG9G5Z55vLiLDwBhQLLF5HbLGSxgN4StoBhg0pK9yw4R02c3sdzprRKRjE
	CHXjCj4z9y+FTqf8Gdz/UfmyrDd0KS4NPUqUfEsxXlSfeaNt9qn0JDRo3LR+TgLAKS+gM6PK4Ve
	L/S8HRVXmq5oBDRefxdFNFgezO6KjdQfnwgK7lfg41VpEZplscrTQZKxjgF9x9OVjfcIKcBRTOC
	Akw==
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr54568515e9.13.1789003979463;
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 4/8] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Thu, 10 Sep 2026 03:32:41 +0200
Message-Id: <20260910013245.8619-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0
