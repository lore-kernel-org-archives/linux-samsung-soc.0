Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C128FFE7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252790; cv=none; b=UuR/FzW3Fzgwp8C/SYikoaR8y981yGI/3wVzr2r2vogjZXgtNQ7PQ1OEezYjZl7W9cYO/Lr6rKCDKpY9CpLJMSBirqA/3cauizmNoCa3+lavi5wcWL9tb/ZnfPtDk4MLGLn9rEVMYLB43dW/d6A07jQvyPbAdneGEH/r/JPKPa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252790; c=relaxed/simple;
	bh=dz27i2JZrLdYVCfKj6wR/Q4ULc2X6qv3RE59HEWlXnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=REnM7XpI9o4eVStDF44yUMmNQ619pxX4wiFv9B+qQuuNnr3jYyhRD7JTsDeFKkZLWP+5eAVWsznLgH+ryIuijcaRbnToJAqa0vtQLzJdDwjlQakbH1rjLoQFNXptQdPKzeps1TrXyrbciT1qae/kdWPcVLFsIoIsRqmUBrDHgNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xFT5fDP/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xFT5fDP/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33c6140336eso2733077a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252787; x=1761857587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=xFT5fDP/vFb9NuyS4zhP90YemMC59ErUHGObTQUbf4uEZVxIiw4E/mXZB5MR2k2bxG
         q+fIHii9rpV51FVcPLyNnIm6a1VfMd0WyvDPKbOF/gx2YJdkvyg+5P8jCn96ahZu3ukE
         /zEaXtTFMCVX9ObonNdCaEdUNAkZZ+qx7HpmnEb6prCgHlTkof0b3vCBeBfcGiiO5Ro0
         7BUH1r2GNAY7PPJ4GdyC/jzIvDa+HxnwtAUo1fbasGhOHN9iNqPWFbFHcClFrg2RulIj
         Bglw/C3Hmi2TQcrS5jo2a8CAmHXLklrHIOK8unUbs6l+fxQBsXzFvEmj7l86jLvgCuP4
         14eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252787; x=1761857587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=W/f9cJWdvnP1g/6ELO1rz8WqCetoQqb3+WcnY/HewCYzlvJ5KGJfcn4Nf7Ee/+klx+
         oZQlyFzHLiawOfYLFhumIdppg2mkfxRzOpqiphbZLLhiKFuoNCJ06x0mNQKyg8yPj39x
         7EshmYEmt7BWiiGWEI+utDxJ04ZqjwHGj8bU7DHa0A8WfiSOtH9a1KwrBilcFsTqQWsj
         qkrH7Xq1WyGoMtPa5siuI2llnDnBlrtH9Lt7AKxk6EGOpjbbqKKD4Zd6bWzR3XtDk7+j
         AybJBdj9gGQIrp7uzpXlbWjlDoQSkQqG4CTcSO5FuRofHUeN6uBvwxs+SsPRdOlLy2PF
         7vGw==
X-Forwarded-Encrypted: i=1; AJvYcCVUYdiNpluvHQHFJ+7uZUKRMrySaIGXbwL7eJhOex+W4auOF9fd7f+Rbs1n/4J12NetRj26rT4cBJx3yQge1Zz79g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQv7MOfAU2QkS/mIMBs/zHK0zdeG190G8gBsUXz4D/lOvhe7fM
	UrNKDBlupzdSLixwYpdG4ropIgO51qLbZiCYXFyssl92ZBaks3Z6NgdNVTfccRgNbh1a04KeEaY
	uIMm62PJ0XDqfI8o/vwQA+4q96O+DJg==
X-Google-Smtp-Source: AGHT+IGkZMpKJqJOm+EoIaC26wIwW3Vcq2H4akvTHbJ23iF2ppwmzR08YRck2L56OCpeCC/yq0C1twga9aOUBHTIEUQ=
X-Received: from pjzm22.prod.google.com ([2002:a17:90b:696:b0:339:ee20:f620])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c4:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33bcf86bf50mr35134169a91.7.1761252787527;
 Thu, 23 Oct 2025 13:53:07 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:45 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-4-willmcvicker@google.com>
Subject: [PATCH v5 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..a5ef7d64b1c2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.51.1.821.gb6fe4d2222-goog

