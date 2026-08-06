Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B113DDB13;
	Thu,  6 Aug 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004500; cv=none; b=bhibDIIc1IDdacI0Zeh4rmb7/1466IU4+eHrvRTPl2t/Fl+QYQ49CkO5M9snq0wiHC8YLYaPAFhJ27oQZEKZw89QvsWTPQo9Ehzx4pT/iQAtfou0V5f/LpHnmr4rGPpe3fxTvQtHb22Sp/6FKyVswwW/ymxZnpGYk/FB0RSmfuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004500; c=relaxed/simple;
	bh=ZlNCp8dIjmyd81ZPzno5nW4rK5IDcbFp975B+dvP4ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8cAUoiUvfOXWT77LuKTM/KTJau8np28z2wMhjyFvYDabGu8R0noZq8EPXVo6tfme/kWAYasqS7L04LopZcftiRpZtmpPSDq63XgkRpwBxW3VdajLowoUGh0jbduvcIkvhXVY1Y1T0txc6flmb2vOjXtdOt1FdcJyr+4cXrbr+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLtQqpYC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLtQqpYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414981F000E9;
	Thu,  6 Aug 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004499;
	bh=g/COYdqDrg8vdSyAwJS5nvJ2rFgUpbSAtTvf3IC0+cc=;
	h=From:To:Cc:Subject:Date;
	b=fLtQqpYCCxvUJ2zcj4FlNtTJg6wNoGDhfI6kxbeW7JuX6H6W552j3du8+x3+CAxnI
	 xKm1ff8aEvKlWw/QV6swlN4QfPepRWMq6Iez9IxTJ7Gr0vtI29hUawiI3JtjO2dbtm
	 fBfBNVPr6LfWd/fodwfzDzHbC2AFbIjfBAItiFyQFRUDuHbh3n/Hmc0UVdq2Tsu6XX
	 y6/3bgiHt+DLgAJYI6f/tNhBSQP0IOl1CbU6X+v3wps5Xl5TTKFjPoSfXnQEfD/FS/
	 szreDRBM79igYxD6qCRTRU+Rub3w+hJc+VUH+LsYO22E1SN/ufCogGZk63MpJaP0Tb
	 /QUBiKiooMJog==
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
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] clk: samsung: drivers for v7.3
Date: Thu,  6 Aug 2026 10:21:30 +0200
Message-ID: <20260806082130.165665-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=krzk@kernel.org; h=from:subject; bh=ZlNCp8dIjmyd81ZPzno5nW4rK5IDcbFp975B+dvP4ic=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEQKqxPuEQFxgqwExDsX10r70tiur91j6tXjt C9sZZxyEP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRECgAKCRDBN2bmhouD 1xAkD/9GLsSNKKVQlcJ2lcpIwAtD74N6L7W2W/AmAR7VWt4lH9ZAepKjJ8GcXiW8pbGxaOzxGC2 KhOFvrKrjRU+7KES8rUbidBE7dGuNoklt2hwp0H+mFr3T4t7O/cgCTfVSr7rHmUmpNfOjzaMnJJ wtv5BqFJ/5V59tKDNA4VRmj640fC96m3oL1bONDPJi0DyJAZkZBwHowBwWD+lKrt1KHiUSbVkrZ rw4p6GoMZi1SkB15b2TW5guYkLaKjw0Oiferlzi5S4idxti18jYcwD/q8Ksa3CVZDzG7EQhUJS0 ofC6ayb1mJ3KEV6wLFwiWrUQ548tXkofKexFJ0qC5S0MR3iOvn0yicWW/Kcct2s3x6uQ1VpgMlX 5ZO5iNE+hciNQBZKMZXyoS/7RaqPh8/dnSXqdTnoS/NrC2fn6XdXkBkxuth7ctXbdOI63byAJXB aqvf1EiQi2PXhJbA0AZbnzwmgJUtnCHSvh+BGCP22K+My3JPPYDCRYgYNzwnnKyKQ6dfXAtFxLS 29sEunqF5ZqBWbPbvRjXjf6431AwVqix8gn2rj4owPj4+bNHHyCgniQYFY8uEI8u2KBfLDveDO5 hY5fLmOHUHTp2wl6YJTCIRvGwkpmqbjks/bP4OsEmKsRUQrb09Y27G0Rj0hnQtPn0Kba0TAyM1c 0E7W7LaqUGxXKmw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.3

for you to fetch changes up to 6d32ae6403694035896cbf0436088fca4c6a35f1:

  clk: samsung: pll: use kzalloc_flex (2026-07-18 18:21:13 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.3

1. Exynos990: Add few missing clocks and correct the gate clock parents
   in the PERIS clock controller.

2. Cleanup - Use kzalloc_flex for __counted_by checks.

----------------------------------------------------------------
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

Rosen Penev (3):
      clk: samsung: use kzalloc_flex
      clk: samsung: cpu: use kzalloc_flex
      clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c                 | 34 +++++++---------
 drivers/clk/samsung/clk-exynos990.c           | 24 +++++++-----
 drivers/clk/samsung/clk-pll.c                 | 56 +++++++++++++--------------
 drivers/clk/samsung/clk.c                     | 11 +++---
 drivers/clk/samsung/clk.h                     |  4 +-
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 6 files changed, 63 insertions(+), 67 deletions(-)
