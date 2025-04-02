Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215F1F8720
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636889; cv=none; b=eC39qmxi1fbVW1oEFy5p/ToppA1S8bIgZXWDColb7x1jvo1ZlLrqdBbtWsPGBu/FOxdhu4tX1uAz9yrHcoh0+CCnUmwbONOaKwFonvgv93+Rwf/ibXedhr0BwRvSoL8lMPDzhKQZQUaLkd7TuxxorrbGgtGv6a6oeUU1mKzaN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636889; c=relaxed/simple;
	bh=ueaYVRAKsehc2srS373efDZ/O4VukJoPLwDJHqA71FQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X5B8y5DF2Qs9dpSRwcREoN4zTxMSFfYkYzfYYWtJalnb3Q5u2oTlHAJpU0nmDw1gZ4OkNNPp6KyjdwtuZXIVgbvc6rjJDmquCZa+wLH8P3MHJgo7aWkLa4mH3m6jsW5ef+UoXaCWe06dsZy1RzT+tMm6dAyPKautxw3AKDJXyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1sxlpa0H; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1sxlpa0H"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso248174a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636887; x=1744241687; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVr3hb8iK4op+4MgIQ86kZFXoHl/MtKw2J/QRgo4taw=;
        b=1sxlpa0H1JF8BrH7hggp6Na6klo3Gkj8cXo/wjXBmDLkIG5lpj9IA2IGXXdIk3fowQ
         TCYeblyVJHBH+/sycbO06EdbqQwgdj8qdk0ap08vgjtmSjIAsUoBxrfmCdwOCaYS2MQC
         +WwRfrWl9mTl0lRWZ1rIvj4W/cjXdGxUm+Tppdc2ogCXDf6zfir+nS2+9FR+T9nzVyEJ
         A3mVrALbefXiE2ZVqsleh86D7OX3tdaCREAeguPQoKVGkDI82UzwytEr8/Sgl07aRjoI
         GJIuY5sPCdrs1tQ93XhOqePWKN9aHicUas8UV13vUf+s/HF9rGRlslWyjfdFVTijzNpq
         UKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636887; x=1744241687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVr3hb8iK4op+4MgIQ86kZFXoHl/MtKw2J/QRgo4taw=;
        b=faz9g2mdBTJSPBlRPAfsWtyrXYqZri7ZumZahcoH8snmLxsque5FP6/1WklmLcy2C/
         yS7S1n/YAYKEm8ypdxbtFD/y+cRxCZgH+jfCp5bnMtMB8EsJA87DRpyIDD3vDZenFYwr
         X5v33klHiC8l7YPAZjJaHRRpFShW3rQ9IDu6qdWLo+xsHVCNSKtKev0A0ZRYEXlsIk9R
         091jmgj2LXmQqgcXHFM51OArHawAM8UHSkUKFR0K3a9u5XHOblopUE5Nw5zPW2Ty1SOJ
         PjZv60YtWKXqDaQQ3kQ4nhfNmY2Oq/GBE58LQHmgXckmZQ1PhcilyuhRfobUpILPXFSR
         ydYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMoeBW9pS8/OJoUOBhjzRj4v0LMB1GGyw0LQE0cYqPwvhzhI+t0QbdLTpMs2Zecvgi/wY3rkK9M7k0oSRrYKciFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOZxlzYbVccYhQesec4EgOasRziuGbk6Y9VIl5e4OYOSft2D+
	Ey63idg7m/o0LVRHfosoZlvZx60v9uPC32OzDgiCE5EzQfDmpV9nfGk72fPwYTsHjn8qo20K6Kd
	7Fna590HhlFDeW/seV/eLR2FOsA==
X-Google-Smtp-Source: AGHT+IGFOOhmWr3Z6viGq+ulkQ92nT2eBCuYGsXtiOmRX4Ho8ivQC5UMWY8LfRMuamRE7HQJon2Mz8MvCxGpPT2O6fQ=
X-Received: from pjbee12.prod.google.com ([2002:a17:90a:fc4c:b0:2ff:4be0:c675])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b50:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-3053215c05cmr20698254a91.34.1743636886898;
 Wed, 02 Apr 2025 16:34:46 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:53 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-3-willmcvicker@google.com>
Subject: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To use the MCT as a sched_clock, the timer value has to be accessed vi
an MCT register which is extremely slow. To improve performance on Arm64
SoCs, use the Arm architected timer as the default clocksource. Note, we
can't completely disable the MCT on Arm64 since it needs to be used as
the wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM SoCs don't have an architectured timer, the MCT will continue
to be the default clocksource. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.49.0.472.ge94155a9ec-goog

