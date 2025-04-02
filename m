Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5BB1F8EEC
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636895; cv=none; b=QIn4jGlPE9F8Mqvu0zQIhNyMUVmYVftyMFY69ipajKjAtGZ5F5dhLuFhXc83BBwpjCYzQMFcwDeSapB7fhOSjLSKH62a31CkY3OHFP4nW+NL4saqZ1s3vNt3DTgqFJzuB0I/lPF7oDXwBUFhrhaeg8URU3RuJGj52ykVc5AOlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636895; c=relaxed/simple;
	bh=OAknLtJvsu5Z8il1CGx/QAgW0sT8q2LX/C14tT3L9I4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ul224rQKxJnnSwo/UhEEiV9GrFRpzGPHHL75hQkzGZk7gzwR6KVp/dDU6Xv/ECsGnfYMY4uqW4om44bxMuAicNtrY8JQPrPhLFPegItdJyo7ze06xToCfZa+gOOPBMzZlkObO1d+7biQLwOyLvVuSsUF27iGPzQ6fo5nVHkYQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZPnea8z; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZPnea8z"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a7aceeaso3598795ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636893; x=1744241693; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3woyidQeaVM0OgW9Tejczk+jE7A6Ip+4MgT+pOFZpA=;
        b=bZPnea8zr75mLFe+j9B/womVxTLhEW9DKjHxo6Ekq2cIR20A6Hu8p86FU4ZLCkb5Hm
         Qze9JTkvO7Vvgo8p/5t/1XkN7cesYwXtAzyK4YHiyDI/qH9+7EUeQ81Tqw1HS125kbxy
         eIo55nqEgek57o1FpPrLpKC8iNKMAkKy5UsugoFVJt3mJDVCh+ZBLWVP7JngFotgKbMC
         JC43EuWN4TPc3IQuTxpBzAlb9RLnSu5tUV7+9PV7wHbSrUysV6UtRLsMqZ/vI7UHrvkD
         4Ylv2h5C2lQflDw4Um0/d1yviGlxoAqRPjmeWReOSsvVOSE01Tl2u/uYhXYTFRyFvVqE
         JyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636893; x=1744241693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3woyidQeaVM0OgW9Tejczk+jE7A6Ip+4MgT+pOFZpA=;
        b=T1fn2AR6MNI8JOJiPhNhda2CNfEVENLyMHHWsdWJHopUiFZq/zsykzhctlcIullqQw
         m6tYaxE9ogtEkPR9XqE7uRw4Eum62T9D+qo8AoSZboc2gtXsorisQLK65SNuMeqDZDlH
         JsDz0fNdAIhzrs1eYpBy+YRUeqVMpoPRan06BLbBvu0AfxXgx28C7tMN+12MllBOfUyA
         UKB4HSmyhlaCmky4wR75E3Fxh25MH36Jpn3umaMxpz6g/3uhDIifesoCBpZ/KxOoyJl4
         3GQbmSVm0pWDJ+GJyNmJKWxf8aiXjrGT7u0MCFg8gishdLKPTOX9Y72BLEYrrYr8QA5Y
         xbeA==
X-Forwarded-Encrypted: i=1; AJvYcCVgxKYaj4jdi9zy553pHNs4cmeRF57LHqlnoPD6NLoJEdkkC2I/nRT8cWAavy03eOBc55XRvKwTroFgZcRP4kmAqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNFXnjNYDHAiC7IKclE9KGOyMsjLqzn1VtxtEUBZAiOjgTQXf8
	PP5M4NC21lOv0ovWD495jnQC0EBNeNbn6tjoQNL3ZicxlGe5LUJ10ZCr6o8CiHLKwlEQKrgN+Oz
	KXaF+hEzDsGltJhCkIGCkUBZmlQ==
X-Google-Smtp-Source: AGHT+IGiCVuhnR8Hm4ls6yhYVA+bAhMO7b7R8+FdaaPf0Sw6oW8BjVfyrFlY1Hg1Xa0Er5xFqEgThNby8zWx1wNh1Eo=
X-Received: from pfjd22.prod.google.com ([2002:a05:6a00:2456:b0:736:9c55:9272])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf0f:b0:220:fe51:1aab with SMTP id d9443c01a7336-22977e0fa71mr9553365ad.38.1743636893194;
 Wed, 02 Apr 2025 16:34:53 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:56 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-6-willmcvicker@google.com>
Subject: [PATCH v2 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
2.49.0.472.ge94155a9ec-goog

