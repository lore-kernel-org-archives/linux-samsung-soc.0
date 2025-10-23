Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429E274FC1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252794; cv=none; b=m/B052btFFf7DXlvLztEEPIoFcWcgE8WpGFbSEItbW3ICQ61vWxbV0UDRp+A6xs1M4ydsi2U+LJl005CYGSUOMGSnW26BUlqkhgth6Gga4x4LHPSAhdlUQzATDnzDpfsBIH0H/WcTLO1wmb7YQ3vt9izvIc4MVOLDCd0/ZX2ekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252794; c=relaxed/simple;
	bh=C/1zX22wjI4qtmE/Rs+0jxW/rC4laO75J74Tq/ISSYo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pa8X9a9JhIxsrLoT8PAziEa9TtT+SFCp982H6KujngeUiCoYj90jP2XcBrqCKBaOICKJ+pcYzWfdgUmET/ecyGdTm3g03PX0RO5JF2k4I69451T6i8lSHoqp6Mw23KsfwzXhipoF1iWjB6eH+MlsJ/n8uAOzS47sbR+mq2TvnDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWlsbH7+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWlsbH7+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso2930863a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252792; x=1761857592; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=RWlsbH7+tPtS85Su5B18H9/OwJc6o3vcyDCLKocUUY28Npa3zdngH9vdW57/bFojTM
         oV+3M2sVGEXiph6I2AdTtZwc4TGt4ARACKttwo2iRAVeC2FyvWrbbabH3bnwfxiyC/ft
         NGe7GPpA4WhWNgZX4pM7XQBMtbA14o0jtmzsDvrfexX8qMwI283zimtakGTz1zSNieQE
         hX/r17qUyFXpbAaTUSpNX8vMEgZhSpnggTG3WNvuJXWwc8Ev1WLeg9P1wdUvHkJmNddv
         3xuQTKAfCRdM9tMUPMw7Ef+rD4xoyr2ZztY7AsdZu1ExUDuhCNA0yR1QaMdysLByB1kS
         jc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252792; x=1761857592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=JDejFtxkiHR95FRuTvacjNjNsnJYeM+obID3YqAXC5xWlylrv5LDZLFgXwdvee4Iuy
         ddaLSlUU8D+WnOgBRJXiDyA2EfQp7yjaNhSDNTSaJu7dJZDZ+JAmzpjR4h4+vpRM7Z4S
         ii7xONiHNyFSVsQPyeCAohu5o9ed2shWI+GXy+mK+85oppPtpwtkXwpbS9TjUq1zqYiX
         daIK4rRU/DAr955h6HJnYfS4AW725o8e6ImjZOMXHYQrDP052ubf1xoYA/y1yyLjPje3
         Zxl4ru5Bh6MmF7bbU2BmiNsBeaC8mL8IsmXSh3DmqB1NccR277ewfBPII8G+dda2FWNy
         PABA==
X-Forwarded-Encrypted: i=1; AJvYcCWHUkwikzt2uyaQ+72RUG/TOZYaP86nXD/nf+vC5AVgT3sgIgdg/pnd6IeI6bpY78Q6Ks5q+Ax/Di3SGdUuk5R/rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzou3h9fPnDpTk7Gsh3iK9UMhZMoWc/W7Y940gHOTZ30kIq4WUM
	uEXbAyZSUsPdHO+Vym7r+4SWWdaCsHgWaz7f1eGASsG7ylengmKYTAXkRrVrEdEQ5otZ6YQw5++
	BsPTaD5IazN2SuQOfx3eE9A9ImfGVYA==
X-Google-Smtp-Source: AGHT+IFW1kad+/CsnnzJKL1H1lX75kDUCzIPITXCJ5Bo7w07f+DaO2z/DzasuC8nJRHc1pc75xqQpvcM/Ch6dWDL4aY=
X-Received: from pjni12.prod.google.com ([2002:a17:90a:838c:b0:33e:3082:9b48])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ac4:b0:33e:30b2:d20 with SMTP id 98e67ed59e1d1-33e30b20e23mr9036228a91.33.1761252791696;
 Thu, 23 Oct 2025 13:53:11 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:47 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-6-willmcvicker@google.com>
Subject: [PATCH v5 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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

Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.51.1.821.gb6fe4d2222-goog

