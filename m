Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B62C15AA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252660; cv=none; b=ZDQ1DfRxhBOOqkp94ScRJQCtWAm7F678IGrPrT4a4DLn8sLsmMySd4Ew4xdsnnPXv6WRV3FbWdf1XCbm2KF+3UcHXYSVBXMmdblI3B5oFRwWSH1mAEAWR8By8FtONd36vBIDXUyWXeJ1qT1tH2TtQnffejs1KgmV0NOT/Ub8w78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252660; c=relaxed/simple;
	bh=C/1zX22wjI4qtmE/Rs+0jxW/rC4laO75J74Tq/ISSYo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uRRo2UZzKI6tVxWwXU7A1NGMdTKz0EKrNwMzMWgfrmn0tOmhe0Xo6pPERMp3QWI4nMYCZR/xX/UStg4gnqdjEfeV5JgJ0Zy24IlygnIZAxreuSFyH9K54l2lFwkXFw4fsFcKOIQ6DnNsl/gOXOJlWKnCjwxZIKPA2291STkfZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pIB0NClm; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pIB0NClm"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso978638a91.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252658; x=1761857458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=pIB0NClmaULvLSTNIHcjIhIQz2exfmdB0n7aPUlM2BudOddYi9/tdy3QsMLB116Zyk
         0R9up3sxyKMTBQyUNimYHGMXdD/u7SNZUWFFmUJdBom6mywJxCcahQXUJyCyryKh5Fqt
         cu1l+Boj3wrje/zynYz68QeWN8d8hO/t5I8qu/9jgUXm3OTGG2FMhMrYC4DAR79o16IF
         zrj2ruM2OYZ8/pmvIfJmzueZuFm3jAls/NSBRnzMyssQQeZd0LKMAb9ursVzARTq9iap
         DFMreHkKM07mt5FKUrz22bsK8XN1fl7LXSyA/WfBxmPwFeV0KCJXrcLLDxJrFpDc8CLe
         BrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252658; x=1761857458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=VvTJBHg8e3quvbSbcEVLpRlr8bWfZvku2shFXlAqWHuo+3AUV5PK64YNT/RXmp4Cz4
         aSz9UN7qTEU1vwVQXGgQCncy9UM0B5SlBgvaxVOrrN1ec3IJD1dAUvKQcwvCISqud94U
         UHYTTdXSrjZpUSpbx5Zw6fhELrR1YCqXGNu/QW2D/9sp1MFpkL0SIx1mieMmXTxXynzm
         etgwLkvslSSJfU6yk8GYkIuf4tdvJRfop51pD88bVLxECTWF1/82qx+STpzCXi5T8Qfw
         mCbfd6QAtrHWLB7GU0ixW4VAFGvgvki8q+NRDhIS78l3BW5datc+Ct37Q9f8ZhOH1uDg
         phvA==
X-Forwarded-Encrypted: i=1; AJvYcCXTWWsvyXzj1i6KQvo0ajRw6LHg+OACdfhln3E05ZdnU7YLq/X1fVPFncJV04NXJ9EFqY7mmmBtpOrEWe//jOOj6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+3jYnzj6/99sdPBWegufvUXjbEZryLfrWNlaW7FOWRUJlZbA
	7R1SlyVOWysD48ceQ+S8yqSXOQRPbW9jYujVYT0gkxNs04FOPwcigL8zQuqOejMp40czNOdGKRj
	OmfysMD56yIa9RfQmiHnwrhp8FRUUZg==
X-Google-Smtp-Source: AGHT+IHJvKbU9UgJaSGXWAUX+DnipcUlKhq0hmwyYZnhUYzOqrdpDg7R1VNHjGHXBcYDkXnRvHh8GcGOhqCddYEK0g4=
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:33b:51fe:1a94])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:33c3:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33fafb97551mr5184629a91.7.1761252658519;
 Thu, 23 Oct 2025 13:50:58 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:31 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-6-willmcvicker@google.com>
Subject: [PATCH 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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

