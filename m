Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219343F7884;
	Thu,  6 Aug 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004772; cv=none; b=LRr/OY8m/ysSD/4yTeI+WbzfT+o9GOl8y5XF1vqC5CdbjYQpLIvQPysMRRdfFJ5fICpf16CDu8z/ayQDPyMlLVyqS30+BOJrzs+ZjS8TkEzFStpKPzlhbDDJznmtt1PVxoTdkdeG0OUVSuL381P4UvwQuUT/Ne7xNpaEK3o08YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004772; c=relaxed/simple;
	bh=mIZ45LDE47L2ERnudXZd0THmCJ2DVChCTILjVaS5HMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFQHvF1j/yi8Bpdvt5llcD+zB+kAReBI607ovElDf5KARhZ13w4FvJpdnELF5x+6NoOgx1mVlJpv4nOFRazueMRnDySXCxnviHLSRsap3MALQR4xc7qsVUQzMn7FwAzBbMuv5iktWIWTDyzAyiEztENlBNq5/TzRqwTlc6dG7zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWHaDXLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWHaDXLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383AC1F00A3A;
	Thu,  6 Aug 2026 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004761;
	bh=dAvLULbPSSQvTSKfGB+nlBjLTES/QZ4bBVW89Ko6iuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HWHaDXLOdGjOzvl6S4AwG7u5nFjCsg6gzpd4wEchZG56sMOrjVMOcOx5e20Go6yAN
	 nbwHoI0EF34jEUY7v5OmaBvZN5RHMfQOiP9W8Esl2sg11njFZp70p/kYavUg6FPIu+
	 qageyNElaaCQAG30mXbF7wtRvCYhlvpxUWGAGsdlwq33NyJUr2ahKVyrU1YDQTgOS9
	 aEbeySSGGfGe3B00rMorHEp6dYo0CfOdPUTPAXD6s9tn6Ul5FqjzXrOO/RQJRTtAao
	 kOIYGrNJv41MXsk/zs/2TQv5/hSj/BFajYZHLoN9SJt0cOOFKyj82mhqKCW+wPZ/QN
	 OvpsPx7ve99nw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: cleanups for v7.3
Date: Thu,  6 Aug 2026 10:25:49 +0200
Message-ID: <20260806082549.349249-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806082549.349249-3-krzk@kernel.org>
References: <20260806082549.349249-3-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2556; i=krzk@kernel.org; h=from:subject; bh=mIZ45LDE47L2ERnudXZd0THmCJ2DVChCTILjVaS5HMk=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEUOy2Lo1CfNWgs5z/tBy8eTLpy4wYNGHrVjB wfkgReFlRmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRFDgAKCRDBN2bmhouD 1w7LD/4gta+NZmNUozA6ElNqjQ4WW2tDvVBs/PmdRbevJscXWcc9Z5X9J4iDgichSKTu6fRbSoN FMbrNKejSwTRoLkncZEDEAiDZ/7zUufPyOZhCP3h9RzXCU/PtrxqZQZn39734slznRUlBNHs7j4 0kDm6mJGbRv9qk//EUiPw6R6HF3exUBD9/sYAXu1h1IBUDgumFT6djuHfT6+yNHNW+NEyiC6vpG WzFVIYJTQMlltYYBid7Xqsg8T1ZPUN9PfmQYNl+BE6UElujG2cZIThyJxsMF/+hBPPpnviCsICL Gkz46PrbaAFyQQ4tkasaSjvkbNTVgL1mzB9/uboxzYW5qDnQxmzhvi6Mgb9q24E37dr/QgWIk8h eBKo/Br1xTEf0o5WbtWew8rhhknz1YcpN4D6bDSc8Ix1ygxYiakdfVAOP5BvNFBO1sPZMsyjYkk OWR9Nq+PYaiDxArEkLU+STeJn5bhfXdomqWIdVPPH3hA7dxyI485QHXhn52OFwDSpqVXpyo2jMo nOMOIDrIbq6TRa520DPybUylflA8sRca2QAIv0e7ftMvnVZM9jt/P0z9WRvNLTPn0zh4be9kJ// 2y4y9BqdXfqZZfny/drxxb+lqfVsqSoaRY90pwa6XnIlq9ApH+ap72tBwTyv54AvhiiB3WAHdao 7rDQS/cW+qzHGsg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-7.3

for you to fetch changes up to e2b3acf8c227beda488f00d06f1266f83b9b5c08:

  ARM: dts: Correct white-space style (2026-08-04 08:10:31 +0200)

----------------------------------------------------------------
Minor improvements in DTS for v7.3

Several non-functional (white-space and style) changes to match with DTS
coding style as reported by recent dt-check-style tool.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: sigmastar: Correct indentation
      ARM: dts: arm: Correct indentation
      ARM: dts: microchip: at91: Correct indentation
      ARM: dts: vt8500: Correct indentation
      ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
      ARM: dts: Correct white-space style

 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |   6 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   4 +-
 arch/arm/boot/dts/armv7-m.dtsi                     |   2 +-
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |   2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts      |   4 +-
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts    |   8 +-
 .../boot/dts/microchip/at91-kizbox3_common.dtsi    |   2 +-
 .../boot/dts/microchip/at91-sama5d27_som1_ek.dts   |   8 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   8 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |   2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts    |   2 +-
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |   2 +-
 arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi  |  20 ++--
 arch/arm/boot/dts/st/stih407-family.dtsi           |   2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   4 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   8 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               | 104 ++++++++++-----------
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |  54 +++++------
 arch/arm/boot/dts/xilinx/zynq-cc108.dts            |   4 +-
 23 files changed, 129 insertions(+), 129 deletions(-)
