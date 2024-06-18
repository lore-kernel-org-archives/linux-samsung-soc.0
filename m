Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9316D328
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743527; cv=none; b=Ol07P/OuteMTA3I7Wp51jFsDY7oMyHioELxyQksm0aLU/Z4/gF4ACKu7uDDVIyYr4AF/k/PIdACBnZehvUjcRznisw/gk97l3oSMdayrytcwFXjMQxgQbPQI0MSxKf/8U9dCMZ3mmn3iSGq5116mhiFOBolHPcX3lGq9/9g293U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743527; c=relaxed/simple;
	bh=z1UyjqdAyG0LPVZ5wG40NVLSXp+qn3yQzxOTXQ/gFjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X2lYbBiavZSv2dzvw4raaCMNYpqZMIxcUi2N8F66b2i/yJrJ2xqTrlGiOb0YBfrSFl9mf4AmUSKGKwQaTgtGdPUwHPckE+azkIjY4PRlXfeNdyaQh8rdNzPp/63K5AiFrqVRcz/SSV9raYF2vr1xulGZDaJtSrklYgSzASjX258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rg9FeT+7; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rg9FeT+7"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5bdbbc37664so2842173eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718743524; x=1719348324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhcEpUixYW1NlD8vTPxrTj/5Uvw5ZqhDNkVhL4sqgko=;
        b=Rg9FeT+7RruPCgAHq/kcseEtTwCRg78pmXU9nPUAJh4ywffkhonr/P9vH3AAUlh8Qv
         E/+5aYnHmE5xOsXDQHGXQTn9O3JY47upIx8KoffVuVOoxIHwekD+gm2Cowvi2tjfdfnB
         rnkaxx/ngGJAfQxPDMFXPB4xucTMzJXr7K7xxQ97Ruwvre2G6QpUMtbAMIe+6UVuHGcM
         1KYF2SJi4Xl5VLMtu8Wxh7SbNabisyEB4TttxI3nmJ5wv2sMrikbmvgf/R1OvoNTgugh
         x1xI590/yyYO9USFG/zQ25x2Aad007vQgu9KSzGVLomfaPZy3a5TAlCIQdqELGdQdsJ5
         USkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743524; x=1719348324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhcEpUixYW1NlD8vTPxrTj/5Uvw5ZqhDNkVhL4sqgko=;
        b=k4K868PMVZ/LHAT8msXvuvh3nzSnFopJeiCHaIo/B80Q5t5SO7qLVVYgBsg2+WQKCN
         et57baGap0jHxt8GoDQ/ZMjWVjLca7/px86Gmj2QHsVY3lpNfoCpc6mHc5Jh7Oe/gxe8
         gHP52qtXZjAu9aZDMq8f7oavlhsi2GdCYGpBBc3YKgWFUGB+ZQg09dJWeViqSgNs5ugF
         tWQ4rBUBtXDyhJv0hgqPfbgwX2quEi0M8DypZvfOktZ/s7L3b+ig6nr7MS8HqY/jrCKc
         wgOTJbqUm6QoCYW98eiUBoY7Ls42gxCqyhConaDIG4VGkmAI7uJAPZFxvPnwmdwVQPev
         FnOA==
X-Forwarded-Encrypted: i=1; AJvYcCVFQAki5N+YSwmkQMcYb6KfNab4N79ZuecHq8FhVoRfuViQH3Fc/iXPDzV117eWK1hA2Vo94ohEc6gYS4hPE3SXTB6nCwhCAQ1RN0SWUfWlW+k=
X-Gm-Message-State: AOJu0YzeMXtmTJ7/4c+tzLvndsukhKLrdyMbvFI5wV2btHs/RgKw9D6S
	JO4DVN8rskWVYkk2Ve3TOJ+yO+33dwaqHEMgjNgb7Gtg5cVUXSamdGN8pCbirCw=
X-Google-Smtp-Source: AGHT+IF2pnET8e+kKpto1cAvMwXd1n2tX30Z+TpufXJVT8R7Pig00Ik8aCpU+HEcP1N7AhulSTEWpw==
X-Received: by 2002:a05:6870:7013:b0:254:a778:6fbd with SMTP id 586e51a60fabf-25c94901c85mr1114518fac.6.1718743524442;
        Tue, 18 Jun 2024 13:45:24 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1f57a1sm1971383a34.46.2024.06.18.13.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:45:24 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] hwrng: exynos: Add support for Exynos850
Date: Tue, 18 Jun 2024 15:45:16 -0500
Message-Id: <20240618204523.9563-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos850 has True Random Number Generator (TRNG) block which is very
similar to Exynos5250 for which the driver already exists
(exynos-trng.c). There are two differences though:
  1. Additional SSS PCLK clock has to be enabled to make TRNG registers
     accessible.
  2. All SSS registers (including TRNG area) are protected with
     TrustZone and can only be accessed from EL3 monitor. So the
     corresponding SMC calls have to be used instead to interact with
     TRNG block.

This patch series enables TRNG support on Exynos850 SoC. It was tested
on the E850-96 board running Debian rootfs like this:

    8<-------------------------------------------------------------->8
    # cat /sys/devices/virtual/misc/hw_random/rng_current
    12081400.rng

    # dd if=/dev/hwrng bs=100000 count=1 > /dev/null
    ...
    122KB/s

    # apt install rng-tools5
    # rngtest -c 1000 < /dev/hwrng
    ...
    rngtest: starting FIPS tests...
    rngtest: bits received from input: 20000032
    rngtest: FIPS 140-2 successes: 1000
    rngtest: FIPS 140-2 failures: 0
    rngtest: FIPS 140-2(2001-10-10) Monobit: 0
    rngtest: FIPS 140-2(2001-10-10) Poker: 0
    rngtest: FIPS 140-2(2001-10-10) Runs: 0
    rngtest: FIPS 140-2(2001-10-10) Long run: 0
    rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
    rngtest: input channel speed: (min=941.855; avg=965.515;
             max=968.236)Kibits/s
    rngtest: FIPS tests speed: (min=49.542; avg=52.886;
             max=53.577)Mibits/s
    rngtest: Program run time: 20590194 microseconds
    8<-------------------------------------------------------------->8

Changes in v2:
  - Removed the patch for renaming the dt-bindings doc file
  - Added the patch for using devm_clk_get_enabled() to get the clock
  - Addressed all review comments for v1 series

Sam Protsenko (7):
  dt-bindings: rng: Add Exynos850 support to exynos-trng
  hwrng: exynos: Improve coding style
  hwrng: exynos: Use devm_clk_get_enabled() to get the clock
  hwrng: exynos: Implement bus clock control
  hwrng: exynos: Add SMC based TRNG operation
  hwrng: exynos: Enable Exynos850 support
  arm64: dts: exynos850: Enable TRNG

 .../bindings/rng/samsung,exynos5250-trng.yaml |  40 +++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   8 +
 drivers/char/hw_random/exynos-trng.c          | 216 +++++++++++++-----
 3 files changed, 206 insertions(+), 58 deletions(-)

-- 
2.39.2

