Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967A2652BD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252792; cv=none; b=a6zTH5jr7Blv1GVqbeeJC1XnHbyVT2YstJ6QTP1oqqH9aW5FX+oyWrXGTZjl5Pdd0ImENJ92VVftF1iGZ43g7jQauY/xa/GpnXGNJlVE3zl9jLKPblICCQCHdaQ6LNqUnoL8DzQKET1FwKHKnyG0+iUCkq6+DrZNLOfyciAXqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252792; c=relaxed/simple;
	bh=n8cqZMaXb4WTd1saP6x9nx7lED6lPw7jzNOTy2/I9Vo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WN6fURL8Nn98byUKkuujHWPnFrYEGwuoOt0fsDqriaibvnMFknkh5KSqCVDL+eq6IPQDTwEpEt9bFgZo6BBriti8/j6GrAj+NzPMp6NySTTIgJU1IttxHD0p4ckq9Pi4ntYP7DIOsc7+2K8lSeGxDmzUr8tWAFpqbz0ftB5N1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jlxyKTB3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jlxyKTB3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28a5b8b12bbso33919135ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252790; x=1761857590; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=jlxyKTB3gybt8FUhFCvqKuivW62duf7vgJTfh+fgVKu5TCcLGcSvaW4C70HiCkuyUv
         vHrZpv3OeyIv+sEE/3MXeCgkLulYwLeyO6hYARQuX4aSxW/zgdrEzvjJm4DhGr+p9W5u
         1sGvgbC5M5DNPFvBm03CXn2YF/VAhikvGKIwBPRRz/spzWmjlmPB7j3Ww6wvcho5PwqD
         GXRfOZY+xQWXaqIoBHdPQytBdbozLStaNPisB5Sg9taYH20OZWj3JK+qHTb/lnIH5/4+
         NiTObhAOjFa+bN3HBGLWnEHaIk0MNPHHveUpbrJS/pejnOJeSDBWdhg1AzbgvfWPwOyg
         AA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252790; x=1761857590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=YSWcZa0xszfsBX3SBj33jUiSytM9Yn+WOOg34Q9ejKJdEdKE/S0WP7oakI0TF6pKX2
         jGbCx+YD4hTu6+GO/PGtNg0cdBoop0dBcM5Nf+wNtNZx9MS1yF9b/MgO7U3iQo8rbWf1
         RSL8Lh6cWFe2BDEQHrQA1u7xkFeIwJjDPKtbotRxbfuLcyu3HeGB3+MHj8VYtAq1291N
         Z2UpWYbvfH1F27Fx6aRMBtifsKbOaU3zA5VfEfBsohESSXMmOzqfwCfOoMbYAzA2F4hF
         Hsy3NgCcXfn4r4vAPFZyKa1SlQfWZ7F2OWYzdWQlD16tpILqsO9OBTXAoBERtqpkt6+9
         cDyw==
X-Forwarded-Encrypted: i=1; AJvYcCWkX0/76zy0unhe06O/JeJ9TY2K3E0uk3SDhGOe4trEcLJh9Er9Z4pBohDv8z68H7E4tya0O5wMOoGgetEEv+Gggw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXoZBlb/BADwQyDPb0EsjKfyCbtexg2zPpIUReCty2tXApfCw
	xNPVgJmxix2tGHP8NvXdFQLuwXPGoPjHHngjYsR4OYnkd1T/BEFaEjvXL33wIUtvp3Y8spmGp0b
	MwnyTuxBR3vHALQ+aaubIQkeHY0C9fw==
X-Google-Smtp-Source: AGHT+IEIa3iCmSK88WeYaF57yxXrkmbmjgzKXsIudMzptYilutAUUKrusmtBqAF1jBuMVBsyJrYvu9lT45iuYPB4xpU=
X-Received: from ploe2.prod.google.com ([2002:a17:903:2402:b0:290:2921:d4d3])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e944:b0:27d:69de:edd3 with SMTP id d9443c01a7336-290c9d2649bmr315429985ad.20.1761252789682;
 Thu, 23 Oct 2025 13:53:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:46 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-5-willmcvicker@google.com>
Subject: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

From: Marek Szyprowski <m.szyprowski@samsung.com>

For some unknown reasons forcing percpu interrupts for local timers
breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
flag only when driver is compiled for newer ARM64 architecture.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -597,7 +597,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
 					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.51.1.821.gb6fe4d2222-goog

