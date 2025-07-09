Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D1238C2C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088445; cv=none; b=XZX3exuSBHtHROFqME228EM6ldjUeJxnOsOAqIS2x5qJpzs5u0SuMn117mRYVZPJOgpCmCu++yH4Uf9/SRIxoS3dqkjGNqlDDS1HOqJSmpJeG1uXrNBrbdLLqRIDvOQsJgj1SdoHbA1v+4buqSZOSr1COJEw60KO/cBW8jFbk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088445; c=relaxed/simple;
	bh=zHDAgo+3usMVt1m3EEn01KDZ4SXsamOfc9Zt4WzYYcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTILWzYdprXh73fRII6/fC76ygqDuhke2/HZ/ppg42GEuo2dIM6v44SB+ibLZg22OHOh9tk2FbQKu73dXkglpAzv/wMmOWgleesYy7A8n+guQWFllkE+NpCDSNEb/Oh4kBvXlCeRqnQCmNcygpL00jLeVQ9uYYFdWMhhHb2/ZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDNcYaPS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDNcYaPS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45368313a7bso220885e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088442; x=1752693242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=sDNcYaPS/eXYFC7nF1pKmAG8GQT4TIIdN38xtjIWCIEoYHSyjVnbV2fkU01TiwLJMi
         l2RR/DdLzA9BEkSgMO6PgKc/TCOLX/YjSFcjACezjx/tKdET5xWP/NJsF4FwZoLOQH0W
         Tj41S+I1OMM0dJ8c6np7eKgfucbZiMkk76TW2YO8wOTXmPrYMjZy6rgya5FMK1ZKads8
         JCr/Gl/GOkLtC8JZAdXDvvCXvKUKiHHefnw3eHeLj9pzbA7JzovbIpFM6rrTMpAUykbN
         YNovUCCv1gMX62o0LWCVJT/Q/xfaWHonn+JH/2NLqtCRC78bPSDNV+Kj1EVS1M+Ookwq
         aD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088442; x=1752693242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=UWhXFz67VyFLPYZyynNbu0ch5E6yUrinEhtr4PR9MfosC1Q7kSYy1+jR59RS2DFaUQ
         4L9bdsg1aAlNtsfmuuGYb+I3ZvIEOu0wUSqSdMSFflTFGFGUtsTJENn/Fr3FTYtQiJ7y
         Kvv2QJ3X0ulCMH/K3cERsP0WDpbViSmnvTHu2ofZr84H/6n7ye4kbf2GuijeA5CvUreh
         agReoD1+pHLitckja36KtbBY05fKCQ0XRiykk6J1wxYhteHGd7xSa1MeFFj7ppPYJbLI
         arzIWZ8QGEX9bDYxamSi3CQ/cy+xMT9WBZsYpt3VrvePPvFWZHTgBCDSvy+tAQoK23yW
         JCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Y1aNNatnifhSKKN5dTx+eIFfZNvmPrL5IRsv44YYX9Se3Qy2QEDoTGz8hPVuiquGFP97xfLJW6ZJr8QDWwFfrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzz+NxIEUwkpTZ5hyYt/3fHBdou9fPEaLcnGFzED56Qi81C6xX
	WC3Loe0SXRRHQ38gfdntmXOltxdYWHxoQVzmvsSlLQHAqVhSBMpVv+p0ty3QsAJTn6A=
X-Gm-Gg: ASbGnctCdIidvCiK4s5z1PtTy/e9KlNQvlTgN4iurLq7ILu0B50KlEjW5HdAkz+F1Ha
	dRgIs7E3rVEMZGP7RFEiZJ5k8syduqm7VjSYaNXPVuyonFlcgCgIkvHQOGlENt40ifNqCkshASg
	n1yxSIf926Zo3aAtEUGuBpWQJdMuG7ZomMy5GUbbrxlsdW2/sfL5DgfTfHcMwHRlinJj1JocwGT
	5EW1xQKvd3HBvM9Y8rK8tWsbeC2UGzkeOmgMJ53fBSEnMNVpdtDgVjX15kfCPCKgAaik+Hif5/a
	jNIaOmdQuMpie1ZUgeQrMgvRk2DcOm06jVGwpStFooJH5tDA/SW5HoqlCqVX+YtXXRD6BCMXN4s
	=
X-Google-Smtp-Source: AGHT+IF+y4VS+J+ifAdhQiRONDZqZsKUZRm/2F/D1x8s7RGynhJsmman4W9nCsHt84pBRtIV7i+ROQ==
X-Received: by 2002:a05:600c:19d1:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454d53eeff3mr13735995e9.8.1752088441748;
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97353sm17115944f8f.51.2025.07.09.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.17
Date: Wed,  9 Jul 2025 21:13:57 +0200
Message-ID: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zHDAgo+3usMVt1m3EEn01KDZ4SXsamOfc9Zt4WzYYcE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr928v6ljIcAcuQ3vV9rIKJq6n7Tm/0r2elL4
 FOSeEekazqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/dgAKCRDBN2bmhouD
 13qOD/9pbiV+Cnbqp0KsjL6cy1H+uJszH7jFQPm4e7juzTsGXcLalJmneRiviNHPeQlhY4Re2Fu
 sHLTlU59BDYNC9BHWjmfHo4jqxNh3FWStRKxTWvurS4QzcqRXtmhjwQYHSc2aLRl48Lvt5gDur2
 RrNnEZ3l9sh1m2mV9wldUyBmloQwS08tIkYd9LQKLOJ2KWRr2PYi2H7ezKcVbCiqaNdua7eWlGb
 NGPeEMf+mCVnEz0zobdeYe8nzsKgki7BPDGbBR/hurovDsQSCwag7G+nuOM/G17yne6mKayaVfa
 8fpx5NWgQfZGFaqTuWJVJeruhv6P370Rme8tVIb1d/QgEUv99N0JiZqOFTmZtT1pSKvn+tigY2Z
 kLGHC6xW0/ZqexuNCujKcptcR7pDcBFxuzCiwufFjTyMFbWcJ9E991WA8GLKRBfArtcwACYxqPF
 /3Hp23E/jm/b0xsWKTVMuxFSrh0o4yoKZ3f99WAHWSpEWGaGADCLg5+hm7wiA23Lz6S3PQaywP5
 22cXVmRAjSkOes+0ADM3ViW69HlVCDoZ/FcN8o8xy0z4MyAIyZ5Mgn7YA86ZGu/dgr0BTgymzbb
 dfC003omx/U1bsB+mODbyrgVy9C/GE3PVFXOuafmfkb9undGYLEc/7NMzciiCwrRSRafYYoeA0R S+lSfuRP3SDJgEw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Clock drivers. The bindings were kept on separate branch, just in case, but
eventually they were not shared outside.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.17

for you to fetch changes up to 2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15:

  clk: samsung: exynosautov920: add block hsi2 clock support (2025-06-12 17:28:11 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.17

1. Fixes for clock topology on Google GS101.
2. Add HSI2 controller on ExynosAutov920.
3. Minor comment fix for Exynos850.

----------------------------------------------------------------
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.17/clk-dt-bindings-headers' into next/clk

Raghav Sharma (3):
      dt-bindings: clock: exynosautov920: sort clock definitions
      dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      clk: samsung: exynosautov920: add block hsi2 clock support

 .../clock/samsung,exynosautov920-clock.yaml        | 37 +++++++++--
 drivers/clk/samsung/clk-exynos850.c                |  2 +-
 drivers/clk/samsung/clk-exynosautov920.c           | 72 ++++++++++++++++++++++
 drivers/clk/samsung/clk-gs101.c                    |  4 +-
 include/dt-bindings/clock/samsung,exynosautov920.h |  9 +++
 5 files changed, 115 insertions(+), 9 deletions(-)
