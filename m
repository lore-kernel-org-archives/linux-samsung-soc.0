Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A41CF8B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474103; cv=none; b=UVJY//la8C95k6B5KzzsJGy/p+O7M/9mPCWB0iYAB7O75D2UzE+dx05JXymonvpYhZxk9l4lnYlsH1l4bdZBwyYBSk9JsUzpi8XzC698wcZfP6sVjjib5LaIVUtsoL+6WaoD2auMkCk+lewVaupWX9eoL6o+FljcNQR2z9ZjGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474103; c=relaxed/simple;
	bh=ejFNoOYsh0RIbZh0gTh5AZFv4tIJYFy5C/80aIdfELc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFrVT2FQ2w5sTRI5rJuwFzS5cAJJRieBoDvfW886draEeQhnKELuiwfw11D3v7gLA6669IECphG0lJaH1DIhxDR9sVqTBe753NRCXJ341Sgb86/a+Bbffgvv/x0DQ39MBY2iq4amc/+6WayFDh2rqA3D24LqF86GTKAeokZLjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNVz7tzq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNVz7tzq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-414911fa3edso2258735e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474100; x=1712078900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34whjUG6Zl1XJm4VzRMa0tnbaz/35qwlfAZRIoFZ8E4=;
        b=zNVz7tzqjT6uL9hevDhszkTpJXvJPEmPmQ/fDlul7Z9e6ZIUR/EOdOgaqGeQG191Hu
         m5w/cSpMWbHY1oiaf7df2m9LRhOluzusnpdNrEN1xSPr+gTeW4RUMKD4RdLMjHIu9DHk
         Hb25+VjHk2SztvYOwU8n/JI5f+H2Sx2dD+joGPWfkexGo0ooCVEBRSJzRu0sOCSz7rZ4
         a4QR4egneqWpAgcKjJzafSmZ1wRVJgJX5jxrq3A6GIjMhxz3naZ/GVn8QOb5u1afOKp8
         JM/cgNyLMBdmC5KCzpux/PcCd54PTIR1so3B8eiBDKXRr3G9913FyUWix617VpwfTQmV
         /pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474100; x=1712078900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34whjUG6Zl1XJm4VzRMa0tnbaz/35qwlfAZRIoFZ8E4=;
        b=LMHOcfWMZptvlvz54WR/LLDii3XDmyLJyzyTauYDmsoHbGDgHvVfcXBoCe37w3N0IJ
         r8jHuWAJMAD0gIKyLOYOeJL9RLDChmuPSjbktuc90s3AKCBAMRTLKO/u0bWVX7V1+etK
         M6SSWsx+SGkIL1VHJFCUA1m1t+ToOP/tq10OZhgWHkzeoly3HNLbAQzKOt3qrLnp+2U6
         DUONW9TbKs0bmesBrGVDTjUsblr28Zbnv4oWrC6ShEBHzHIbVHFJSWjF5DYVnZV7KqcV
         9DQzQ+CcOis9IZCMXXs+CdBn1nIP/qmecGPf+MEQ1VrYQj5Q5GDPQjThjpDKHQrSoT3H
         Prcg==
X-Forwarded-Encrypted: i=1; AJvYcCV1x/grR0u/u7lsIGUflq4N3raQ8fG6ZH3oJSrfw08lCCrG3ELOImNTYr59dYsmzSqzrhIrzqiJgLATKS4BhKbIVGPGVJCKmT85eQyCmwBL6KQ=
X-Gm-Message-State: AOJu0Ywe3CtDCQ8pYsnBFZ9nnXZI5Qe48NZnEYalbZ5NZLhET0zq0Hep
	8zRSPlbk2AoB3MVVUg+7pVit1/7KjiK/mBbKYsXdOjKhJtOsfFd2KXC+CZOYli4=
X-Google-Smtp-Source: AGHT+IGVsI/cgzBwB19eGGlN8u5ea7DLBa4HSFT2VWsIzl7t0W0L/UkrdqHMsvGdc4yOzHzhWAb+lg==
X-Received: by 2002:a05:600c:3149:b0:413:3160:840f with SMTP id h9-20020a05600c314900b004133160840fmr201412wmo.0.1711474099691;
        Tue, 26 Mar 2024 10:28:19 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id fl12-20020a05600c0b8c00b004148f9c5822sm2063281wmb.22.2024.03.26.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:28:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	linux-clk@vger.kernel.org,
	jaewon02.kim@samsung.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/3] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Tue, 26 Mar 2024 17:28:10 +0000
Message-ID: <20240326172813.801470-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().
    
Introduce nMUX() for MUX clocks that can be reparented. nMUX is used
in GS101 to reparent the USI MUX to OSCCLK on low SPI clock rates.

Each instance of the USI IP in GS101 has its own MUX_USI clock, thus
the reparenting of a MUX_USI clock corresponds to a single instance
of the USI IP. We allow the reparenting of the MUX_USIx clocks to
OSCCLK. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks
to OSCCLK. Follow the downstream driver and do the same.

Tested with USI6 and USI13 SPI.

Find discussion on MUX reparenting to OSCCLK at:
https://lore.kernel.org/linux-samsung-soc/d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org/

v2:
- reword commit messages
- drop exynos850 patch on Sam's request

v1: https://lore.kernel.org/linux-samsung-soc/20240229122021.1901785-1-tudor.ambarus@linaro.org/

Tudor Ambarus (3):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate

 drivers/clk/samsung/clk-gs101.c | 225 +++++++++++++++++---------------
 drivers/clk/samsung/clk.h       |  20 +++
 2 files changed, 140 insertions(+), 105 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

