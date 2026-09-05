Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4BC3E2747
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591859; cv=none; b=rWhNqhlnJIu3oouh7eNJzBEYf9e08y8shvkcWQJIq/PVaId50O8keZxR2FTJgIp2HoiLYFFxyPy7VEVbPj5K2Z09NYVkQkgk6g0rQyc6katdnvxIq8Rm58+GA5fB98WAEZfg0hngN36tqp9ixI0nYneIR0JjXbllTf7QRhHE5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591859; c=relaxed/simple;
	bh=ItZT5GNunHVnueIdaFQjAOk/BPjP1n6HkFAdihTWgYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IqOuoxmGb1jHwF33deBEKs6aVFLDyxzU/0QjPhgxyaWeExqZEyqP6O7WgDhRpC2V5J5EhaN7tvpAH++mw3va4Pm2PhFU2rF+UVENAl4V+J82ZLDxZNiOvn3xmDhthsXN8KP2wI/3eu9+eWHsZklwb+O9L3CeKu6EijK1ZQq7V5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ot2TgaTS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ot2TgaTS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4858303de5dso2174012f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591848; x=1789196648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=ot2TgaTSFyf0JGzHOS0qVEAf6ZxzDDZ9GbwaoviLSwiAMvTFLOKcRxlwvGcTuqHzw5
         EkRs1xP7nf03aZMrJAMt2A4vqFH6X5rfGTK0/Vyri5Ijk2c4UffB1TcG58IRkXtYgSV1
         Lqiczg4F7DVsT/bfD8Dx4iw+ZCRZ0G+oAO5ESiQxUiSEN3HFL52rQVd2QFAYy01WVJvc
         AuwmYB7H4ehU2TRk4SWu99reuV00ExXtZkNHcXcIzps/tOjkWE+FX3P8hYqnEYJ1/MCI
         dpBI0NJG8Rj8bLcFMvzVpenCY3Q55LPB62VZMu36usLLEDEOOWtHzGUhvARquerAn5BG
         Sbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591848; x=1789196648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=lyiVhnFb8dLaDnIGSkWOGQoISiL/k1qGE0z4rq9hOOCKt2YZpUjDjJH/pLc4i5comZ
         ihSVGZ3BHevH41LeXNhvRqW6cgGeqzTRNxjNyOgX7gmUuYP1m6tMIYZagkMMy09LWu9T
         j0tJkkQxS0/iF0NDA5I2zaYiTZBNKa5oq8SyWBFqX7KZmJuXgbZ3cF36+gbIAcCtYXuW
         FF46hpJs4K6HqlRnkSvRMPVFQe8uK3Y6C22Kb2q4dLMqxLL7dKQ/WsgvpHARSSfzKEHa
         NSMFrUUZBqWI0b4CfhnFlW9gSz7m7T9vJwSmOKF9w+BbqvzLGOdntwFPXUI3Fb/dhkyp
         a7HQ==
X-Forwarded-Encrypted: i=1; AKwUvByeMbhrbQg4kJLFbfSXQQCsfSUbDSJKJlUQ2p+1nH3CaIDa+K3Ic+FuKxrunlh55CvvCVNeu4USlZuFl6F0/fKuiw==@vger.kernel.org
X-Gm-Message-State: AFuF++nOlx3ForiCYENKP87kX8nQDb6MSQ9sbNilIeitusyWPAQw15lK
	KIkhX1E4MebD7L0gtC06TdRN4Z+tBfEKozG0WAAJ4DoobZVnDO+u3AXJ
X-Gm-Gg: AYBFou1b6KiHx8pKzTTdIDOI6zCtkCiNkqPh8DQ6+rI1u5PL2s6GUBhaZeN1Im6wjwj
	IjY1Dk6JeB4ne+Eg8IdGX8NuVg5SwqLkgo+1OmSp5FgQQgtkkcMVZrYTFbolvD7Jxw0KuFqSjbS
	+zm2jayhsPE75Jsa3nrZ/fjS/20meRxGTyKJ2aH9uWn2+bsCusGgyf2HprJ/5fpUzMK0/vMIb8P
	GbmFuUlbPP6R4k9Q/OiysmmPRlRpThD9bJYjhn9m4h5/rh1PFCrefkXIxXvfYfmhIoFzFHdlQI9
	WhOiFugcE9dSoN5HLGKgCqpbrDjyW0i4hRxh+2byxMIOWfZDjItBvadHWfuTil4irze+FcheolO
	7HfKTv04oFtoqr45pGYOxPOirFAJn4gX7C7wX/jOPU+xckjuz9AONSWoKISJZVkP5YSQcYnS01E
	lL8G4ESFdPiv5i01j9ZLdnlLqSBaD/ad7fJMNry7ANXo0ljT+KM7b00wfSodXevC8n37hbC1u3r
	/dJYTuw/lptTOemgWQbICZoJAgyZp3ZhHDvBmBml0MiVxt/HiXLEWJeOa3E17LVF9jNPqDPG+F0
	av9IVRfsC47NdcZ2ixfVyuFM1cO7mf17DsOFpre66KJ8pCq/kVQEYQ3V9ih8UFQEyTvdnxN0ccW
	iqh83/vg=
X-Received: by 2002:a5d:5f55:0:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48587091856mr13328658f8f.18.1788591847580;
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 09:03:45 +0200
Message-Id: <20260905070347.25902-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0

