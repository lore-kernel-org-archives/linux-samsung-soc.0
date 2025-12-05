Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F91199E94
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897034; cv=none; b=euEbFR4SjLcTY/Z+Z0+ZDJIXnftnihiM/bitSRnnaWHyUaz5zCcSbJs1i8kMlprf/XBjuQGfz7UPzERgy4oiOp1OQVs9WWeWfC2eqb6nEAKekyBuIxA/bVFRPWI3gp1jAlv3P7FU97g4Mi7JqWHxXFwCIlS4jMFwQLSxnG0c7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897034; c=relaxed/simple;
	bh=M78wMYaAgXvl3a5b31zlM86Eip3VnZGZaQ9q2XGwANQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PTkgPbj/0f7t9zZkUuuWTEo6hx++cgjFuP0vBPJBa+wfDea1TjeYcuxg76AGEQ5wfmFFJKKVgaTsGBRykyEMxqqpfuLXBn3sA4TQ0ScjJTp0o/SYrDqBHBRZnOcqqMbf7S9QkNaPc4LdSWYat+2//wkaYjEcGh7TbO9cMU1wDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JixRd30B; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JixRd30B"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2980ef53fc5so33358795ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897032; x=1765501832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a9BcMIreCW4+XPCC79kC21m2v3SL+rHpTmsJgeu1lI=;
        b=JixRd30Bj04X4yIqrlglUDYQWp5q1GoV3A6f9vRlil9TD3VTDa8/XsvpHl28aFWB08
         c9wi9FpmVsSRUFWe8uBaOpLDHnt/LKJtHSSJyqw+/gTAzggehy/2ts91O9sjXyeB8X/o
         M8T0bA5RnmhM2bobN/d6txBXiFD2S5geJj8vc99DKt5f1tV5w81PDCiQ/aHyyz5/ANNZ
         23Fd6Io6yNe2oJYXxD1rGeDt38Wvmw7+Dvsuv16CxiBitLswyUkS+jyUNqR6mKlDVaia
         K9jigBdLWVNr0AP8ktVL/zm+fk48kbl3fkF5bJL8THPjLmyBSDmaesEsyJnBzSFPilcR
         9MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897032; x=1765501832;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a9BcMIreCW4+XPCC79kC21m2v3SL+rHpTmsJgeu1lI=;
        b=wAATuq+J0hFBnDfa0c3+OQVyBVRSYw1Hn+r4Zn6o3ivP8dZ0zoXU/zDAivYvXkUtHY
         mdgpfplGXyFVDpbCgBHTTpKNLUs9WCJpbghfVFvEkKyctxWiOBzTmL8rMONoctvaA4IA
         md9ziGTu3lmYEFqu6WWyJE7/Upwpu5xT1/7c3AAKLzA5zkO5wsGXbzudisqlnrTfbqdo
         +KzPO0SuUOuoRkbbsV4Ky2vWI04uhOM50kNCZFkO/HqWqiXy1x7Bkm9znMKonTb3XSYL
         nQZwdPWQUkbnE0Kn/nKOkbM2f2kGPjKgBwg/weMQhuKHitQNAYggkzNA/w1OD1pKvAmj
         f+nw==
X-Forwarded-Encrypted: i=1; AJvYcCVc7ifoRtjVN+MMASdDmpEgU//8uwuejXWohcgqAhP0N+vtFzeRDuDNhCA/4OJGWpbunXZtvYQF8aftEDfO/Qlc2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu57FAnTuzFzc2bHUJBRrLzTbPmxk2J0gl24m+uNuHgYADA9vP
	fC1aqlM6L87Ct4cg2aTa4LrrMIegcYCizYXHrEKVT6PirzxG7EHLqFgm3WRXB2HJtMSaBDhZzi0
	QV3VjgI+kxHGaT31hvRtgsyf1QfZkuQ==
X-Google-Smtp-Source: AGHT+IEjP0N5xs+xBNnphbRYDosC8i2Rg8/XLir7yaw0gap7gjtVgDvzQj6P8ZnliWmsUFtD4fTKRgqtbH2Nw+M58n0=
X-Received: from plhz18.prod.google.com ([2002:a17:902:d9d2:b0:29a:1de:14aa])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:40cb:b0:295:ac6f:c899 with SMTP id d9443c01a7336-29d683ae56fmr95984665ad.47.1764897031708;
 Thu, 04 Dec 2025 17:10:31 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:13 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-1-willmcvicker@google.com>
Subject: [PATCH v7 0/6] Add module support for Arm64 Exynos MCT driver
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
Content-Transfer-Encoding: quoted-printable

This series adds support to build the Arm64 Exynos MCT driver as a module.
This is only possible on Arm64 SoCs since they can use the Arm architected
timer as the clocksource. Once the Exynos MCT module is loaded and the devi=
ce
probes, the MCT is used as the wakeup source for the arch_timer to ensure t=
he
device can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel fou=
nd
at [1] and have been adapted for upstream. Not only has the Exynos MCT driv=
er
been shipping as a module in the field with Android, but I've also tested t=
his
series with the upstream kernel on my Pixel 6 Pro.

To the driver changes (both as built-in and as module) on Pixel 6 Pro, I ra=
n
these tests:

# cat /proc/interrupts | grep -E "mct|arch_timer"
 23:       6823      10938       7795       5607       8935      12828     =
 21947       2200    GICv3  30 Level     arch_timer
104:          1          0          0          0          0          0     =
     0          0    GICv3 785 Level     mct_comp_irq
105:        547          0          0          0          0          0     =
     0          0    GICv3 789 Level     mct_tick0
106:          0       1333          0          0          0          0     =
     0          0    GICv3 790 Level     mct_tick1
107:          0          0       1467          0          0          0     =
     0          0    GICv3 791 Level     mct_tick2
108:          0          0          0        583          0          0     =
     0          0    GICv3 792 Level     mct_tick3
109:          0          0          0          0        206          0     =
     0          0    GICv3 793 Level     mct_tick4
110:          0          0          0          0          0        153     =
     0          0    GICv3 794 Level     mct_tick5
111:          0          0          0          0          0          0     =
    13          0    GICv3 795 Level     mct_tick6
112:          0          0          0          0          0          0     =
     0         87    GICv3 796 Level     mct_tick7

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter

When built and loaded as a module, you can verify via:

# lsmod | grep exynos_mct
exynos_mct             20480  9

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

Note2, this series is based off of krzk/for-next commit bca42080637c (Merge
branch 'next/drivers-late' into for-next).

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/READ=
ME.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
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
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Changes in v7:
- Dropped v6 patch 1/6 that removed __init from register_current_timer_dela=
y()
- Refactored the init function in patch 4/7 to handle the case of registeri=
ng
  the timer delay function for ARM 32-bit systems from an __init tagged fun=
ction.
  This addresses the original section mismatch issues reported in v4.
- Rebased series onto base commit bca42080637c (Merge branch
  'next/drivers-late' into for-next).

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

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
    ARM64

Will McVicker (4):
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  clocksource/drivers/exynos_mct: Refactor driver init
  clocksource/drivers/exynos_mct: Add module support for ARM64
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms     |   1 -
 drivers/clocksource/Kconfig      |   3 +-
 drivers/clocksource/exynos_mct.c | 255 ++++++++++++++++++++++---------
 3 files changed, 182 insertions(+), 77 deletions(-)


base-commit: bca42080637ce3a21092fc0f7d5411e853b0c3b3
--=20
2.52.0.223.gf5cc29aaa4-goog

