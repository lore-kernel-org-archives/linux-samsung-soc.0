Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337FE1FECBC;
	Wed,  5 Feb 2025 22:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794299; cv=none; b=qz1CQk1LUFzw3yNhtm8EUCRtf+MMz3laF82Alplq6EzlIoKmQ6B/Wu1llmtoEFMyRBmH53DT6pV9myNMaDltza7kyQjgcVVGrbEmBctbum1emJ95cESahhd1pbO7bi//E3AP4JEpo8UJXNubSq/ACcEtuB8oKWiv4QV9C7Itj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794299; c=relaxed/simple;
	bh=LfGNaAxrUpL6jhZXkHuHEOGvKUB0xdAvf8mOYpiez6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NHuA/Bwt2H7GAnzt4rNY5dRvbwcmNt+pIOLXfDpl/5NuLMUavyz7w5Rouy2oeAB8WAeQGXJxqMhTs9kxPURKZn0Z26n3lhMgUbD0r+q7rR/0sJf5hN+3k3NbX3aHP7BX30Gt+UHoFTSUa7EJQ64z6ifm00zhm1wP/wSL3U1669E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp5/ADYs; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp5/ADYs"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afdf300d07so122559137.3;
        Wed, 05 Feb 2025 14:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794297; x=1739399097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDI1H+rJa85Vk3CfNIzhP22h3WLuIx8UkR6DrHKijs4=;
        b=Pp5/ADYsOwrGBgTPQjBMNfVEmFGktGlgY055CQNOw0n6SgpTCDJWR3vhSZjqNDAKSU
         3d6nkoO8LAvBZMx6kVvA5iQn70He3Co0zaimIwIp3+36y7zEkS7wwmVUYEkiPnJnCLS5
         UENHD7UTYsrQPmATO++KQNpGi4u7BYMXEimNRe8r8C6W1cSXhJqPxScwaiyRQ3/PT+mH
         RCFp6dDQDNf1vxzglEH1Mb+JbBw7WyB9jEp3H79qVC88Xncmuw17wYlkC5CmCWzZw3Cu
         Rr4jHZvrB16bDUBLg0aKoMEnC/pADdeFNDCQ8Ma5ahApPhPAVwJdthje4Xv7yH2p/bPG
         M07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794297; x=1739399097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDI1H+rJa85Vk3CfNIzhP22h3WLuIx8UkR6DrHKijs4=;
        b=cne/dmfhfKFtUslrfT5qIOi9TP/U+zffcan7BmuRjzUNBTE1htPH0uuY+9BChcSqkN
         GFhZqq0iXkMOyfTUwUojLuM8JIiu+whiJhwPvIsh6pzjoZqmfVT34Le4FNuHiB1D9s4u
         Iz12H+9nsvb5TMfNNVHtTcFwCagEj5nnjxFJJMoDumYrDWLzHSNL3VJShOuv8XW8VDsc
         S/Scsj3romMV9/GLy1i/oOfnGwlQxzEtXHm4UyGxk+NTLzJD6JUG6/+Unn9KA3Q5E6FS
         7iOvW8DgGh97grqsgWDNOfoHdHL12ZPTQe+H07djUpAy/OUUMrpJb9lJEmtU/f+82wrd
         7UBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw8HS5dbCYmiCPdOuMAjzM9MbjuSCUCwOW2AtV84OIKklJYFnpQSJXhb/Siy4/5dyOAuohveXWHrj9Jw9eqYj/nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOsYOPtuqlf4hhKM7j9HG+2KkV8JtjxNdh1CEPGI6cNrmluKv7
	KQ7XgAsrAriQ5L0RdqhBKSA88lKmPD2FoLIvviVTv7bLkd8hdYFZ
X-Gm-Gg: ASbGncvxJ/rRYegPN7kUbNvltrC2pSrQITB/ltsYy9KtPJ39qoIYm4I9Y49JgHPvBpy
	MzMA9pdcG9zQQY0l/SBu/ggFKoIs203OrPkEXco8gJVy4W9yyJG0HPjniAdUO7tNOFPXFJzExqE
	7Vvp9TDeUmRRDdaMXQmKIZ208qMMPVaaQk9DOVqyrBxJUPGyeYsQPouC6PtsrDhdm/s25LAQB5n
	obsnS0DD0pDV2MGU5kuqk+2ExU0K5MJuofxw50I1Nvk8awEgylBFYWq3PiaQ3NFpHqgu26TrnzU
	LmwUNsYPrfeWioW39IQz72/dafJsCE4tY0DY9sRhmLQj/IHOfwMl8XyNNSkETpOGcuVCBS4+TzU
	/Mw==
X-Google-Smtp-Source: AGHT+IGVuqnzO9h7xuXld4Fi/N6TlX/gjITeZ3zFxASd8IeSGU1kC9RCh1Ppy/3bLsG7OipCqGb60g==
X-Received: by 2002:a05:6102:1622:b0:4b9:bd43:97a0 with SMTP id ada2fe7eead31-4ba4b57d58dmr3762624137.24.1738794296858;
        Wed, 05 Feb 2025 14:24:56 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:24:56 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 0/9] Add PERIC0/1 support for Exynos 990
Date: Wed,  5 Feb 2025 22:22:14 +0000
Message-Id: <20250205222223.613-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces support for
the PERIC0 and PERIC1 blocks in the Exynos 990 SoC.
It includes devicetree bindings, clock definitions,
and driver support for the following components:

- Universal Serial Interface (USI):
  - Adds samsung,exynos990-usi compatible
    for defining USI nodes in PERIC0/1.
  - Supports UART, SPI, and I2C modes.
  - Defines all 18 USI nodes in the Exynos 990 device tree.

- SPI (Serial Peripheral Interface):
  - Adds `samsung,exynos990-spi` compatible.
  - Implements SPI port configuration data.
  - Some controllers (SPI 8, 9, and 10) use a 256 bytes FIFO depth 
    instead of the usual 64 bytes.

- HSI2C (High-Speed I2C):
  - Adds `samsung,exynos990-hsi2c` compatible for Exynos 990.  

- Clock Management Unit (CMU) for PERIC0/1:
  - Adds clock definitions for USI and I2C peripherals.  
  - CMU_PERIC0/1 clocks are not marked as critical.  

This has been tested on the Samsung Galaxy S20 FE (r8s),
where USI and SPI interfaces are confirmed to be functional.

Denzeel Oliva (9):
  dt-bindings: clock: samsung,exynos990-clock: add PERIC0 / 1 clock
    management unit
  dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
  dt-bindings: serial: samsung: add Exynos990 compatible
  dt-bindings: samsung: usi: add exynos990-usi compatible
  spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
  dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1
    sysreg for Exynos990
  clk: samsung: exynos990: add support for CMU_PERIC0/1
  spi: s3c64xx: add support exynos990-spi to new port config data
  arm64: dts: exynos990: define all PERIC USI nodes

 .../clock/samsung,exynos990-clock.yaml        |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |    1 +
 .../bindings/serial/samsung_uart.yaml         |    6 +
 .../bindings/soc/samsung/exynos-usi.yaml      |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    2 +
 .../devicetree/bindings/spi/samsung,spi.yaml  |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi     | 1711 +++++++++++++++++
 drivers/clk/samsung/clk-exynos990.c           | 1079 +++++++++++
 drivers/spi/spi-s3c64xx.c                     |   16 +
 include/dt-bindings/clock/samsung,exynos990.h |  178 +-
 10 files changed, 3018 insertions(+), 1 deletion(-)

-- 
2.47.1

