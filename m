Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8153BB674;
	Thu,  6 Aug 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004355; cv=none; b=hqXfo4PKoURgLNPa7nWU8iY/y0pUIZzlT8KGwPSrh77RDynXazH4157BwBh4oUJU/cMF8tjhUjGoX5BFg52tXCSqQ93jUpWZVg3QWeNwrGVNu+Z9pS2/f3CBNxBoHS5dwyczAz8FaCx1qV0GWgyMch896ZT1FGgPz3MTbrUQ8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004355; c=relaxed/simple;
	bh=XPsFn2eE3sKXbnQScOVUfxElOUzFv7hsnuWT25srH+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F00lTi0dxjAXFl5/qoUvU1lIrZj9knLqUDEcXZahujMla7NZusiy/uxWq/yyn+5/0es5GhFhWpkqXlbgLZfIwUiC2bNNIv1JWEn1iB5hHDKFY0MtspYg3JSHVA1GIgpcaL/P1uU1gYqBAG4t97hFktEgG+qnPqvcK8UFuUjwdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdR1aTtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdR1aTtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F141F000E9;
	Thu,  6 Aug 2026 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004354;
	bh=JVezxqT7pqPq8EjOwQoBK9NfsDXNVMbK3A6RkO/5H1c=;
	h=From:To:Cc:Subject:Date;
	b=CdR1aTtP/1803WqHAZuKdxq+7Ha+xJ20uBS36BW0TuN+4qCXfa3yaXr6nB5e0UH3r
	 g2MO5N3KuOFfnOU0Ti2SbK6CEjMyzwdG7NRaUVwKI3CI0n1c6Z4vtFctcEiHG+CUnz
	 3SAWtfEZ9FS0hgf7XxAwIsREc5BZ1xAY31wsP3Wdiixx/aEbIHZYDKZ2cN+NFUCuut
	 fqMIp1MV/I568ijlZZDheZEJ3zrDH3QnjjZtvs5k54lOE9TArGGyPXPvlKQFkfz/qG
	 TflFuTRlQ6TvsO6j4dRKxHluhsuuRpLydsztHAbkOmGEHkB8GioUuTH27Uhj1xuVnp
	 O397pIPmwQV1A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] arm64: dts: samsung: for v7.3, part two
Date: Thu,  6 Aug 2026 10:19:01 +0200
Message-ID: <20260806081903.165005-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3994; i=krzk@kernel.org; h=from:subject; bh=XPsFn2eE3sKXbnQScOVUfxElOUzFv7hsnuWT25srH+s=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEN3XIQVrSUEmRpJzGZp2Bwa3LUbB7XLJBk33 oQk+Jk+XpOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRDdwAKCRDBN2bmhouD 19rmD/9hEsO+IYIkeXBnej0YSFORBPlW8+XAGmiKZTZv27+16iSi3UOTAgYhYm/wHpE02nJVzei 1fziN65htHuW64eIkp3jAjJ4dxRjhialHrAZwMxEhcNXiTT+IQQ2EcpwQ0sMdTUSTXgucMZ3Yfd A7A9KNhm4D10g5AeWA+5awVidVmyBMI3sD63KAxh/SIfQW4p3gt4rm6v4VHi5OK0NRXlLTv7x26 SR8rvutFbpiP/n6nBXLqZcw0UaEv1mDQ+yZD2Pwqiyyfzjhi3fjRyMrMpqqRZuMkDSc86mavGib YSbMVZEnU+bS3Oy8H9bNpMIaarOKaX06gNbJVWnsIdCUyIYDpI9oOufFJOjoLVKtNlReHfHqe74 YvjsgiPrfvYo8UQupSPGZeBVhm5q2oye1dCU1YDF8dpehQVbS4oVoyoTFzC7wc9ltOmK0gY8/g+ DDaDXwE9OE0XCLH+DwXgiDFZhti2fhiGhcnKt3KbaGAiIqucFVodAaoFxI55m9WH2POnn7UAU3P 6+0cURfC8SrZuIEAds40hB5J3V1tuXxe1+s6k3Pr6aDKNSKvCqyuAzSOFp9IV8LQWCRnBOb3eO2 RFv8bxNqODulRi8fFbACRZgVibms0x2ox6ajfk4XKMCn1YgjWqHduCOG+VTa6D5rmDjX3AXSFjr 0q8L8eTLU0oxxEA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

On top of the previous pull request.

Best regards,
Krzysztof


The following changes since commit a87d503a0ab077b0d9892290ab7dbec29f922eb1:

  MAINTAINERS: Add entry for Samsung Exynos8855 SoC (2026-07-13 09:20:24 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.3-2

for you to fetch changes up to db23b4aab4252f793d9fa97dc5d6f8d99c5e8e4b:

  arm64: dts: exynos: Correct white-space style (2026-08-04 08:07:12 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v7.3, part two

Several non-functional (white-space and style) changes to match with DTS
coding style as reported by recent dt-check-style tool.  Goal is to get
to no `dt-check-style --mode strict` warnings over time.

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines
      arm64: dts: exynos: Correct white-space style

 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 570 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  58 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  47 +-
 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi |   2 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  86 +++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  64 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   2 +
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi      |   8 +-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  81 ++-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 121 +++--
 37 files changed, 1170 insertions(+), 411 deletions(-)
