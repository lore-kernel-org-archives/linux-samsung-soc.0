Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C71624A06F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131256; cv=none; b=oEEkn1VdzBmpXHVP1IdEFVVBXCjXe5iMmJIsZn9tJAAgnSx2flns5xczv9znWHqOBL/GoxdA0O6dmTW7Mq5S7jKDwW5CfUmHb1pDCG0+iSOXKLmbIlZYPXLUROAkN//FUZJ4mnpbjUIqA4Hip0d6bOdOzLzTUgWhnJpKLvvlOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131256; c=relaxed/simple;
	bh=ULrHUwBSa4Nx57f23106q1CX/Yt3c3c/zhOPpinKUyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RasZxWvfos0bsNSGrRsXUP8ouWJCTYI4oZ3HmIZa44TzmN/H6en2gv8We74wqwolPv1SMRZUYOV6OzD5WQdw4PQAjJlJqBM9io+wEL7hmT7+jlpZ/+x5Xo3KxKT0uWQBo6kwvzLoDfQvsX+qhmuiGhU7zA1ftPv/iCGw8xWdlZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vtgwdm/d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vtgwdm/d"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cee550af2so2137265e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131252; x=1747736052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmKO4iUFCtGPij5z8zMun04XAyBt8taBVw5kM26b2KE=;
        b=Vtgwdm/dEhbENwJJWIIqTHAdVYs31McVV4WGQmCSFANVtpV7bWcZ2Z+2KBSBEjJTG0
         48zhplxe96CZNui6rWFyzG9VLYJ/0GUOCefvg3chjErhcg7cB8c8B5wYuu2EdmieRgEa
         L1OQpBc7ZCqDIWQUY5L2MK3gFKDB8cwNOu/Rwz7b0MbSm0LQBYmmn3Slud1ahNniQdtj
         QW3y2C/Cj3jeBCZ6TuHGV7ZAA+kKLOgFSm41ip4HZNLpRwVhUZHphy4cHItbl3g3NE27
         Hy2T4io7GXPilIM9T1UfjZikbTAMyhljl717fZhbV7h5gH70fk7Ua2GcjLMsN8u6UdoC
         BFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131252; x=1747736052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmKO4iUFCtGPij5z8zMun04XAyBt8taBVw5kM26b2KE=;
        b=nKSbGT87jEGzV3OTKP6kdgoRuF4rvLe/Fm3HuRRly7l4aRayzopopz8uu+Sdbtbyxl
         Uduwx279cU/mSrDINuPlIf5q8SKZx/SEU/0SqnNcu3piVWr4VrYAos3ZX2S69CIoYOo8
         Vi0vxhOAqahWd08Dt9n8p7PjpAO9EpB0XWpPFWMDtNphg/i+6VU3g6/k/ihG4wpjVt6o
         yvgcdHJBA9ROqdvU5OOdvxOV6xiNPPJubp/aCDq/JDxAN49zO1O6xR8jXQ11i+2a6oxN
         bi7yd9rgcPOX7RFYKX2YnZvyc5oCYm2KWgmtd5cnA2Djgxbggd2x2DaQJpRla5WeNXyh
         1AXw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWFpr6Qysf5OJT9IxFgFNBsLiwVBCND+NWmEE9QpZlXybAO8iyf04cOxkz9lqjarS0IS6ofkwKzcAtD2GEWZjUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzb0ii9wAdm0UwoW6VvaMBQmck2aEuiGwNxJtmTpe2SuF5rDB2
	7T1wpWzNoOlQEYIamuuFeizfv0hulmBpTP7jY1aqNCSQTM1lYvH5ot3/c7T484Y=
X-Gm-Gg: ASbGncvxl+xDgpOioETGwckSsFGWjkqsDYCDbGVMcgrgfIuLhHiZR7V8TXCon9pte1e
	lhKPzsVEzakhuLos2faUDKOdiBab/g7Jr3/fXsUCaczsfwMm10LyafAI/oI8UTyZj5M9idz+0Y+
	SDWLDiGEnNOv0bBY53maczYEnkOnRXyedb8eQ/ZEHBhcQ8jR4eDpWYA9bK9R38W9eM1cdDKhjZn
	PUIWzFWgzzxNht0ZruDCCthAQKEO/jgChgjYedwwMK3AN4v0YkfdJ5JRYWyVZCV5GWBEQyTWybS
	od3j6QusPYHvu7nreu06LRqbzIf9sjiHnoK2fhOnuDrKJn/mPFKQWK/rGgFHAwb5BGZXVIVsSGr
	EMPZdEJyLmBvvH7vYlHQx/5S7F4L4AQRd71MzYZY=
X-Google-Smtp-Source: AGHT+IHK4ZgyRSwCAQUNKdc+qokxm+jDw3954HdRD4CSqDPQxvmPct2ZSvOSVpIzgIPcfnsOsH7saA==
X-Received: by 2002:a05:600c:3513:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-442d9c8e883mr49631055e9.2.1747131252406;
        Tue, 13 May 2025 03:14:12 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm211920495e9.40.2025.05.13.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:14:11 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:14:08 +0200
Message-ID: <20250513101407.22233-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ULrHUwBSa4Nx57f23106q1CX/Yt3c3c/zhOPpinKUyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxtvRkenr8845Ru9521lbcHxxw4cdwiBeV80j
 l4nXPkerpeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMbbwAKCRDBN2bmhouD
 1+NbD/93RhWOMmoLrcMu+Ixi+i1CLAmMXhF5TyrC/rP1BMFqTHiOh3HfrwHoBpONqaPc1UagMkV
 jwKMRPdVrwu7GX1TfnBORAtXoCgVRepVUHNvUKl1uKFmOJlS7t83YFfq2EdXy32Wjk9q31SjkVA
 K+AtUHfNnDGk9hLDJZeJM7ZVsNlP6YUK80aZegURRAbcLVvIdXX67ogEsqsHtBNtWALr0kVmXFp
 sDoToY0r1+o8v22bM687E+RBnlYmWBHTYcl75SLsHM0NCJY/FiPNxK7nbxzdLikikMFxFqnLxvA
 jp64iju1RGqAe7vnFknUD3s/NcxnAFo7MXhSFY5J6wbJuK7/ruQWJGznhhLRi/rrT461bU03LOB
 hV+WFiTuV7G/irrmngaaDG7yfmCx8AlWS2cY8tXCEQ1G7PDqcWGzXLKQqD20oOzbURRSdG5nFcE
 4HwQ2I5hy1zHJP6A8UYQM+XqEJ0Azgb5Y0XMdhU/vVEsz9IffzNli6k8LUkKKN4U6wkhmTIMW4z
 Kn81iZKqidUbgwmTVRgW9uXQC/V09vYfAPYuAyunpV1luJaihbm3/S/Iozz7PK2A7s2mHrRmSUI
 XsYZV6Z7c4RfJ80yxy2EJSUHCaayBiuX+gkTdZ3Voemy1nrM1iHEDe/q9hWxaQPfO1qbLFQsx/P N7L5dub2+QwjjoQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.16

for you to fetch changes up to 81214185e7e1fc6dfc8661a574c457accaf9a5a4:

  clk: samsung: correct clock summary for hsi1 block (2025-05-12 08:30:06 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.16

1. ExynosAutov920:
 - Add CPU cluster CL0, CL1 and CL2 clock controllers.
 - Fix HSI1 USBDRD clock parents.

2. Minor cleanup for Exynos4 drivers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk

Pritam Manohar Sutar (1):
      clk: samsung: correct clock summary for hsi1 block

Shin Son (5):
      dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
      clk: samsung: exynosautov920: add cpucl0 clock support
      dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      clk: samsung: exynosautov920: add cpucl1/2 clock support
      clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition

Varada Pavani (1):
      clk: samsung: Use samsung CCF common function

 .../clock/samsung,exynosautov920-clock.yaml        |  69 +++++
 drivers/clk/samsung/clk-exynos4.c                  |  74 +++--
 drivers/clk/samsung/clk-exynosautov920.c           | 338 ++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynosautov920.h |  51 ++++
 4 files changed, 499 insertions(+), 33 deletions(-)
