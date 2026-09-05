Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301F3DBD76
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591848; cv=none; b=tbbRjNW6qf2v9WJcaZpc97ZxbnKUouDAJEac0y1hogCrInAVcR0oMfWxo84M1BaKidI2TK1cBsQTz5bMyxGBwzrihHhc7+38xLv0CetgWyWrHhLGMjntzvsN24Nc/31/FNCmqRySYKcq8tESxKClfaVW1OlXOHWyMH+r6Njh8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591848; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k1Bm1lC+DgRqN1GhqKoqLaDq6e88vNtq8i2YeH8M4/koGNruM4vAneQEUXtwJKq46lJAbBHkhV2mwRsAFBZQ+Ir7bplQD87dJ1CQAR1P5S0CnZATivz4ASkzLIOWlx/xm2sNEyuJgZbgQ1SHi6g1FJf7XDWRrUL+MmxBlOzAuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTgk/Bir; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTgk/Bir"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c259e5c22ffso286657466b.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591843; x=1789196643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=CTgk/Bir/irm1HNOtFUvU6UDv+QZsqLHmwn3U1pGvJvT3QHNNspH2iWM6hsvRzd0rQ
         +UBq6r6+i+ciz9GE1cNac5fERSG3fs531KyW86jZ4vkoKuZhDfTmhI7UhkPRKYUZmK01
         MgDyFOjl0fErZ+P01xZbNWAla+v84cUhIsRo7x3Bd9TmDbPPcPbjc9ZQjtLwW5ne+6jT
         w3JZtCZxqL6zrMQZd1HZSv/MFn2o+HtGLaXzamx0uFvJ4VWnHe7uUsowPi7AUWpdqM+6
         jIIak06kMPVed/xh1N37YsqjOe1Tpncqtc1BaaIYFR/Z5MraNH0XqCTmj8DSW4V4yRLa
         jG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591843; x=1789196643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=pXrhknMUabn90DXKB0smybN/368JH345hg+KJbNvFWMxVCdKAGG2mZRxkqgEeTU3VU
         3/GtT1nXd9pivF0ImADrk7aQFq++EvAjB5kcQ0vH5SU+Gl1u+YKhZoAZgya+uJDC3WVu
         xVwAwKPaTN2MOgY8dqlFCE5FyNCGzf1eEvmlDDZQT3Q3EcHmkPzJICf3tR7dvi0lJkFc
         fSmewt6MYPZogqg6DMNe3UYTmAmFSdPoB1nZmpDv7k0Eba8e4nMczJZJflCA9U93N8K6
         KzlXwnG1J+n6Rq1UIHgLwgf6xw8d6T11/M9eboaXFsMKkfqJoBuaqeIxHjeCCEec8HiK
         8f7A==
X-Forwarded-Encrypted: i=1; AKwUvBytIoOVmH6fttgaeCO4+gPpxOaqbzd9GT6RFxJVyS8MTLSY+V5r581IU9iwYDlA6+w9vP59rfZ+g68R8OcJu+KCvw==@vger.kernel.org
X-Gm-Message-State: AFuF++mUIi8jf3FzKvkYT6g0d3UTy7r9b9IjUzCZyV1iAZwsq4sJJ739
	p0cfCDkN9RwS9WIR8VkVsNLVggs3s37aAl0OsCAna88RCRH+hESS2HTg
X-Gm-Gg: AYBFou3cHsUa48gd2ySE3D62IWcaPKQyWBhkTWeiV7TVP9c/hGq+VUBSgcrg6uYw/mE
	DMwkX4HoSV08MGejqNOvWowolnxRzYJZc9urwHLVi4fx0S9MKhuoA0CKsm1t/oh6QIbTgyPi9gG
	dr0VYgiC4dYf42JEeFJzt/4f7Xt7MaERrtcqpvXBddZ5DAIsYRilzDJcBSSkvBFholYJ+qSwCoB
	P3X/8Lqf88BaM5wqoQZLoOZrfs++Anh7iM3/sohGM3UAVXaaXhSD1FD1fKgOEkpb0RaJbERyB+z
	4zngODtSR49EGWJcE/twik4/sKFtVuLZ+Q5tqnaDmSUlFsDDpJb/pFUohbXF9epIc20rtK8vNyP
	ojBRjs9eicmK2wZ8A7MCLx7TqLJo8aS7ZNfCslMNCSkWDA0VTRZ0httN8g6xXtQeguLtxbhWN4f
	/stnYLoA8WrqQfh+XtPDEy44FM0sGCXBM0CXlvPvMHN+XJQ4njrzHn0aV51lXGygDv5zyGsDIrU
	UWLTxYK94a0af1HuPX51yxSIpeWbtMVK0w5KK1ru1XUBMeOzwsoW1Zi+AH6ELoTXgkc1qqxF7tF
	tA2Lfn7iQIXC4xzV59WvM65Oj1Xc8mWYHGtRKTLPoqK9O4DWXQkCH8h7/SViEzr05IlSqYMh1g=
	=
X-Received: by 2002:a17:907:d94:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c260ca47420mr442803966b.20.1788591842595;
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
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
Subject: [PATCH 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 09:03:42 +0200
Message-Id: <20260905070347.25902-5-kmehltretter@gmail.com>
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

