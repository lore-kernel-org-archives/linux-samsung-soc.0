Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617F2EBBBC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443468; cv=none; b=GGRrU9gc4bQEaeoXW/IMI9rGMkydz3ZgVBxDaGOqQkr8zoHgIqT9Zf4U9UuSlXUQrLGIlaHQm/H336LQJJnHS0F7chtmAa7kQeJp1dKqyeE9FiWBUKbrFORHEcbbTuJKcLsCu9t00oNtqt6zmZROXjhCAtPJmuw2UXDBabaJQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443468; c=relaxed/simple;
	bh=M0nny4REtUZhhIQOIJ8d/6AAG3bKyfZKLTfcSkQpEvE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XwF5YmGs86dD4nRwgdIrKFPJ35qInCerkC2ce6tXo9L3WhrsSgPgbr5KdQbxv/hmuavMlzyTLksVvJSL1w1IsM28mZP/7fZz67rGxZfnRDaJYJ4LQOLtWRh/IdiqZMkxXYpuB8VN3BmKjgK/+xgGwbTIdrCS+/KzqEWQ+g2Ovgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lf6cyZD0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lf6cyZD0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748475d2a79so1869849b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443466; x=1751048266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=lf6cyZD01do3iImW+w/Mv5+NkOOiVtHVxayLg3nZeEYOMzySTdRPXFoA2NAYMtx8W8
         gSa11UviQu8c8O6RtHoys5x6/ATPTDVsLBSaM4yt7SDJNeBC6BD1YLXNImVJftpNFWc6
         Q63VzrI6Qh42kcYhPKuxKvqsjojKrtQCheGQLfdQJxHNQ3EM6/3qI3w2mNjYnoLFIjPW
         +G0iTqnLata2PfwdE4KVgw7K/b9TSne946zw5gkUo4A4DJrCECIJ7PqBJ1xL9aCnlIVW
         h2FqRrLHKILTG1AP5b5j1wRCJRh3uwyE41Lk4xZUry2X88xaE6dH1jvarRHeS6mNcmX5
         2bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443466; x=1751048266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=AgwcJZfpCQI28HOb0CLcMkWnahHMSM0rmJ5bxeUBEBuG988bYxCZHAuJLTIfmjAEIV
         cKppY7pC/u5b9Bl//Jth+VcqS/4A5TmOxYcYdwgDuuUch4vmzxvDlwNmvIQyUjEdRywF
         YZ+VzfadaCBaSboWhRT58ZKEqOvFVYE9Av0MXKGDTwJT/ekF46xXeo4uLHq+KlS7PZtm
         BGz5fxQ1uIhItAu9Eo2cQutkQTAjWeIlph9J0w7j0J8/+QcD9q3xFe/DXjz0Mq0E7Fue
         ajtOknkHJ7hu1g3jwFbugHTR8k0SYmFcBmtGskRVxD84DeEFexcWD8iRF0WoOa2zBQk9
         LJtA==
X-Forwarded-Encrypted: i=1; AJvYcCWbI6iZpkz9MbyrIXpjtIazLKTzke4TxV2ORSd4ZPUj7xbJaU94RHDKrq3MDqQt86TGkEylcTkQlEWJfBn4supMeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7D00aEucNTtU4l8l376QHKdHSmuoC5P5mIVrYoQaRCSRjDqH
	dTnSa5qDa9KFXhLA5UQyLpZQX4gKbu/CqrCD+i1TWhzZ4CqCLuiqFMzKXSOj/nXYqDggRMNhvIU
	u0RsEd/KREGZbpD691OxbVUYyjmKe9A==
X-Google-Smtp-Source: AGHT+IHoiuIPOX5cQFNIBafAR41PjPYk18rc3/O/j6tqRVu5p45znC4S855hKfUC4szgUQ9hnGaEGhg3C2WZ1qgdT6c=
X-Received: from pfrb30.prod.google.com ([2002:aa7:8ede:0:b0:748:d81f:a79e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7702:b0:220:658:855 with SMTP id adf61e73a8af0-22026d72b49mr5784487637.13.1750443466155;
 Fri, 20 Jun 2025 11:17:46 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:06 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-4-willmcvicker@google.com>
Subject: [PATCH v4 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
2.50.0.rc2.761.g2dc52ea45b-goog

