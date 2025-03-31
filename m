Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DC1EEE9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462044; cv=none; b=DLowWkiiL+Bip9JJvUsikVRXjOTdjXlZ4/Jo7+32Tzv8x2n0erdSwFeUUnClE6uBCpXLKLc7Jzpdd7eft9xHNs60KEGEbStZ2Lho3LkqiPeSHbfXz5jLnGdn8yHAT7qWL7Soda8Wxx3fX1dNx2haomTYlh6HLInhuM4gvVdCT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462044; c=relaxed/simple;
	bh=6Ok35Jc2sYOa5RJIwfF2Usbs4iwCcwm7AGdULF2JQRU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QE4iVWniRTP5Wdfq7DwUljMRNSMuaTEpPPxEOXcU5OWIyXX6Ff0AeTcY5S5SdhW5TMXOnGw0vbssts4ZcXZYsXvvYtkDCKLtLe3meAV7ghRqo2gt7EozIGhF2x6ZNl53QYng1ycScjxsWMdwJZaMqguwLaWtiSSL0bXCWsihtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLxfHdOb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLxfHdOb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso12190171a91.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462042; x=1744066842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=tLxfHdOb1WxlbVWLzcQJbyNIOtngg7QpUjy6G4aSL33pjQWkwHGxGpDBYsKEJOQN7H
         ewccztSgEHVyBfgbFp/VHA1swxf+TKBFDhbhtRoh3IzA6O0GiKIuW5CNlPj4w1+IeiI0
         9SRBp4K4pQva/DrbctRCC0MltJruDFk3a+MybyZQ/JpXWcGHsv8hkeNdOCOjFnvk3VIw
         xkiJoVjewibruBxblk5He30vzwVHkCgJ9n8E34SQpGWbO9ARPtFnjFL9EgsZcHiYrH86
         JBD2HIQdCZ412mRSuZBPNKYnOiPdiVkOsef78Rl4eCtAbe6Wlp8rai3CKZqHHTyiiqBV
         NmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462042; x=1744066842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=v8ZUqk/WlrfVOaQv5zSkRXk2KeGu4T8lZAdVT5nZrSREYpJHrQKSzbJGQvd/fRxrJ1
         +G5QuCISfy9m5L0bBkHNKXNsUefuKKmYeymwNE43ynTeGYCu0ddv7mUGCz/s69Mfm9dJ
         5g6VPt2s1RuYDoqglCp+QGgB8tonUUrCI7C3H8nOV2mwZZneCxrWYXGp06KHboompsYp
         c0QgEJqyd+q8q0mpKdUBbdemo76kE6s0N1WbNNhpRWtJxlKkYzzhuqyiydbilpwfd5Ui
         43HWhuqZT8uqmTLTgINi+U+/cXTBNHJjlwRb77tIgLs6dJ0gIpIBmTQj8cjYqRbu2L51
         5JUw==
X-Forwarded-Encrypted: i=1; AJvYcCWNSjZo3VOLOEFSVEYB7it6s07pWzFOZA8uqEnphpLFWgmL4H4wE+rSUsqbjCeWHbrDKA7RcRqzTjhip5vObbByag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRYuYu/fdspNf/UdnWo3CudlYuzDTjMEWGTOt3YaeS/V6bxkZ
	9dNNs7Vg3iNabGDglN3xMDsYYSduY2lEuWsmH/DjmzBL4PShdgW0W2gR3l4DR8fbJ//abb8ipu5
	+dJFZeqqBIMhYrYSNnP6ayXkRnA==
X-Google-Smtp-Source: AGHT+IEltaWMh5mxqWCSOc5LwIIwISS15CHmoIhdVB3ul9l1TDM+bcKrNYeQAGpdOsN2DGV2kSzXTrnq7LHwPcjzh+w=
X-Received: from pgcv23.prod.google.com ([2002:a05:6a02:5317:b0:af9:318c:41a1])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d0c:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-2009f8042d4mr21446912637.40.1743462042575;
 Mon, 31 Mar 2025 16:00:42 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:22 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-1-willmcvicker@google.com>
Subject: [PATCH v1 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series adds support to build the Arm64 Exynos MCT driver as a module. This
is only possible on Arm64 SoCs since they can use the Arm architected timer as
the clocksource. Once the Exynos MCT module is loaded and the device probes,
the MCT driver is used as the wakeup source for the arch_timer.

These patches are originally from the downstream Pixel 6 (gs101) kernel found
at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
been shipping as a module in the field with Android, but I've also tested this
seris with the upstream kernel on my Pixel 6 Pro.

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
can be found at [2].

Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
linux-next specific files for 20250331").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will Deacon (1):
  arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

Will McVicker (3):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms                 |  1 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 ++
 drivers/clocksource/Kconfig                  |  3 +-
 drivers/clocksource/exynos_mct.c             | 55 ++++++++++++++++----
 drivers/of/irq.c                             |  1 +
 5 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

