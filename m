Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AABC523D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jul 2024 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901888; cv=none; b=Iw1Apwu6SPAgG/Y4oJ4qjdQktbrD3SmRIT5rrH/RnXVjfP9FqnjqtGpckZETIKpXXVAIhCYxHGoEWsWXDAT4huhjwlTuTKD1RgRwwWuonP4QcDWBhOMePfyDKwvKktvKDRcoNnCWFtoFGKYsSfnXOTU+CMUFO+GX+eFBgwJ9Lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901888; c=relaxed/simple;
	bh=bUusz5MFGQbk320lmZ7nHwxfWZl+U6GCDeO9USqryDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsGLPvgtmvRIQk+C30SH6Qf7l5u+jDxOfXIoDjJrlo5nDX4RBWT9UMqGdJLHxl6fNXV3Rz1yBkXPrU/1JfAKmVVgDP1R3OzujcEsY3DyQsehf7zNZbXF6rzi6embV3CmXX+GKFd0R9Wsf9lmVtRX8Klw2JSj7w6WLU8ZpoQ2Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuwpcWJp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuwpcWJp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36532d177a0so2236279f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jul 2024 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719901885; x=1720506685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPU0iTtV1+7oVrxQo2zcnXjCL251x61XTIALxv2H0OM=;
        b=xuwpcWJpfu9hX+kviR7IeaDp+qgQfcKixUZFep0aTL4442AMPwSO5GJEkSxplFEQck
         jbSi8wtV/qJsl0xb3Lajws/jJnf6b+f0nJ6Z43lrquw+ChRYGGPTaSXqOibEwSDaQkZ6
         klOQWqp9sxMbXS5AqwH3r0SuycCl1GzcUu+ffgsNfE2wkCdFawsGZ7k+kcOKFXSjQypp
         z9j4KwC+tnH4YdD/YhdcyHbb7vJ6tpXrazhr1KguLWka8GiQWq/maVDswIZiQefFXAqE
         fYT7demAZ3lG4PB3KideQeYX4iecCQE4oaK5J4MpwsKnpS0E3JnWRsETtu5AO+2uNK13
         ZQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719901885; x=1720506685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPU0iTtV1+7oVrxQo2zcnXjCL251x61XTIALxv2H0OM=;
        b=ZakmAe8xoY03kH0Bi/gYdW3OEvNfA8EVWl0NeAjF8sB0CBdArUtZiNECH2Isb0COi3
         vjB8Dm9lXxAa5LdeCSmeULPogAJ0kzqQztfxmQbfMLJ+IpLibyq/DcSkx5NQhKq0CqoQ
         Ppf6/wDO0yn/RMLWQNb3jTAKWTxC02qqzw6SFq0aQdka2p6QgF2yD9aKF22lGjX/WkD4
         HzuyLX3w60BrjmmfsSTZVDLQ4TluWPH+sO3tQYIJ76FMnpBGMggKssFWOehOWvHF2ggO
         MDPn3Wrh+w+SaEMO43QVFOHopSHmpf46SR0sBvmHOqqJSU+H+Hqn8PxNLYf/LzEtv/g/
         kUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVncBJph7oybMjDN8dN/XUPr31aqKMvsMEf0uxLRauWe/1s7NHpg+gGv/zF8yD2Huohna6pi5dUO/DPlkZ6kkPf3WywLlAhR9qM+G0LT/IGi+8=
X-Gm-Message-State: AOJu0YyDfO9NVj7Xw0ESUVOPStbwjtFAa+0FED+Kn54/51ocn6eZBHBH
	uEFK/EwSpNB6EIpeFrYicAijjVKhvgIUAGYVSqLqBULD++ThRU/WTuMLh0kxp28=
X-Google-Smtp-Source: AGHT+IH7TeWOJbXnfMxDaKJe3iYWxiALr9fPl4REF5wkT0sXVKtGKpAgu6H+zyO3BCdKZKl9oco8NQ==
X-Received: by 2002:adf:f30b:0:b0:362:b906:99c4 with SMTP id ffacd0b85a97d-3677572829amr4407346f8f.58.1719901884817;
        Mon, 01 Jul 2024 23:31:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8daasm12107097f8f.30.2024.07.01.23.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:31:24 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.11
Date: Tue,  2 Jul 2024 08:31:19 +0200
Message-ID: <20240702063120.5821-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.11

for you to fetch changes up to e61f400d6cf3d598ac3ff88a47b34823f9e1f2d5:

  clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical (2024-07-01 10:15:30 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.11

1. exynos-clkout: Remove usage of of_device_id table as .of_match_table,
   because the driver is instantiated as MFD cell, not as standalone
   platform driver.  Populated .of_match_table confused people few times
   to convert the code to device_get_match_data(), which broke the
   driver.

2. Mark one of UFS clocks as critical, because having it off stops the
   system from shutdown.

3. Cleanup: Use kmemdup_array() when applicable.

----------------------------------------------------------------
Andy Shevchenko (1):
      clk: samsung: Switch to use kmemdup_array()

Marek Szyprowski (1):
      clk: samsung: exynos-clkout: Remove misleading of_match_table/MODULE_DEVICE_TABLE

Peter Griffin (1):
      clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical

 drivers/clk/samsung/clk-cpu.c           | 4 ++--
 drivers/clk/samsung/clk-exynos-clkout.c | 7 ++++---
 drivers/clk/samsung/clk-gs101.c         | 2 +-
 drivers/clk/samsung/clk-pll.c           | 8 ++++----
 4 files changed, 11 insertions(+), 10 deletions(-)
