Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD14756AE;
	Mon,  5 Oct 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195908; cv=none; b=ojk3Tk+OrlMB6KT2NM7fklwsKXNjO6SdbRwl+o7CufCRbtr2FH1WiVJSd4oVw5IPer2Rul71oNjs3+c1s5ZATdUK91PG0A2c/GqGZPXq27EE5UFDOjzczn9MhVmas311wwjjf2ic5Gryii39V4zZKhOfIOrH1LbpEjiweEh2uHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195908; c=relaxed/simple;
	bh=WRlhwtU1kXu7w+5nMoJISp3hl1W6KmEIiCCyZauF3Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/RfDpLZpj0ACDBf/ym59KM/nJY4hmErOwAZNiOoksB5EMTLA0CJ4Ql44aC2cmVoUy5oEDd0WxjOdji+yRSKCHGVZe5TjX3gQXWHIuEgVrywqz+jP9bCBKCeaWtYXcLj7WXiQWRvPAOKvq+wXnvAzJSMPXAdgpqqA35qOymUJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JShs+XMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JShs+XMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EF81F00893;
	Mon,  5 Oct 2026 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195906;
	bh=GfnN1aSdXWmTo8q/DewYWQGMbm4TMx5bk22+lXAuIcc=;
	h=From:To:Cc:Subject:Date;
	b=JShs+XMJ7dR91/bjgbQ90njng/7XJepBHoGNu2K9eWBMmrdFwza/j08M2ESVZvnP0
	 5oGDdCTg0cckUTHSh9VEhf0UVw9OzweLZXV5K4fpWgevlxs2QsfjZ/qwVje0x0gzNl
	 tp1jtNEpy9kwfi6ejrqBw3NYLp3P30rtzbJog4MUMZk1BtXZ/MIvfWH74D5UpYVbGN
	 Bw2U178xJg0fAAi2jsZHFjDiaz2WtTuJsMklWBKgDU7sI4bUMZl0BKQtdygizXtXg5
	 JGUcyD2KQh0wivKhmp0qkG+Czr+gbWHvaCT6qCJ3PdOfUJYBQGvhbCXiYA0CSBbWgr
	 8Q7hbky8YbLNw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: drivers for v7.4
Date: Mon,  5 Oct 2026 12:24:44 +0200
Message-ID: <20261005102459.35529-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=krzk@kernel.org; h=from:subject; bh=WRlhwtU1kXu7w+5nMoJISp3hl1W6KmEIiCCyZauF3Kw=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3r7uvYdiNMrOSRdYOQDpociZVSRIJDDmcx1j XLXsUG5JDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN6+wAKCRDBN2bmhouD 15qcEACG0M98i3CPuDUqKNgoRkpkYeH8U4AkjGlSTjitCoDBbSqZ57uNssFoWl0Vbeke19COgRs d6qjgNH/GSsU5gnPqvPgxKy3Ytf3ownSZ99TbV48L3ZQCYKfHBk1X5uU/Q+L5fZ9walvsvIYRk4 Qxh5lmq4AC9et/rdO4HPRc7qbEMXwm+D5c5T9Y0SnP7+wvJtY46XrA+vb1hW83d0+3m9ZsrEqA0 6KSQ9t1BVGyVvJvcFW80rnFV3hSXknL2H+gSPdUnhI2e136QVxc9l0zDWMqMIHANpEujUx3P44z 1Ym4dnjoyDpb4+O3YStL8iyLJZ1fUCynOOB5f4SJYzhII217QyfSzVUDg842ZuyIdru9GuLf3Y8 tuu9DeEipFc2Nfz1sKzDjIJS/QpZpops2WDUKSWKFj43/WB35nNBujd6Yac/jNmIdLxnnRX9SaV NvET/0RoVAx7nOed+1cjxWilY3DkixApeuoUeP+QHW44IwBZPhB/3uk+Jm0zuLk+hBMJWML1hFY gyQLjlGua72FPMwcMIfGCcvdLZywXgJjej8VBrTMb3xVcj2gHwJFtLLfokJ7dMb09TKHZPsnK+m SBaXLuqvu4gHNXxcsQs4cJNeOvZHxKq2pyfGqqPUYNIIQ3CeHl58SQXqey/QxAB6RSbxHKKI5A5 Kv9MvIWQ0LJfn4g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.4

for you to fetch changes up to 13634cde9771811488847ef76cd64a785599fdb5:

  clk: samsung: acpm: add Exynos850 support (2026-09-20 17:11:54 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.4

1. New drivers for a new SoC: Exynos5515.
2. ACPM driver: add support for Exynos850 (beside existing Google
   GS101).

----------------------------------------------------------------
Aiden Isik (3):
      dt-bindings: clock: Add Exynos5515 SoC
      clk: samsung: clk-pll: Add support for pll_309
      clk: samsung: Introduce Exynos5515 clock driver

Alexey Klimov (2):
      clk: samsung: acpm: introduce driver data for SoC-specific clocks
      clk: samsung: acpm: add Exynos850 support

 .../bindings/clock/samsung,exynos5515-cmu.yaml     |  145 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-acpm.c                     |   61 +-
 drivers/clk/samsung/clk-exynos5515.c               | 1484 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos5515-cmu.h |  191 +++
 7 files changed, 1878 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos5515-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos5515.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos5515-cmu.h
