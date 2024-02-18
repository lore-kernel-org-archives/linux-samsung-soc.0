Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E56EB7E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280512; cv=none; b=eWYHN/IS37XLjlk59WVqiwMtryXKtDc3zya8/kZHLXXh8SXxg0F8eR7PmW0wVpkjjBVlp/jPq6qc0cSRRUDsvuAkrcKxzPrHFILChmhfN3jiaF/GA7rRRPokIiSmCpzaHIZFZxAIlWN//s2ElTNl9msRXFvGVfb1PGOO94JGQHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280512; c=relaxed/simple;
	bh=5b3Ax3VyVKSo04rdS6XGi1aGBOyKWPLhlxPxlJG1Cs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlC5NoDL9ZYuLCOuwTas6r/FoibPrl1soNjJ3oU1fmLQUyUf38htrJLeWKQ0+ahl8fSKrE3w3I1LPVLLTNyCdTPtU/K8ynxgFW2NVnQoroG2+obK5qU32t5lD9qJ8hnbCa41ZolpDZMjyNhHnq17xnCLJwKcsn6pZ0MQ3tTbto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJZlpWV+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJZlpWV+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d066f8239so1632019f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280508; x=1708885308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBUvsJh7J3bbNyhiGiF4j3z5FqJ0WMiX5JDP4IiaR8=;
        b=BJZlpWV+8rLY/e1SlzCUU/F8R2eRbo9JoGEXm2mykaLU7tgt8SlMQD7SQzoFAD/6oh
         SFlqti0zAw1qLx8SwVQgkebJsiHmgpIkVpV7LyAoHONLL7NKOGKjPIAiskWdZ8tvXIuW
         CnczSmUwiGDeuB5jNzbrGpdMdLx5digXVNsD79nvmrMYn98vrbKKW43be6Lc+otn2O4o
         fLF0yVj1Lt+jjKz4sAbQ80rg4dLHQt5Et0u4D2/gSWjy6zsuzUyHyP4Aanensnsdv4nu
         BhkiWTSuzTHL0Nftz01YzSnpju7Nz77IPBn5iinyd+guZ4RxVCWuFqPjunnQS8soXHAR
         d8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280508; x=1708885308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgBUvsJh7J3bbNyhiGiF4j3z5FqJ0WMiX5JDP4IiaR8=;
        b=qP7KMN7aP0LiP2gKXAhi5EU2xKr/YEPP4D7tTewWME23atZG+uYrjyyqXGkRpUshFI
         7nnm9etZvT/ruXVLMDfkd+VO6xwmdoXFRKK+dnWCOU6BlrnVimB4bF288qbPNiK0aY6H
         Zo5a5YHaHB15y1t4j7vggW/HhWxTV+uYZ3wJzwdTRumGYPpzFFhbN6OF+00nL8QZ6u8p
         6EyCzwRKuXIQLNdGwBV9HaIwQB/41Q6+DhdzQEwlQ4ZWScv8Oc6y/M8NcON0C3qA1nk/
         JvMXCWrF4a7JNcHhvzckOY3t2RP/k5sT4o+sR4D5KGM05+CSpi0bQS+nYTYYgJPN3HQF
         CrXA==
X-Forwarded-Encrypted: i=1; AJvYcCVhigOOtN7nK91E4N1fW3bgEeBbJKUZFUYtYgR9OGrkFkUd4pjRMCCDJwqTUy99lsavXTVFj3NDD3NxkD5+jTSUw/BcRiE7+1uj0L1CxTDwAKk=
X-Gm-Message-State: AOJu0Yw0hoXgpDTPbpsk3LN9FZTL0spTrAKGMpNBjLhGtUqjGzRrmGCm
	Wvs2eI4k8aJV6UHHDIm0fd+X+4KXZ6w/urTPGf5KaSkd8rRdHK3A8PnfyTLsYOM=
X-Google-Smtp-Source: AGHT+IEMWzddT4jRRM3mO0QYTgawsI5pX0vK8dPJPiXyovwwBFb00vCi6jL6NpInJqDKlgAVNajVuA==
X-Received: by 2002:adf:f352:0:b0:33d:1145:8787 with SMTP id e18-20020adff352000000b0033d11458787mr6409743wrp.25.1708280508015;
        Sun, 18 Feb 2024 10:21:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] arm64: dts: samsung: exynos and google for v6.9
Date: Sun, 18 Feb 2024 19:21:39 +0100
Message-Id: <20240218182141.31213-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.9

for you to fetch changes up to 0791f541ff42f0ba7301f8caa7f3ab257284dc8f:

  arm64: dts: fsd: Add fifosize for UART in Device Tree (2024-02-12 14:21:29 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.9

Mostly work around Google GS101 SoC and Pixel phone (Oriole) adding
support for:

1. Multi Core Timer (MCT) clocksource.
2. Several clock controllers (DTS and DT bindings) and use new clocks in
   several other device nodes.
3. More serial-interface instances: USI8 and USI12 with I2C.

Exynos850:
1. SPI and DMA controllers (PL330).

----------------------------------------------------------------
André Draszik (7):
      arm64: dts: exynos: gs101: sysreg_peric0 needs a clock
      arm64: dts: exynos: gs101: use correct clocks for usi8
      arm64: dts: exynos: gs101: use correct clocks for usi_uart
      dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
      arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
      arm64: dts: exynos: gs101: define USI12 with I2C configuration
      arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole

Krzysztof Kozlowski (2):
      Merge tag 'samsung-dt-bindings-clk-6.9-3' into next/dt64
      arm64: dts: exynos: gs101: minor whitespace cleanup

Peter Griffin (1):
      arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node

Sam Protsenko (3):
      dt-bindings: clock: exynos850: Add PDMA clocks
      arm64: dts: exynos: Add PDMA node for Exynos850
      arm64: dts: exynos: Add SPI nodes for Exynos850

Tamseel Shams (1):
      arm64: dts: fsd: Add fifosize for UART in Device Tree

Tudor Ambarus (6):
      dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
      arm64: dts: exynos: gs101: remove reg-io-width from serial
      arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
      arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
      arm64: dts: exynos: gs101: define USI8 with I2C configuration
      arm64: dts: exynos: gs101: enable eeprom on gs101-oriole

 .../bindings/clock/google,gs101-clock.yaml         |  28 ++++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  64 ++++++++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  24 ++++
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi      |   2 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 131 ++++++++++++++++++---
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   2 +
 include/dt-bindings/clock/exynos850.h              |   2 +
 include/dt-bindings/clock/google,gs101.h           | 129 ++++++++++++++++++++
 8 files changed, 360 insertions(+), 22 deletions(-)
