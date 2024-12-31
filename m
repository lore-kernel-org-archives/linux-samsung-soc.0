Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC351A238E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651081; cv=none; b=m8pNM3obokWe7kfFBoc3nWrLs18J34EJZ/KUPaY8CmacjjsZ8tZVbVDGxpXPw4PLHgfm9YpObzAUihg4qFhUpbgYTLbKJPQUK2T5Xr1vqFOzNGPgB2z2OjS/oOY2IRwP1Jq1znEdD3JQx4wu1svIdgnwWYolDV31yOfs/LGYzkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651081; c=relaxed/simple;
	bh=8Abt9DLwlSN/DVenDy9L+RiKF/fAYC1R2EoRkGYChRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fB+9E8j3WA7T4MjV7g+i1xrSqLy/h/5OIrL04AJ5Ak4XNCPz9y8mHd5PIKco6MdDOaNJscWUrh6NYIVvHttaifNJaOeemK3tMRtpucxmeS0pZHhbUN+bJGK9mslWx/JDyh+KFmiJdujFvFn/bIHZVGuhyZ/HckbIIm5Tl/N9GE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCwKG7nv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCwKG7nv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43637977fa4so9624645e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651078; x=1736255878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=rCwKG7nvuMl5vJ0KZB6SBeapWGxuqtfNkC+s3d6D5YLZ984zkW532awXfOgx5aRGs3
         7zhBt03OEp+Q+7+YWqpxnDBOlfXQboOy6FuHMM8VBhXpi8Hwbztr17zi1nRDLDdaorWe
         HqlH7TVX5/6OAVPNmTbQ1fpPkk2YxRUcSQQt4LACaA91OgEDh/zXGSdrNF0MFx3zxfg2
         xCHINxRME/QjGfYCWY6BOZXWyjKVdALgp+LrV5llU0Qassj4VmDW2dom1mwKwvxKce59
         nK0ocmK6mN7TVRKNZ6SmGqCXxMnTKI40apNMviIKlqnlY7uCH1rx4Nve6kF5mUjEpAxF
         o1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651078; x=1736255878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=CGCaDjeQqyOFsz9Z252m6bXp0fyL9oOiELW4ZkqLGdmqay66S2RxuVeQnqHoZn7Kjp
         Ql0bOuQo786o7i7bQuQl8ZmrOO0nVys+PoD3gXAUh8s1uvW7vCrv3+SUIMIOaSpV0fPr
         vqmqVUOu8ku+zSkcg10Ku+vRVDYOPSh1GtwT5Qt2FQ6LhHQ9aSS2vnM7qiYM+7kerDWP
         5Rz8nKirXYNx6VMB/XKJzvTBwJ3nU6iBjKuGESg6krZxdaHe7OFssYbc6WqsyxsRx04g
         hOrytILeOtxoqCbPyPcRLiqwuwKXntOvC+eFSU2C+s0RJkcymqAdcMWq1imH0ls0PSJY
         yIaw==
X-Forwarded-Encrypted: i=1; AJvYcCXmkR3LAM5g88L/flbkPbKLfJa9gPhKjWH1QXX0tsvpPfrIq11fUOtLte3/2YQDvNWCDvV0Iy+LbhFFHRskRqTHAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXhVYvk9HC0jXJRphmCSFQqXiQM3hZ9udKSbcy51dvE67GgM1
	VIBXT6if3/VK8yJm61//+KJ/hPS+SNd2HCzVg5oLOulKJtvQ/lETELF1R+RN0HA=
X-Gm-Gg: ASbGncsFVXS2HNttNZXzygkftEmpoLgGpBXfjf0vNyl1VheRuTqaAH0Ut5s0v8T95qs
	QBRI+jhCydF7stkSjYUjkI2VCGKE6YvQyXf9K7XtXtvrlZlVUVZQkXs806iGpynYzQpEegNDzJ0
	BQTeLlnDE1ajx8lNDJTn93XzaDHoOySz99tapuhCLLADLDUBiRj4pxeAKB9JkGSOhZyIZl7dFOO
	Uz/neZP3DM3h9zC5qu9h65KQyXBHWRQQcsIaLEIW2gunP5ME2w3RgLKN/kA4G+J2iuVsW4=
X-Google-Smtp-Source: AGHT+IFVEtvYE67HJ7VdU/l5KrgWkC3CkvWsWK1hbjrDA7cq4LCs/IzDCew94Z0tCX56MEGV7xGI9w==
X-Received: by 2002:a05:600c:45c6:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-43668b5e06bmr127243005e9.5.1735651078219;
        Tue, 31 Dec 2024 05:17:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] arm64: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:41 +0100
Message-ID: <20241231131742.134329-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.14

for you to fetch changes up to f424523b1b516b3f0984feeb1d8218e904d17a97:

  arm64: dts: exynos8895: Add camera hsi2c nodes (2024-12-30 08:30:36 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.14

1. Exynos8895: Add UART nodes, PMU (performance) for the M2 cluster and
   I2C controllers in the camera block (HSI2C in CAM0-3).
2. Exynos990: Add Power Management Unit (Samsung block), PMU
   (performance) for M5 cluster and two clock controllers.
3. ExynosAutov920: Add watchdog and DMA controllers.
4. Google GS101: Minor fixes for phy and USB. Add USB Type-C.
5. Exynos850-e850-96 board: Drop gap in memory layout.
6. New SoC: Exynos9810.
7. New boards, all mobile phones:
    - Exynos9810:
      Samsung Galaxy S9 (SM-G960F)
    - Exynos990:
      Samsung Galaxy S20 FE (SM-G780F)
      Samsung Galaxy S20 5G  (SM-G980F)

----------------------------------------------------------------
André Draszik (5):
      MAINTAINERS: add myself and Tudor as reviewers for Google Tensor SoC
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

Byoungtae Cho (1):
      arm64: dts: exynosautov920: add watchdog DT node

Denzeel Oliva (2):
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 FE (r8s)

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DMA nodes

Igor Belwon (3):
      arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      arm64: dts: exynos990: Add clock management unit nodes

Ivaylo Ivanov (3):
      arm64: dts: exynos8895: Add serial_0/1 nodes
      arm64: dts: exynos8895: Add a PMU node for the second cluster
      arm64: dts: exynos8895: Add camera hsi2c nodes

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.14/dt-bindings-clk-samsung' into next/dt64

Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

Sam Protsenko (1):
      arm64: dts: exynos850-e850-96: Specify reserved secure memory explicitly

Umer Uddin (5):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
      arm64: dts: exynos990: Add a PMU node for the third cluster

 .../bindings/arm/samsung/samsung-boards.yaml       |   3 +
 .../bindings/clock/samsung,exynos990-clock.yaml    | 121 +++++
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/exynos/Makefile                |   4 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  15 +-
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  82 +++-
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 115 +++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |  98 ++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts       |  28 ++
 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts    |  28 ++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  50 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  83 ++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   5 +-
 include/dt-bindings/clock/samsung,exynos990.h      | 236 ++++++++++
 18 files changed, 1858 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h
