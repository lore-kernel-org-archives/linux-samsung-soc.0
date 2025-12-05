Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B521ABA2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 01:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897041; cv=none; b=pjjIrowgD95Md3HQ+UaajRz4ylv2ElSxpk0QNE/HDPC4w4ZTdPoS0yQgNogqvq7UKJ/6T6xlaMsuDQRtl0CyuMLyMtYd3+i7ompoX5ZaC67HugSqY81+RW1tVlkqk4XqJEnL0wuUhBwCqAnHqvxqszmB/bOFtN6Col1zCKtTk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897041; c=relaxed/simple;
	bh=YsQRkwt8aNS+A6u6lkYYMMDlpjUjZfaAvsLtaTmNY+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FJaJvIgim2E5+ydzlvLStL5zhJUbEAh/o6i3IRVLBCYhG8zq5XusA9BEFI0sylDOl/De0eZyXAdQHDaTIMsUbH7D4q69w0SyWqpT3Hvkl4YBFQKdwhkrq+zrmcYXn3MZVeEij4sCLNMEGFVzR8xEy04ozZhr/OvoTt/vnBZyN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1aSikxRT; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1aSikxRT"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso1711903a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 17:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897038; x=1765501838; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbyBqfLlkb7wVGA5FM2mgEiFp1TljGmkVIPsEEhzkw=;
        b=1aSikxRTaAcDvImoRZtaZS5lSAZiSqFriGJji7Dt0RPdAsD0aIpFGKsCsvwbws3eCY
         0OZU92hqyvM1AEQuDo2FURAJnDKMMceumPR/SUXfk2Z7Z3Qs7dZp0/2ZbC+EYRPNctQR
         hszQeu3R5yvyKfNcrrHig1xGQ/TMKtDCs2ehLOhQOm9bmO9OPBmoVUouAGF4i6sWGGAR
         kLZoDuhhTO4N/Dc1KAvrKsE6rv5Z1NDrWD44fUyc/dc0Wk68dcLjMIJybUqLvG/u9md0
         SCEOONQP5Bn1xp2L82OtL/oAtJZ29mQ+ClE/eZMsjEeHbpCIpGQxgdwlNfBhFmhSyrBh
         UGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897038; x=1765501838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbyBqfLlkb7wVGA5FM2mgEiFp1TljGmkVIPsEEhzkw=;
        b=t1wd/ttuuqS2ghO6k3RTXGmSSTwPJoQKf+4ubqQ3kRhZzIrktM8yfMf6YhF4rA25Bt
         QPbi1llHDOgCPIb2i1YK4+RUSlY/1ITb8hH7fOJ3lAxi+lLYucmqw7uXvICUkMFpEN90
         lbYt3wfXAa2x9s9z78OOIZMRmBHAhCPRoUeFUxuw9gtSBpe2EByRrqHIrfXindZ8IXr4
         4zCFmXIB5O5JAAp5Ehv6qkyrYAIm6aBKfwia/q6Ko4+j74zqVKHA6gzDvv/IgG42Wkip
         OPZhuCyqZ5GpufuhgNNEa2RPMjzyhK8nShTgoOzE9njYbG10ul2vyEN1VLLnjSY+Nqg9
         gy6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWREqTdq5wjENIBJgTzAJwPH6MrQO264QRTNpllmsA+psAUXHJ0a85pVdFwLnuKypB+CdUwt97JcgamoCmDdVAoIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7QUcejXUlRx/gPdNQB5R5ZXQ0Q5NGlbVmtHS86EAYP2aJqeo
	uxfzDD+k1F5JtgjTvB9JKmuyirL/7ziobJhwRMCqa7WiUumd8oDsIlTCtGqCKn818rt5T9BKwjM
	QmoU3hdV8XwdevAigatSRNKgx7AVcEQ==
X-Google-Smtp-Source: AGHT+IH9KMxSRQ5wVKmte0Bi3CRERC2XxJgetiRnkGTJBGEVXsPWpng07cULyLreEjs12GMrzr3xnVDBBaYvIjN3EJY=
X-Received: from pjbsd5.prod.google.com ([2002:a17:90b:5145:b0:33b:52d6:e13e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5444:b0:343:7714:4cab with SMTP id 98e67ed59e1d1-34947f07f1fmr4183700a91.22.1764897037891;
 Thu, 04 Dec 2025 17:10:37 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:16 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-4-willmcvicker@google.com>
Subject: [PATCH v7 3/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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

The Exynos MCT driver doesn't set the clocksource name until the CPU
hotplug state is setup which happens after the IRQs are requested. This
results in an empty IRQ name which leads to the below warning at
proc_create() time. When this happens, the userdata partition fails to
mount and the device gets stuck in an endless loop printing the error:

  root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.

To fix this, we just need to initialize the name before requesting the
IRQs.

Warning from Pixel 6 kernel log:

[  T430] name len 0
[  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
[  T430] Modules linked in: dwc3_exynos(E+)
[  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
[  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
[  T430]  arm_dsu_pmu(E) simplefb(E)
[  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
         ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
[  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  T430] Hardware name: Raven (DT)
[...]
[  T430] Call trace:
[  T430]  __proc_create+0x258/0x2b4 (P)
[  T430]  proc_mkdir+0x40/0xa0
[  T430]  register_handler_proc+0x118/0x140
[  T430]  __setup_irq+0x460/0x6d0
[  T430]  request_threaded_irq+0xcc/0x1b0
[  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
[  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
[  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
[  T430]  platform_probe+0x6c/0xe4
[  T430]  really_probe+0xf4/0x38c
[...]
[  T430]  driver_register+0x6c/0x140
[  T430]  __platform_driver_register+0x28/0x38
[  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
[  T430]  do_one_initcall+0x84/0x3c0
[  T430]  do_init_module+0x58/0x208
[  T430]  load_module+0x1de0/0x2500
[  T430]  init_module_from_file+0x8c/0xdc

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 1429b9d03a58..fece6bbc190e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
-
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
 	evt->set_next_event = exynos4_tick_set_next_event;
@@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
+	for_each_possible_cpu(cpu) {
+		struct mct_clock_event_device *mevt =
+		    per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
+			 cpu);
+	}
+
 	if (mct_int_type == MCT_INT_PPI) {
 
 		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
-- 
2.52.0.223.gf5cc29aaa4-goog

