Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F403F1ABB;
	Thu,  6 Aug 2026 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004770; cv=none; b=g5vGxmrAX5pfyBvyPM/akIXp55GQdIuIQ/LKkDCpfaJkC7+6RkxPVkxE2yXdbuDJareaP+xezfTmWvkgVko9SjpoOW2Wrhi3BTkZ4QhLS7HqiVODsdjB5wBrm3RZm8cKs5Hv1PQFye8Nx48MdCx62q/Detg9QU3CKZOeyomXKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004770; c=relaxed/simple;
	bh=XIjQSTyJ3i2AYQ14shatiDHanfcsjL3lf5TYzyx/VeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0NxdNU1GoL+iVOXY6NyEIAbN3XqJLB80MMOvtYdQAul93uODvUy6fr+X2iVIoR6S46T4KHeT9HKGeLafmmCHLA14k/crjFAWk43B7WkBCCCFNK4oRu/vt68VCcZch5iUNcoxHCCOJXPneZWQME498kmE6Yz2aKl9brzEKflQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPULdNV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPULdNV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310F41F000E9;
	Thu,  6 Aug 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004758;
	bh=HPl8QuKx+Jv94jkEyDtUph3ENaTBTfkBrFMm38p73Xo=;
	h=From:To:Cc:Subject:Date;
	b=UPULdNV/tkKMuBupcAFShqET84NWg4lZyeVVSylwYn985jSKQ7k6UAr2KRxx+o5VM
	 w1Uglcgug0W4bT3B1SxrupkImizao3BWKohFZDiBDrwNM7SjAsL94L4j7pU7DtCfed
	 PUkD6AjbRhKTYo6f9XVD/1Vh8zKK91jGtNxJao3m0sVkypbrQEzD/R3OiS7UCcH83D
	 +FbCsJpd24nLcurKNju6xQ+a5eTAzMJB1fw8vw0ObJdorIzu8jp4Utk8Gw9tVZiD0w
	 ZH0QPzUiHPCCk+ZtPuedAH7+T9J6KdYiQ1i6B8EXBT+x2J4FD5dCrdWR3MABV4K3sY
	 60J7wUF7/LAag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] arm64: dts: cleanups for v7.3
Date: Thu,  6 Aug 2026 10:25:48 +0200
Message-ID: <20260806082549.349249-3-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=krzk@kernel.org; h=from:subject; bh=XIjQSTyJ3i2AYQ14shatiDHanfcsjL3lf5TYzyx/VeQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEUNt9vPQkjHsm0A6T8Dcz9y7+ktADjmzgQLG 7AyKzMWenqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRFDQAKCRDBN2bmhouD 1+fwD/98J36rBBkO5RY/CGRI3Era+F6QD26hWR9+2yIJbJW4Mn2oywL3VmxH+eG+PzLtnUUnOrn ROuEkYdAOtSj5HqDsnoxQG7/2frDrHfIMkxbQsDTdXrZTDdcEudgDe6VztUnXpm3snj93A3r6vY z/4HfVXTpEhp3xgBANJ+ojO+kYkOJvBK47590xht7Jo7DZ+gYDrXRJFRK28FrpJkG6syExLaRxP CJmD0lpAjanbnBjmFdM/MrSlYt432WVVhdLtB/vR2QH7cu+bk/5YGvuKm5qIM75VVhUJOegghEr SThCs1oQC9lVdWz0q+P24wT6VP9//kLqcM+HTemj1LhdSti6CW+cBTNTPTpIqQR32RI8wqisnHU BuPLpOF0Wdcn7tr0dm11cz1IkM+qC78bkV6erGZ7X/vTD94Pa9q5X/oy1a2T/qpJVsTUVgDB74V rtVUKBXcbElfGo8S5CzHaQxkfdpY1bIvJLl12J9WpUQcpZRyJsaYaiZYvkSF+vvsepqd6Yc0wdQ subUyU6+UCgNWLyjx1ofangESX1I2mG0Tfuh9ETQFojz7GXcsQ3rh3FooefV5/moh2U0jN9H+/7 /uiDW6zVF8MOYu8xXVaNtvf1ou3aiM21/0BAnFuul+hvRP9xHAOuis0Lar5kdAKFazgqiEIncQc P28H2sZrySX4HXw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

Various DTS cleanups touching several platforms

Best regards,
Krzysztof


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-7.3

for you to fetch changes up to 7c78d6fa9aec67a72a498cda5cdbaced890cb038:

  arm64: dts: Correct white-space style (2026-08-04 08:10:49 +0200)

----------------------------------------------------------------
Minor improvements in arm64 DTS for v7.3

Several non-functional (white-space and style) changes to match with DTS
coding style as reported by recent dt-check-style tool.  Goal is to get
to no `dt-check-style --mode strict` warnings over time.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: amd: seattle: Remove useless clocks DTSI include
      arm64: dts: amd: seattle: Remove useless xgbe DTSI include
      arm64: dts: Correct white-space style

 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts   | 78 +++++++++++++++++++-
 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi      | 43 -----------
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi       | 36 +++++++++-
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi    | 84 ----------------------
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  2 +-
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |  2 +-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  2 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |  2 +-
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |  2 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |  4 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  2 +-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  2 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  4 +-
 arch/arm64/boot/dts/xilinx/versal-net.dtsi         |  4 +-
 17 files changed, 128 insertions(+), 145 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
