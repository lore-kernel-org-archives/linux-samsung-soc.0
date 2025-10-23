Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31241274B5A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252788; cv=none; b=SbebCnxXfn9M+1M/0hJvmKCTX1Yy7f2UIIZTPZwOrlRR3KxkhkCvaT++6CxOgfm33dC2nnuVy0Sd8LiT2QZQ/MK8VVv7cN41eagQTSdSHT/oFOH2PexAN40/dX+87WStvqQsldkv3rh6BflZB58C6toV6HgPwvy68Q4BluFql4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252788; c=relaxed/simple;
	bh=2OVYsiaEALq8X/jeb/e/72PKIxNOL2+WIgOo7aBNVYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jax2wLVpNNiwTG0VEa3LuKfmSXuBWbwczhxJBR2m6KZh9qAAj//WTDNEuSnhEkhLuL8Et4FfS4kJyhTb6nG8cXiVMxbvPA5XTEI5oPybEHWtETX3SAcylCYmGptCO/5BCC8RyJdsIU24kF2sgS6QsAlLGTGuU/5WOyExR3aF7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yBV2Tw/v; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yBV2Tw/v"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1003762a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252785; x=1761857585; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=yBV2Tw/vzcH6yAbKfyYONLU77dQp5VlaNoqUQCJcWpseDX5Wn6jzayn/xvvg9JNxFi
         20U+VbLFK4LRLaxPH8pRoB1W8TEfFC+9XJ6JW0HnMnvyH16apzzc5/N+tC3n0L5rMMfV
         Xkk1/RT31z9Pc6oiGq2v8nytw8v4WMj+/2jkl5XrMBScF986yFIhPlN98mjf/A9uMxVB
         8Piwni9MPjptHFlbxB3PtwfBk4Nmj5Daay+f15HdT0suO+tjJ5fXN6mNV46zidrw9RL5
         oPFHbVAFinjO+eWmSChIXalxhYePRBvpb3hRqgT48C9Ve5W6ooZ4wku8aMDaHrjlOMT/
         3FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252785; x=1761857585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=DV4MlJpiZELAQSi/gP6VShyLS29FnJiZvD68hbSXQyMjxyIRO3VaRNjMrQS2DrLTq6
         x0Do3bb+hL5KaOnh9JN53sVt4zyWks3zjwefdBKyzDFsQnl13UlYto9Uth4cERAp070C
         92kFOglqj8N9YtbZqHCWkBoK4sBOqMEAMCxzqsdmF9xhYOa3rTgMzDqpBpz/cXUteERl
         jfA3W5kil2LP4bqUp10yKdch5AHnbUTPGMyK3rvmTnjo6ZnihDx/VawltSWPNFtnxsE9
         7ayMNrWqnQw94IJ/0cSB71ZIy2uwrtC+PPGv6mF/kwCLutOTEVWjQej8GKWTt5OSMJnU
         ANgw==
X-Forwarded-Encrypted: i=1; AJvYcCVDoX8cQ9AZVmubL8XeeDxNgsW4d7EonH5qgYXTV5qjsdxATDzhPfqhv6hj0zkzUhegFMaMaVEtn1xIFKbHzoX1IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga0XKV8yR3+vg3/Avem4LwG1zI+TkmDY/Cc3RFrJm/v2z4oqz
	zIr2WA9GfuSdepACbO0EHGP8biKzDDj+7oPjmEsjzCDTcN1Hm90fPvK3y0kIHfU7yv+79FdKKlS
	HL7BcnXhSlbhGfOq0AwhAV5Nfkuv4kw==
X-Google-Smtp-Source: AGHT+IFP81I1iyalJE6aYdlbb3aYFaFBB5LVK9Iwi6HZICalmHAgswwkY0DX0NqFtFW5Im4RHwVUP8KP+TPcn7qo9cA=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:33d:98cb:883b])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2c3:b0:327:f216:4360 with SMTP id 98e67ed59e1d1-33bcf853706mr35210162a91.8.1761252785336;
 Thu, 23 Oct 2025 13:53:05 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:44 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-3-willmcvicker@google.com>
Subject: [PATCH v5 2/7] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
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
Signed-off-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
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
2.51.1.821.gb6fe4d2222-goog

