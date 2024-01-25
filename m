Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142581388
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146742; cv=none; b=YWOXVWIllNMjorQKFZZ6EmCdPkY+tJXY0jYivrKIACKbJQwLO8LEOMaItZF9BcyBhl4a5Q3Wk2WtnCL955iCOQuE61B6QHZ3oeN6naK3eDFjfam/4Uk2VP8yGIVS2koVqFWSMTux0aJYvTshd4nRzqbRXHDPlb7ZXWBM2PUJpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146742; c=relaxed/simple;
	bh=qY7j2+m8JvVkTVPqKhSkmNsGAVT5rHjPIQI9Gqpm0cg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tnroQjsB7sM7Rcsg/AHMbqoTI3QDDSlMmGjxwUUSDXNlgkPC7bPHL47j6vZ2r23hwCjIJATwAWuDpUMqLzWaZK/uWB0Jz9LD1WvADchBQP/0bc312kgoOy3hKCgbFNHCXnzgntnAtTNF3wRfFGofpa/JbIqgLkOTpGQ/h47gjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DazliC7I; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DazliC7I"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-210dec2442eso2353637fac.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 17:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146739; x=1706751539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8Il4gVKKNEQvo/qv2BtCM/sXFUWE9YTnXMAVGgAkY4=;
        b=DazliC7IIfGYv/T8OM51UCXxPi5vtydR/ri8wVvPZSokPEI6zvYk5OuEqlCl6qKBHM
         Gz5qBRv8eIdMFkcQO9YTGj9mzOEg0LwZyYtOWD+SMO59Ne0EC2otIYcdF0ZbDaE+qxaf
         VABph+A3qjRYUs7Zy6exnP3/Y/6+tM9Q4Qy7WoQgEd0k2Vc2ELXSRHX0Bn8eU2Z6YdsD
         rGSzsre0nR86EeGQvOeXJsODU2xmThnPlRHTrA5ZFX8D1bD4JjaneoA/sktW+CVCa3gy
         pKPM7ku1n4OhK9KsZ7J/SVJRqqWjordv+5rDItDCNvkB0Bu572+R5DlhwVhpGu6htN7z
         42kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146739; x=1706751539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Il4gVKKNEQvo/qv2BtCM/sXFUWE9YTnXMAVGgAkY4=;
        b=QaDmHyvLe5w6PVTss9sSugBhKRGCLU/9W6jwQjv8oR8pYsPw+8t3X/kuj5viJaXB8h
         6ZUGoTd2fYDa0E8/H4Pq5L6NaitWq/8/8KVL6bvFR6FFDu8gr+Whb9e3wpoCvfnnyNhg
         dNuRktuAdXokps6lRmMhgrtRRs8u3Bd+eGwtIkkK/oE1p6R+HSGfuKFSIoyRucKaHXlA
         BHP4WwaofgrZoitr5SsvmSDoiaD6o0zdYRmxAI2pvcy/b++ly50ddGuukobF4LfZay22
         6P2LicE2+MWyQpwhaQt3/UXlxCBhZTcJzQNdQl3ifjFd4xRIi77Bs/atzVIXI+fRNowr
         6crA==
X-Gm-Message-State: AOJu0YzV2pdKDYlmt85o895qY6hgZr22pyHV5hVJykcnH7Yj2aGQIM3h
	FBxnaWyE/tZG71osgllx92pBSKj8cF9WWXv5LjJk5T3s10B26euGwNHav4c3Hyg=
X-Google-Smtp-Source: AGHT+IHrjT5Fo0hJsl7pCFvcTyCiRF0snSrvYh3ulAFp1VrfvafCOARzEbUve/QcrhhXpowRJBAhww==
X-Received: by 2002:a05:6870:3041:b0:210:ac52:bc08 with SMTP id u1-20020a056870304100b00210ac52bc08mr178322oau.75.1706146739248;
        Wed, 24 Jan 2024 17:38:59 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id gb20-20020a056870671400b00214a527781asm710630oab.13.2024.01.24.17.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:38:58 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: exynos: Enable SPI for Exynos850
Date: Wed, 24 Jan 2024 19:38:55 -0600
Message-Id: <20240125013858.3986-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables SPI for Exynos850 SoC. The summary:

  1. Enable PDMA, it's needed for SPI (dts, clk)
  2. Propagate SPI src clock rate change up to DIV clocks, to make it
     possible to change SPI frequency (clk driver)
  3. Add SPI nodes to Exynos850 SoC dtsi

All SPI instances were tested using `spidev_test' tool in all 3 possible
modes:

  - Polling mode: xfer_size <= 32
  - IRQ mode: 64 >= xfer_size >= 32
  - DMA mode: xfer_size > 64

with 200 kHz ... 49.9 MHz SPI frequencies. The next 3 approaches were
used:

  1. Software loopback ('-l' option for `spidev_test' tool)
  2. Hardware loopback (by connecting MISO line to MOSI)
  3. By communicating with ATMega found on Sensors Mezzanine board [1],
     programmed to act as an SPI slave device

and all the transactions were additionally checked on my Logic Analyzer
to make sure the SCK frequencies were actually correct.

This series is supposed to go via Krzysztof's tree. SPI driver additions
and corresponding bindings will be submitted in a separate series and
are independent from this one.

Changes in v2:
  - Fixed indentation in clk patch to make checkpatch strict happy
  - Ordered PDMA node by unit address
  - Sorted pinctrl properties properly

[1] https://www.96boards.org/product/sensors-mezzanine/
[2] https://lore.kernel.org/all/20240120012948.8836-1-semen.protsenko@linaro.org/

Sam Protsenko (3):
  clk: samsung: exynos850: Propagate SPI IPCLK rate change
  arm64: dts: exynos: Add PDMA node for Exynos850
  arm64: dts: exynos: Add SPI nodes for Exynos850

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 64 +++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c       | 33 ++++++------
 2 files changed, 81 insertions(+), 16 deletions(-)

-- 
2.39.2

