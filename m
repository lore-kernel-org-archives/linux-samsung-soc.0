Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B00E171E70
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Nov 2024 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706645; cv=none; b=tBz9ArRFJ/s6PXUMMv59vXQEukFIXT7I2rHavCuhvyM480gZnR13wOF4fSIh32XENihIa4tsqiXxk09xCCpbzz2Zpnyo5DFMNJFLjMeW1lCI/cdk1LnL2SEwNKnEyEqUBgPmjW/1b8LtI+A0/HjXhuQkBvKlZaLQRGtH44hprQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706645; c=relaxed/simple;
	bh=/Y28vokTpQb4d1tXRJmorOa0iViEBF2hFEc+PPDpI44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uO3/zFzOqAsEA8ObIF+u+8GIXjv8ySAeM3IC4OQ2gNv9FcZnDzF7c9dcNwGvgv1+E6ZY9e4GAMEpmO6EpwqyGq/KEHTJWTmuI6SzgF4NzbqjKm7UUdq6Um6kh9lVSaYK0bxuoPUmWYzT7/6Kgy8HDzFQn3ypgU9wgZXY1nn7urY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIzqfx18; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIzqfx18"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a19bf0a1dso85102366b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Nov 2024 23:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730706642; x=1731311442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=VIzqfx18CbAbeUr9i5ZLfk7DB2zaD/c2zk4v6HrvfbjFQ8DN3atauRSs3giY1g6slf
         5oExa81iR4hnG42Soa63Zxk63+/pSeztCpZSsjOLwQiYYHLWTOczVQcKA0Y4O+GO1RgT
         pcBWw99bY0IvBCnoDabFJenikvUdMJRCmeHMzb8gebYUSGIq6HQbr1RrD9JS/R0+x9Sp
         cwQK0szDeBSka2wSm4qzpkZsQnjDQ7h4mUoB5e1wTEfnQnoD5HdqS5MbS+PEWmeLtc2L
         4sYYb1WQtqpw04xbo3GKavcvvZF9lDpiIox4JK/pjusTRaqg+PMUNLlAIZFWZfIQRf1C
         vkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706642; x=1731311442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=XJQTUxfCczBwC9Al+XSYW1rHq6VdiGnkybdELm0dIIIZpZQ62svjwGjg199oSj4OaN
         4waibsR1WoSj+1yGCnPfM6yS+iISGZexvad91PTfNKBETbVfESJNECtge+3ZstrrN2JQ
         UAhTmTZl6y3rnsrgRXvMv6LosBL+0rvXyUlkqvAb9ic76Q2UX/fOtLHEcV1YgrO3YiFU
         69NLI7ut7xmObbVDEHOIhqEQOEkyJ+whWagIVUkR60MPv8A7LdxgcpbZbyWToyQlfnBh
         FXqV/1eO7+3gX2xFKcsDKyNl+bKmCFkeANZ5si+DekNc0WvsVHgwW5PdwZ1YMX3YO1W6
         /bHA==
X-Forwarded-Encrypted: i=1; AJvYcCWhDm7KQtmgIfg0MEezSVYQkSdxo50Xj19HuW0b3Cv9PBbkm2AdYZgzZXgHFTGG8c/5lwOwdFHNBRxSKAVlKIwKmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3E1JYbbZgBKky0V35MsA4Fm61ePWy47zaw6qNHrKJf6NIsr1
	Z5lI+xe/DJMW6CW0e/QApASMtpvuICKYfsvdme+J/6ECFtwhMPsR4ewr3k4OAD0=
X-Google-Smtp-Source: AGHT+IEbIfNzeLwZgrrpPLLaSv5bOleyHd6msDt353EA2HHUzNhF9o9Fa5Cuz6VIqVTylhnb+z1K8g==
X-Received: by 2002:a17:907:74b:b0:a99:fbb6:4956 with SMTP id a640c23a62f3a-a9de6175f57mr1477251366b.10.1730706641496;
        Sun, 03 Nov 2024 23:50:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5668499esm517640966b.219.2024.11.03.23.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:50:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.13
Date: Mon,  4 Nov 2024 08:50:36 +0100
Message-ID: <20241104075037.13323-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.13

for you to fetch changes up to 9174fac3b302a853b78c78f2f5ad11462b0c54b0:

  clk: samsung: Introduce Exynos8895 clock driver (2024-10-26 14:00:12 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.13

1. Tesla FSD: Move number of clocks from DT binding headers to driver,
   because these are not an ABI and might change while finishing support
   for the hardware.

2. ExynosAutov920: Add clock controller drivers for PERIC1, MISC, HSI0
   and HSI1.  Context of patch depends on a fix from fixes branch, thus
   pull in my earlier pull request with fixes.

3. Google GS101: Do not disable UFS host controller clocks, ever,
   because gating them does not work well with UFS sleep/power savings.
   Downstream does not gate them via OS, but uses hardware feature -
   Automatic Clock Gating - which is not yet supported in upstream.

4. Exynos8895: New SoC with initial support for clock controllers:
   FSYS0/1, PERIC0/1, PERIS and TOP.

5. Few code style improvements.

----------------------------------------------------------------
Inbaraj E (2):
      clk: samsung: fsd: do not define number of clocks in bindings
      dt-bindings: clock: samsung: remove define with number of clocks for FSD

Ivaylo Ivanov (3):
      dt-bindings: clock: samsung: Add Exynos8895 SoC
      clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
      clk: samsung: Introduce Exynos8895 clock driver

Jinjie Ruan (1):
      clk: samsung: Fix out-of-bound access of of_match_node()

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk
      Merge tag 'samsung-clk-fixes-6.12' into next/clk
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk

Peter Griffin (1):
      clk: samsung: gs101: make all ufs related clocks critical

Sunyeal Hong (2):
      dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
      clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock support

Varada Pavani (2):
      clk: samsung: Fix block comment style warnings reported by checkpatch
      clk: samsung: Fix errors reported by checkpatch

 .../bindings/clock/samsung,exynos8895-clock.yaml   |  239 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-audss.c             |    2 +-
 drivers/clk/samsung/clk-exynos3250.c               |    2 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5250.c               |    2 +-
 drivers/clk/samsung/clk-exynos5260.c               |    4 +-
 drivers/clk/samsung/clk-exynos5410.c               |    2 +-
 drivers/clk/samsung/clk-exynos5420.c               |    6 +-
 drivers/clk/samsung/clk-exynos7.c                  |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               | 2803 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynosautov920.c           |  290 ++
 drivers/clk/samsung/clk-fsd.c                      |   23 +-
 drivers/clk/samsung/clk-gs101.c                    |   10 +-
 drivers/clk/samsung/clk-pll.c                      |    2 +
 drivers/clk/samsung/clk-pll.h                      |    2 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    2 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |    2 +-
 drivers/clk/samsung/clk.c                          |    2 +-
 include/dt-bindings/clock/fsd-clk.h                |    7 -
 include/dt-bindings/clock/samsung,exynos8895.h     |  453 ++++
 include/dt-bindings/clock/samsung,exynosautov920.h |   47 +
 23 files changed, 3873 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h
