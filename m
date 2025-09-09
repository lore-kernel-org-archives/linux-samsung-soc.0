Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A72FD1B6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440902; cv=none; b=jDCBLI4BcQHpN8Yyx26jZePgbyO9gmnf2UqJTCE0C8R3WmTBs8DI4fodVOIFtkDEbyjW8yRltenKRL61XCF+ZU5AheSUgQXe9K5NIX8R53Z8NMmovz6Jt8pxmDufo3kHNEBNWezuEApPcBdqOk/MVqcvIKdPSkLl1h6b33IE0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440902; c=relaxed/simple;
	bh=lPSneZP6QA4IVA2DA2vcr6ck9xWg1uRXp8PmH5pXh0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyVU/72WsKkVK4nKHKUasfuC9I9+YKmXpAmZxhFScsYL8Jl13Eu5moZn+HafdJ8ggoPEkFXh/FbOGtXrrsqrEolH1FvMhsJX72or5WUtIAa7DMwzJRl0RH4EzGNwSisDgQsE4sOGjXiL7+P/bNwtu5jQjiem+E/WTznGpr52Opw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfLEcX+T; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfLEcX+T"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0419ea6241so65708766b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757440898; x=1758045698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB3rahRir377R/zsN8HMeSS97H1bc/fP4p5/jH1URm0=;
        b=MfLEcX+TwAAlLLpolOxXl7QApTRgegL4+PttY1mXCc6ne3qnneV45N7Pv/gdLFjl9y
         ldmHo8drwJ/wWA8ZxeR/hx0nPMdbQTeco1vHsB2B/hLp7mOQY6jtctBpufb9G92M8xil
         Gq/7PNV4vcbL47/Vf03Do/GIUcniORNgKkw2uSvwN5YdLUy8S7mrbTkr5W/MggCZSRNg
         G0kNBy41oXtUstXsWmAYCpoK/VcyPb3vo9TfblfzdJnnGrF84LYB9HMasMhs+9RNKAGI
         GrZNqmf31kwexEEcKdCdUnXwKL0lGC5RZUaarZjG7qI7mcfZPyGRcH0Zo1ec47F2GRMO
         seCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440898; x=1758045698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB3rahRir377R/zsN8HMeSS97H1bc/fP4p5/jH1URm0=;
        b=lXC5Aqm/e0iUyquLowXxxBkglSqpKg+/ckoEdQqCq0O6X/uLnbVeS8fNo/rMRnm+Fh
         w1fkuaDBWvs8rMLKRtNpV7Kjl1lLbHdKELHQrPQkOb9qKzNZ+V5okq5rLc6cyIJIKb07
         DUaNTHkrgoSh1wAiAsSdBjM1Vb/gXiMHztFfqxPob0dWcqm7tdcpJQCqSQ9IKRfMtzep
         DS7efjI2kHjxEWr071VTWLEV3Bw08DsQ4AGQjOoAR0g2GfDT1ap636Gn2qtCAKlEQ7Dn
         TBiKoaZIKc4GpXxd3CSA4iX3ngSgUOf/zYO/GDbWhPCmDFp+TjK5RO/RSaHyzp3EAgnD
         kK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAv6kaLdFM1yAm0tEeMAhl7LwBGMxZyTyDaiAm5YGYVaI4kryXHrlXai8+BhMUsqLqA0pKMUON+6RSPOk3/uVEZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2EvoKZ/IAM5hnnM3GpcVYTW91dji/Do0leLG1/kiMBdmjYu/R
	DJDTCZlmxKgGBCWvKri6n1hzqOFYZYkp2enyL++G6DlXETHVPub0AeI5/SwpNo6QteM=
X-Gm-Gg: ASbGncsSZxp7BZuVpZWq4MYtQgewDzVhlol5nabDk3fOzmZBYI797pxzrtctoDyanBS
	+0+dgmHcxCV+rGpnsIvgUmFkp1JkWvmbIJbYRu4rn1TOC8zT1SfGLOEYoVig9VmJor7ppvoig3o
	OKRKxHN5JUS7OZzFb1dUzqk2++zFtk3I57XMak1tWwUAkEbiiWyTT5VnkGu308dbsrqOaRGAzuW
	6z5EZtmT7R60/2NTAnF7OudIpm4TwKxuyWzyZf4VzwKC9Zek7R6ZP3HoxJIhIoyOOMRfkifH2Ek
	kZLKgpJlJVbilwX0el5K5sim6vlY3m7nmERdnn0ErhdSCmbVTrF/5IPaTVbq6LE8rLiwPSvs8JB
	HTn/nv/pbr1VpcmwoWzpdpzy9iJms7Lenl8ZKaU7x2DMQ
X-Google-Smtp-Source: AGHT+IGXL1lC6sfR6puzIfYw5N3tfqCgjfuu9nQRbjgZ453UE5FzV7MG4pX6BoUszCm7i8a3ZjXp9w==
X-Received: by 2002:a17:906:c113:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-b04b16e17ffmr664688966b.9.1757440897721;
        Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e899sm26294666b.64.2025.09.09.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts for v6.18
Date: Tue,  9 Sep 2025 20:01:27 +0200
Message-ID: <20250909180127.99783-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
References: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=lPSneZP6QA4IVA2DA2vcr6ck9xWg1uRXp8PmH5pXh0g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowGt6T0IuM1YHzvBZgMmsxOPoA4RqAtH4l9R+s
 O/+YUMZ7M2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBregAKCRDBN2bmhouD
 13ukD/9SHoOx8xFBNg3/qjAVgkV/PKibiiWFgSvp6djzxC911MYrbS7OtoTWqyhX0xK0iyHuOW7
 PN8neHL723EiARZT2emcAKewRCoVR+JIpupio/HkHlJB6y5vbgjg2IenEfimryx1cOrMNfqZQ+I
 cNO/zF9Ju65IZy3iewiWmkDa+fU3bmvaghQAFUn06v9pwFskOwx175V59C8dhz0esy0AzJ4WOle
 CynzK3kMyxW0zgMCfY0VJlb1tHLT5L3aKshyCcMyWobfXTYUEtrgMg61ixGjB5+N0mzpfsBXAIl
 RogLQahDUlFbZznXU9t2i+3p95Itak+WQIBELc+jNYF6nQ3sPzbnbrqN+APvTbzk5wGb7Qxda68
 YA7TQzvqUOy49Fs3M96g2MNNXPMAklgxHapdg/vZfpUPUUcANjvQUt0NAVSh1SfeiR7iJ6+XyCc
 ZPN1xATGm49wV0tIklKkRCCumCv7bcL+8N7uLz5UO/47GrBVJC2iKUxxSWs+mqzVczxOwqz7/y+
 mwDLOiqF44cEj8+rYp4ZVPV1knxExrSErXOhIFKAZabB6EEaJ/L/RLpMs7/6NZTAhFKbF832zDp
 soWki6uSTE8O+5IY83+E8U9FPyZM7SedwJ+wVqxLn2RE675/djB6hWgnzx7u4RDJ0Auo4oHsWdJ f9vWGBZswpSDS7g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.18

for you to fetch changes up to 44b0a8e433aaad8aac51593a052f043aeb9a18d1:

  arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers (2025-09-07 11:13:06 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.18

1. Exynos850 e850 board: Enable Ethernet.

2. Exynos990: Enable watchdog and USB, add more clock controllers.

3. Exynos2200: Switch to 32-bit address space for blocks, because all
   peripherals fit there.  Add remaining serial engine (USI) nodes
   (serial, I2C).

4. New Artpec ARTPEC-8 SoC with board. That's a design from Samsung,
   sharing all basic blocks with other Samsung SoCs (busses, clock
   controllers, pin controllers, PCIe, USB) and having media/video
   related blocks from Axis.

   Only basic support is added here: few clock controllers, pin
   controller and UART.

5. Several cleanups.

----------------------------------------------------------------
Denzeel Oliva (1):
      arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers

Igor Belwon (5):
      arm64: dts: exynos990: Enable watchdog timer
      arm64: dts: exynos990: Add USB nodes
      arm64: dts: exynos990-x1s-common: Enable USB
      arm64: dts: exynos990-c1s: Enable USB
      arm64: dts: exynos990-r8s: Enable USB

Ivaylo Ivanov (4):
      arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
      arm64: dts: exynos2200: use 32-bit address space for /soc
      arm64: dts: exynos2200: increase the size of all syscons
      arm64: dts: exynos2200: define all usi nodes

Krzysztof Kozlowski (5):
      arm64: dts: exynos5433: Add default GIC address cells
      arm64: dts: google: gs101: Add default GIC address cells
      arm64: dts: fsd: Add default GIC address cells
      arm64: dts: exynos2200: Add default GIC address cells
      arm64: dts: exynos8895: Minor whitespace cleanup

Ravi Patel (1):
      dt-bindings: arm: Convert Axis board/soc bindings to json-schema

Sam Protsenko (1):
      arm64: dts: exynos: Add Ethernet node for E850-96 board

SeonGu Kang (1):
      arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

SungMin Park (2):
      dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
      arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support

 Documentation/devicetree/bindings/arm/axis.txt     |   13 -
 Documentation/devicetree/bindings/arm/axis.yaml    |   36 +
 MAINTAINERS                                        |   12 +
 arch/arm64/Kconfig.platforms                       |    7 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/axis/Makefile           |    4 +
 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h   |   36 +
 .../arm64/boot/dts/exynos/axis/artpec8-grizzly.dts |   35 +
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi      |  120 ++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  244 ++++
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1434 +++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |   15 +
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   16 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   16 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   16 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   77 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    1 +
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |    1 +
 21 files changed, 2038 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
