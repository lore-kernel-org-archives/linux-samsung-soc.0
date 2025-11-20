Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2B35B132
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664179; cv=none; b=SaWETCFzwWfG0xaMflOBsp33mG3n1hAmvM50t2N0WgRddNVV57ygd04LMSiRn0dnL4evjRJ26VIvBWzbpygecqKgKhSEhEhrvuUlUw8Y23ag4Pe4fT8V53wrYH7F9pkJPXw4Dk1LE99CGhcbtdOmIhHx2Xt/QhcF5zIsFdi96YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664179; c=relaxed/simple;
	bh=CQ2TWS8aptGYMzzphALGKplU6Ms1bM5/JLx4uRHaTJY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DO0DJ91fuQJmvBI6fd8f7EwjKWXvRHwr9+48Hosr7I+viB7eCDlQttrz8opujvSCwjXQ5EnpgU+cwWW5ZYmLXRKjnXMyWEjHRdS9ZwkxZdxpuoJAinmK4dElgUnmmd/UeMrl1GeOZrhWgkt3brbwIRlxrK5QpqDupolGmAZ23Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UKN/uUnB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UKN/uUnB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-340c261fb38so2171703a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664176; x=1764268976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJIhZfmMqbO9mcnaTw+JwlxVWIorab3X8zBbkjMr7nk=;
        b=UKN/uUnBv+YKzBNhR5YGJV++6+94CovV03Voecj7DHZOJlmhoewRB34Ka9V9ndCAvH
         Mml/FzASmziEY1MldeaVExbOOiDyvZ5PH+MVmOdJeMWmJXFIPq7wlMlEzvlPzTGc0mzz
         KZ2XYJqSRchVY20+MiugC+SB1Mn2HyOsVdD/1DfKHYFDChmZRZG6X72DFkRSwuXTMKti
         /4pbBn9JUEKemQO29uAAbn130+D3yjctMsUN119zkHcXsdlEk65jxzwnNqUv4EvcRFid
         KfYPDm8HRlJbDtp2F1Qy1ZYOL2bFZrjR/uOWLnBO/P2QzI1DfqZNLgj8zdEp9B8eyr2U
         4zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664176; x=1764268976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJIhZfmMqbO9mcnaTw+JwlxVWIorab3X8zBbkjMr7nk=;
        b=dBuj7ttc04n95ZHecRUMah8Y4HxdE+Y1riXLBjzdgXKf1jf8Xe7Ag8/p8bHxKwXaXD
         fVzi5KMIbkSdkH96e/3L2gOV9uGZyVavECI+5VY9cfLBGogJFdydnviEC7S4CQPRGoBo
         LTXcxB3HcgsaF8zZr2BDE8RnGPn0EbE6BdBc5hIp9noNYKUNsPQDn8NOVPx5khAwoAZ5
         IpAMHz25nIJURu07ftPbAvdOvXjwKBrWbRZyZ877LneIm0o7O7eHITF2BmR6LcQxwjRg
         1lt2HNfcXqjTFQb8EZontk/hqvghpdF3QkWDSU50v+N89egeAd/DIdD//4a9IwLGF3yK
         IXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw0kwDdsLQVyHetITZnmc2qAeBPeH4fyVZfDzUs91riLCrbAJGw9jmXgalS7DvDrtT8zD7rKZb8yF8Wd3mkCS1JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32msK0aegb2WnNO12H3XRlKrkyFaRwfzULoH0pyEZgMILyyWM
	u4HShzOpq6/v9QVRs7e7EyU4BV4/l5SXji83F5ZmIKvX2EQJbDTyYnAiwxpHg9q9FzBpnPkYZds
	tLVeFJgIlr0ufu3KVRAampg3+XxOg2A==
X-Google-Smtp-Source: AGHT+IFl9fEZIqkiFghfs+vHISTz0rvAH1muHgcGsd/RNvOZgDkuVVLTz0XzwarjQHuZpL8REviNMoTiDtwcLfUWL4w=
X-Received: from pjon18.prod.google.com ([2002:a17:90a:9292:b0:340:5073:f80f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a44:b0:32c:2cd:4d67 with SMTP id 98e67ed59e1d1-3472a8fb8bamr3465095a91.13.1763664175778;
 Thu, 20 Nov 2025 10:42:55 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:31 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-4-willmcvicker@google.com>
Subject: [PATCH v6 3/6] clocksource/drivers/exynos_mct: Set percpu local timer
 interrupts for ARM64
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
2.52.0.rc2.455.g230fcf2819-goog

