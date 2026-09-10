Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474736605D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003980; cv=none; b=nt1vT+uvr9vzc7e+0ApUng47ONeLNI/P66AFIc6KAxFSMkTP9ysdskfeJtgd5fseGlikHTqscq6CqRVf5TUGwPtb1+y72jdTV040kHSmHRNpmS1CYjiyGHbLWX4cLmn7qzyfIQSXWaYDc1/G3iHEt7KV7BpuyGtWgoQPJaekQA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003980; c=relaxed/simple;
	bh=5npIdaapraypBrumlWXF26qNLLXzmRV667k+YLJkaDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CP4BEx96Jy5xbWXEbTXuAm7UP1UYUFP3hkDM2K9qQ261GcGzbiwiXXe1zV3isoBw/qbEjAGeXwL+XZpDx7UmyED2OY3O6k6Ry+Fa3GRwxwgG/tFNf33N3jlspcPwyh9EFsFqOZoDzvbYtG8L+av7+DHZCh3Ie1c7yXdKKosx9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTBYOs9h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTBYOs9h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so81382715e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003975; x=1789608775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=oTBYOs9hrQ1g2s7H1bO9ogdhbix+86v1yKFtfKCQWjR2iRiM0lteprlG6Tn3bvnNeW
         RDnjU23cFSUweUOo/dO+YQs57po24Vf3jckqzJ7ygXrMBi2RX2UeRHj+//bkJ8Eiqukq
         6dmbafTfGj8ObvjKL3mFBCqDa/6+bq4N4jT/jPNvy3dFG8CMTQtFozbVCsxKjxzetMNJ
         wxRIGzrC4KOjnhjl9GxsScP+rj5w9qgsm2euP4SfZ9sVImxRy5fXrI15ETNA5Ppcuua2
         NtIxDrLqswMf+z5hVSRi8PvnlqC7QVtXzpLkpX1wHIxIC88GSFYtxvHmgyuubyqaolzO
         KxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003975; x=1789608775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=P7ocbh9s6GrrE/MOxaWuwqriaxDUP+3tEGvHi/UK2bWjLNfdxeIe9wDV7/Z3igbj63
         ej13+EHMNtLh021ZmM1SAFEWFql3iDFoUjssXVKt44QJvCygSEQ9A0XHkP6pI+KBi41X
         Sb+rddVeeWT0O65Lv+fy/YwSM8LJ82Nzv3fOCGyZibORMHmudMFTL9CKAaxRtoAIKR4y
         lyQmKeCBT51GwkPRw+VqpT9OBZIvXviaTr/DsHXpMOF7RfJd/i5tR+BfycF+5C1kzS2/
         aWuyViuqhdBTr/QXgwbrGYkMVs8dTVImw9lockIIWQzcmuaTlS1gb7Ig9VJgLBlTBReC
         lnPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6iCciAaQQ/kU/7Kl6EaE8IEws8evOr+DCk1C/e82npKDLRZOOJ6r15yaLKlgwD74pBOrAD8We6BLqDmAQRmFYDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mF6eA0WN40Yq0iJCMD2xoNlPY1QCU3rEznPAnQWoUWursTOEIS
	fIyCE+d4KlliZE+ILco3lgWAdhjoCpiFZj1g3X3r54M9T/aOGx8bnrkF
X-Gm-Gg: AYBFou2tmApINSwMClPvY4XYbLlBHLAezTzW0yYIhUbRcs2BSaWHcpuH3X0ojq6LaJ4
	TGOMAGemnOfRM74YHrUOSkPZLxfksi2xFwsV/My85VtjbSHDmGqmjtoAJB6B0KMM9KlZSldqmMq
	mxwKzw63sgPabhrwVTFTvZ4vxE0URWFVMzNxfb1W5/mxwQXb0sm80rwtvoZQmH4vtDPrJ8mRCjy
	6IXxK9o5vHfHJFXKE2qv6V6D9DXeTL7ets3DvfuY6gIrHNjGRHAC4Rt0PWswrK2NwGsQu6dLbem
	ZtyJUpxZe1xbD1q/fTLmWhpQ+bAr0u+EpNB4s9HnLTzfX04O6UiW5PfkNMIuoJ2bQnbwH4Wufch
	xfaiwoXYdWoRRSyvjCeKlRkegeR2sSJB3ATM+uScCbEnj+A2vR9uxbosj2E/nYsCHH+9R25DCir
	aac+wp48xte+OFFhL/CVBfj17ayBLpQP8Nb4ilidi8Gma3lzaC6My2gXYUOdLSvEbXjXNPMT6IQ
	EmF2i6Rb2ggr42u1K5cQV0WdILVNB7F+lZM7YaqLTXQrzMdR+Aw0y/ipkNm9DLakvSN8EQ1HMrR
	YfX/rdK2YTQP6Xro12TGoYrA6PkT1q/aj3k+OUCeavdf4Vw3a/Og9XmlGCHf+/UtJvZWA3boc5+
	mWg==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49cfe467228mr261724915e9.20.1789003975492;
        Wed, 09 Sep 2026 18:32:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
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
Subject: [PATCH v3 2/8] docs: kernel-parameters: Drop the bau= entry
Date: Thu, 10 Sep 2026 03:32:39 +0200
Message-Id: <20260910013245.8619-3-kmehltretter@gmail.com>
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0
