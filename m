Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9735A132
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664177; cv=none; b=Ni/UzOnCxrhjLbyZAgRhDMsEiA2BZSCMCpzP8tJvu4z6EuGAV+OvRtF5lxcFYrXOgGdTx+q5/7ZsMKry0qKkdhyW6rvG6yscl+p2ea3glkX6G4gLJYfDS5EbpTHZvSeyEWbe3Iz0oPSA2fE4gNH2G2pgujR4Bfuo8561AF62qLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664177; c=relaxed/simple;
	bh=lKVdCN8JBdUVNmi+2+CNjUNO8qd/FNjKg98yTe+QFgc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H/Jq0FLbWrz0cmHp14C4BjxtlS/nrzzudOh626wgXJmohwZB1SM3hu+CiH2oCbRDuz08tk4dp1RVGyZVMkf5DKwF7Ck0V3pgARwt7KkB2Qq4xlReO4RVZWoOxXImZQLKmQmvx4GRIOaEWjCMN/5M9Og3gbcnBG1uzWbkbccMQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jgI34uVA; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jgI34uVA"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-295952a4dd6so26896075ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664174; x=1764268974; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dwVcqjt/+P6tfyy9WazYLCo3sTdT6XbgNKzwRFFAj5A=;
        b=jgI34uVAxK4bTbrmD+0qXcTJ/fXpyWGo7UKCZql977k+7eFF1VU7P+iVAo7qegwCsz
         TG9sIsXIomU+evG5RbS+YezC8ukf9lxJoUXoDTc+dBkie2FPhNTG0AufUaKK5DPyz57k
         CJDANrDPOdHSdgi4nMJ/guKH0Mg/lnszbF2UqOL2jylH3QmhrgjnLoehZ2AMp1L5aK/b
         UI4Gd4GO5Ziri9l2riipa/V4fp7mzD86m5P0+D06F6xxxaeNR/uEKTVpI4Q4eVx4Ukk/
         fLRg5+rJUyt8faym24BgnY6FYMt7/kKiwrhLPg+NjjjY0NC9WW3Iw/KrSGMIIf0WFSgh
         CgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664174; x=1764268974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwVcqjt/+P6tfyy9WazYLCo3sTdT6XbgNKzwRFFAj5A=;
        b=bhge1Lcb1g1MnyP11KrThP+WgI8AQnMDyj8oZJqsjgdhEY2kKkzWrxIfxIWeXUR2zW
         pnrUu1fPl5ZY1aDXOvyDIWz1Dlnkfex9Q3gTCWX5nyDp8JIaGqDYzIYcEO92qvjyk06a
         BHw2YpjooRCnb9tBfxWRKpNWuHCE7PEIcVc6aqsBgVe5RBT8IpdAdpUavFRT0hhVuGF0
         cfEU7IacsLUbzRKwoR1cpZomNpFS9R/CWWbhxP9qnS/Hi5hlNd+H2cbCmYC6Lxhy57nM
         CU+BLKRdoqbs5QT3rAzh4aDmJFE8P/vz9hPC3zPN3saeK0K5EwBQoVHfntyq7xrl7XuJ
         GhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61pCnU29v3jrponkoZRCNxrSXYR6Sje7J/00d4BqdYI+MiV59EKA+20ipCoHszsGKvvJZUIMEjCmm98sWiVQfhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/OyyEOzgdDgo0JCtJEER73QHBLOgDWxZcZyvM+9236IRxBtS
	xD9aw6Xxkv+PCy9xGsfYvlVS7z1Y0Wbat7TAXnG1HmvbmD4DWrRWk3YuhhW4FwM+esJp+giV2UJ
	SAIH5D1STITZs2+BH5yLY7EOrJeemAg==
X-Google-Smtp-Source: AGHT+IFTNfvZtT0WzL5Nc+FAu6fv6lCFS2ToKvk1FK8qn2vpItsaemU3AQtQmy9D0GKcQaDz7XzVGZor3xk+RWh+byo=
X-Received: from pgav4.prod.google.com ([2002:a05:6a02:2dc4:b0:bac:a20:5efc])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f54c:b0:297:df99:6bd4 with SMTP id d9443c01a7336-29b5e38c0f2mr46481795ad.18.1763664173790;
 Thu, 20 Nov 2025 10:42:53 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:30 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-3-willmcvicker@google.com>
Subject: [PATCH v6 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Donghoon Yu <hoony.yu@samsung.com>

The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state. So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..96361d5dc57d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,18 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+/*
+ * Since ARM devices do not have an architected timer, they need to continue
+ * using the MCT as the main clocksource for timekeeping, sched_clock, and the
+ * delay timer. For AARCH64 SoCs, the architected timer is the preferred
+ * clocksource due to it's superior performance.
+ */
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +256,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.52.0.rc2.455.g230fcf2819-goog

