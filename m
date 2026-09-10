Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25CF367F21
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003998; cv=none; b=L+QOg+YPtam31DHgWThbuIyDH6vtUWBsJVuT/uUnfYDQgl534bvmS6DVrDFTplFwP5zfMiVnZfNb+jOkyEYgBtQiVAb1ZecZQtr0fT2xoewv0JyyjDncyt18MfrhWO9V/wB4tPQL4SQR2oF1G1SGjo3peJOJfyTe+ztq4FmMD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003998; c=relaxed/simple;
	bh=ZYFLiiSEbPgU0+ZjsS1KNzdvmrfyUGct38CSb+7KC10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n1Kq192W7K4JjAF03JarlKLO1p3JYoXIjQ+s1VfljdEm/ajCpucphn+JoK424mAYybngx7cD6LqZWinzbK0eF3yfK5GF9KC7eYNZ4dvSQUoGOEDz4VEVcxOtwHQpbT4utjBnY9y5Z1hx9IF7SGUtJ0solfUJpBm7P6qZXC78hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKOsMtbD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKOsMtbD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so81384915e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003988; x=1789608788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=CKOsMtbDLmlvqC8UoICufqDEvkMqZRt2CNhavbyp+Wp4tgCcZvOZel11M4HI5DDmnO
         ZAzzXbIWC1dy0RP9A1G0s94vYDEvR/IfMcm4AokLVmIzvRZGmoJXnyFEHsVQ4ZhfxFxN
         vS/7t5ODxV7m+iWr7weuwS67oq8/8AgHKnG6MsC5+hdHRbHkqRbr462hkCSppYgvs5tg
         /gfLDyDd7IjuI/rLVfo/8ltTx9CDAaHReuOyntpOAHsz2jFwB9GUDKnNR/G/rBJeqiSi
         BSURrWL3KxAM2vuO0xHeT4gJRhUNeK1sSMjJIFbAvI+BweQVtCZaYJhYMQLknpfNySl4
         phNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003988; x=1789608788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=aXxtDvSklMVpNlyZ6N50jeaoNhjPTfXHYeAm2zREzSJETqcaBxEPF57Gm1deW3dZOJ
         oHMWMxil6lmlAR01J7eMXwdJ291f/pxm636y2Hlyvd/89+D0U56OJoSeUhhEyBmrHQRH
         MRiNXcQepiJsfeZ8l+LDGAtkEuENBXrQWjYTi+ZWMMnMyWpNuBeV7MDnlbShIJ9OEVg6
         dBti2rrStTTW2TT7Ho4lvnsoHLxctPJnx74goBvhIfbBqfhnjznkd2ZqOfKWAnm2+d9Y
         hB3VaI+/xsy/w5fXMyoRWNU7xhw5L1W/t+U1Uy0w5qcnPmkPxYiDoxGJfqm88wtRx9F1
         QbMg==
X-Forwarded-Encrypted: i=1; AKwUvBwnKWPDbyYAHsbuQHzcljP6Zhxk3TC6xev7G6HbD9VLW7Bu9d5SGmco75uTmwJ3V3uFk1XN5s3dV1chadi2QYEWPw==@vger.kernel.org
X-Gm-Message-State: AFuF++nvjT87i9yTYaeQ3nepZQFriolERfNxahVhTPkAx2hbiX98nDho
	w6Yb7Jz1xne6dUCpIYSoLFlUqMPd+8C1SPBfhWIgq90iPUN59SWf+use
X-Gm-Gg: AYBFou21bD5IUUkMJ9mBL+t7t9ZKDwf3bxC119Oh6d8ZuwzOnGDoU+66QrJCWTkU0Yh
	l8hf5vEFJILXYgCzi3qgSjZ+14FNt1B3eF3SI1gK0fdZ7qDxUTB6we0vqwV6zqyz2l4F8jQfIQc
	A1RdpkxnxrMosZMjSwYUeIHSmwJ0LYE8Hgh9ZS2ZBu8nTElCq3s5gIW7K6f8dagWNBQnxLnKb1h
	DLLg+Du1m+T1AhtuNZJUPVY+ukYysRqUP8AyUheN5aczOsOFYJudWNYxGhbDNsOo60vDozhBD9s
	qctuSCll4ojvAMVMMVq6wcze1BRn+foA3l0qptWvF9YBxelGzvkeuWJRKd2QAyrU06V9qMRF4xG
	h2r0sLs+OqCqKfX0Q90qBJ3k42HceKTIp0GdNtkP7F5174aAEBxdZnlSiTSvUOgSCqTyC8dklik
	QgI9m3WwmbPRwxkiT5w68pjFWqxusluYZbCsfYiaSL7g4TmLTSzz1z0YGWNQQytS5ZlDjfKAbSb
	CTRjjzaZp0j9KwdsFxngAQ1d+ChGbxvG+MygXOMQqVCVTi2LxXDrmx3cGFkF27C9fSIDTvVwYn8
	CP2xm4/baE0CvOkGVXy1yl+YFo7oLBqXdUJHHG3xdj/tnIdZ/00h0tKY/e53lMp5MYnT4ribj6W
	WfcX6Y5A9FVjY
X-Received: by 2002:a05:600c:6305:b0:49d:2803:22fe with SMTP id 5b1f17b1804b1-49d28032d49mr11185475e9.32.1789003988252;
        Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
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
Subject: [PATCH v3 8/8] docs: kernel-parameters: Drop the pcmv= entry
Date: Thu, 10 Sep 2026 03:32:45 +0200
Message-Id: <20260910013245.8619-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0
