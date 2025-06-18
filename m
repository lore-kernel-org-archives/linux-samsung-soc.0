Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB49261595
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280945; cv=none; b=Sw43Y92BQRM0bw/0Ja7Ihaopd62qyCNYioYF+CBWQVwWUBtjf5Bm6l2qmVp+jSjowj0ldOEvCpspVkL7VAGJlovpAl0hbBf2nQD7nMvR/8cBUXSM9KPDtA3nwBBjEUWAVylAjxz0Drpcb5Exb519JTswbRftX5jn/MGuhRZirt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280945; c=relaxed/simple;
	bh=E5gNelm91XMJ+AZCHJOExXs098uttzq+1BtKy9LZWyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QoOl7T/iQ26srFsxTgms0sf/CFx3heGy9hGmkhHEahFiKrZknhpyZRRNXgZjRSO4dEgxjLh1AcFis8jMdEbHEl9FDU7FysLAD9XkHxKnb3gqGJyFZ7cBoeEomC7MBjf/4A41uo9wZDpssmVpZDCtJ36v9Ak79Qj4/LdwRT6vwq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkux9VcM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkux9VcM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so10458a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280943; x=1750885743; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=bkux9VcMpWx4IPdmPoZnB1XWwjlQ1OW893wHPo6hSlMLWV1nMBGwv/mQuAz08vw768
         y5sptY7lx99KYADS1uo/Ld3OpqSYcnjNEWR6du2Mjy3Dh/0hV+rQBi8CfwFwW5dVe1pi
         SzS2LkNyAPF8Jtjgz9KZ0x6HDrteflfwlvGEqV0qFL1PHwkEr7gfAfLKadWnp0xDRXo8
         tP95ZT8ZqwZII5p8+WGuUICThpeHvrtp6hd6HzOnIb77jix6Dh0j2mjEn0BLErHlGv1z
         PT3e/oT2vDba7ZfbsXlql7Qf1XMsv/lBBd3bf6cyFWlH0nlVpHBTPqhSCFV+Pm7zjCcZ
         8SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280943; x=1750885743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=b33wTCztCBHMbOHIwt2+QRCNaI1FgBMVeEVkg4NpiB1bQvN6eSuJMQzXoaozL9SMhd
         FV7Av/Mmntmb1EGHT6Q5/JKd+NRIsel0Z1S9gCSl1SUsjLfiY3hcZGfOCEgXPjLYdh5z
         /gdggWkKkfhTwxACzG3HRS46NYnFTpeUlxbn0aLE+ZcoFbjH+F33RDMJEdyQyZy7MWF3
         6F1mwoqg25j/vaMWWLq02Qdlv3jaUS2EVfByFgFuixwM5Kpie1H7o4UbcEXnYKbZfudb
         DgV3pKEdCey5hsdI872YYBQuAxiMryAaCsYf6a+rmL4VpkU1ST68aI1HDC6y0bNFfJO2
         TyUw==
X-Forwarded-Encrypted: i=1; AJvYcCXuV3HH6Mz7klmz5GlKPIumW1xH+PgUYppUX51PzundrDDmeBXp/MMt3SHZIW30yTraKpaj5rXrjhaWpyOiwYHrGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKnYHnTsOGLogdG2Ft7Arfx/zpvQUcO8meqnZwqvN8bXrVNKo
	Ahy7mTwd0GtbHbz9LUDuJBcBQi7VTXLHZYI6tlKOQ2VPC1ldGTFDRodMgYEFUbb5F0aeI2t4sDc
	MWftE4x4iX67OTeT5r+6puX7MIYo3+w==
X-Google-Smtp-Source: AGHT+IHnN4KQrdCKJ7jBLwoS1jPThBVW4hDHqpvXB6q54bqABdZTJVdZXZ6NaNfXR5nGBhyVR/ay/ByQfgGq2xiOFrA=
X-Received: from pjbpb15.prod.google.com ([2002:a17:90b:3c0f:b0:2ef:d283:5089])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:dfc6:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-313f1e22ec0mr22222585a91.32.1750280943259;
 Wed, 18 Jun 2025 14:09:03 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:39 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-3-willmcvicker@google.com>
Subject: [PATCH 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.50.0.rc2.761.g2dc52ea45b-goog

