Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDB25FA03
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280937; cv=none; b=FLRkToOjZBosOdAymLY5Wt9IrnosEK8vyezTW9v3UIynyxnBt4p0zaNSp7T888Rmj+3enrFzhTB1qYktP1reSUYXLQHIFwT5kidS9d+yxe4hTFE/tGq6VOi+dHrtQ5WGN7ozyKHmQ1Wk2S99+qBIeoqm/6SDd/N8iUfKzZPjKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280937; c=relaxed/simple;
	bh=Lz3dQQOzBSazZRbRcgIezuMZcmy9SPEZppaICybM6wA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P2EQFuf+w4sjFngPwd0aQ/XYVQSXZWB/5Y3cK//1DXeBVIdR8lIERDRFY4s3W2k/jwDmC9J6hdgqy0S+LSk7Ih53k5HieR7OdZptX1FEvhD5gviYlKR9DhZkAuYLZLCQM+5mePF3zq9nQ7PUVuk48RqzwkrRX0ZYQbR0HIPm/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UiY8qWlQ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UiY8qWlQ"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f13ef248so57157b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280935; x=1750885735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zRoaCj6hoTPJxaDDV3mKgmJ3Npn8sA7fvAWlw4tbnTU=;
        b=UiY8qWlQa55CXbzr1vJtppcP2IjK0Ej4DrawxXKmZifsVOD4CljKo7VWqHNwl33BK1
         tl2S2VZuJb6k27gV/FVMf9crmqWfQ0fEuC6tjbYR52xA90HeIVoa584085hClHbDBDLs
         RWuXw5xL9iT30rHZKTPuyLLDrUA8hbUYSIQVsgcyAl/k0jeJGW6tp8KVdgCAF7oqmlv7
         rIR8/+HERWYC+66XmCGyKo+84Mj5IMPlSrn7YoE4wkfxpRxUoHv7xT8T2vLwkztaxxnN
         CUYQtCmJ/qQOB1zha1+4z1aPtJz1AdRdJmqumOZJQ/bKinW1e1E43rnpopaLksKldBPz
         6+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280935; x=1750885735;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRoaCj6hoTPJxaDDV3mKgmJ3Npn8sA7fvAWlw4tbnTU=;
        b=tiyesobFKeHmNRQ/E1HvEJLbX0kMyB+4XR7fMszS0/2PtoA2LU01zVTPyo09a7s98I
         RYGVg27ji620YTIi/ak0erBK6iHwJv9sSSZKvmxyKmS0SHzY3qlNc7+HaaCbq+1OQDvc
         ZfYxMdovZKSwM7tYl+BtNTyV8PmsvQDdOI+WX3EfXhvXHK+NgtDkQ3I60CPaaL2PYpFk
         BPpN9FtX7boP5s+NkzE1uy3wwrugAyA4siaj9WcAcr48XclqL1EgDRQ30IvZyloGNKlk
         SvrXWK/IFkGPinhvAAYhYoNXlRfnOyOoBE3AhTMzthjQwENqqzp2bcl7r12PVO9zlHjs
         N5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUDXChwYPUlriO4QDZ0XQQ4Py6l6d1VW04sWlsZjZdHxisbpRjLEF2rDxZFaasuUBigaU3bkDJyeK2hAl0ic7aJSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwithVv8qR3XzEIG3pLYitZZ+HEO/2PT61QSz/DdiYoswaxHOgD
	3sYrlk3KhpJfsgi5OW9AC4MiOWuV53A88Ax9zhybxme/e1i93J/pCe+NVY9FVId5c7pn98XApu9
	jwMBz3Mp6P22unF/GcMfRg0Bg+YW92w==
X-Google-Smtp-Source: AGHT+IHM4S67QrX8m1RQpKcEdli21K1Bw8q46eAiayWAixmfo6GxjxzG/TdPG1taUNLCEpzBbx7ZQPCg2BlL67kHZ7s=
X-Received: from pfkq15.prod.google.com ([2002:a05:6a00:84f:b0:748:55b9:ffbe])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d10:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-7489ce0d39fmr24849663b3a.4.1750280935227;
 Wed, 18 Jun 2025 14:08:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:37 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-1-willmcvicker@google.com>
Subject: [PATCH v3 0/6] Add module support for Arm64 Exynos MCT driver
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

--=20
2.50.0.rc2.761.g2dc52ea45b-goog

