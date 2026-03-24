Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA413D566B;
	Tue, 24 Mar 2026 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357129; cv=none; b=WbvqVI8ulKfnkhk5PJ2cZHFUQAVvkufe7jfm/XbmBnpsUS9Il5ADNI4ebzbajY9VbAKnUDgCdKSvB2Jxoh8kK7WEWtgtGyWYllkrh1lxzmQY+mjSturFksouniNcCrkZUNHsSFxPDRINxVDObCSvolI4UJpISacxYgljK4dhDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357129; c=relaxed/simple;
	bh=MmcCA5Xn9PA62YuIE5jDTBc2W5syVFoV8J1qc1fPQns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5APF7Es1Z7a737ZkBLZkgS8PstAczs4HEUYpvpYG0LuqyVubW0SAm+to7VJUqKQtVd4UzXfR17/ZELjFAjYeLvuQVQcbcDFgaW20nAplIysoqTEtW57NvY6oEVhaUjkROf3eREmL/0g2jdOY9tKJNlk+/F4O08eV7jUpXOXBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNyjyfHg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNyjyfHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A078C2BCB2;
	Tue, 24 Mar 2026 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357128;
	bh=MmcCA5Xn9PA62YuIE5jDTBc2W5syVFoV8J1qc1fPQns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNyjyfHg1q9gc4LNo95m9wuvtIcvxoh+ZWwK7KzHBerV8X6xqtyDEgPcIct/gWhwk
	 Be0fr8PUgmMAFBHy1hV6zEycCaa8m/10Oxg6U5/yGOIscwmRfZBVtobcoOVIDrGHyk
	 lja863xoTCUyKTv8il7wD0hOcq4i2sJpaWgr+htr/ZoxobSn6lmNceAGEVtF8TKQa5
	 p0GFQyQW/O+0UFCsqUrk2AD8R+klmVgg0VVZdDkzTvDFlvoV3hZV2zHd5G+6n28QhK
	 h53muFOHDucdnA3ZEg3DP3pg44sOPgqLUwOqS8riO/GwqiUn72kGa0wK1XjXIM52kZ
	 ZtD2txvSqLd+g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/4] ARM: dts: samsung: dts for v7.1
Date: Tue, 24 Mar 2026 13:58:23 +0100
Message-ID: <20260324125821.59728-7-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
References: <20260324125821.59728-5-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=krzk@kernel.org; h=from:subject; bh=MmcCA5Xn9PA62YuIE5jDTBc2W5syVFoV8J1qc1fPQns=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwopvK/4FJb1yvGeHFMyO5wN7HbaXqwV9HXacC +oZxxJesiSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKbwAKCRDBN2bmhouD 1198D/sEqmYlYF62mX4tuDHVj1Amc3BEBdB60QsT9WIGFLEWwPS41j9MX5ku/yAxyOUQfAdw6qC HHgTBLdQzUj2G9hI0dNLZ7oFjztQniAr7cBfybp7+3mZvb326R9F3Ian1XLnPMnftgT1GPQefBl 1joPW04ZtSWgCWzTiECnfN6cuFZTAk2BCBPZrrBhadtIqzIbvkeIL59uRbv18Q8D967eyMusLB1 06q+/MTbmg44/UPAxiBhQSIiWuDUGE1Mcin1s4bgf2vRKjKIsDBX7xphdiE9h4ctvUDnbh4FiDH Ig8v9+xNrgXVuj5vZStnLxCXmqQNDq1t0e+1IqBZiwbF5P89Z4zXSo5TJoNebG0AAT8WLik5Oc8 S57Cn/HvzomWikKYnKYRquipSPZ6MD3qzl6jfpeCi0SdNUE7bJwECQYPxuJJIPCZFoJnJ184KKG +rAravE3x3WxooiXeILiwOYWKBa+gOJAZcKIOXMvaTiByoEJcRLzEyMPChMRmmD0XL/pU1w1m8b 6r9O8FouwkgoRRoZP6wuTyzonOm/w5jWx4WTQCpc2etl/eTKY0Xu8e8inl0ivkrjurm27JrWNUO +XpktjFV+iqYcm7FfEWZ9H1Vu+WIPrPH+Xnq+57KC4lwJmwiVgWZlby/20bI0izREO+WsMKGUNv SPMyhAbnZD7Dw/w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.1

for you to fetch changes up to 44ee52a030a6dd2f6e0ecb3632ecf8b263114619:

  ARM: dts: exyons4412: Drop duplicated I2C address/size-cells (2026-03-10 17:03:43 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.1

1. New board: Exynos5250 based Google Manta (Nexus 10).
2. Few cleanups.

----------------------------------------------------------------
Alexandre Marquet (2):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)

Krzysztof Kozlowski (3):
      ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      ARM: dts: exyons4412: Drop duplicated I2C address/size-cells

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi   |   2 -
 arch/arm/boot/dts/samsung/exynos3250-monk.dts      |   4 -
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts    |   4 -
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |   2 -
 .../boot/dts/samsung/exynos4412-itop-scp-core.dtsi |   2 -
 arch/arm/boot/dts/samsung/exynos4412-origen.dts    |   2 -
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 564 +++++++++++++++++++++
 9 files changed, 566 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos5250-manta.dts
