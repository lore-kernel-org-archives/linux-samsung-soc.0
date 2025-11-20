Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B04368DE1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664174; cv=none; b=I1M/bZQuweg5Jl/IaSDzc0KfZIlFax6PgUaG6G14Uk3/hvs2LL4VYBOjc6PG3Bc2twTeL14vpYwOF2vUakEA6taF6FEFeQ+xJwTeQD5SW35gpkE0WJ1hWBE4uZvCVCPWNn0EUzyWYLCvmSKqhI0LSF1QgYQZzzOWoOSHNsYaKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664174; c=relaxed/simple;
	bh=mslMfeDi0lNZcGc0R4YUDATxth4de469BWf6q36LOA4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jT9mx9xZkI0KXl2zOo06E4KDQAh/vTy0ftDZxZ55ZTVkVvR+jCk2qB+T/ZSUSahsWHDho1rUkeXFbxkg1roH2dd3RQJWZxenLtKU2yWihIJpP7b9PMSBemXtDd8YpfwQO5sItxCWZjWLbRb2nxt343WeFcBskq6QXKR4q58gHtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RhkqqNJS; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RhkqqNJS"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso1291566b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664170; x=1764268970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gYwj93ryFPGdFky83dYYS6ZDTHJJpU1AWJipT2S26I=;
        b=RhkqqNJSykDKqdGOot78jYyWh2VNMcnC3krFrs3ligc3fH4KNgnItHL4faBhGYafoj
         qjsjBkUvhLabHJocDC/F73Zu9u/Dqn+N8wF8tj/3XKTUk8jc9mgFzeEUPc2SdgEYRBgt
         CxyAr8gidWhWb6Qz7txuZKPJhnBz9JBH0rRt2VBAbUz5Vby+CZV9/7xlhdqfpUz5kscs
         MxBNVqhDGkipKKdyJtJEFBQ4bm0ngsQKPN561hJWcDNOPdVhoGt594gOYvMi/WeDN5aM
         3xXVPAYSS1XENIFp+stUmzBrlzAtUUeblJxjOAY1pQUScOkHjpPWr/4SNE099uhIPNF6
         PPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664170; x=1764268970;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gYwj93ryFPGdFky83dYYS6ZDTHJJpU1AWJipT2S26I=;
        b=adYyAZ5tX4EiRt4rqPEvjsXBLZjiND+l6GdwNj1QP9uKC7Bik19emKLVsn6MyemX0L
         nd/KnAhV0o9M3qngW+DVy7zlTS5weTyFE6XtMdaMLqoj+4T383tNFqEX5FpB/mbjA1gY
         3dj7rcQw67NpSANBOmToJNfQ762aYB2t1TD/a8GFMQVGaZjCW3ZlJzpPv47GvXu8eCom
         Z5i/pIeRigqZbG7bfqsag2TFKgqWHr3yOgOIOaAMwpXjnJxMr845Wj3U97jbewQejTTr
         Phs/wZDHiNeLruuBMKJ7x6izSnH3JCbt6kwM997wa4yauPJBA0iZ9ETJijC/H3Z0/g68
         zoBA==
X-Forwarded-Encrypted: i=1; AJvYcCUO32JwpT+Bo/ZXPoZdZtkxBKpzfzHLxIwmM1+ni+AwQiM6Nf5zkdLdsUA7RaYGnL6YWBA7YWp1R1scy43OCX4a/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeWbGoH8o9FOG73k4a6SBCMSNbsEawne8E+9/nCtfbNVVwz/TT
	myMsRWpdHbWKkHuD4PvjriEpiUaNIFSHuIgQCehv25QIHZuil4r5adQaWZ7pqhJak74kHVuKeGp
	91B9XepIlQbUWEPtmvY4JQsgrOgMQaA==
X-Google-Smtp-Source: AGHT+IHBVvm88wDn5w9S/JgfQwmp8U4yjEebgPqVtkfCZPcAEjVOcZZqXsldQdYTy6V83y17yFgNAmg2NtnLTj286K4=
X-Received: from pgbfe22.prod.google.com ([2002:a05:6a02:2896:b0:b6c:b966:bd27])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4310:b0:34f:e712:349c with SMTP id adf61e73a8af0-3613b5f0d67mr5706552637.35.1763664169953;
 Thu, 20 Nov 2025 10:42:49 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:28 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-1-willmcvicker@google.com>
Subject: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
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
Content-Transfer-Encoding: quoted-printable

This series adds support to build the Arm64 Exynos MCT driver as a module.
This is only possible on Arm64 SoCs since they can use the Arm architected
timer as the clocksource. Once the Exynos MCT module is loaded and the
device probes, the MCT is used as the wakeup source for the arch_timer to
ensure the device can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel
found at [1] and have been adapted for upstream. Not only has the Exynos MC=
T
driver been shipping as a module in the field with Android, but I've also
tested this series with the upstream kernel on my Pixel 6 Pro.

To verify the module on Pixel 6 Pro is used and the arch_timer is used as t=
he
main clocksource, I ran these tests:

# lsmod | grep exynos_mct
exynos_mct             24576  9 [permanent]

$ cat /proc/interrupts | grep -E "mct|arch_timer"
 23:        222        171        211        139        184        124     =
   825        378    GICv3  30 Level     arch_timer
117:          1          0          0          0          0          0     =
     0          0    GICv3 785 Level     mct_comp_irq
118:        228          0          0          0          0          0     =
     0          0    GICv3 789 Level     mct_tick0
119:          0        351          0          0          0          0     =
     0          0    GICv3 790 Level     mct_tick1
120:          0          0       1490          0          0          0     =
     0          0    GICv3 791 Level     mct_tick2
121:          0          0          0        325          0          0     =
     0          0    GICv3 792 Level     mct_tick3
122:          0          0          0          0         97          0     =
     0          0    GICv3 793 Level     mct_tick4
123:          0          0          0          0          0        150     =
     0          0    GICv3 794 Level     mct_tick5
124:          0          0          0          0          0          0     =
   188          0    GICv3 795 Level     mct_tick6
125:          0          0          0          0          0          0     =
     0        157    GICv3 796 Level     mct_tick7

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter

I also compile tested for ARCH=3DARM DEFCONFIG=3Dmulti_v7_defconfig with th=
e
following debug configs to ensure the section mismatches are fixed:
  CONFIG_DEBUG_SECTION_MISMATCH=3Dy
  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set

Any additional testing is much appreciated!

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream
kernel can be found at [2].

Note2, this series is based off of krzk/for-next commit 870f6ca955ea ("Merg=
e
branch 'next/clk' into for-next").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/READ=
ME.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Changes in v6:
- Updated module support to only register the MCT driver as a platform driv=
er
  for ARM64 to ensure ARM 32-bit SoCs continue to probe the MCT driver very
  early.
- Squashed the percpu fix suggested by Marek Szyprowski in
  https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung=
.com/
  together with patch 3/6.

Changes in v5:
- Fixed section mismatch issues.
- Addressed Arnd's concerns regarding potential issues with unloading and/o=
r
  unbinding the driver.
- Fixed SoB concerns to clarify the development chain from AOSP to Linux.
- Pulled in https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprows=
ki@samsung.com/
  to limit percpu interrupts only for ARM64.

Changes in v4:
- Missed the "v3" string in the previous series for the actual patches
- Re-generated patches with --base a15edf91668beefdb5171c53fa698c9b43dd1e0d
  for kernel test robot.

Changes in v3:
- Rebased on top of Daniel's timer modularization prep series [3] and
  krzk/for-next commit a15edf91668b ("Merge branch 'next/dt64' into
  for-next")
- Added owner references to Exynos MCT clocksource and clockevent objects.
- Dropped #ifdef MODULE conditional section in favor of just using
  module_platform_driver() which will properly handle setting up the
  of_device_id table based on if the driver is built-in or a module.
- Update commit message for patch 2 based on John's feedback.
- Dropped DT change from v2 as it was picked up by Krzysztof for CPU Idle.

Changes in v2:
- Re-worked patch v1 5 based on Rob Herring's review to use the compatible
  data for retrieving the mct_init function pointer.
- Updated the Kconfig logic to disallow building the Exynos MCT driver as
  a module for ARM32 configurations based on Krzysztof Kozlowski's findings=
.
- Added comments and clarified commit messages in patches 1 and 2 based on
  reviews from John Stultz and Youngmin Nam.
- Fixed an issue found during testing that resulted in the device getting
  stuck on boot. This is included in v2 as patch 5.
- Collected *-by tags
- Rebased to the latest linux-next/master.
---

Donghoon Yu (2):
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Add module support for ARM64

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
    ARM64

Will McVicker (3):
  ARM: make register_current_timer_delay() accessible after init
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm/lib/delay.c             |  2 +-
 arch/arm64/Kconfig.platforms     |  1 -
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 87 +++++++++++++++++++++++++++-----
 4 files changed, 78 insertions(+), 15 deletions(-)


base-commit: 870f6ca955ea3f23b4d7824c815c81180a6d7c48
--=20
2.52.0.rc2.455.g230fcf2819-goog

