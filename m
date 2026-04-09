Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A093BADBA;
	Thu,  9 Apr 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737513; cv=none; b=aeU7fwBdFfWCPrOh+ZtbMEfQ+K0sjEfrRXlmx8oRatwdjFKmhLE8NbH6lbH9R4RntF/KR6aABagHXmMuMYEnH89vykRtu8Lo17jQPtodoV3AEKfzVsmbweGM9wVo361Aj9CTcqRA2M36Jam5exINQ/bxRIfS5Cej2OKJzFzBHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737513; c=relaxed/simple;
	bh=PzGc744IfLosoYW/4TYIUb0+vQyy/eIOqkVjcY5usVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oCVtoAefOzoiAUqbMPHlRL/wwK+erFk/VruVKZfloYlRJI3y5wXh0IAHf4XYnQkTNNtqL19YTXnnZAbJB5ev2x5uPj30NJ43ZLmqO7GsU547JncRWlYXDKquXq1lqMSuvOzkPPgNTu0uOu2BDmqPeRFs5tljUkShaYPalTpqupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+mBCCTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+mBCCTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E696BC4CEF7;
	Thu,  9 Apr 2026 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775737513;
	bh=PzGc744IfLosoYW/4TYIUb0+vQyy/eIOqkVjcY5usVM=;
	h=From:To:Cc:Subject:Date:From;
	b=D+mBCCTm9aFfhSUlUFqw7wrHppv2f4W7eKSm69uxuv5Z2uuExwh2/9eCTIjI6xH0m
	 28Hmy03nH48fD8BLpZeHYWQgRV2z9yHvvNL+A7Xj9CQAJY7VTnkehdsCEK8SlQ/dXN
	 8SanpPUp8lKo713jj0QT4nvCvTMxbBwnQJS8M5GYFNAW0yVt7ixghSjhYLA0X2C71X
	 zxAupitBEFW/QW2bKOhuwAbQ8AsGI7ive/vhGkvWOywiAQlBsI+FUWfUCAdl1RV+gR
	 lL+r8hNCTYz90ZpdUgejiQ0ufQxoWP5uKarpT/pyxot/ETPyd0BV3bPjGgQxpYaRsn
	 todkMfrFJn0dg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: drivers for v7.1
Date: Thu,  9 Apr 2026 14:25:03 +0200
Message-ID: <20260409122504.71017-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=krzk@kernel.org; h=from:subject; bh=PzGc744IfLosoYW/4TYIUb0+vQyy/eIOqkVjcY5usVM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp15qggmUZ3kZpp2bVcyGYL99GjodD8u7JOCp85 BWyWyjGyHqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadeaoAAKCRDBN2bmhouD 1x8vD/47Otrj+RkgOUhE4x6o4gLRbj8uIwUT1Kl/+IvbYl1Zb0h0m9JVQSHu9Dljpqa8sZsLBLI +0bARVU4n5OaCpQ6gcVaGYB8TRwdiuopLwICEi6UApL0Uz9FCgtZuz6PIw/a5jo2SggD0WRAs6V n3mA6/fIs0KMoMgWnjV6ouWUib7yl/SFE8tk2H2GvyHODv3+0ZCemLCmWjjx9KlrE1UrZHlO5M5 HOO/WoRiDF5D+so1M5reTEiVdnR0KFcBcIt3SZwy1BS60mZxiodcNp2zLv50afP8l/VVAoabEP3 Ijlua8KJB+sGC3lRcNnfp6s//0APB0XZFRTMDUAadjAdz2XSc5NigHP6YZFBPThfZYJuSxIfIiF lLGQ6lxuoacmmLngyYHk41mRUOW7Ee5u/KeIB9B2u54seHTbFAq/2V+6cx7/wM08tM72/LFCqTk Lb3pIBMJnmF1iDcYMhbjJ3YqrHQsVyXcKtuF/nIecqbReLvs5B05eKl1WndGkq2JZLf6XHxbOPx CBXckWYBJesypbiIYOdqZhoSiPv6tyeaQL0Q+g/BUKxvizbMLdZlgtbEBHs2yjvpAtgYrWqSZCl hfr5lDegZpnDOkHoL92dIjv3tVZSEd+Bd4cFErlmN4z+Hc1XHOtKznZFRPRrEkD6dxqWW9P/ceD n4wloye2NfPGYZQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.1

for you to fetch changes up to e57c36bc1a3e459239ead492ebce731a88a264b1:

  clk: samsung: exynos850: Add APM-to-AP mailbox clock (2026-03-24 13:43:19 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.1

1. Axis ARTPEC-9: Add new PLL clocks and new drivers for eight clock
   controllers on the SoC.
2. ExynosAutov920: Add G3D (GPU) clock controller.
3. Exynos850: Define missing clock for the APM mailbox.
4. Few compiler warning fixes cleanups.

----------------------------------------------------------------
Alexey Klimov (2):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock

André Draszik (1):
      clk: samsung: gs101: harmonise symbol names (clock arrays)

GyoungBo Min (3):
      dt-bindings: clock: Add ARTPEC-9 clock controller
      clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

Krzysztof Kozlowski (3):
      clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
      clk: samsung: Use %pe format to simplify
      Merge branch 'for-v7.1/dt-bindings-clk' into next/clk

Raghav Sharma (2):
      dt-bindings: clock: exynosautov920: add G3D clock definitions
      clk: samsung: exynosautov920: add block G3D clock support

 .../bindings/clock/axis,artpec9-clock.yaml         |  232 ++++
 .../clock/samsung,exynosautov920-clock.yaml        |   21 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-artpec9.c                  | 1224 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c                |    7 +-
 drivers/clk/samsung/clk-exynosautov920.c           |   52 +
 drivers/clk/samsung/clk-gs101.c                    |   52 +-
 drivers/clk/samsung/clk-pll.c                      |  185 ++-
 drivers/clk/samsung/clk-pll.h                      |   17 +
 drivers/clk/samsung/clk.c                          |    4 +-
 include/dt-bindings/clock/axis,artpec9-clk.h       |  195 ++++
 include/dt-bindings/clock/exynos850.h              |    1 +
 include/dt-bindings/clock/samsung,exynosautov920.h |    6 +
 13 files changed, 1960 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
