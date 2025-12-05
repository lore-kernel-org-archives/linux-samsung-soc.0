Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953BE20C48A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897036; cv=none; b=B2ktgluXJw1Y2o+aTQSCTV8MpJ14k/wUCcVVk4ZDt6iM1CWfNMlfLYaDBvw6HDAl/+a7KfRdbP6EmP/0aExD0/8EXi5r3H82sM2tnzpVZvzUvu2m2eJQNCS4YutBhCVDAUswqZIz7Gv4UGlfmsI5o4sw641GNKRaNJ5ihyd8Ku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897036; c=relaxed/simple;
	bh=yDmgIgCZhvGrk0E9AUmatb3DkoMcKN02EEKmu7B9xUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a9dL7E34kBKIxQ5FjMlhXqFb4pUzbtr36voNFEXZ42rUFwAdhTEqb1u+Vf3KdncFuO0F+G07gmNzXA5KsgMPyl40c9RBGSL41JnOG24kcKgRwQ5h5ESr4c35Jvdz6usCmy88UQ7Zg9Rkqdo6X/SyTDl6Uaw1Ijbq75Gstfb7VyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b7+RJVMM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b7+RJVMM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297e1cf9aedso32681075ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 17:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897034; x=1765501834; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=epPHunbVN6ELvj6p+MEX1OyxA6JWq2kv5WE7lZYQqjY=;
        b=b7+RJVMMpRhEEhfnOg5lVn5fEBgWb7Wvg4SGQH0Q4MlXuE65pxgC0gPEwKkYh1t3U7
         B3pT9fhwXRQxI1nu7zYqZexNXpH1CjrU/EvriPfUZrkVWBQLAyQa9cLiCOECosv/IlFp
         b5aB1FBXWRqfMYko9nCUOVXv0A75HQS4OXePe/khhEE5+iHa+QhW6LULkimsLbSYDYf/
         Di7YhQonsX+K+GLEK7qFDWn2r+3+09UMMY8kW5Kk7fZivNcqLb6rsxxsD67KABxtGd3J
         yZucsK7xTCpsXs1C3DpLFBBXdLq1/KaZPbN6+XelSn8hrkq5gnfcki3w1rYhW88gkDKm
         xD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897034; x=1765501834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epPHunbVN6ELvj6p+MEX1OyxA6JWq2kv5WE7lZYQqjY=;
        b=kN8OTGUONDdYhrKSxmT9yLMNLurVkMUe17qrZUiK71A8lV78+eGdQWU8hMN42UxLdb
         ho+qSD5ZFSotEQE0eHCUYbwu05NwMCdyyKRPmeHVPv4AJwrOjLArQVk56UV25xJ+oWPv
         dLztrtXSAgvQ2oVV34Mts6Nqn1MLyJQ/6g3G+SZdltQPVu75ojevvObHL2N/yCrHWLHQ
         0jsYv4+EtBJTx3Ao3iJ4qoXZALFqTZTdHiAL5IB7mF77cgBSGAjooA9BD8PqMr5pgnfN
         QUqaoo34FY2lsEEU0TLy1+0nsGzOeEzw1v5eNvXAIwd+ubPXY++FIb8xh0kmKd7ARmDo
         wW0g==
X-Forwarded-Encrypted: i=1; AJvYcCW70V4q/DW4X3TRfipezLx/jrKCqAkv5qn5ZAEGcAXLj9c6PkJUCQKRTWNyFCLJFNoXw472+gl7FX0czSRPWmHVWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnh68E9SjXP3ubqWfC9+R7GcXa8VCiZb928Fp0R+WpSOmIGFmU
	iQfm1C0T/4qUBybWWkXYm0q5QJhHWVhJUkKhmUVivSAMn2/g0P0iy7RdiF3Xks3Yfbi1SCfYbsE
	nwh9d0I4qsf/xHgPGv+ol+AOFqt0EUA==
X-Google-Smtp-Source: AGHT+IEsCk2LyqVOkWJhdegH8mdf1hOi4A1iW6PlmwDrObjR3XVrHjRiwFEIsDfkYG5erGemrrr/fcN25Cehz6zSF6g=
X-Received: from plpn23.prod.google.com ([2002:a17:902:9697:b0:295:1ab8:c43c])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e544:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29d68339410mr94473405ad.1.1764897033869;
 Thu, 04 Dec 2025 17:10:33 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:14 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-2-willmcvicker@google.com>
Subject: [PATCH v7 1/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
2.52.0.223.gf5cc29aaa4-goog

