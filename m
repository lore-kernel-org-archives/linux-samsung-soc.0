Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100311519A7;
	Sat, 15 Feb 2025 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622258; cv=none; b=e6B/Ki80syO72FK8JnOBXzHmlUmYUAYDsiSRAV+ZbSfS3CELBqvPd7SVa2Zw9XdCL4K0gkbv+GmdAgWiDwQinWtTelvnbe+YvK4xfvUGYQPPXiStYgentIfe72mSvQYXIqrrNhUQuLvETfs5axyoj70acHRC95LucI30SHmoRL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622258; c=relaxed/simple;
	bh=I9ODCIlXWH1GnOCiR+0RcDEO36s+UH1Hg6Tszz75DRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8rH3X3Q7QnUtVr6l4JXbxhiLIv7ulW8ULwiJPNTspKOPIp37ArHr9+S2ysANOlmrjzOrEjgx8Zy4R/gcoZ2o2HpN+dwXL5BrsvB5CifdDlwUW2a9k5bCkAEVq1PhdnhLeXkAbVxCWbRkI14FokgusHnbMw5vNF/OA/4flCwOGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/WutG81; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/WutG81"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43948021a45so30280565e9.1;
        Sat, 15 Feb 2025 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622253; x=1740227053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOPD4qymf/IqNbBDolDLOPpuGGy9P3JOLEcWb703OHE=;
        b=i/WutG81o8z4xT+4Reh8hAeEAUkZgURZeGBvqNzajF5AhOT3ilB205Qsfifqtm6c/9
         fGIlR070e0cMyvMzXQb867DT08b9pg3tQgUjAvpM/9NDMs63rtMXc7OpQNDx7ki6I+Lb
         y7PDiOf0nvhwt10NB9Xs9/4P8dySAwvPvQ/bM3Yyfx3/AbLDMjHQCFF4nuL3n97/YWMw
         6Jq8vup6XqJdK9x3DgNtOZYAOoOMlukR/MuG2gTfzcTzgcb+/FnwG+PMMKOHBZziqBGE
         h+nhxqUARhaTs8rXRJNgVxDPdqjcGUhJjkXL5IAEUqLKwEs4kdcGc3cDXDi5HTNA8HRO
         ZYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622253; x=1740227053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOPD4qymf/IqNbBDolDLOPpuGGy9P3JOLEcWb703OHE=;
        b=pezbGxjx7p1TANai9s3AlMmau1+VvrDUH6StuA9hHY1eoUO4nNR1gYRHA0sb3PJwmT
         mtMRi9IVW3OiUCOjaMHedy8La0DvNMdgAa6XHo+62Qv3PyQtUA78xbTa2eH8eEu1Z3Hi
         nV2bkRYjCDlUaGSDHSpcwUhfRmcJlLNuLLBgI/3ADOXsoV15DgpCD6j5mcYY3chnOZnF
         /wur3lE46LDTR4A6ojPea6FulmF8FkUZTGU9B4x82NeX93DQKdc4CO0QwXGHBWZa4Gja
         rDYdwDB/qTPd57FZLB2FxR96cRmkQpth4FrxWBWLpVG21W8pJmr1S9ZfT/0BB/Wd5CPJ
         6jXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMQxb9wPd0dbTpiTZmwdiki7QotHhN2H42kWP/AXESaig7zs6GbzqT4t7faQJxInqejhOyobdnkG8Df2PrTW7pw00=@vger.kernel.org, AJvYcCXFnWq8JRka44MQjShQ0r5pO32G069MKxhIynUQAVKipP4Qjyc6FRLND1IdZgvHO3Aq7xroiaWjStJt@vger.kernel.org, AJvYcCXG4om3N+zuN7Y+maeJlQu6ZU6JXke6aZpvXbcu79MOKeD8stB5OKvY5PtaLtqy2AaMFLf81HaKQCmKJtut@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/FDG/rxxvfUhuEA9CF3NTPC4mIbcLVXioJlt/T1d70TgYQEb
	dvwjCgIv0SUuotZs+6m1ageMz2QtVx5BdF9CyBLukpAcn6TCS/VQ
X-Gm-Gg: ASbGnctaoed3fCASgZuIs7Jey3h0XKDQjfSYpX8YrC3WBqBe26ZF2R2pH3aCoiXzUqA
	s59FUg+HxQc5GWsH/n7lFxOPVTXmMyOR5VRGtFNoVYMxgVIEyuN+Y9XvutE+qVT9TuTbc+v5XHZ
	G0sB78RSweJTh3mx05g1cu9Oujzqv0fGZeceKc/YqnVl6NMcvo3yZc0//TxMSWyPYe+BtXD0jN9
	A7zMqzMZO4gATVhoMKOpOpttw7wcelHlO0GYNMiNpnPDIk+TBckNmhaFQ0ukljCr/ZVkqWWdn/9
	mL2KaRf+QNnZp65BFrYa8l4rjiuDobCua0jyANZ9V9Oq3TvlG8jfM0G3RuKqloC/bM4=
X-Google-Smtp-Source: AGHT+IF2EDbcWuGuPwaVqGyExCl4jmeDNEBMWClpEDv9+wDSPNJiMarBLIkfU3eg/COziRDF/asPfg==
X-Received: by 2002:adf:e750:0:b0:38d:ba09:86b5 with SMTP id ffacd0b85a97d-38f33f56af3mr2707537f8f.52.1739622253043;
        Sat, 15 Feb 2025 04:24:13 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:12 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 15 Feb 2025 14:24:05 +0200
Message-ID: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

In the vendor kernel, everything is handled in a single phy driver,
with helpers for functions outside it. Clocks and regulators are
specified and enabled in one node, which makes it difficult to
separate what clocks and regulators go where without access to
schematics or TRMs. The following gates are defined for USB:

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBSUBCTL_APB_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_TCA_APB_CLK

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBLINK_ACLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USB32DRD_REF_CLK_40

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_APB_CLK
CLK_BLK_HSI0_UID_AS_APB_EUSBPHY_HSI0_IPCLKPORT_PCLKM
CLK_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_EUSB_IPCLKPORT_CLK

From what I've managed to understand, this SoC has 3 PHYs for USB:
 - a synopsys eusb2 phy
 - a synposys combophy for usbdp and superspeed
 - a usbcon phy, which can detach/attach pipe3 and has registers for
   linkctrl

The approach taken here is to introduce 2 new separate drivers: one for
the eusb2 and one for the usbcon. The eusb2 driver is modelled to take
a phandle to the usbcon and configure/unconfigure it for the eUSB2
to become accessible and not cause a hang whenever its registers are
touched.

A new USBDP driver will be added later on, so that pipe3 and super-speed
can be configured.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  dt-bindings: phy: add samsung,exynos2200-snps-eusb2-phy schema file
  dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
  phy: samsung: add Exynos2200 SNPS eUSB2 driver
  phy: samsung: add Exynos2200 usb phy controller

 .../samsung,exynos2200-snps-eusb2-phy.yaml    |  75 ++++
 .../phy/samsung,exynos2200-usbcon-phy.yaml    |  70 ++++
 drivers/phy/samsung/Kconfig                   |  26 ++
 drivers/phy/samsung/Makefile                  |   2 +
 .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
 drivers/phy/samsung/phy-exynos2200-usbcon.c   | 241 ++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 7 files changed, 768 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
 create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

-- 
2.43.0

