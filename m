Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B001368E18
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664181; cv=none; b=N3Y/DbaoePOaChe+GBhA6wFc/i/Nhyo8Jw/1vlOf+R0hY+akzldS+K0Bq3ZdHYU5rNkc2GUE5QAq846ZrhTwzAEU/0c/PppVZFC1SgG/pwu8L3woX6MOQT7PKJJwSCMoQrUaB0FgQY1Kq2zWQWub5mfjmcJRbM9GAskoGHImQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664181; c=relaxed/simple;
	bh=fizX/zpb55v6tWXmO2kY83jVuj1wy+fw9bIDltyNrM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jUlCMYjr4mh2GWHrg6/+3+CFpPIxNmeeTAaDCd1Z1eg2ZG8ZO7HAw9VjMA0FVB/2kfGpmpA8vj3D9oMPRgpf84PcTRHPCeTNGw5fS8I2j0g38jbfUWXup5hRoWZ1kAbAng/osVF4ZrW8HC+2WyX5ycECldepgdloTEfTpoVe8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zIMB6cuY; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zIMB6cuY"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297dabf9fd0so17207355ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664178; x=1764268978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQI/aMjga6zLBbmFacInf1FiaB4N/DGsz2v/Apbe6jw=;
        b=zIMB6cuYqoRI5SI1XNtRf4g6wAZ74yuG3/T7sPaJsTU5qnWC2H4DSImuVVlvOnYMGv
         rqKvWvvHQY/wd0ixOurLOQorNDFrnWqgAt5b3dfFZdRxmtKTRgwZZfy4HuxS+OIDZ/uL
         KdHs4aDiHuBa2TH5CRQnkiCVgdfapKQPhKikgG5YxGLZSQs1uTM4eLWtoD5C52Mtjfbu
         aRRtOgQB/H/W/byvwRAaubCJ4reHLIWdzSx6ENBOzRn++3J+kmJqvT16LhzyG7ciq9Rr
         G/6WaqZCXGabJuyoYd2K8cjIKz9VUa1AVCwR/qj6fLc3Sfv1/lEPpg+DL5larajGfaKh
         wBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664178; x=1764268978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQI/aMjga6zLBbmFacInf1FiaB4N/DGsz2v/Apbe6jw=;
        b=ayzdliBvsa+sgDFNalpsVqihJbQvw45KBeeGP8G2zTMEW+njMG/VVubQhQdvlMi6bE
         0U3s9kg2kqleLjz55Yqb3ripGmr7rON2hVXkkyl7AHgGXt5kwT49N4SR2fKK5P0+Lcqd
         zebprUHpa52oJBSVlYxdBgvJl+G0agjfLFdZrcEP0BKlX3qb8UgE+6AA68/3OrCS6vYI
         oxKwNBLThQq1SuS35JthH3EFiVvkIPsVHzHoldygpaZJYO82DEUVX7I0GtGNn6HmYU45
         JVUkQYFnDYOqf2RQQqYcNIrapK/9tNu3WnbwHiJMV7ktBDQRzTmD8MFdA3BH+3pdAiLs
         TeuA==
X-Forwarded-Encrypted: i=1; AJvYcCVpZX611oTdjAYix2Tyr34xDu4OoX1K6LvLpv/138s0Yeac1qsmIOKT0pWGwexME55272blB7np2OGIpgorTnNzxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50PujPUJBot3ZBEXzSTHDpIMw2hyuKMYQP1RB5KxNoi9GVOJ1
	xlphwJEm1qY32lP/7Lb+roLfagF25a5M+qy3dp4F+BmJp4fktz9W3h4OOA7RNpekU5pbjHymFlj
	g2KUcX6apoADTppECtuR6DiuZEptF9Q==
X-Google-Smtp-Source: AGHT+IHwJthRNw4pqfJjYDk4vSF8m6qYCdx11lKLy4Vbpkd9LUAmbdAJbP3S8s2Ivqdqp6aG9ef+u6sWKJHez1RSwqw=
X-Received: from plkb6.prod.google.com ([2002:a17:903:fa6:b0:268:cfa:6a80])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2408:b0:295:fbc7:d282 with SMTP id d9443c01a7336-29b5b08a22dmr50358725ad.27.1763664177775;
 Thu, 20 Nov 2025 10:42:57 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:32 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-5-willmcvicker@google.com>
Subject: [PATCH v6 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
2.52.0.rc2.455.g230fcf2819-goog

