Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCFD411F95
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601638; cv=none; b=R1cfb6MXOXPGu2N3kpF/4pWrnADy5blrbY+gMpVkK4x+N0N6cIWQndFsvXMKnFDvX3vxG78L8Pird3o3msGhbMu9yDpHrK9Tp48eg78MPq/O64obwW7C98d9MiziVqjrUCFxiKLIs3FUIwHzpVll6vne2krX5Pxqfzgti/fKzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601638; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b5K7tPhnpa31lqOVFEIFoPwI4gYatV590eoNtWFXwy2KREZr/TZ06/JTUeUCY1P2kaPQgLEufg4GgifmDdkoY0UCExoWVG3MZws6XRIA4u8/tGbbKr9e9wW84SSQVxscWSbDlUsE/iYFJqdtM1zTWd6LgOM7Y1yTS0XanVcVziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF6eznBR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF6eznBR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2373634f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601628; x=1789206428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=WF6eznBRtkwHGPWcdSI5zmE6nOZXyfhdN2pXXayZzx0BbgJPuw+KlFuKyGt+oPL4Gn
         x5Fdmar1PYKUgTWNQMERUPVz0nv7Mxix0vYmZEYWQJJOKq2IhCwllLS0NUlGI53+Sb5v
         5/bNjxfGOVPTwMCDRyEgg8niqb1POYfm+DvWwohpgMrPJQpIvHANwiBLbEd1TEAyWkB6
         Yk0kGOVhMD6W24IF/0oUwz3EPVKNZvvniPgnF/EmaNhO2oDa4d3jzD/DgSjSYE1SDRdD
         eJVT5P/AMMCz+8MsEccoS5fKN9eLm8DUge+M/Pg7OhsbQTmPGElHSKeWCxs9g7wuy/tx
         Kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601628; x=1789206428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=MeXz7vNW0wnQCOGcbqKht432LIfgl7is/bEydFB/ywmQlQi1yhXBiYhcKjYt9+11uk
         z9ShmKb5PWV+W2VkvxDv9yqc1L1FjGuxuej5wmp64lmXNdScktoLvq9CL12+dZeRGkmT
         y2/ZTOBbIG+xsVNcnxiuBn5tjLFmFLZikSSzP+4p6ZRYmEbpRmWk4ZQ25BYWekfE5s3Y
         xkt2uS5Xjbzq33d89ONR1AzhHqgPdgpHrkATCT/bD+6H02EZXESY/6SV8C/OpIuGxA64
         BnWRSAAIecQ+sSU22vvCSPK/iduxbU9Ro/4fX7qZFqqCImvv2vLEwwHr4MRZUBzcKUXQ
         gMAw==
X-Forwarded-Encrypted: i=1; AKwUvByK6XJ/K+Le9G0Qrp5g5rrwxvXaNDZ6zqjr1mRyWAd1O3bne4InP5jRUCypW8AEQGHm+2+PbXysGt08HbZoc5mbSg==@vger.kernel.org
X-Gm-Message-State: AFuF++lS5LOXdw374Q4S2BhWCeMMU+/58jEYRC6hQLncJf++broWzCtC
	Jg9gsUDzo07zv790ciPMUOcON+XGObnP00zNkvAMn34nOsbsbhwYRzgc
X-Gm-Gg: AYBFou2vEtRJAu+aesUDJ4fUthlVmchbY/OrHcs52CP0EZWrOcqlx5su3JjN74ulHCQ
	yYc7AB5fq9t90x59liRlkcWyTLT4NbXPKVj38McEX1mQ27wte/78fJMxvCRNouPnlaRrZigeTcp
	XKwv0q2KC7EgSAoZpTV2quLcNPcLmjg2/0n6Vilbk8yNp7RrImDS+eho1iBTl+D+cgiUKd+OInM
	Gqc4pJdnq5yqP1wHEtivAfeMOIlUPl/tJT9/SKp1yNWIN6JlTGwo4AcARcQoQypUvSCkhKnU8l9
	XJTlT5dt6uDOIigZ/W3AyYSgMmCMfT+1LktlrU0GM6364JM907Bg1I128e3+G5wHQlRr5RWY1R5
	1TkN3YoiZtObn204DBWpSEc+ZpxEmLBVZIHAaaupVYVu8A0NspayMnlTpcwgV3ij3DQY8C7ZxSH
	AFLn0QagkD34us+Ba8Y+uxEnHnZrr+F2pNrgzF9ZMmjJFcQMup7C5aUHmnIevLA7c0yF6KAI1pM
	gexvVv4WPZqn3AXtwomHLXkjTgzigOKO2zRgjqyDXbSgJdkneu3eiofm6NtSDeNqMKTfSMw0lVs
	Xt4fIERXKvoedG3axS8DdSb362cn1/tbWwpOuXORD9fud7mVYwCxY3YZwOC16B8Qgz4wmaQM3P5
	zTA==
X-Received: by 2002:a05:600c:a307:b0:49c:f13d:ffea with SMTP id 5b1f17b1804b1-49cf13e05c2mr154976805e9.14.1788601627485;
        Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 11:46:44 +0200
Message-Id: <20260905094649.41996-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
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

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

