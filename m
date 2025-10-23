Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EEB26F2AB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252656; cv=none; b=HQD/YWHF5gkh42GJ0rSgWJQjpAciVG21SKa8v9JkmocbIqdvrLnoGD8q+/oElLPHQ3D25gehmbOqfdp/JVB6il4C4MI240L66/Azd9q4RkwTObUOnyDNpLxENjcZtoQP7AePRBWd03barwkvlDM/U23VRwO2rWecRozLSCsxxiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252656; c=relaxed/simple;
	bh=dz27i2JZrLdYVCfKj6wR/Q4ULc2X6qv3RE59HEWlXnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SSsjwyF34lZl1rYj6uTqwCVGE2yzwNZjGLQ0zWcW0cVK/RplXYoqhw1y47P4tGOfNST7397Gq+WsppaNTwAeDK+KJPL7nw+qI4CTi3Sjnv26ZZyPqmbE/cgPhyX7Hrr/OpaQKyK0CrZVcvavUAb66edBK+T4nyQHJ1zrwPqOaLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=27DqkAzk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="27DqkAzk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso1875400a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252654; x=1761857454; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=27DqkAzkwxiXBd6nh99BYvxPFAc6myfzuhr/dMgRsSeORgt2bGneE/yNY6dpycgRyy
         STFF6noyENTDzr0JpRdc/+6Gb6Wh2mrfIo1DZxIHblhb8+9R74g26iBIpSQBHvuB1Yp7
         7MA/Wh7ykJYOMiy0UKaiv7j35cBOiDIS7k4Wi77CqlDIvWxwPILNEph0Xg8uQNXZ9Zr7
         T9FDu5tdWfhQURYv0IHe+RWBH/HMZI24d//IjgNZ8DM8dSGVxDyWMb0aT2KgG6T7JlNE
         dFpYXgN1GoaDc2rpPcJb6tYrwE9FBvtXR0PQuTIUtgMTO0glds74tWQeCmn3kqKl5mPC
         L04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252654; x=1761857454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=vWrXAt7/PCvQxsbIr0EmEszbw9mY98Td0Xi5Rl49hIGBb7Bkzaoe/NJW86D9jofMmq
         pL464IQ1kEoMlwbDSPzNDD/XGf6ZhlsJ3xkrI3fcoP9xoNAw3dBDQjf0PutOEcr6zv+3
         163FhWO9RSDmmPXAk6sO5FE0LPcTe8mLn8kvxzLoHBzezISF8pu+ucCUPqLl6to5A4HN
         rbiD9y2KB2KYGRkj/Zk70GMadU8e+PD1piScGR9cVvyAJGQh8v+DTOVGtUnjQVJMcPvJ
         67uFFIsk0uNqmXuuPpuW0dSwjUGG+V/YZ9YcXM4aD66GmuHLwe+EdcJ+dNsiVtmufsHf
         O6fA==
X-Forwarded-Encrypted: i=1; AJvYcCVmeb0Ycce3BsN8ii1S1a0g5MDxb+O68uSI8VsUf9tXSAVnE1zBtv5GeYAPi12QsvoWgCJT9rbmnCemNNDcRGlw7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyurM+hwSqjwUE5H0kCFxLsjiTfKvHRGxgjh0wgPMftL+8WtN1C
	14NjZquH1jke2L2HkZlthu2t7er5yluXzFWuPCz0ng7iKuyV4ASuZMNR7c+wjaGOq92Eqy8cbWo
	BXcYWqcfZm3nsvvxZlCGGajEFMjdgCQ==
X-Google-Smtp-Source: AGHT+IGL+5kVHhQd1OfDjE63ymS8X2c8akCZDgOtgOFkQSZNDy1zc7o/AWAgmT8EIgOAV2XCAQ/VH6rMwtmcpBUAUkk=
X-Received: from pjqt14.prod.google.com ([2002:a17:90a:ae0e:b0:33b:c59f:b015])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:998a:b0:331:e662:c97e with SMTP id adf61e73a8af0-334a86172d0mr31428687637.37.1761252654301;
 Thu, 23 Oct 2025 13:50:54 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:29 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-4-willmcvicker@google.com>
Subject: [PATCH 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
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

