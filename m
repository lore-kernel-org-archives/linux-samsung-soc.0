Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FF2ECD33
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443471; cv=none; b=jITdn6JTknZOtaVomdO+9JyuycgnqZcJOD2id+LJE/gpZfW0nimKQDxEUd0uw1MIzH7Rd3xv1IIGDU1w0s4Bl6Qsd+nwyO7aacTvd4bmUBo8V/4nVO53iGHx7baC3WZJDcm1KxZ8M7ONPVhryjGwYhtzjRvD315HB/glB2aw5Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443471; c=relaxed/simple;
	bh=qdxcwdOlQ3EdsQcn5czc5e/96PPBxIfgnyOOP8Kx86M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU3VUBIzercopWlVBtimZO3sa/B3WtA7KYJVMxxCd2dm+d5fgFcMZ62cJFnst0Mc6xhxSuMIN9Gd8VUZpp5gyOe6Fy8C/cCGBalzMlsIvuoJEn9oKx56MC4l0xSNe0ex+hyKaHPMK5AG+kYdYjULp4lyP0UmlqNB88moJQGfVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yjTuIaNq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yjTuIaNq"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74880a02689so1735928b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443469; x=1751048269; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=yjTuIaNqXautQ/wHGc8RJ8CQ1oUw61wmO4b9F2Q8Q0E+DhQ1LDgTMG/N3Ye0JYkpXQ
         bDjMHulvLr1LrFioiP8ZS3DEaEsBJ5lrNbvG3KIFDYbwC09j64zDun8RLf9U0PH2B1iT
         O/+5ejXOwvKb6yR30AM/hvlYxsNWbv7Ft2NfKa/jDIknBsEyhTlDDM6QB8YrHxmakRVG
         Wfq7tJ7T3cB9tAefTWmwUvrET8BkJvm6t4PRVpDLVEWqulZM+mBytBOWmyu6N2THUNCK
         dFMyCWWvW+36SmXZZgD1C6kVqJsgRFGCU568XKN2pbFZg7iE3N/Kc1RpOovoWiNr3odm
         NmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443469; x=1751048269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=VGcHQkqOrW9XrlJjeAAuce6cHLHfLofToNrJSfUUomiK7oPjk7enioq9XlKEV9vSL4
         c8QFGEFK0DiIn5B1qK3QJx7yKgH+7OSr+ydY+XheA2ddQWJXYFsYeu+9eBoGtAhHebUn
         L2MJmd7bWRc0CD/f0S4WgXm/pyDj9IE949zPuUfWePw3la5Uw3drBRTXzGPJhe9qZ7ZM
         FUZ9YfWG5pN3cKePSMKItdw4unkpHu1XCwzImcEjQrIYhfGoF+VWaBBmE5vxsYuVGjek
         QoatBXWu2AGGscxueUFtehBXR6HikZu0f6ZZKAlj+QRFqK1w8VQfk/MMTTyTb0VnuzVZ
         e/eg==
X-Forwarded-Encrypted: i=1; AJvYcCWyiX85gCceIs9rixlXMZemglkPVeaNlMP8J0UlKJgJEcWaph7EU5tlv9tCTVVxRfB86aDnwdYGIfaaYnq5arfqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsSpUgIOnbNyVMegbR689NkBLVb/MlW6wTQTGM/hI1Lu36mGT
	xBWRf1rk6pIwGpYDm0MCSSVkOAIgd9Rj1gCVf5xRxpwd/OpGjCKBcJGnQwUsoTdfo81XcWN9H0K
	6CAuZDfRaiqGtDyfA+UOBQeeqStiS7Q==
X-Google-Smtp-Source: AGHT+IHpdvlqIvd5OPMBnBWNmW/55tcTKxbpdQaDGPMx3/p+0hFPHDCPkEbjUA750R9QqBN1jh56itwHNkqhRDPQ52g=
X-Received: from pge20.prod.google.com ([2002:a05:6a02:2d14:b0:b2f:637a:a7d0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f8b:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-22026c30688mr5635494637.10.1750443468893;
 Fri, 20 Jun 2025 11:17:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:07 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-5-willmcvicker@google.com>
Subject: [PATCH v4 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
index a5ef7d64b1c2..62febeb4e1de 100644
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
2.50.0.rc2.761.g2dc52ea45b-goog

