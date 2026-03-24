Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED93D6471;
	Tue, 24 Mar 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357127; cv=none; b=sqfQAbt5zJNjMddz0WDmLAJXK8NqsZmS/unRdfaA97Bbm2NtEUtieUxsfc8ppUIA9sUNYULtnDE//SGqT5zDQrhNdDHgoIxdWRG74TTiOU9D7Z/g12lEo9qY/g9zdIjRu2R5Grpj9o4q9qjXfcDvwGzsOAILLSJpx9Uxnqj6p78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357127; c=relaxed/simple;
	bh=biCbtIRU481vCPJLX3AdNKMbwjIIiNq0L/qKcYQg0R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8Mlz73HsCK3Ij0HidUaxqxuQv9LbPf7Zv/fwLJsElCb2nHTN8yJuwkz30gMZ7rgNNqMap7UKmMWfV0Ay/zuC6v1GeBGtffFaZJdjhNnIILKFsYRBdrdn1KqfJiEkVCeYM3z5mR7ogCHmj3XklKJwV7LPoT/dxg+b99EI2uEiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ke7DBhYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ke7DBhYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3901C2BC87;
	Tue, 24 Mar 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357126;
	bh=biCbtIRU481vCPJLX3AdNKMbwjIIiNq0L/qKcYQg0R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ke7DBhYf//PdOitW4Oj2ROQ9YA1YPdmip+dazPPi4x1nJGZmaUbG0iNUPSh/ZG4Kc
	 +kiwagq97YkMJAJzZ7Vf05ciEdLOdEvqsyVXaAkKSWuHvwH7ZWsUuudBsxZTeYtgfB
	 IBLtoyA+NR8kl3175K1vFycmcV+DRkNxOCUgNR0aUcZKlAhsBGKL7OpQtAmvuIXZLk
	 /yg/T11qha/t8YMbMw+UfnS96xknOCN1hasEC4Om/uaY3pVKXkK6H627NvLnupIhLK
	 0arMCM1IWvx+KsySfybccZnjayOb2MVsv164f14eitIP9SMNSfpyTc99pUKvGkoCNP
	 reV+/agSG+3ZA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/4] arm64: dts: samsung: dts for v7.1
Date: Tue, 24 Mar 2026 13:58:22 +0100
Message-ID: <20260324125821.59728-6-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
References: <20260324125821.59728-5-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4134; i=krzk@kernel.org; h=from:subject; bh=biCbtIRU481vCPJLX3AdNKMbwjIIiNq0L/qKcYQg0R4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwopunc29pPDPS/prVbKw4XmJJj4IQJV9zBFxP DarkVbIupeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKbgAKCRDBN2bmhouD 1wsaD/4n2NgBYTK1mA8Pdnleh6q9G3aO2pnsanUlbKuyQFvvBGTcv0G+bKrVlr+am+eijSyt4dc 4VWOniqfEyB9L65fLbo62tvwKg79Mx0wk7MVMRa/TV4FRXEq/beMivCBnqyHCYCm5DewTWLvJBm RMUVSiaA7P+Ubv4Le7SSW5igVMvyxdTmii0tV/xMP8kSkFnwtDOWPVxjekKpgx+d/SkWWG9bCrC MS9cRH1/W9v5TDDkzZn42NaxCgWSFh1r+mU3RDZhpw7okTXYLRqoF76hWfBIKu9JlAlruD1rgbi MHsn0ru5uFVcNmfTTPOvhKNXMySrJbZJC2HC2b+Y7eHlWKnJ1QW1Ed2slsqovFapv6wUEpFITXL RoCbJch7HPFe6itQYARuW+Z/pZrqeX09Ed3JnR8OSX4Cj9yw+ZECZApVZkmuxN9cV4Jv4EmDuwW dX7giejfnl4+ehZLnOa1pVVq/CGtZLsuQeLob3U9ZDuzGSLlYHGW0VJV2en//YgyjUWCCtRhTgI E38YReTlVqvl8jYCPmLbUjGIATisXxJlOKB6ydRlYGcKK69lZX6gZRw6uXwBdyJ2e1EA/lkgfuM H243K2G1hzDmroU6JdFrVPOkSXAmFOuyb74c21HJ+ExXp5nhp46sfw/+qihhcq/u+fro11rfFDK F6ELrIFfJWq9I5w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.1

for you to fetch changes up to 90f771a9745476a5e2b95b5efe225a943c090bb9:

  arm64: dts: exynos8895: Move I2C address/size-cells to DTSI (2026-03-10 17:04:20 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v7.1

1. Add initial support for Axis ARTPEC-9 SoC and Alfred board using it.
   Just like ARTPEC-8, this is a derivative of Samsung Exynos SoC made
   for Axis, sharing most or all of core SoC blocks with Samsung
   designs.

2. New boards: Exynos7870 based Samsung Galaxy J7 (2016) and Samsung
   Galaxy J5 (2017).

3. Google GS101 Pixel phone: describe all PMIC regulators and Maxim
   fuel-gauge.

4. ExynosAutov920: add G3D (GPU) clock controller (CMU).

----------------------------------------------------------------
Andras Sebok (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J5

André Draszik (2):
      arm64: dts: exynos: gs101-pixel: add all S2MPG1x regulators
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 fuel gauge

GyoungBo Min (1):
      dt-bindings: clock: Add ARTPEC-9 clock controller

Kaustabh Chakraborty (2):
      dt-bindings: arm: samsung: add compatible for samsung-j7xelte
      dt-bindings: arm: samsung: add compatible for samsung-j5y17lte

Krzysztof Kozlowski (3):
      arm64: dts: axis: artpec9: Fix missing soc unit address
      arm64: dts: exynos7870: Move I2C address/size-cells to DTSI
      arm64: dts: exynos8895: Move I2C address/size-cells to DTSI

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_G3D clock DT nodes

Ravi Patel (2):
      dt-bindings: arm: axis: Add ARTPEC-9 alfred board
      arm64: dts: axis: Add ARTPEC-9 Alfred board support

Rayan Marzouk (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 (2016)

SungMin Park (1):
      arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support

 Documentation/devicetree/bindings/arm/axis.yaml    |   6 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   2 +
 .../bindings/clock/axis,artpec9-clock.yaml         | 232 +++++++++
 arch/arm64/boot/dts/exynos/Makefile                |   2 +
 arch/arm64/boot/dts/exynos/axis/Makefile           |   3 +-
 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts |  36 ++
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi      | 115 +++++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       | 277 +++++++++++
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   9 -
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts | 523 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   6 -
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  | 494 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   9 -
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  48 ++
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 128 +++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  13 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  22 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 528 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  18 +
 include/dt-bindings/clock/axis,artpec9-clk.h       | 195 ++++++++
 21 files changed, 2640 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
