Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86E3164B5;
	Mon, 10 Nov 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787609; cv=none; b=RWdr8IG83mXxX2ORsWcF6bZKikngO4oJ/pRnZOG/knXuw/xIE42AbpY+QpCgMPWSUuGolSd7NRBYaAkBYbFIeZRWLzF1xsaLBFSeG7CHaiMLNsg0vbuluZ2JdrsjpW7/LVw+LGfCP/Vi77ukVEbnqcVAYkv6vDifbDqSjOWJh3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787609; c=relaxed/simple;
	bh=v+WhwaNQxNmGiOc1Ncd79H143hIDikEV7iSCtMGSUSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F+KrzT1T8tZVT6YhsDMtYEoisb9mFXwZek77lQA9oDMuXKwbV/1Q2uHVo/83tcOzo4kF63n9lOe8Aeks/FyuJU8g6W9s4gXlOOH8pHNvPMZnDjPlxuPmWcCD5cSf53OAXTDDYOMosH3NWq9vas6vq3tQqwBwQ0psJCAAbrcSv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiUDi3t4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiUDi3t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81911C113D0;
	Mon, 10 Nov 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762787609;
	bh=v+WhwaNQxNmGiOc1Ncd79H143hIDikEV7iSCtMGSUSs=;
	h=From:To:Cc:Subject:Date:From;
	b=LiUDi3t4vRd8VWatHnlVRBRwc+wUM+x+VJ129NqHQliqbXiDbnYtKkQM0rO2nbXO3
	 MTtKngRvz5i00KeGbOUn8supigGQx1UZaLJ2dzMIJILD31SeI9/E33zBvsPrfrAziY
	 p+370/fG3Erg/1e4VAGDbJ1oJy3Je+W+HbC1rsvp0n+zl9XEZ7uR691FXpNps36cE5
	 RwGVaw1UjdPZZLhFceUF//lYWuRXeVhdp2U9Wnr+UpyP7zbrB80gDQYXaipqQ33Om2
	 MDr1Hy/5xJ4oO2N2cfFQkS6nfbaVDCeXrdn3JD5RaRPp/mmkqptj+lc+wDUqRi1coR
	 4t2BPB1xiOckw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 16:12:42 +0100
Message-ID: <20251110151242.136508-2-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=krzk@kernel.org; h=from:subject; bh=NMFi2ddzD9bgrisS/6TQO0TkyBRAyNYFx94+jZwEbr0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEgDqC/UaGCPFd7MoHs5A4cH0wd5gAMIivlI5p hrkjXr4tYmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRIA6gAKCRDBN2bmhouD 13YWD/oD6VZLjGViUOEIYqWSweEQOKX6GoKvMVmCpjo8GyspDLo1rHZl7tc8s/RE2Cyud0u91dv 9vY+pxlKCr8TVLhLI1aK/0xtWcoXXPwYyjcsOrhl/QbWctQm6Yu8GHj0Yvkdf6ZYSEeKshxwiNK NR0mcDrRqoXXVOAahvPETM+ppkJBT8mDB5oDU+GL/m8FCaCJxdLa0kZbMgPyKIvHWtlMKGj3dIg faN0D0bGx1txnOy1QPS5XErhQFCz4yHc1yb2wq8ag1YFAUIvtUsuxt73/OcYrPMMnHulGnrdyQ7 5y12NM5sDfIDFHBMpAbm0KOzQkoOL8a5F3rIHIpnBqnA/w4/2ykZ0bfwdaIx9kfEc9/u/tgLz63 Nqi1I/GoPkkdP1On0jtnKgZ2D4qg8mD/rLIz95xAWf0IFer2I9OQcG+oS/ZPsDBcbVeVsTLT+Nu RAQTTaFaVZK3G06XiDWJfhlKtivbF+6SFlpvSENaYx+akM6i/6tCWmvkMspKQsgI4Sx+uOf0Syy EYjMMl8rgnEaTT1lf0HRDKz4AUzg7FGQ72QpYAcFNEcszVCGh42omri6ECDIJZVwrhN6ErdxPhV x9ApiYlrbRbEECA4ugdPBQ9aUtMNGlLm2jhcOndSDcPkFz6IIeiHSSMdj0BsyLFGvSccVEHAUPA Vf2PkaUDVLGtbRg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.19

for you to fetch changes up to d669ec6be0b1965c67248407d87c848b1b7c12ae:

  clk: samsung: clk-pll: simplify samsung_pll_lock_wait() (2025-10-18 18:12:41 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.19

1. ExynosAutov920: add support for additional clock controllers (M2M and
   MFC).

2. Few more cleanups and new bindings.

----------------------------------------------------------------
André Draszik (2):
      dt-bindings: clock: google,gs101-clock: add power-domains
      clk: samsung: clk-pll: simplify samsung_pll_lock_wait()

Raghav Sharma (4):
      dt-bindings: clock: exynosautov920: add m2m clock definitions
      dt-bindings: clock: exynosautov920: add mfc clock definitions
      clk: samsung: exynosautov920: add clock support
      clk: samsung: exynosautov920: add block mfc clock support

 .../bindings/clock/google,gs101-clock.yaml         |  3 +
 .../clock/samsung,exynosautov920-clock.yaml        | 42 ++++++++++
 drivers/clk/samsung/clk-exynosautov920.c           | 90 ++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      | 41 +++-------
 include/dt-bindings/clock/samsung,exynosautov920.h | 10 +++
 5 files changed, 155 insertions(+), 31 deletions(-)
