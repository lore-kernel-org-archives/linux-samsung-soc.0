Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077E31A83
	for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714322004; cv=none; b=hKNtY2+ub9r3R9UUPW1uiPezjVL1EvaEhAQVj8wwV+yNk6zjhw6dNOplPHjAtNQjoE0x22R0otFWBolH0d8Rz8qaFr9bXoHYUAdSpz4q1hs1QvcTQZ7tZUvY594Uun387IDYtvhOFBv0OyBzxbwWDFTBDpv5hFoo0t3AvMrf5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714322004; c=relaxed/simple;
	bh=hJwkw1Qe6He0UoOh47oNbcetclyLtp+Ip53ep8cFUls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxmbFzhZ01Xf698UpOHgIQYBmCHjnJuo7CHOg13KfveB4dZsadt+dILMwh0ODJIc0weRWZ26U+4GEXdnUHmM/CfL+aC2KSOKel2YE7oYRjIWX5iCxs+38gTbSMca5gpIajpbbBbFO1B9vrh1Fbsr/6GI8lJWQw2a7lDxvpWCpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQe/YZgk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQe/YZgk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a52223e004dso394217766b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2024 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714322000; x=1714926800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkBehBmM8rJHl9TYbr2TiyM0+uJxcjWlmpw8IC5vBb8=;
        b=iQe/YZgkG3VfRhMfu7oqQ+qhLNl81XSjTEmfY9KNlvZNs/8tTKhwmrlPA1Y6mOOfiv
         U0jq/NelAiO0gMfis7Xn4qsgruRthqDjOIOtStweI6sJLYqQTFGWz2xC3T1Mp2hzsLSx
         IIaNwnUusxdAkDMhPEHQX1zzaJy/6nudFHBW/fTl5io5rbEeN+xvmJYelVlQAh1pZClO
         3ZqeDgO69t2atuisQEmBt0JBbrxlvjMePYLxXYefhQ5x4Yciz9dsAayyUcYalalKBJXy
         0QW55+r7OhADKy/RrcuYLKcLEQ7UCNKY10nG223aj5LahvPohacHRhPOu+3cTj5Y0G3m
         rpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714322000; x=1714926800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkBehBmM8rJHl9TYbr2TiyM0+uJxcjWlmpw8IC5vBb8=;
        b=GAmrjv3jwhMJ5JQ94RTcSEvCUtTtftTHY5C3nA1tnQx7qHxJEOp7l+k7+zltjgUAHv
         h481Fr7VneXL91PVq0IVWfytX/aSMb8cAI9hp2dvil9ijRmMJNRWR2GVvM+ZyBoiN09T
         gJMb1+woiKvRz6OkQXBmvrigjT1IJxa17/YIcJoW2S3Q0PKMZeH+Qexe1yK/64wCOJXz
         JLuY4BcMU0UvtLc3xVKRRbkwtKpCeM/qcwlUVghBPQuDOxcYmXehEA0WSikrK9ni8wds
         bdKDbhF9sBZsmffnECqunGnSZqZtGlYMmibDCohxfvHnq7hgnrjPw2F5DL6yOODQrNoy
         mbJA==
X-Forwarded-Encrypted: i=1; AJvYcCXVZcq6iqiDhseJq52vexnGDTggmtyX7Z7j+7131CqNmTYDqLnij4NFJBN6NcRm8oxEGFDp1etGgNU1OL1vC6za1Q8OrmWlUJPNL2ZjAiqPi5k=
X-Gm-Message-State: AOJu0YxSrFZSuVXeyfJQWoXngvOpDSgJ+wL3XpWneBuydaxyuKVdNDBV
	9fGU7EAvIYkl1Rw5hPDWmwL1mVqLfr+I/brgSk5W2mD2DN7SrANXaMNIiZBnqHk=
X-Google-Smtp-Source: AGHT+IG2xsOsBb1Q9wusjv7j48e04laj4MhrtGe2fyJZosVzz7UkCTyzwT62xmRR9KcjI6SwTW3mwg==
X-Received: by 2002:a17:906:1c8b:b0:a58:c09d:1484 with SMTP id g11-20020a1709061c8b00b00a58c09d1484mr7831776ejh.7.1714322000448;
        Sun, 28 Apr 2024 09:33:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170906adc200b00a58f4b3661asm1173623ejb.0.2024.04.28.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:33:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.10
Date: Sun, 28 Apr 2024 18:33:13 +0200
Message-ID: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.10

for you to fetch changes up to de2ba5bd3607a5e5442a5fcbdea6ee2823b72fb9:

  arm64: dts: cavium: thunder2-99xx: drop redundant reg-names (2024-04-24 09:23:56 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.10

Fixes, which might have practical impact, however things were broken for
long enough to justify pushing it regular path:
1. ARM Juno: shorten node names for thermal zones, because Linux drivers
   have strict limit of 20 characters.
2. HiSilicon: correct size of GIC GICC address space and add missing
   GICH and GICV spaces, add cache info to properly describe cache
   topology and solve kernel boot warning.

Several cleanups:
1. Use capital "OR" for multiple licenses in SPDX.
2. Correct white-spaces for code readability.
3. Fix W=1 dtc compiler warnings, which should not have practical
   impact for Amazon, APM, Cavium, Realtek, Socionext Uniphier and
   Spreadtrum like:
    - missing unit addresses,
    - nodes not belonging to soc node,
    - not using generic node names,
    - few incorrect unit addresses.

----------------------------------------------------------------
Krzysztof Kozlowski (25):
      arm64: dts: juno: fix thermal zone node names
      arm64: dts: amd: use capital "OR" for multiple licenses in SPDX
      arm64: dts: sprd: minor whitespace cleanup
      arm64: dts: sc9860: add missing aon-prediv unit address
      arm64: dts: sc9860: move GPIO keys to board
      arm64: dts: sc9860: move GIC to soc node
      arm64: dts: whale2: add missing ap-apb unit address
      arm64: dts: sharkl3: add missing unit addresses
      arm64: dts: uniphier: ld11-global: use generic node name for audio-codec
      arm64: dts: uniphier: ld11-global: drop audio codec port unit address
      arm64: dts: uniphier: ld20-global: use generic node name for audio-codec
      arm64: dts: uniphier: ld20-global: drop audio codec port unit address
      arm64: dts: realtek: rtd129x: add missing unit address to soc node
      arm64: dts: realtek: rtd139x: add missing unit address to soc node
      arm64: dts: realtek: rtc16xx: add missing unit address to soc node
      arm64: dts: cavium: move non-MMIO node out of soc
      arm64: dts: cavium: correct unit addresses
      arm64: dts: apm: storm: move non-MMIO node out of soc
      arm64: dts: apm: shadowcat: move non-MMIO node out of soc
      arm64: dts: amazon: alpine-v2: add missing io-fabric unit addresses
      arm64: dts: amazon: alpine-v2: move non-MMIO node out of soc
      arm64: dts: amazon: alpine-v3: add missing io-fabric unit addresses
      arm64: dts: amazon: alpine-v3: drop cache nodes unit addresses
      arm64: dts: amazon: alpine-v3: correct gic unit addresses
      arm64: dts: cavium: thunder2-99xx: drop redundant reg-names

Yang Xiwen (3):
      arm64: dts: hi3798cv200: fix the size of GICR
      arm64: dts: hi3798cv200: add GICH, GICV register space and irq
      arm64: dts: hi3798cv200: add cache info

 arch/arm64/boot/dts/amazon/alpine-v2.dtsi          | 35 +++++++-------
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi          | 12 ++---
 arch/arm64/boot/dts/amd/elba-16core.dtsi           |  2 +-
 arch/arm64/boot/dts/amd/elba-asic-common.dtsi      |  2 +-
 arch/arm64/boot/dts/amd/elba-asic.dts              |  2 +-
 arch/arm64/boot/dts/amd/elba-flash-parts.dtsi      |  2 +-
 arch/arm64/boot/dts/amd/elba.dtsi                  |  2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         | 14 +++---
 arch/arm64/boot/dts/apm/apm-storm.dtsi             | 13 ++---
 arch/arm64/boot/dts/arm/juno-base.dtsi             |  4 +-
 arch/arm64/boot/dts/arm/juno-scmi.dtsi             |  4 +-
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       | 20 ++++----
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi      |  1 -
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     | 43 ++++++++++++++++-
 arch/arm64/boot/dts/realtek/rtd129x.dtsi           |  2 +-
 arch/arm64/boot/dts/realtek/rtd139x.dtsi           |  2 +-
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi           |  2 +-
 .../boot/dts/socionext/uniphier-ld11-global.dts    |  4 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts    |  4 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi               | 56 ++++++----------------
 arch/arm64/boot/dts/sprd/sharkl3.dtsi              | 18 +++----
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts          | 30 +++++++++++-
 arch/arm64/boot/dts/sprd/whale2.dtsi               |  2 +-
 23 files changed, 159 insertions(+), 117 deletions(-)
