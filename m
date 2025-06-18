Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D371265CC5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280953; cv=none; b=DsgB4i+/j80WtLfCVCL9x/5rJzrF/M6DfRmRA2rUiy1FkGa/JEZru7sPqFar4ksrNn4eV/Ab9SfhpJtkloAn1CPcZrXre62gYVApMxEFoVlJojYYyhW+pyxKZkijXLeLyMf8iIjyTOn7/cV4K+73oAmI1Bm3R9oNuihhF5D4rRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280953; c=relaxed/simple;
	bh=qdxcwdOlQ3EdsQcn5czc5e/96PPBxIfgnyOOP8Kx86M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7Wq0/OiZv9+EDqsyG3je1N4srTPwcZKTpLI0PYPfeUrhwEIYUtCPc7GsdyZ+3RkHXXjRULNmwkWPksaiyOonF3d2JPpgXS+ZuaWFfK7hQ/Z1Kj9qJ4y3xXRuHWkayXiCosOjx7bn1Z72P7GfEEeo/iMVJw4pQ4XNCh6jVCVNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8/hutxz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8/hutxz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so66361b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280952; x=1750885752; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=s8/hutxzt+cOvTwLGZVLoJ3pZ3Fu2O7TIENBZ5wtSi0nj2iJUtryTTYdWMvzFxE+dr
         q6is/R83JEFND10k5QxNeQ/ZnXrLYIMdv27ofZzu5WISpK8amqdd3+HO5n15uFJmUrdi
         Fwf8lL6xX2/hAz57veC6exCI0qQQ0LKxd9FXb9gQUZ0qYjKrlqNutri7VKKDexZh9hJP
         UI8APuArQCRA4M0EuDL7V7J6GVbRmMzduslxkqhDRUXUeD8f5Z8B3p3KRg5Kq2LFTrj9
         LvZgF/ZXjcNYhT9qn8OQO+kwIH/0ixPFKnuCKJ5EHcmLXxSF6iBrpfdwu1RKme8Q9KrI
         ixuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280952; x=1750885752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=ciJtPVZ5kHH/jmptQYOOq6oGqUAfM1aELj1FRsIdi7NwpUCOjXw25NJR2yLZmkyhkK
         AaF5GsFbCwiaJEaClwpMmHYnsSQivy5WYyj7ssl0JL6qqs1PAYdUyyRXXKTPsQcTtmEz
         50BnRG5HtCxuseftU4NauTHoh99vheVYDtPIu/OaPe2NB/o6eKW1EU/N8KHMIEPbMkds
         BSgSIxAG7bH1YZXUxrUkHmE2hQj8jGIuzb2XDHYGGhzc4pKcq1WY0NJ+KacK0cmwfRv9
         RBLK+VJEHJdzFDmMH4zRS5nJBlbuycnG/lCqhX+UunTXeQFkZTQTfJoRgrrsv06wv0J2
         Ow5w==
X-Forwarded-Encrypted: i=1; AJvYcCULTjjNsZHNYat1T2QTKS+mSc2nyeFymPIF28Lx9WYQ8GDW0Rba2Xn+gNeevlnnITpKJ14dozx0AvDqz7fTVzzgUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqGkgtS7POpjAAxdN81HzJckXv6bWl/NfjJgHzF1NmoCIpif0
	7R3WGu2v9t8fIL5rwD/gT0yO9j7dq19U7ld7CWnTA9hzvxcfN9ivnGuiUiCFpRQP/TVnUYWcd3r
	nDUgv+4nao2nwx53JGgUjuAqXtxY/Zg==
X-Google-Smtp-Source: AGHT+IEUH0HhZVuisj90FwEGDiok/NrAHfvkSm0jzyn2dsHw93KZbhBFM72hsFqGAT45LPQd/K59WQMzu1/wKRC8RnU=
X-Received: from pfcj16.prod.google.com ([2002:a05:6a00:1750:b0:748:f627:51c4])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:8884:0:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-7489ce0d394mr26377988b3a.3.1750280951666;
 Wed, 18 Jun 2025 14:09:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:41 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-5-willmcvicker@google.com>
Subject: [PATCH 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
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

