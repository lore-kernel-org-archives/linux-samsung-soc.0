Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12323B63D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088536; cv=none; b=H0tPGCaZHHWn0LGRdskuaGtJFrxdafWhjBbV8iMVlarcEjAZr437OpRdFn9olsfJ6knGavl22rZCSgK3OPmIdjvz3x3GZwfNpW4b8LW/MVy2o+X1PxVjU3gfT3UGfm0LnjJ+7kZ0Tq9+bghC+IzAWRIvhwHKmOlbyDMEElHrcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088536; c=relaxed/simple;
	bh=OIoxzz9nTa1KEMKLgwavRzStSsKZ+ayPWesJQHTnF6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8HnGfHWQkuwJ8Vs0ApXOEbHft3MQmJvytE9bhkUQZOocy9kmWuuRtx7NGCYZ1GU6UBmi3rCMCYLItWo9lq9fJHp3uovKgBg++OJLI4qUvtE0ABa37Ax2JVRMOpIBbNgTPI3AQxG5ydyaomCzvDmfzcjZxgAxvnnvqnOw69wOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5Oy7q9I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5Oy7q9I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453442d3a15so326025e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088532; x=1752693332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=d5Oy7q9Ixye7f2ZV53TM0tI9Iq0JqhbpCPQzLT3uwEmEJnOq3MtStwYR4p3F0/jfYm
         zSKgV6YdwTDgBm6kDh5imfbcvgRwa5Dorqbknq/n86AuUQZOcqH7MKMkhbe/i9zZZHUD
         awHdkIGxo4FfqkEDEpoC/2cWvAUzEmlIkg3T2YA0gHuYFVnzxWetwRE7H24nZo8utjLF
         ojeHWIpRTKdHes4IRmyi7PHSK1aWfJkbBYj6dDck+sqm2numNrSYmomopegHjmwtN71H
         iJbC0sYUuFxhUQ5ohlPq8NHoex2av3xPVOBtnjPkthYesaCdq8JrYMCjdK+AuGKpT4vO
         +F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088532; x=1752693332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=EDIbVvKMcBnVOIL43o9pZ4R2UI35RAkW98YsieamBp5VvLEafaJZv+J5u0oqshb5Fi
         FpRQSYbAbi8xsVwcbSmi9JciNZoZ4eDsSvXSrR+uu/Ssmi++yRg5RADgzPgg8MLyjYNM
         uStmMrIbXA/MmEhnYV4gguhT0wMNwiuXuHR7c3calYd25H0ThQiJEFLHd9etYKKCNGBs
         BA/LFqQ61WaAN1Y9zFKlYa55SnTgzamISLZMcB6FecWU6pDOFsdLAICubA24iRpv7FMa
         QR6M/ZD4BLPT0HxsbEFgYuR9KtzDBmGDWhD2MYF3cKwhUHCY/7Mx4gMKyKcSZqbnw+3d
         VKVw==
X-Forwarded-Encrypted: i=1; AJvYcCXULgzVNudFLgZAH7yXLK8VJSU5IBxY+nTzWDuQGcbNLvaMkPnQUKGeHO5qkeKstGlCvQ5rAwcj2i0oLVDWRKYtCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JAZeRGcm9GdEFDkAwEzhWzgghc9nKLfs7wxJKh9IfCIazg6a
	sQCNLMB8npNcnWZehC7ehMTcvxanY59hoApWOniaXt30wrm5iU28qBgXJ5jJKAZ5oTk=
X-Gm-Gg: ASbGncs7e1WDRmRGruP26pdk+SFoCTE4ngp4m5WxYRbRuxOLXYDOkFE3Iu/6u7W1s3A
	8Bz+Q5u0jz1G6eTWZKdL1SlaAK3yJ/jYUMoZC3Em19UWCKIGsfs3J+Kr74Sp/j26Aq79onBQFz/
	Mj1c+kdmY4DiUeP6bokq4/eWtKpY02pezCzKtuyx08iMZEXIUX3iYOqtNlLUhagWfisBicho8R4
	x3akvoStXd1Y30VP90GqiXI3UHEYSSIMYKLnKlP7Sc3DHV+CIUNgOaQsk2gT9rtHZWXufVnMvOH
	5lttjMkbyE1oEBGAG+qRjK3G5TA+46ZOmZFqA5niyAjDmg1ur3pQWqmwgkXneYJ2ToQCrZf3SHM
	=
X-Google-Smtp-Source: AGHT+IGhNA++7xZg6xgr84ItwYyhelF2UwYcUcnBnnifNfCSp2rTw7/vvTd7m7A27LjCuZliDTQLRQ==
X-Received: by 2002:a05:6000:1ace:b0:3a6:d256:c5db with SMTP id ffacd0b85a97d-3b5e4543f00mr1268338f8f.13.1752088532254;
        Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
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
Subject: [GIT PULL 3/3] arm64: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:22 +0200
Message-ID: <20250709191523.171359-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4153; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OIoxzz9nTa1KEMKLgwavRzStSsKZ+ayPWesJQHTnF6s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/NKL27EF4KQkesT2MoJWrhmPLTsMsLxQTV9
 Ys2GZMKRgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zQAKCRDBN2bmhouD
 15fBEACHFwozinLrM6K5N5e/2mYfNzEFTl+V7ougAttEa+lWvR7tcmGlIPgGwtJ7KvaEmJZRgQi
 JWz9dMlXIRsxSVVQFeJpZfYs4gSA2OD/3Bxx4Jl97R+SD3owvFjs257RvrUivPKozjHKw66nOmf
 Y+qxXHUWEecUo47WKYlPvO49sYYa9oJVrNehrN/XyKoVvrsG7LnKQZLH6bxA+0LS672gz+CSBsS
 ZNFwPTKMs6AzgODHnsbjNmprq88Zn3UVCn6o30ovvFtPQ6VqHraX8eDpzhqtX4sM/Ohm3U2iXib
 W4hgDwkVNWwKSjDlW880VqRJmlPasLUISOcOVN7M04vuBNDDwoIa8qYb6ohBRdJq04DMVXwXuZ/
 8esRKXWR2lwag8K+8dutaP4KELdh/LZYZZU6rfIK/jwxkIIp1XnlPkpHMSH+thYcPSh5Os3L+mM
 aCw/qK1SXGohHc3jXPKwQ3ZVXE7Wgs25906EepQnfFxZx/fClmnaQmvkwWnEDvlsRUxqB64hmlO
 Horjnau8jTBMt+ftOp8ht88yQdEXvZxOkYSaW5F55kuH2zqCRwvaF5v7xksl4d1mIIsp8KPBQrK
 IMB6wjl5kYn1h2CL23F/TDg+uCV1M9PO0vWORqdxLV5sxjxKEwvq9AC0gIga5TOpvtAyJoXLWm5 IIYTqo/9PlzLIEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17

for you to fetch changes up to 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17

1. New SoC - Exynos2200 SoC - with basic nodes, pin controllers,
   clock controllers and initial USB support.  Add board using it:
   Samsung Galaxy S22+ (SM-S906B), called G0S.

2. ExynosAutov920: Add CMU_HSI2 clock controller, remaining SPI nodes

3. Google GS101:
   - Prepare to switching to architected timer, instead of Exynos MCT as
     the primary one.
   - Add secondary Maxim MAX77759 PMIC to Pixel boards, managing USB Type-C and
     charger.
   - Add incomplete description of the primary Samsung S2MPG10 PMIC.
     Several bits, like regulators, are still missing, though.
   - Add also secondary reboot-mode, via MAX77759 NVMEM.
   - Switch the primary (SoC) reboot handler to Google specific
     google,gs101-reboot which gives additional GS101 features (cold and
     warm reboots).
     This change will affect other users of this DTS, but to our
     knowledge there is only Android, from which this change originates.

4. Exynos7870:
   - Fix speed problems in USB gadget mode.
   - Correct memory map to avoid crashes due to secure world.

----------------------------------------------------------------
André Draszik (5):
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DT node for all SPI ports

Ivaylo Ivanov (4):
      dt-bindings: arm: samsung: document g0s board binding
      arm64: dts: exynos: add initial support for exynos2200 SoC
      arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      MAINTAINERS: add entry for Samsung Exynos2200 SoC

Kaustabh Chakraborty (3):
      arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
      arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
      arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount

Krzysztof Kozlowski (1):
      arm64: dts: exynos5433: Align i2c-gpio node names with dtschema

Peter Griffin (1):
      arm64: dts: exynos: gs101: ufs: add dma-coherent property

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |  169 ++
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 1765 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  561 +++++++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |    1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  378 +++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   96 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   10 +-
 13 files changed, 2996 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
