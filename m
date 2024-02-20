Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6541AAC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708466780; cv=none; b=KN8Z0ICs0F7RhFcQBV5CgkkdBgnrMCznoddmhzLkiqXiLUcKaYajLolH+LGJSDuL4wU041ipjEeQ/lFxwOC/9QSIyOvG5Q04wOdXEmrXRCQ5PtjjkFLROOt20bvJaQ4JIK8pJl7cjnwVA29Qlr8noSCfhN3Kugyqm3vQWVF0OKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708466780; c=relaxed/simple;
	bh=GhaDgjWdtUOht8rngj1jEJh+EUkKVJhegTHN4rK9F5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVeFh8mQDpO/Urnfn9pqlmK/XelxlhAp4mBpWk+ucGq5qOe+ZQlDW4HnkCV+ejOlwQNyxTjxTM+NKMW57nw77mCsUTSVDJ1YZw0/Gw6OsJP/jMNmR7xy8p8hWuUJqc8s3KXEdRHDtCB/MC/zSFmUEchirdZk0KfLlNiobFwFLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9pURTX7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9pURTX7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so5514722a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 14:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708466777; x=1709071577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WayrAqJKlPUd9zETfUw1Ts8bEtutpMZwBNJvVgBjtaI=;
        b=J9pURTX7qJmHmPjZOn2JGsBmsu34gaan7cBdEpRrcmI+KLlokuVtTSVap2u5b5hlxz
         FkmvONzBXBekIqlkgd9wnIq5BmEhIMUmFzByUYr17WRsiVU5I8Mdi6erE8Dky77eYQyL
         pi7i7KraOtTPyZSgc9xlwqpZm+bPK/Veo3bpTlANYdmwYhuUdnw1C/hiGaDmCU0W4cNw
         p/2qnzQztYPrDU9x2LVnegfq8Dj6I1nM6mjaNZa1HRQrDaesD0xQJrhqTR4m9b18W73D
         26QOSDtvs3y4GUnkOHCej666e9Q6KSOEDtPEGEZem2FyPrps9qT1MJ+LbcFJIDo4hDN8
         wfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708466777; x=1709071577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WayrAqJKlPUd9zETfUw1Ts8bEtutpMZwBNJvVgBjtaI=;
        b=MCgAEPz/GXgtZt+UUZ87vu/c8a5EqZ0YBb6R3D4LIuCDCeUu13sGSg8vBH7V0YAz4x
         wHQKe5oNGw0GcSTeP0vS7+pU24PH8ZjbAoLr5V/SV1Ux5slASX2CYffAS/TwLyaoljPQ
         CJNA80zZt5cIalQQud2QnbyE7uvS0ejHgn2DzhQ8blliuRuS2mhQNqpASRyO3TAj4/HM
         Vr7SaPPo9O6Fme+cta9vmxq9ZinR8oalqZlC7gtNzkOZYni1OM81MrMupOV6debwBbm3
         P6Ghlj3SkdZCEkjm3gdbCmk4yegBE5ZhmK455DRpdFSFvJ7EtQgbSJVygFnHZswq19XX
         OPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnEINqU2+G53Nisb582RLvzH/jyILfURQseEig/bxpRFewP6fReXDNNCCkQ+l/9Vkhx/C+W5c7uBu7Z5bkneR0mB/7JDs0J+nVn+Bkzma0/V8=
X-Gm-Message-State: AOJu0YwL+S4AB4qs/c+wyiahkOTf1nzUm0P3lZq0FzhZZKxFZtUMB1f4
	pm65DNzQJYiO5tS50pF1bX/si7IW5F/hLQXBkd/mpD1iACWbXF8jxduG34HsCdo=
X-Google-Smtp-Source: AGHT+IG3snKOIDgwa63ac2HZsTDoHUOHQJjsrhmM0VJAueATDqhQcjXoXx0E9aN1/Rc8QHgCkh4A/Q==
X-Received: by 2002:a17:906:40ce:b0:a3e:69d7:3514 with SMTP id a14-20020a17090640ce00b00a3e69d73514mr5448019ejk.26.1708466777363;
        Tue, 20 Feb 2024 14:06:17 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-74-232.as13285.net. [92.18.74.232])
        by smtp.gmail.com with ESMTPSA id r8-20020a170906364800b00a3e4e7ad9dbsm3413771ejb.68.2024.02.20.14.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:06:16 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: alexey.klimov@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v6 0/2] Add regmap support to exynos-pmu for protected PMU regs
Date: Tue, 20 Feb 2024 22:06:11 +0000
Message-ID: <20240220220613.797068-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is a v6 of the series to add support for protected PMU registers found
on gs101 and derivative SoCs. In v2 and later it was re-worked to be based
on a regmap abstraction that I think leads to a much neater overall
solution.

The advantage of the regmap abstraction is that most leaf drivers that
read/write PMU registers need minimal changes.

Example of Exynos drivers that require PMU register access are:
* watchdog
* usb phy
* mipi phy
* ufs phy

This series has been tested on Pixel 6 Oriole / gs101 (by me), exynos850
(by Sam) and odroid xu3 (exynos 5422) by Alexey. That confirms that both
the regmap mmio parts and regmap SMC parts are working correctly.

The expectation is this series would be merged via Krzysztofs Samsung Exynos
tree.

regards,

Peter

Changes since v5:
 - Update kerneldoc comment property -> propname 

Changes since v4:
 - Use same argument names as in struct regmap_config
 - Remove inline keyword and rely on compiler
 - Update kerneldoc wording
 - property -> propname argument rename
 - reverse Xmas tree
 - Only call of_node_put() when of_parse_phandle() is called
 - Collect tags

Changes since v3:
 - Fix PMUALIVE_MASK
 - Add TENSOR_ prefix
 - clear SET_BITS bits on each loop iteration
 - change set_bit to set_bits func name
 - Fix some alignment
 - Add missing return on dev_err_probe
 - Reduce indentation in loop

Changes since v2
 - Add select REGMAP to Kconfig
 - Add constant for SET/CLEAR bits
 - Replace kerneldoc with one line comment
 - Fix kerneldoc for EXPORT_SYMBOL_GPL funcs
 - remove superfluous extern keyword
 - dev_err_probe() on probe error
 - shorten regmcfg name
 - no compatibles inside probe, use match data
 - don't mix declarations with/without initializations
 - tensor_sec_reg_read() use mmio to avoid access restrictions
 - Collect up Reviewed-by
 - const for regmap_config structs

Changes since v1:
 - Refactor to use custom regmap to abstract SMC register access (Sam / Guenter)
 - Add deferred probing support (Saravana / Krzysztof)

v5 lore: https://lore.kernel.org/all/20240219204238.356942-1-peter.griffin@linaro.org/
v4 lore: https://lore.kernel.org/all/20240208161700.268570-1-peter.griffin@linaro.org/
v3 lore: https://lore.kernel.org/all/20240202145731.4082033-1-peter.griffin@linaro.org/
v2 lore: https://lore.kernel.org/lkml/20240129211912.3068411-1-peter.griffin@linaro.org/
v1 lore: https://lore.kernel.org/all/20240122225710.1952066-1-peter.griffin@linaro.org/

Peter Griffin (2):
  soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU
    regs
  watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU
    regs

 drivers/soc/samsung/Kconfig            |   1 +
 drivers/soc/samsung/exynos-pmu.c       | 235 ++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h       |   1 +
 drivers/watchdog/Kconfig               |   1 -
 drivers/watchdog/s3c2410_wdt.c         |   8 +-
 include/linux/soc/samsung/exynos-pmu.h |  11 +-
 6 files changed, 249 insertions(+), 8 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

