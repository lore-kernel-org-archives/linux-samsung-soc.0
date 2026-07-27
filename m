Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F33CAA3A;
	Mon, 27 Jul 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178856; cv=none; b=UcCtC8PyWgKaaAg1alZ4L7bjUImLm+k69ZA3YNtMA2xnw6XIC2fbA/0bXuM6px1A5Dbh0mFuqkppiMHmtnlQbQkOjEsgmnQLSKIhuX/W+w5N/MPRj0PTatjFOr6DttQvwHNtS66xP9f6xN6n1+dLP9x0fEGPAwnBh9F1fbXY9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178856; c=relaxed/simple;
	bh=8q/iUaeAAO3trLj7UgUpcehLnoLmuEJ+JikTuSLad8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEpD+SlV2vbiEspfg4aTZTnxVZQX7kFUSQ0lMRyWQUti+yDsClR/PXxUZkas9Hd/xiFOyNdsCXAikCF4yxt9OG6MW+ghcAQgVJ9jS7vXqIAPK9Pu9tnhrrYiUQHAfSv2M0thiZiC2U+Dc2ougDlIBNZwSXSCG1dpWUh8IkP+mik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWUh/KLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWUh/KLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7146E1F00A3D;
	Mon, 27 Jul 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785178826;
	bh=4iStQMNT3oznFv2kg8CejE5g27jqz5g151MZWuQusgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MWUh/KLAada8qqjoQQEa2lVBBSfTe6TleecU8ttk/TZqzeSwCEqkEl8ptjAa49ePI
	 mcOgVAW3VMkbMsErsFz5z7NkTeKhN0jumnYf03tOy9zIueoV9tOQaNqXsf0uqkC7kU
	 TATzGEItP/w/oiT6gpnikbK3uTxAPYYNZpZwJ0ZTdJw29t6h9GsLUaCdV8w8PFzrI+
	 k9owfenPmFTqLWW8qKS2Lt0slbULm5xXjl4RkXJUMRTFAjnR0fBu4jIlY3Ge7teqPR
	 p9XTkz9FFDegxGoxGnuBohVwGE59Zwkfgkz44t7qCmyM8CcXedi9234R+8BqBDMhkj
	 /fJQ1r4jXeY+w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] arm64: dts: samsung: for v7.3
Date: Mon, 27 Jul 2026 21:00:10 +0200
Message-ID: <20260727190010.404981-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727190010.404981-3-krzk@kernel.org>
References: <20260727190010.404981-3-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=krzk@kernel.org; h=from:subject; bh=8q/iUaeAAO3trLj7UgUpcehLnoLmuEJ+JikTuSLad8c=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ6q7bO19C4LuRrGTY2igQZCqfXKRyqIhOH1Kb w3HXyb1heyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamequwAKCRDBN2bmhouD 1/bcEACUgUJR7TT824i01H5LBaXzgsHJCP4z8nZTAiMdRp5UypbAjKizXmBnG8oYrTLNUE0V7Dw 5NEgkU6yxy6iEtHvukzb7CHorp/MFdlYQQeKFT22FqKna9FFpue/bKFSclqMpWF+lbGulsbow2L tUiWDkvGqj3daAh38z24Kj9zLgpxeuIb/ANUXN1t2ARfbd3rIcgThBD2NrupW3ahSUJOklwu0+1 BiZKa20dHR7a/JJdcUcrdbW9I+Dj80WRq0m+xQrpSZmb0NTd0qkr8cQi6hBRdtGJPuUfmfNDm5O V0tu3i7bUgj1AEIyqUnAdHAptaVghGD+HaKisBdtxBfQVodEl6qB2kwzmOzpiSyq8LtTuPx1lBx 180jytbc9SkCB5XsTGchfdhM+0zXO0rjBmTyvi1PsweyT3ol3C8XcObVEeeGcHsXQQ7xIuJBTES HpdEiCzwsTpVwhxr0FUF+AJUkSRh3TF2YgURBxQxvFri7bckO9Vo+0Tp7K6acCV/ph9hClHV+sw HCISoPaWbj2WXgf5ee8QROEnjI8YsZzft74Gd9kdaxhCcpq0rZqREHTQ7xL4lXnMQLOMaFZxfwA H2OLPRKITDZT2YANmzAUS1ZJwJC5HJ643Ot6AX/sECZJoCu6ucoLjLXJ4nuQvoibfnURbJHDMTa ZjX5JHKKXUGl3sQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.3

for you to fetch changes up to a87d503a0ab077b0d9892290ab7dbec29f922eb1:

  MAINTAINERS: Add entry for Samsung Exynos8855 SoC (2026-07-13 09:20:24 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v7.3

1. New SoC Exynos8855 (market naming: Exynos 1580) basic support with
   its SMDK development board.  That's a 8-core SoC, released in Q4
   2024.

2. ExynosAutov920: Add HSI0 syscon node.

----------------------------------------------------------------
Alim Akhtar (3):
      dt-binding: ARM: samsung: Add Samsung Exynos8855
      arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
      MAINTAINERS: Add entry for Samsung Exynos8855 SoC

Sanghoon Bae (1):
      arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY

 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi | 574 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts     |  31 ++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         | 204 ++++++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   6 +
 7 files changed, 829 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
