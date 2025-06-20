Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685121516E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443459; cv=none; b=e/fSOBiKdmUcDUltNwTapZ4Zx2H/ObbMNIaauuLMs4pISKMAa6WGAyijseS7EQiMbU+EdM3SZ72y/rwRodWjW+ONm08yrKJ826AytukNnQAavDXEwl6dxiYZS9In5un6gEElY6GZ1sIUohtbfXXynhYMHKomCfMDXC1GQRH1vM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443459; c=relaxed/simple;
	bh=J0/LzDB5Lh1XrCrxj+Jd3W69MZlCOE748yQMhLe42C0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hBVUtSd/pWvlQoiCmexQ/Ihr3EMBdR4xbFNq6WtvUJzikaQchX92ZvJv62F8NdzQw/ivb50EhcfOMd7tz/QR8wVHNysyC2nniRQsnmggQAVz1HHfnqCI51jMWl5C0ehlCJj7TpjCl+BNRddKFBfX8rmFEGLc0KbuPWZFaRpd2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1cOcCDJU; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1cOcCDJU"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747cebffd4eso1716310b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443457; x=1751048257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoOqUmI/ukeAvOCDfitszVNrmRf7QCXDZ9hIanYDn+c=;
        b=1cOcCDJUcTwMR+oD+jY2XiyKO+stmrnQ0pIzqKaa9zfmcz7W0XKvqaOm+0Iteu9g+0
         xvNUmLt05Yvxk7Uy/qlPIsAPy5AsOLWZrrwUr5rzqXLCnbYfwHWzHEyFc897/ueVR3Bb
         GBjHvf4Bm3aq0Spe7OhaYA65EdclcVmpLzU7NflZWVAs2NkLKCzZqpMqKIGtahkfom73
         LDX7xRWD0lKzrf368yv0fOr6F0Gix2ZORJZ3qp6Bweldf3DRiEO62BF3Yiuhx9ac/Mwi
         4MwflAW1Hiy2ctcWvDI5cjHrVsJyBAwNd5hdoykCFqq41OQc03Ho42MxbB1C7QeisU6K
         uxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443457; x=1751048257;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoOqUmI/ukeAvOCDfitszVNrmRf7QCXDZ9hIanYDn+c=;
        b=rV1/8qPkMkmnIURXV2sObuB/ALVSVLaNHPGHsitE9zC5Z4PZr0iodlxJaZwBd6grFN
         W8+tmx/AkwWlwdj1uc/4u9eOonp4pyEaXt6B3XxKEluYNh15ZOvV5XloCSO7gcVvArC0
         m6e8i4msyQEouM8Ux0fDjTE1tu5Azbh+Od4GDzxu4EjDoMYFla5RZoIglnI/I4IER5F/
         PZSc24MfTnwmmGqC2dPgPg42j3YzcBTHB7Ceb/qSWdOXX5i5OBZVjporuzxUX7cURHru
         J+ZwwyU+PiKpdm7D7xmrDNVXYHW7cukNdWE4xCNCd+2QmUsaLCJtq/WSQ7t76bgJ8WOS
         rn8w==
X-Forwarded-Encrypted: i=1; AJvYcCVLabWiUWQ0m9l2m8MVRW192AvvgKi8j1uo20sYUr2aPeZ7qdgzCBiDAHXfNx42fm4q3XwfhbfTPfyCMD8KlNjqdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3it+Z/mSfdYyr4HIp9j8nInJ/7tp0htRcX01b5lcXKqEzX9y
	Lrc9H4iQ7GTxzJW5ZBphWsQnPYWzkEtqcLukyrdrmgDTW7I9IOLUEtJgOn3l3+5dAosyf2Yblng
	tVKrSWDC9dJOlJkYzauPWId5TRDRhdw==
X-Google-Smtp-Source: AGHT+IGLyMBA9YVtduYhTCnTre04zoapWO94rFAMkDl8DZB2kVIM8sEEP0xqi2SKfllFUVq4GFuWa2lUG16t4cETsX4=
X-Received: from pfbly4.prod.google.com ([2002:a05:6a00:7584:b0:749:d28:4ca2])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr6106675b3a.8.1750443456920;
 Fri, 20 Jun 2025 11:17:36 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:03 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-1-willmcvicker@google.com>
Subject: [PATCH v4 0/6] Add module support for Arm64 Exynos MCT driver
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

In addition, I verified that the Exynos MCT module cannot be unloaded on my
Pixel 6. This is due to /sys/module/exynos_mct/refcnt > 0. So if you try,
you'll get this:

  root@google-gs:~# rmmod exynos_mct
  rmmod: ERROR: Module exynos_mct is in use
  root@google-gs:~# cat /sys/module/exynos_mct/refcnt
  9

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream
kernel can be found at [2].

Note2, this series is based off of krzk/for-next commit a15edf91668b ("Merg=
e
branch 'next/dt64' into for-next") with [3] on top.

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main=
/README.md?ref_type=3Dheads
[3] https://lore.kernel.org/linux-arm-kernel/20250602151853.1942521-1-danie=
l.lezcano@linaro.org/

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
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
Cc: linux-samsung-soc@vger.kernel.org

---
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
=20

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will McVicker (4):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms     |  1 -
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 75 ++++++++++++++++++++++++++------
 drivers/of/irq.c                 |  1 +
 4 files changed, 64 insertions(+), 16 deletions(-)


base-commit: a15edf91668beefdb5171c53fa698c9b43dd1e0d
prerequisite-patch-id: 0c5b7e9fb27295e0c125c537ac80d1eb16cef60d
prerequisite-patch-id: 6a9b683baee83ddc2b2fada31479b27b53469759
prerequisite-patch-id: b9cbd59ff2f4c905001ecb02868d20fb004034cc
prerequisite-patch-id: cdde1a76624089aa818cb35e612f880107bdc073
prerequisite-patch-id: cec67e07038c7aa93a2b53879781626d738cd199
prerequisite-patch-id: 8fda377fcaf407026f04f2a547086cf1ecf4efc9
prerequisite-patch-id: dce925ac224bb361c74fdb23126fab53e7c5c26b
--=20
2.50.0.rc2.761.g2dc52ea45b-goog

