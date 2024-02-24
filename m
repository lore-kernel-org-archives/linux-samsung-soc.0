Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BBA4502C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806058; cv=none; b=ldvoWnuJk+ELCZbPQDwAedJT+RxSP5ghlhGrLFgYBJVIgu/dGoY5zmARqBPpZtoBcbsTVDn7ibOtlWtsAmP2dymXVMLcetx6aUAlliFZbER8yA+y0mHtCLXsoKxg8Dk9e2dR7GZcajHX3whoEQLND1NVTrkqEzRjYmtICUn234k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806058; c=relaxed/simple;
	bh=20ejiDKTsTpcZrPqXuhNtaCBoYDI0evQiQurarPLh1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TAwhG3oELIreiZ7vhbnYHOToBRpVPUa6nM7jeyCI5Ta1iReRIbU+Fri9KoFHKFgbqQiLHCbemBDLD1J97VpmI54BXBBlnmSe7he1+sMWvyTGbQc2BuwXLL5V5rFm13WeIzipInZv5GNU5to4mmHQH8OMpTLxEmYASoNXhG5DRL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAv7CU9k; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAv7CU9k"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-218642337c9so879665fac.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 12:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806054; x=1709410854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGannrirxDLyEcw4QNj/PlGVunpR8oUL3gw2gn1CCdI=;
        b=nAv7CU9kDPnMub9OtRBm+UFNkpcDV/ql/rIZHiOEcwJ259eSOYYPzj9IKRV3PD1cY+
         evoAHTHe8XxII5ynSn8mI3MM8xiRLxf3E/w8LspR9s3nAFOjoLOrt2Mey/CRhyc3XdO8
         2AXdKy0HXYLUoR0thQnx0MXYS0j/TOXHBLb4SaLGmNQP0TF8nwi3/sZltUPA1060DONj
         Jkjn9wVYh4fPibcNuL4kEuYnkkNpKW0K4hX5/hQAVqO4qUqH33rU6OA9lDB4m3V+z9LJ
         tjr4HTQ7UtyhKUAu5CHcElS5Ho8+OHhq0vnORz5cUmGp065pl8VoXDAQ0E9JHZC3RAar
         id6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806054; x=1709410854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGannrirxDLyEcw4QNj/PlGVunpR8oUL3gw2gn1CCdI=;
        b=BWDg+motmXzftgrs06nKG0rTngmtXt4iPA/4qxJhjyQiUuhwM64jhn3g10NDQeyCJe
         kYP02gkzx+uAFLLNZcdbTKsZCv/VaehrHtKeGqjInq/KWK3yLkD7RsvgVSTlEgi1JBWp
         YTgSTJEwyvUKmL0uy4aol8dD03jjatmD7LiEI/ahPJDNnP6wTwKk+nrOPevYdIAl5dSp
         t8hXPBX1AUZRuuo3JSuvpnz4H0/T1xsWji8ezLyzP7InxVDphJZaMTgy66Hy+kdlXAIT
         K1a0L+k4re6aq9xSXsY2eZFTCHS85BQ5XCm4ny2DfdaIMC+VghCrYfRDIakDlPDtKYDo
         l1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAkHQgtoetI8t4EKPWdEp7zlK6noxZGf5eopNCoKDlhHH1AMCJrnplGOy+xoESXfQKkh4PVhO86luiucpVneFuuUMnbUnK2ZzDNLCjg3jw590=
X-Gm-Message-State: AOJu0YwAcxZaKzHqY0BuONJ6zP4MagO0YvM9pj5/DORw5fi8/RV1+PNE
	rNrTp3d2ZjZdF6UycJyHN0sge7+HZEjrZPwErk8550CxDOy3d49VsLIvp2X2YCw=
X-Google-Smtp-Source: AGHT+IE2dY97kRAepcW5IQOAJvCI6fuBC0RU49Fd8Ug20+7FPGijjsTJfx0+d2Ygnyzbi+gveHFkmw==
X-Received: by 2002:a05:6871:5287:b0:21e:e97:a4cb with SMTP id hu7-20020a056871528700b0021e0e97a4cbmr4296920oac.1.1708806054416;
        Sat, 24 Feb 2024 12:20:54 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id hu15-20020a056871528f00b0021ec89a1a2asm585542oac.32.2024.02.24.12.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:20:54 -0800 (PST)
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
Subject: [PATCH v3 00/15] clk: samsung: Add CPU clocks for Exynos850
Date: Sat, 24 Feb 2024 14:20:38 -0600
Message-Id: <20240224202053.25313-1-semen.protsenko@linaro.org>
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

Changes in v3:
  - Merged struct exynos850_cpuclk_regs fields into struct
    exynos_cpuclk_regs ("one-size-fits-all" approach)

Changes in v2:
  - Removed confusing "breakup by patch" list from patch #0 commit
    message
  - Dropped the patch for making clk.h a single included header
  - Rebased the series on top of the latest linux-next
  - See per-patch changes in each patch's changelog

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
 drivers/clk/samsung/clk-cpu.c                 | 556 +++++++++++++-----
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
 13 files changed, 1034 insertions(+), 232 deletions(-)

-- 
2.39.2

