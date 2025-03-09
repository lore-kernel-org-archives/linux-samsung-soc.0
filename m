Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A91DE88B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741542714; cv=none; b=TIluyz6E11JxvN3T3J5nMMT07RcshlMXHw6IG6y7EQc63CQA2lQPgk+m9CSnmunwY7nZJN3siJCHskjy6C3rHQtWpAIvoW6Qg31QujceLUzcUzZ+5HB4ZYE8kY9V5U5xbjswO2Bs4BbIJUq7u/btI39sBJLNHFnCzNGbNErtImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741542714; c=relaxed/simple;
	bh=wqzDb0QwjxRa7XVwLas9r4QBvnQeBCYaIII+SwsSoao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLaBsYfrCAHULizm9L+pcHDR8fe96K5sUOLfdWJVt7XsrTdxx5UgpSYYvz5x95WhO1fSM9YQ44z81TpPu/ZdzCHayqUwFrfC5vREu1KlohUtKZlcJur7jwzVDRY+cy2pje5a9YFcPnhZwCEZgatiiIA+StTNqisc8NA1zegMaLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h3TQGOOI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h3TQGOOI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso214098f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2025 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542711; x=1742147511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=h3TQGOOI1zhU8maqRCYUmp9vaDw46f5IS+zcDmbqR4UjgZzDSXKhF5iOw+7DCmwos/
         5QHYylak0iCwcWYweKuBrMobEOMesce5evlKGak7tSraJnAakCHP3M4rncVhUh4cFg6F
         9MsbmKNgqkXP2FAggMcUV+7KHnzkVuu4VmCbONJawMfQPjBMdGW4lcdPdsc/ad1a47ib
         7fwSJ1a4/FgBaXRkp6dquN2EK/K9Jb4YIUe5EbKb+yuw2ugE9Ge0ZvxilC6FdJlQKwLq
         hdOajDBzOuQMVkLPgpd1Er0uTKhp+m/tb8bdF0HMloqQXo0Y7KaWVT5qHVJroEmlkCZD
         i4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542711; x=1742147511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=BTXE2cGNkO6GmA17yNwZEbCvhCoRUvjtd7PvFCuUTs28htXqqx9ok3HpuHiL9QZYlj
         JU5P1OgY7fdqdtFT2pJ4IlRa1HkKuIBZQccAafPNNY6HCHJJvwI17p9021xrtubXcV4U
         iPbfWRyuzUGkILfmJ8uHVDlJrhIUcFRBn+hxTnZvZ3PPDPzbdRx7aagwpuUbW/PLngX0
         Cf13hoJxcLEqhr7anHibgq74vy8WF+JI6TbFKuZl/KhRMDPGj35JyuFnLFNYLJi/hNiO
         5F32TnV7b6wgDHMC0+1s1LwGV6SorGL30np4nKpwMpJd9XqoYToCTTUHR1VcWR3fSzi7
         B3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWzspr01AMmOsXzkQ6x3XiGGQpmazmMBrkVQapTwpBSsmCFHe8JsE1ajX9FnJKXYmSwC4dKEM+E59AvziOMdg3HIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjLQFWmR+XNqav/F9BJrOQQc5Puq6o+XgIHzG4bi/jO55fTBF
	6OF6hMdpNQvvj2gFbizRoy1N/sbAQpvSjEy+0vzxLGRuXWlYV5dcoGSFUxxpRMk=
X-Gm-Gg: ASbGncsCmfNP2uf/gnW7nw1UHlp+UDZCscntn5JU1eE8L1dfOPOafn1e+s+0pTwejGL
	yADsgwRbeBZCwEplDyPsEmQsON5KWRUogZ4mLi+7EJAtPBoC6VD+iNClEDaJKYRAa71frdOyTax
	wTijYvHw333VrxrCMNUrFteILtxEwT36g8y46lYoy3W/NV2OG4afjSm3X8C1IuiuZ/4zogyrjzp
	hpBr8ipbkjwG2p1NFSqgSUi4oKNOfvNPTaRvZiTH8atXQjVqzPP4agn9zXc/Em44zODHUllBTRu
	ASjGTDFR7dcVn7sxUGLBWiUEY8veE2GeC/DR+wtCLcq+WbmSHJRfCK/IjIrLtU0JvIiMMA==
X-Google-Smtp-Source: AGHT+IFa08ql7h89Y752Zvu7Rau8znLYoWC3F6Ls9EZuW63PkjYBwc7RN80jzLbibjKC9dFckabhWw==
X-Received: by 2002:a05:6000:4021:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3913bbd20d1mr1460637f8f.12.1741542711124;
        Sun, 09 Mar 2025 10:51:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb34904sm39156975e9.30.2025.03.09.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:51:50 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.15
Date: Sun,  9 Mar 2025 18:51:47 +0100
Message-ID: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

New clk drivers for Samsung SoC.  This pull includes drivers which you
commented later and pointed out few issues.  Pointed issues are in all Samsung
clk drivers and the ones here just copy existing patterns:

1. Headers: I fixed it for new and existing drivers and this pull request
includes the fixes.
2. device_get_match_data(): I still wait for contributors response. If they do
not respond, I will fix it for next cycle.
3. refdata and platform_driver_probe: I tried fixing it, but incomplete and
need to investigate more.

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.15

for you to fetch changes up to 017bbc922a09630579ff7b5b314fb186b8c0efcf:

  clk: samsung: Drop unused clk.h and of.h headers (2025-03-07 16:01:22 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.15

1. Exynos990: Add support for the PERIS clock controller in existing
   driver.
2. Exynos2200: Add new driver for several clock controllers (Alive,
   CMGP, HSI, PERIC/PERIS, TOP, UFS and VFS).
3. Exynos7870: Add new driver for several clock controllers (Alive,
   MIF, DISP AUD, FSYS, G3D, ISP, MFC and PERI).
4. Correct undefined behavior / runtime array bounds check of flexible
   array member (last 'hws' element in 'struct clk_hw_onecell_data').
   The code was logically correct for normal case, but not for the
   clang/GCC runtime bounds checking of flexible array member.
5. Few cleanups: spelling, header inclusions.

----------------------------------------------------------------
Colin Ian King (1):
      clk: samsung: Fix spelling mistake "stablization" -> "stabilization"

Igor Belwon (2):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      clk: samsung: exynos990: Add CMU_PERIS block

Ivaylo Ivanov (3):
      dt-bindings: clock: add Exynos2200 SoC
      clk: samsung: clk-pll: add support for pll_4311
      clk: samsung: introduce Exynos2200 clock driver

Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/clk
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

Will McVicker (1):
      clk: samsung: Fix UBSAN panic in samsung_clk_init()

 .../bindings/clock/samsung,exynos2200-cmu.yaml     |  247 ++
 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 ++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   19 +
 drivers/clk/samsung/Makefile                       |    2 +
 drivers/clk/samsung/clk-cpu.c                      |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 +
 drivers/clk/samsung/clk-exynos2200.c               | 3928 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos3250.c               |    4 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 +
 drivers/clk/samsung/clk-exynos5250.c               |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |    3 -
 drivers/clk/samsung/clk-exynos5410.c               |    2 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 +
 drivers/clk/samsung/clk-exynos5433.c               |    4 +-
 drivers/clk/samsung/clk-exynos7.c                  |    1 -
 drivers/clk/samsung/clk-exynos7870.c               | 1829 +++++++++
 drivers/clk/samsung/clk-exynos7885.c               |    2 +-
 drivers/clk/samsung/clk-exynos850.c                |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               |    2 +-
 drivers/clk/samsung/clk-exynos990.c                |  182 +-
 drivers/clk/samsung/clk-exynosautov9.c             |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |    2 +-
 drivers/clk/samsung/clk-fsd.c                      |    2 +-
 drivers/clk/samsung/clk-gs101.c                    |    2 +-
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 +
 drivers/clk/samsung/clk-s5pv210.c                  |    1 -
 drivers/clk/samsung/clk.c                          |    4 +-
 drivers/clk/samsung/clk.h                          |    1 +
 include/dt-bindings/clock/samsung,exynos2200-cmu.h |  431 +++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++
 include/dt-bindings/clock/samsung,exynos990.h      |   21 +
 37 files changed, 7231 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 drivers/clk/samsung/clk-exynos7870.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos7870-cmu.h
