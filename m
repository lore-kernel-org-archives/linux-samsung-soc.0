Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365481CFAF
	for <linux-samsung-soc@vger.kernel.org>; Sat,  4 May 2024 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824760; cv=none; b=cdA5nrZR/tWJUJxg7ppTcHDOaHosdVu4j14Dkf8tN16Ta/rMm8ZgnfOEzO71nIMvyZIb62dGY+egtuQ8W1hCEfazncLM8mj22SY+s7bhQPmF1huA2Oj9dt/sb9wrl2sTXqnj3H/6Gvm+0rm6PMj0AdD/OiOFGgPRCrSTbMLdo74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824760; c=relaxed/simple;
	bh=e1jEgB0fjAfZ3F7oHZau9fnKOKNyVck5nUtMXGTsSfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZDfi/d4ZTjV9TwdtpSzkQ+p6DF8H0zhVINXGbJ2KbFtrDonlQcijkwuc+1ZGVIq9S9MNNI6aHOQWrenNKrilAsu7y3rOlFD7Cfhd6gOw9ltCC5CIAxe1ShN3aDTP043PChj1fllWCU9p1PpR2qhmbOFYFjXvV8yV0+LFyxrJSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWMWuL2/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWMWuL2/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e22a1bed91so6163221fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 May 2024 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714824757; x=1715429557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICI5eXiJ0vUJcoCOr2N1c06yFJQ7Qp0yrnmnXTdidMc=;
        b=LWMWuL2/k0ZnMK6/swxx4YGzxmyVVdGL8ZW2fq1uDKM9LCgE+FTe6gan60cv10i5bQ
         Y0TCSWliEWSZbJ6gswPWea7J1ee8b+XykTC+XNKtZolow2Z/LxVaKOZUe8yCIF8YeebF
         LeVuzgKE220T3GImseP9mMMNJhuAR5DjdJ1cnVwkzCFqcxDGKmIibWQEOQQOtH44E9x/
         SeMpfdv6Nu+3rz6xAXQA2t1i4PGuEIkXDPg/QLmZK7QRfNqJ3ZX1NGyS+22FVasuieX6
         HDEeGo3tWUbu37Lc2HmuW+m20Buv6lQEoKGRHZTgyZpoYYdhLZ2DQfr6Yab066o6ehh9
         Klgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714824757; x=1715429557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICI5eXiJ0vUJcoCOr2N1c06yFJQ7Qp0yrnmnXTdidMc=;
        b=NQWXk9J7K5aEpaxIdfrDVJuZ9rIRdHw21sUiA9SzXjbO62DSRGdyTO0vdObyz2x5Sj
         xPIpqO+LrdaqDCW9oGpwb2++Xok7n3THwwyeEZwvYxbFRjcjiDdAvasvgV5Ir87PZe/D
         U1UqHTn6lAzLu2k7dInPEs9S8DTrkQ9t+rzFRo2+NuTPe7xqe44K/XFp0wF/usMRVFpj
         CDSfCws57gmgLRj/sfHJQ1FJCm1hbVTPlz/haqtTpVBPU9t1LkzV9ZqamIpAzG6wjsqY
         ImdqETm/u7s7yru5eKMUQCFUKrlcbCQBhxxerugWBv6oviUqFwk1curYbAvJHUA9BL2K
         pQOw==
X-Forwarded-Encrypted: i=1; AJvYcCWNEthDnb8q5oVDgucgxGa/PIHhI9VjSnAUphblffBWKrlnDw1ibUQZrlKdgDYxxVCmVnaihm3tyHzYQqORcwlnIQwPh5wZpw6+nHhc4r7TP7Y=
X-Gm-Message-State: AOJu0YwavJM4TxU8hOWRwG2Qih+wVeMPiy0JabbA76PtibTsq/36dmXO
	Vcs2lpgF+mY6C0gyDJPfIzCV9KrgyTvcZ9dDAWipOxICocA0Gp8E08lQo5OMACXSnHOMHu6sUJW
	LvGw=
X-Google-Smtp-Source: AGHT+IFj+qJ3fbIHVe57Z8zbN5Rs15TtFjm6vsXzOPnENrewemL6r+rTHyYA8LfnEUOPnluH4G2KLw==
X-Received: by 2002:a2e:94d6:0:b0:2e0:37be:b70f with SMTP id r22-20020a2e94d6000000b002e037beb70fmr3228987ljh.26.1714824757350;
        Sat, 04 May 2024 05:12:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id hn26-20020a05600ca39a00b0041a68d4fe76sm10802937wmb.0.2024.05.04.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:12:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: dts for v6.10, part two
Date: Sat,  4 May 2024 14:12:32 +0200
Message-ID: <20240504121233.7589-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On top of previous DTS64 pull request.

Best regards,
Krzysztof


The following changes since commit a45c3a9b1ef9571741d40bf10f22ce3c60bc5111:

  arm64: dts: exynos: gs101: define all PERIC USI nodes (2024-03-28 10:51:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.10-2

for you to fetch changes up to 4db286b0a29aa3576a401b637ac5910dac22117f:

  arm64: dts: exynos: gs101: specify empty clocks for remaining pinctrl (2024-05-03 10:36:56 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.10, part two

Few changes exclusively for Google GS101:
1. Add HSI0 and HSI2 clock controllers (CMUs).
2. Add USB 3.1 Dual Role Device (DRD) support.
3. Add UFS (Universal Flash Storage) support.
4. Document bus clocks in pin controllers necessary for accessing
   registers.

----------------------------------------------------------------
André Draszik (8):
      dt-bindings: clock: google,gs101-clock: add HSI0 clock management unit
      arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller
      arm64: dts: exynos: gs101: add USB & USB-phy nodes
      arm64: dts: exynos: gs101-oriole: enable USB on this board
      arm64: dts: exynos: gs101: specify bus clock for pinctrl (far) alive
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_peric[01]
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_hsi2
      arm64: dts: exynos: gs101: specify empty clocks for remaining pinctrl

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.10/clk-gs101-bindings' into next/dt64

Peter Griffin (6):
      dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
      dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
      arm64: dts: exynos: gs101: Add the hsi2 sysreg node
      arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
      arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs regulator

 .../bindings/clock/google,gs101-clock.yaml         |  55 ++++++++-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  42 +++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 128 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 116 +++++++++++++++++++
 5 files changed, 341 insertions(+), 2 deletions(-)
