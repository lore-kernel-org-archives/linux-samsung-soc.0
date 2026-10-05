Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24A25B08E;
	Mon,  5 Oct 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195544; cv=none; b=U9ZjCggQ5rBtHKJQQQH9vZt6W5A98+2pXyFWEEzxQV4MYGA/6Yeiud9NKwU7R20wEMNe/OM8BX70tkezFcFSZH7+nXnmNTqNujY/2MDX6dDW4jOIKp6LGXpTcwza3GfM4c15zUtdTHQjDFN5t7v+wryTWw0yBhvj6LXKez3uQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195544; c=relaxed/simple;
	bh=ni6oVuqL8P0j2f132xZcCrMzmrIkFVC8sbgHtLofdV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpyS3jc/5si0GRAYCLfCRUH+dJ1Hn+JP78FcsK1F2LMncBr5DmZmHE4QN7UBxrzrQEtN/R6ykqoNn70oLLhKRPbZtuoFFC1n2D23E410pxj1VnIecFLoSIIp+McPs5JFF1Bb0Dswn7WfNCxRfLYCsCLnRZCmpa2poAv4F/nERU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAg4CSY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAg4CSY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646C81F00899;
	Mon,  5 Oct 2026 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195543;
	bh=N2zyOcfzlZ960YepIjOmi+MAl7sJytSI8WiZwfw/tvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CAg4CSY+/oGaUQiqZgqOH0WCm1eAgDQyfK3ziTitLoeIM6M8UzaKm/aV4nT3dtuuC
	 gYDaAxSFdc/tvivZgdS7yPWTWDFANjgD/e794tyCpr5XWLHzgzHGOcHFm7bapD0KRD
	 k6Xbwaw4uo45rPsdOpo3WwmTxbvmzDTaVbJes62aOCJhnUj8t9oo1Lz9SAef4Wc1cT
	 db0xpuNu02iuuxcO7YB+iNfWavSIUzQ6DZK/RqXKIgdn7Kvuehk2Ce7w4jrrgRWWPZ
	 fXmYIuYhqLSTYPMob87jiQJMt5vq/pjXJ1jg1GjaRm9wHyPTlCpPlMHWKdwCPgxkiG
	 bY1erMxpc4brA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/4] ARM: dts: samsung: for v7.4
Date: Mon,  5 Oct 2026 12:18:46 +0200
Message-ID: <20261005101845.34752-7-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
References: <20261005101845.34752-5-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=krzk@kernel.org; h=from:subject; bh=ni6oVuqL8P0j2f132xZcCrMzmrIkFVC8sbgHtLofdV4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3mHzihfkTnL+YZmHOF2J181E0N3vcvsWpLwe sznDRCY766JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5hwAKCRDBN2bmhouD 146mEACK2xkIcNSzsC/toWThjk3ygKaVqjb1jTeNHLN7hiOTIPXos2OlXtdX6C+38udIAjg1J5+ 2nWo+fwqK8zJFw7bZd/WkQw1iWq+ODoV3CDRU+ZcqtGE1N6t0d0snirFXoiFb2XU7LW/LSoLekV 2YItkbzj5iheeYnmg5H3kfg1OEVyku82Q+0MJHvbsOegVZ79M3ybcUqYLbe19pYszr9ghtmfOJ6 yynsCOEfkix2B6ENFRJyuNrD0gPZn8EUud2FmXsPLVLQAweid35dgRImqqcKRvDbZHeFBRD16+b a0EylL2dMp2p3hnKmq2bQ7uCB3I2alTDijkFs47dFWlk4IpKktU3EWtqy8klJM1YckXMOHsD4MD R0JWfSAVAMLDSlQER0cjBu8hCQIlPedyFygyqONj9KoCF3NrfKnF7IRYpmEuwBCc/gIxsxjKDvB g7md2JfneZ43n3UJsf6JdM+2t0aVZxK8oBkRww8H71nN3PMS4bod98tqbRcYEXHLJu0fX1oBjAL k1pkd1aS6JWc7pm0wpb0COiyP1bznIUdjj+E3XPuZekrjGytxv9yKWRh5oShAPWaD7gMuVUFYDW neW8fafdSmyBE3tCc+cN1qAvn/92i8EILy/ULZyiV1KEtqksXDAsUZltcLGWSQCKVS4GYfE3n7e xriLX3/ORzovkBg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.4

for you to fetch changes up to b47faa6004d86ade16b90d24fa1e1f179e6f7230:

  ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes (2026-09-24 22:17:10 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.4

1. Cleanup of clock-frequency property in favor of assigned-clock-rates.
2. Fix bandwidth of Bluetooth on Exynos4210-based boards.

----------------------------------------------------------------
Laurent Pinchart (2):
      ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
      ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node

Paul Cercueil (1):
      ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 9 ++++++++-
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 5 +++++
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 5 +++++
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 5 ++++-
 4 files changed, 22 insertions(+), 2 deletions(-)
