Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1E127B5D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 May 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182327; cv=none; b=TtP+E4/UjWhAc5y7nn5QoAOllMCaqyydHi5UYCBB4YN3fTgQQM8JK9nXdvK6rYqTnL3s4FQRUazAkkKSwLBNF59FiqmGAaZ2u99LHYdTSnNRiyMoGfhD+RUsCCnq+49ImgtNuKcQYkfTUtYcRYSViXwTzUBxRaLFNGz4k0GRaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182327; c=relaxed/simple;
	bh=d6A87ZdDShos4dPJ2y/3IA60bZ8PQJh++57xgXv9pFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EIwUZS74uv+ZbIfj04JL8sRRn8xo7UANES8V1PqZz7hjBXSClKe36Zv1GzflsnGlaAoiv0oOuOZ03OvWtCe1SqAKUDbO8THKDnHIy411hvRfcZZLCB2hGNCzLZPkLUVOrMU0r1r+RBLLIZpxBPIwsRfBlQTH1KUHzIdnAKmlGco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J1IuKkWq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J1IuKkWq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a599af16934so1143128266b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 May 2024 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715182322; x=1715787122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xupSga4L31hmKfvqtY9DNqTyzYiKLL6jl7vTBAe7YEE=;
        b=J1IuKkWq9O7msQM2GQRIHMkA3ijeplNea0j2LWASzHcp4DdL0d6/oQTd0JAYFU/0tk
         UoMGdUxSDrQdqbGkeyyrpCZ7ZIsqIlq6LuoCDl415d5aTVGYoagpPTlyasHZZlTNl6+d
         OIJoiT5DQ2ooij1crRv4EisfSdFNwWPyd1vjgmbsivoRp7aDtD3l6TIIgc9UA748o+ux
         UED64QIxBgfYWGbR81LFAf0zNX2mAMh2B4VH7PKbSJ5JJNfMTaiOyNsmf0QZcxjaR37R
         WKLpy2JWK2ZRd2fhw7dH6PrxgVoyxWCYeR0NYobQovnG7XHs5vmBsLCLnsdwrJAp0m7Z
         fPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715182322; x=1715787122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xupSga4L31hmKfvqtY9DNqTyzYiKLL6jl7vTBAe7YEE=;
        b=G/IqPHqY+NS7EOaQOIOW2Gy65HkDRKxjoSD73PXI2JLW4+WB1Mg5uvEFGmpjTMm4FA
         5qBuRZKcL7fSZUNgI2I4rZLZX/zyX4iLoea7zJurqYHb/8dBzewT081RJIUXG1q0sayj
         YP422U1JY1/m4EVJLXwxZx35JuYhGOqpAC0Eou2etSyPCXtGfhp70V9Jt3gFLjHXRqPc
         LJFDStb2iHCUBZ8i6LdqbwyQfC2T6v4PfdRmUUfSsYWiBtlX5dNSMUOw4HNzJ1BxsqVV
         TEgNHFjAFa32MF0BL8wXR4uyKJUP+XpnSzTNcEiKXp9AHLjrLss3OzNgPM1lluclQJ9y
         Nj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVceZv4Jh1lhJf9a+NrK9e9SYyAZA5k61pvhakiFy8wSE+3FchY0/3TwEnAX33UA/xgfZxNInSI78tvza+TYnQQxhNlHmUPg5S0YYn+GMx1/CE=
X-Gm-Message-State: AOJu0YyI8ZTT2BlJsoKoJv9sTuz/vZnruBGYiahLlfsO78w2YFTeOo83
	gkllWyJkuJNUfAZ+8nwP8TQmFF2xcLZ4m/Vw8Ir8gP+3mcW8qjKUHySxt+TpILs=
X-Google-Smtp-Source: AGHT+IGGZtYVnHUZ4EcfX4aUj9KBc6+H6XRuZCyQOp65StXRn/5tu41dc3BooKDe9AlZc5DJGcUdoQ==
X-Received: by 2002:a17:907:60e:b0:a59:a431:a8ce with SMTP id a640c23a62f3a-a59fb94a3fdmr209508866b.2.1715182322419;
        Wed, 08 May 2024 08:32:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id em19-20020a170907289300b00a59c2da005csm4557320ejc.215.2024.05.08.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:32:01 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.10, fixed pull, 2nd try
Date: Wed,  8 May 2024 17:31:56 +0200
Message-ID: <20240508153158.496248-1-krzysztof.kozlowski@linaro.org>
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

Updated pull request with fixed issue of non-used local const data.

Best regards,
Krzysztof


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.10-2

for you to fetch changes up to 7c18b0a5aa46cc7e5d3a7ef3f9f8e3aa91bb780f:

  clk: samsung: gs101: drop unused HSI2 clock parent data (2024-05-07 11:47:39 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.10

1. Allow choice of manual or firmware-driven control over PLLs, needed
   to fully implement CPU clock controllers on Exynos850.

2. Correct PLL clock IDs on ExynosAutov9.

3. Google GS101:
   - Propagate certain clock rates to allow setting proper SPI clock
     rates.
   - Add HSI0 and HSI2 clock controllers.
   - Mark certain clocks critical.

4. Convert old S3C64xx clock controller bindings to DT schema.

----------------------------------------------------------------
André Draszik (3):
      dt-bindings: clock: google,gs101-clock: add HSI0 clock management unit
      clk: samsung: gs101: add support for cmu_hsi0
      clk: samsung: gs101: mark some apm UASC and XIU clocks critical

Jaewon Kim (1):
      clk: samsung: exynosautov9: fix wrong pll clock id value

Krzysztof Kozlowski (3):
      dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
      Merge branch 'for-v6.10/clk-gs101-bindings' into next/clk
      clk: samsung: gs101: drop unused HSI2 clock parent data

Peter Griffin (2):
      dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      clk: samsung: gs101: add support for cmu_hsi2

Sam Protsenko (2):
      clk: samsung: Implement manual PLL control for ARM64 SoCs
      clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1

Tudor Ambarus (2):
      clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
      clk: samsung: gs101: propagate PERIC1 USI SPI clock rate

 .../bindings/clock/google,gs101-clock.yaml         |   55 +-
 .../bindings/clock/samsung,s3c6400-clock.yaml      |   57 +
 .../bindings/clock/samsung,s3c64xx-clock.txt       |   76 --
 drivers/clk/samsung/clk-exynos-arm64.c             |   56 +-
 drivers/clk/samsung/clk-exynos850.c                |  440 +++++++-
 drivers/clk/samsung/clk-exynosautov9.c             |    8 +-
 drivers/clk/samsung/clk-gs101.c                    | 1192 ++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |   15 +-
 include/dt-bindings/clock/google,gs101.h           |  116 ++
 9 files changed, 1807 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
