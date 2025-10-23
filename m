Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B420221FDA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252651; cv=none; b=ukIhvWFtleAZeNjAjMg65ldYOUJbtZtVOozIGotqb+qGR6XtQ69+tnOmdHDLFyCBLdx4DatkrX6j9Kp2Tx4apC3Urbc1kd1NndFpVHpykhtDsBrfEL+KIs2Olr87JeTK4av3iTy2yMbuNt5ZX+nFNNcn2wVirLpOUfO7QjAf1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252651; c=relaxed/simple;
	bh=8zqWw3/DzF0JbCkSbYoLHCYTqNuxWleoVqC0QqgZxyA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TfUAmI+PI54ItZqUW1qK+2IokfDI1Fm1/Qt2da1qxyJZPyo5g153wIFfgzmZHDT3Yzn28YzSW0ei88abNota6cuA7mMgbBwjrFu0M2Mz861M7zXveJs3D8VGkrUROVOeS7wvcY5YqPmACI+6ZhfdCsvqKo8/UtbB685cnYEqNLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YFXCcmsK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YFXCcmsK"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso1979483a91.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252648; x=1761857448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/CuDqQKYrCjFmmuQ7Z7ZrmkPpP9qzjAbWKHA6vZ3F0=;
        b=YFXCcmsKbtBMiz2XI+VcreiWw2vZqpkh0YCorYLWRyzamnbBEcAyl/ufAXq0Uc+R3t
         NuJF/5v9AnSamlvebhFCV83aq0D1gewrez8BTxCXUsdA+FfwRJIIO2rrA9gYhFFU9J+m
         VKk1XkqUam9ZIl7uxwueZk/5Z2G7b6L82QlkeSvHOcTs40mSBLPS3w3ZLjBeYXTCrStC
         uu29IPvGk4wsbrAbGa8/PBbkYKgqVJhmurzVjFo8/wTgSkqya9VnkP/YfiqAC0Uyqg3E
         9ohqlEPxSI9SAroe9WAKFjCX+nqKwR7cMuTcHVGNNPwAj9UREgLyd0E5Ey7/ykXW5wK8
         3l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252648; x=1761857448;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/CuDqQKYrCjFmmuQ7Z7ZrmkPpP9qzjAbWKHA6vZ3F0=;
        b=bWRv/B30v12bck6wvcduETUjoEqNaN/55SbcI5qhNqfxvi4WS5HdkZ8FGKwNB4iWfu
         g1uhZUmRv+u3dQUK01+BnVF2108wlejCU85kByDNJ+87GODJzAfERAqqLl4XvLdxk5C2
         mVzhIyMQ2BnZRxVXxgorRl7P6Kj/7OWRTkkTKdCBlbrpWitjWb1Z5D2ejMZBBTB9a4Nz
         9Xby2VnoJokJjhOk1kfJLlPPhX5FyTEI89e09fJButmPBqqOTlEV9Sw0oFoGYNY92W04
         Vs0KLNLlmbEFvRdHoPXQLuAZheIFJjxaxPJ0Rj7apnasycrdI1tRJjAkG9ZoSbLSlKgp
         +zkA==
X-Forwarded-Encrypted: i=1; AJvYcCWB0dzDwWOhSpES1aWV6mj6ajoNYug+6YGQOwG55wKqpoBLlPXaJP3VkyhxdyLqof5pfx+AQWzoLhOq9aSMsdxPAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOja5gwMLxgIZtCrSr9FHLkRRXI6RzQUoNNmVsQzCrSvy/wC2g
	tnSTeUXott2rXZY77Wbkxsdp+y75dtJzoCmiAE4teWc+ylsBplIVoP/pCnO8oeVJMDhROuwvkWn
	TNo6Nfq87nPYNT/LA1eOgELcXE99BvQ==
X-Google-Smtp-Source: AGHT+IHCv+iwDGJO8KEDUioy4nOYWkjvJbAezYpNBnUyVCizEPR3YPZK7WXcrL5qP149uizbsOzs5ZNlsJ9NvJ1PSCs=
X-Received: from pjcc13.prod.google.com ([2002:a17:90b:574d:b0:33d:813f:6829])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:55cf:b0:329:d8d2:3602 with SMTP id 98e67ed59e1d1-33bcf8f9c49mr35638804a91.17.1761252647860;
 Thu, 23 Oct 2025 13:50:47 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:26 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-1-willmcvicker@google.com>
Subject: [PATCH v5 0/7] Add module support for Arm64 Exynos MCT driver
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
---
# lsmod | grep exynos_mct
exynos_mct             20480  9 [permanent]

# cat /proc/interrupts | grep -E "mct|arch_timer"
 23:        759       1009        741        477        601        405     =
  1350        789    GICv3  30 Level     arch_timer
117:          1          0          0          0          0          0     =
     0          0    GICv3 785 Level     mct_comp_irq
118:       2126          0          0          0          0          0     =
     0          0    GICv3 789 Level     mct_tick0
119:          0       1442          0          0          0          0     =
     0          0    GICv3 790 Level     mct_tick1
120:          0          0       4617          0          0          0     =
     0          0    GICv3 791 Level     mct_tick2
121:          0          0          0       2617          0          0     =
     0          0    GICv3 792 Level     mct_tick3
122:          0          0          0          0       4173          0     =
     0          0    GICv3 793 Level     mct_tick4
123:          0          0          0          0          0       2217     =
     0          0    GICv3 794 Level     mct_tick5
124:          0          0          0          0          0          0     =
  1618          0    GICv3 795 Level     mct_tick6
125:          0          0          0          0          0          0     =
     0        894    GICv3 796 Level     mct_tick7

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter
---

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

Note2, this series is based off of krzk/for-next commit 73f7017e6636 ("Merg=
e
branch 'fixes' into for-next").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main=
/README.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
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
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Marek Szyprowski (1):
  clocksource/drivers/exynos_mct: Use percpu interrupts only on ARM64

Will McVicker (3):
  ARM: make register_current_timer_delay() accessible after init
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm/lib/delay.c             |  2 +-
 arch/arm64/Kconfig.platforms     |  1 -
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 81 ++++++++++++++++++++++++++------
 4 files changed, 70 insertions(+), 17 deletions(-)


base-commit: 73f7017e663620a616171cc80d62504a624dc4de
--=20
2.51.1.821.gb6fe4d2222-goog

