Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EC10A05
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570959; cv=none; b=u4wgJC6x4GzTB5G6w1ZGq1Qfcoag386VJKOYyR8oD55+tH+XEBGfBo5EMjAF7D17s2ktEdF3GYIeb9A0xXhlY7fwoiTQ+eEVIjGqFu/d6Oy2HEp4faTYHkN149ayBTBsK1y6qOYKYFL/cRQfE17Z6xFOT8TUmTWwqAbSPQce4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570959; c=relaxed/simple;
	bh=SBUqXxvxQDpVqQFR+XWaiNDrRIJRD/TV6Uug1+c1n8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tpy1w82XeQ/3BoO4nVIErfqp193mhAZGBUZnPlj11m75ayqaf8l2m7sE4j9G08I9ggLtDOBoH+tCW45xbb0elDh7CHJl3yI7T7KToTmhVtnjKH8yfLtmXb5lCgmnQGp2WU2wdc4g61FUpbcT1ExUqt5cXJ+H2vPm6N/XNtbw4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtBcJVQx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtBcJVQx"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbbc6e51d0so4524885b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 19:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570956; x=1709175756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F77N/bJd/ArmxmRc/lfS9FL/QYcTZED/SCdkWs1Ud9Q=;
        b=xtBcJVQxAN+RVZBeZv0SICymQo8tbL5yIXus/suzr2TpoLsT6AiFwGDWBTZKQGxBPn
         c6aZSSUhrNsbowdFP0CyC/j6YkINoodMDOe/WjoFhUwPh9heYoDC9uoXgkVchlB+QXVe
         RvQCZmaLA2i3gmv8C94ZJDGoBYBX2ZOj5EuB2mLJUOCw9a4j5y1KN/ePt9G+BqO3Py4S
         4xSPgTwzIYnXjt7zG5sjKyv7MIA19Kkl1lrCmKl/hk1XD0t8sL+llFB2QV+ruibz8MDa
         JLr4HIbq0t2A1oiqB4anmNFcRTqNlpI4Ka5KsFXFGcDN5Fvc9GBe0g99JEKYtbSX+jmR
         agwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570956; x=1709175756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F77N/bJd/ArmxmRc/lfS9FL/QYcTZED/SCdkWs1Ud9Q=;
        b=lfCtfIZ/webwUACP6GB6tmaXHEFdd9JPa5BZtOcnkv/i2ENr6NqFnJKxvdxoHIkwgx
         a0BANK9Tz2v24OjHaMx6Bn+XUmHa6KjjgAKgDVrHwoC03T9ibMOgQwfsG7nDxJDkt6po
         CCz8tQIEVyjeIIA53bIwTWuQwiRJ4w/JBHmwrLiuqHzpQ6I//P744JNcxORjGFHlXY7B
         Y/9499wD7G087leLZimxisS4zrblckUMNuXUeSEyDhmdCLf9d+FhmVYn2KyL2Zch2dS9
         Ib+d7YeS4bQqb+Dbv6jpHzba3VUivg9mO8iS3Xkn1uU2Aqd6Ha0khnajNjAK9LSb7VcF
         KeYw==
X-Forwarded-Encrypted: i=1; AJvYcCXMCMfYXK0Ynv1+Y0VzF8qcQVzd1i7+/tWgr/oxD/r2bhXLw2e9/oWmhK3m3T9fTzL3t1pFWAYmeVpnwPt8CYpjxRnvwsi1Xzv74nTZGBan1eU=
X-Gm-Message-State: AOJu0YwakASKxR0kjvMsFL4vFSXcBqVpWGupAAu1JL6jv8SHUU0kv4vT
	cjl0c+58m4kDT/w0gEd8P7scFgOsbjP9hUJvm1IaiKVbs/9iJE6aXyWsS4HlyKA=
X-Google-Smtp-Source: AGHT+IEXZInhvB5ALK1v8rtCTrCqJYCB4UW3CTVtZPB1h3AluZ/4MefuxPgZx95IQFYdJsixH0MKEA==
X-Received: by 2002:a05:6808:23d4:b0:3c1:578a:9a17 with SMTP id bq20-20020a05680823d400b003c1578a9a17mr12392977oib.4.1708570956219;
        Wed, 21 Feb 2024 19:02:36 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id eh10-20020a056808274a00b003c13787306asm1800443oib.56.2024.02.21.19.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:35 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/15] clk: samsung: Add CPU clocks for Exynos850
Date: Wed, 21 Feb 2024 21:02:20 -0600
Message-Id: <20240222030235.27815-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series implements CPU clock support for Exynos850, adds CPU CMUs to
the clock driver and enables those in dts. This is the first step
towards cpufreq implementation.

If possible, all patches should go through Krzysztof's tree. As
inter-series dependencies go:

  * All driver changes (patch 02..14) must be taken together following
    the order established in this series
  * Patch 15 (dts changes) depends on patch 01 (bindings additions)
  * Patch 14 (driver changes) depends on patch 01 (bindings additions)

The series was tested on E850-96 board, via DebugFS with
CLOCK_ALLOW_WRITE_DEBUGFS enabled, by setting different CPU clock rates,
like this:

  # cd /sys/kernel/debug/clk/cluster0_clk/
  # cat clk_rate
  1053000000
  # echo 10000000 > clk_rate
  # cat clk_rate
  130000000

Of course, DVFS/cpufreq is not implemented yet, so the CPU can't be
overclocked too much right now, and the cpufreq interface is not
available too. As per the TRM, the CPU operates at a voltage level of
0.65 V, 0.75 V, 0.85 V and 1.05 V. When the voltage is 0.85 V, A55
quad-core operates at 1.6 GHz and CoreSight at 200 MHz.

To check the actual frequency, the "perf" tool was used:

  # perf stat sleep 1

And to check that on a particular CPU core:

  # taskset -c 4 perf stat sleep 1

Some takeaways:

  * Max functional frequency right now is 1.586 GHz
  * 1.742 GHz or more leads to the system freeze, as it requires
    more voltage to be operational
  * Max possible frequency: 2.210 GHz
  * The lowest possible frequency: 130 MHz
  * Default boot up frequency: 1.053 GHz

Changes in v2:
- Removed confusing "breakup by patch" list from patch #0 commit message
- Dropped the patch for making clk.h a single included header
- Rebased the series on top of the latest linux-next

Sam Protsenko (15):
  dt-bindings: clock: exynos850: Add CMU_CPUCLK0 and CMU_CPUCL1
  clk: samsung: Improve clk-cpu.c style
  clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
  clk: samsung: Reduce params count in exynos_register_cpu_clock()
  clk: samsung: Use single CPU clock notifier callback for all chips
  clk: samsung: Group CPU clock functions by chip
  clk: samsung: Pass actual CPU clock registers base to CPU_CLK()
  clk: samsung: Pass register layout type explicitly to CLK_CPU()
  clk: samsung: Keep CPU clock chip specific data in a dedicated struct
  clk: samsung: Keep register offsets in chip specific structure
  clk: samsung: Pass mask to wait_until_mux_stable()
  clk: samsung: Add CPU clock support for Exynos850
  clk: samsung: Implement manual PLL control for ARM64 SoCs
  clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1
  arm64: dts: exynos: Add CPU clocks for Exynos850

 .../clock/samsung,exynos850-clock.yaml        |  42 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  26 +
 drivers/clk/samsung/clk-cpu.c                 | 562 +++++++++++++-----
 drivers/clk/samsung/clk-cpu.h                 |  53 +-
 drivers/clk/samsung/clk-exynos-arm64.c        |  44 +-
 drivers/clk/samsung/clk-exynos3250.c          |   2 +-
 drivers/clk/samsung/clk-exynos4.c             |   9 +-
 drivers/clk/samsung/clk-exynos5250.c          |   5 +-
 drivers/clk/samsung/clk-exynos5420.c          |  16 +-
 drivers/clk/samsung/clk-exynos5433.c          |  10 +-
 drivers/clk/samsung/clk-exynos850.c           | 440 +++++++++++++-
 drivers/clk/samsung/clk.h                     |   9 +-
 include/dt-bindings/clock/exynos850.h         |  54 ++
 13 files changed, 1040 insertions(+), 232 deletions(-)

-- 
2.39.2

