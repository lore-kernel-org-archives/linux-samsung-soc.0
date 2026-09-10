Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880FA3659F9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003984; cv=none; b=ib+HHhppLqL38Pu2CgZ4UV4Hee4IEgEv/4yxkL3prX0aTMPfWM/1wf907t0VzMIUntel3rg8X8ewXagesmF3UhEef48bIeBPKS2OvvMx5Vo5uzD8/HWRGNr6CP2Fn3gkNbrFNFrlQX1KsHLhhM8fBl4IAT5GrpcnPXzcNxc8RuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003984; c=relaxed/simple;
	bh=GhxAkOxBMRZ6zZ0dFT8xEiFSpjQVEMyU/AlCAWxV42c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJqsd7W0u8vw8OXiOUnAATOMbbE/3dht9PaD3LUyvjtNtAnywuK/zzVHTfwH/xAto5Nz0bhkIVBJ269hqxVVADyDjiD1DJGf2iOpkDDJ1PWJr492Uz03/BqVbWjDCuMeWvqshrnz/eSHmOuuf5ib1jqHyd3ZZW9sAuhJMRuHn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRweCLTm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRweCLTm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so27949315e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003978; x=1789608778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=FRweCLTm6hE3ScM5rUKdIWX5D7IO1QOebFr3bYP+SSYn9YSUEJHgyo5FvyiH9fcwWW
         VFae+jdUNq6ZO6o8BpPSdywlUJajJnyod/kMpE+ToJY8Kx3bMwhqTO1MqUQtvVa0/Q4F
         wmZzOapWlNvP9mwiH1l3LoiMAIJ5iIcCxAxWx36PcOth7Ggz9K+SawijHILWpafUrJ+b
         Lk/KRZBmoeYSzAz7fF1VQiQ/y2O06+Ne68fCggfjJmtoBIxkkzBotfjm9RmCGc4cdspI
         YpCuMc2khwnt9wHBpJ98PJ0FGUY+BcFJyrhiJxuny3GHQpD2livSiQnzowuzp9aFOx4E
         TSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003978; x=1789608778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=SExeU2Tebmk+UY84+2pF4WU2B9nxbzR3+0yO5ycSGWzimuK6xl6JFn8IyvhTZU3/kS
         qUcnhk5gCfh3YN2RFGRRRkbdnIQlJmJMZNlaEH3i3WFYz7nCioOPDR48kNBkOjNNHH0P
         5lhUvFyEuYW/udk8fs9odhp19oSmVbaemqvr4OdzikRPKL+08S4QrKjHJRmVdPV5ea8K
         5hVko7UX305tyoksdrANxHgWg8hNQdvmnMHceH3nkvhR1c6Rj46F/TudJhwWvJS6sv1H
         4XJc02LbcXtQ/OiPCgFaRCySijnyKw6AOy2ehn7MuY01rUw3LguAI6MvnF+d5PBkTvy8
         x/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzIUAJHzlpGNHznQnUvYjZVE/3emqnTJIVvllob6V8oqj1kq4KtCr/AKd5uQA+GtJB29ANlUTkqYtsZMOxSlVsx/Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kxpFJvmF0eWEc8fqcQL6RgwhKTt095WDlN0g7NOeLphk3reakP
	gizMCsdzMIwn6GWghwRM/ShWIE5Ox65bdDdmr0jn0ZB0V+6/5tmF8mK4
X-Gm-Gg: AYBFou3UcJ1VTWEtAo7ib57K+pMxUlGfY/Ho2lk+K1t3086Yt+NMghYtc+btDSoS+ZV
	oZdPedhprtmOJKsYa3vWsepzCD+0wzS0BAr9oooISxYVxlNznWOw12kTeuP4aLLJXKnyXr0o47X
	7MBoJMvVkRbjqWCuv4IQIeOzEbyvOdZuqF4Ngi3toNknNGbaHNklHq+ghoa9bBOTY/DRGuME2ST
	bl2sLgTW3+jKjqZ1KxOQVPPQKVXkTktAjiDLV2BGrf4WC2u4Zzs2fLNwC5ltOx38Y1mwCHI6LkK
	57nhIezK7X3RER6GBE9KEPb3UmFgGR74+k4raVDnjiMdTQHLCF6g1OrL24X+Q90GWgxXjyWoima
	HXQ39oSyVkUP5wAHWmkk62itrgwZrpgln1vb3B9ag89z3PbZqlylz8QvOrr+vnYP6jvMfZeHhbs
	DAR1ilAy4yCygWW6BuOGU/civB3fzXQL2JY8qKs+8ZzulG0v3I6kTcfebILAGgNZU4g1/t5OSUC
	AXC4DV00BTblgsqQiM3dLyeNlr0w/Q/X4u7xD725Bgea5Ooo8gU5vUCgSd0ggX6VVIlbPZ9p5bD
	Seh18hZ8MtCb4YutgamL92FsV1YycH3K0tbWBYTGkwk8CfPL5EMSVJxxOKUF5weACVPsnQd8PLj
	oNQ==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr366891825e9.26.1789003977900;
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
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
Subject: [PATCH v3 3/8] docs: kernel-parameters: Drop the edac_report= entry
Date: Thu, 10 Sep 2026 03:32:40 +0200
Message-Id: <20260910013245.8619-4-kmehltretter@gmail.com>
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

edac_report= became the edac_core.edac_report module parameter with
commit fee27d7d9788 ("EDAC: Delete edac_stub.c") and went away with
commit 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks");
nothing parses it any more.

Drop the entry.

Fixes: 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v3: name the right commits, Fixes: tag moved to 7fc0b9b995f2 (Boris)

 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0
