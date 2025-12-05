Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896C215055
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897038; cv=none; b=GlRkFI7/GGW4iUy9gSXdAQatYPEoWfHNMsPelkV+92W3erxlfiRYDRXx7Pdr8PfNmnVqq6kPwtWg0QgzvqYWydXlmphFAvqAND2/lNcV9WGhLXjDhDn2gGCzWOdP6TcZu64hC2Wlew1Fu5l3aGcA1R1bCW/YeBSZzlsRfpc6Wtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897038; c=relaxed/simple;
	bh=2zkySTL2gIRf1RsG3vNd16XpLLsDDWHLpQxaGSs2sUA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OuRqhmlybrUmCfj6cVZbdA4Fscf5UZo0G8btq9ipSczUkttwuag3Uwfw2GoJzrUfN/Q3ddmBzoTPJzigH6zx2IFmO+hAP8H9NVcidUz5DQzlpK2yYF9XdTGTurvlGirav+vbXjXzv7tXrgU+ZFOBo7S9GA2D76CkMt/8b+lmyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TCwHG6Kb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TCwHG6Kb"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29848363458so29473815ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 17:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897036; x=1765501836; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiOsEYutVbO+h1UqOe3paDd0R8z8pvGw0+OBJoG+80k=;
        b=TCwHG6KboMJZZ00+pVDiXFq6A1w5w1wCND72kd8KRlnR8aCRQEeDvJjIsotOuwchak
         VwHxE4J27qwjLo/HJuV7ZVz+p1Mvd37DptyEbdDaiKf3+NIz5ML17Rr3NtdYmjTZz7g2
         /0upiQvID7uX/bDjv/LSpNaxxZgFlvSeZHnOsh0vGX5lC4LTSBkHA3S8Yj2kPRmcEoxX
         EZ6Ouwsz97SR3eAXQzr4yXTAy6hPenGWHKehp6DlhrYWaaQetW2ik+rkblsg4vgR7qkV
         6+a6qnV7W5M/NA7lWjijunAuCuO7rZUdOciX1rjcDkyB6AsyOoWE67X/CDE6AF90Yz2a
         BVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897036; x=1765501836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiOsEYutVbO+h1UqOe3paDd0R8z8pvGw0+OBJoG+80k=;
        b=EuyDgGiC1QY1OxbkLrhiVkA2dfnaqQ8rDZOI6thkJStZkgiLbh6G+gaEqWrD2Ytdi7
         Q9+1f64dwSNg5Y7CfPaxmwvwWBem7MeTu4m/eVO7ZzQuoycFp7yRrjTH4YHwaYnn1lbY
         mvf4N6lTETXxNYr+F9mMfhUuOYYF2G09SX8GHK1KyF1VT643p9U0Z8bT+9883TXD5xTo
         6w7jRZNca1GXTuPaoFzq3ZYbVO+STUMbmytXGKWNM5PoxwvDkcCxd3A32k6tH19UuNnm
         tIBkwGabUxph6vV5kyNHTEr3BMXMrZPjWNjRnq5O3Sl7m8n+ccaNfwPuMiG+nck2Zy94
         Kffw==
X-Forwarded-Encrypted: i=1; AJvYcCUJjh1QU6QZlqVc0ZcTHxHbiXnq/IPjYxz8Tte1ClYAaNQrwrVcM+jbOmBgoCod4onCgaSeB6hfg6IyjA1tsbX6FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxgrLMcas7cT1LFrCEgsQ0iSYTOQGSCiJywwjQQ+JY53UPE9W
	e/dUZqIV3AU2RxNCBiw8xYSd0XzTzxkbsI3VY+p9hsaS6gUyjQKnFeXQYUyrLNhHTN9hUAh8cDe
	WnAiN49ODJXawwC1VcgC6jnhoUqveiw==
X-Google-Smtp-Source: AGHT+IGwKjR6HoWiAaZHSjZKfvDhjRoj1KNeMWN2XQyeip1Cn/yVXxS2IBKHwOO4uvafLBMoWHmMfbwd8u1Aw+IWG2I=
X-Received: from plbjy14.prod.google.com ([2002:a17:903:42ce:b0:297:f856:fba9])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2b05:b0:295:57f6:76b with SMTP id d9443c01a7336-29d6833c55emr97042065ad.7.1764897035793;
 Thu, 04 Dec 2025 17:10:35 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:15 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-3-willmcvicker@google.com>
Subject: [PATCH v7 2/6] clocksource/drivers/exynos_mct: Set percpu local timer
 interrupts for ARM64
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs. This is only supported on ARM64.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,9 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.52.0.223.gf5cc29aaa4-goog

