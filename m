Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802665;
	b=OsqWKAn3KNy0P2M3DlQIewr3o9i8MtuM10DfFrDUvZswOd3/GqXzMxOA0Dv3zVDehmGa
	 +l7F3HuNRBtGXx6d0bpXYwcYQIl9I4HiI6imL0xB4vl1dINd7F8Mb3Dhw0ldvvyI4oGOe
	 HX0CXjYyJK9A5pDauTPBays06nyDVmoNrQjnWcpTQzZMxlJ07nVwMgievUpI+mHbiwJIb
	 0sDdzdMWRmqX0N2pnRiVVolcMdiHht5ntulzHz53ZbGlUQh4JkV3mIQfZpsOBNqG9jBSh
	 iQZd7oBhVs7JYewut3ea4Fg+6QxMd40LyaFOT/JhSW7pQ84eBSolfCht+QulGqlzQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802665;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eqhQyaSO26tG2EEvyxab+zJaVAN+aU3CJYT9KFFubgA=;
	b=hypX4MC1EPn6mM1d9agqboLHPBNgLLTWYtJdyhrYboEFl6as8zfeN5KBGFg6sgcGvoNK
	 zY5qHCMhc0EMoHQt8XO5NbAIRbVo1r0P9XoPdOiIskefPD5cVkISzPTzonuoUzjLuanZT
	 Mx/PVTdU7urLqv1lKkhpAiaZeXGVwrLWjul8puR7kqXI16ZUBaFKods4HhCY96FumPoNM
	 6nlcyY+kdekj2vdaSGO0YkRKCgMpB70JRbJSJtmqN+Zs6bimbi8f5p6WuhrBDdwY/LeZp
	 fmMO5UcQyDVaPPXz2kgkNAEHvCUjBcq+B3oahiHVkHPjjGzml42UU+RZtqHC5e1vOiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyVyCx0b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77795606A31C;
	Fri, 27 Nov 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyVyCx0b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1D41F000C1;
	Fri, 27 Nov 2026 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802665;
	bh=eqhQyaSO26tG2EEvyxab+zJaVAN+aU3CJYT9KFFubgA=;
	h=From:To:Cc:Subject:Date;
	b=VyVyCx0bVS6DrV1JVlfl5838fWNFpEAjP86/JZBnzmPFdG61A+CvNApihKcEX8aES
	 ENgWw1DuWuA6qJvAOBCr1y0hH0iIj5EQptkkz/6gFiBa7RRw9E6Z8YOqClsAkxSuzv
	 y+pJTfg3ey9HMa0wILvI0h87+Tz3witqUirbic3h3w4YV4RiAYbgQZEXOP0Qtmrmik
	 7aXMyWHtGBd0WSaB9ey+VyhViwTqOZ1PxWUdSGqGgU8uV4RWegoD//udn52+qO8wmw
	 5NQ8kfNRNJ/cn8CH2oVHOw1vZUmLaQ812Un/ZaHAkzN6obiVWGvUS205R3iVdQm5El
	 UxPTS7DHZucyw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?D=C3=A1vid=20Vir=C3=A1g?= <virag.david003@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Ajay Kumar <ajaykumar.rs@samsung.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrew Bresticker <abrestic@chromium.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Danilo Krummrich <dakr@kernel.org>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Hakyeong Kim <hgkim05@coasia.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Jayati Sahu <jayati.sahu@samsung.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lars Persson <lars.persson@axis.com>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Raghav Sharma <raghav.s@samsung.com>,
	Rahul Sharma <rahul.sharma@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Sachin Kamat <sachin.kamat@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Sathyakam M <sathya@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	Shin Son <shin.son@samsung.com>,
	Smitha T Murthy <smitha.t@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Tarek Dakhran <t.dakhran@samsung.com>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 00/12] clk: samsung: Fix power-domain, bus clock, and missing PLL sentinel bugs
Date: Fri, 27 Nov 2026 18:03:08 +0000
Message-ID: <20261127180416.3277544-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first two issues were reported by Sashiko; the remaining ten
patches append missing zero sentinels to all remaining Samsung PLL rate
tables, following Krzysztof Kozlowski's request on the Exynos5420 fix.

This series is based on krzk/linux next/clk.

Cc: "Dávid Virág" <virag.david003@gmail.com>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Brian Masney <bmasney+clk@redhat.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: GyoungBo Min <mingyoungbo@coasia.com>
Cc: Hakyeong Kim <hgkim05@coasia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Jayati Sahu <jayati.sahu@samsung.com>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lars Persson <lars.persson@axis.com>
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Raghav Sharma <raghav.s@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>
Cc: Ravi Patel <ravi.patel@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Sathyakam M <sathya@samsung.com>
Cc: SeonGu Kang <ksk4725@coasia.com>
Cc: Shin Son <shin.son@samsung.com>
Cc: Smitha T Murthy <smitha.t@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Tarek Dakhran <t.dakhran@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Varada Pavani <v.pavani@samsung.com>

Lee Jones (12):
  clk: samsung: exynos5-subcmu: Detach power domain on add failure
  clk: samsung: exynos-arm64: Do not store ERR_PTR in data->clk
  clk: samsung: artpec8: Terminate PLL rate table with sentinel
  clk: samsung: artpec9: Terminate PLL rate tables with sentinels
  clk: samsung: exynos5250: Terminate PLL rate table with sentinel
  clk: samsung: exynos5260: Terminate PLL rate tables with sentinels
  clk: samsung: exynos5410: Terminate PLL rate table with sentinel
  clk: samsung: exynos7885: Terminate PLL rate table with sentinel
  clk: samsung: exynos850: Terminate PLL rate table with sentinel
  clk: samsung: exynos8895: Terminate PLL rate tables with sentinels
  clk: samsung: exynosautov920: Terminate PLL rate table with sentinel
  clk: samsung: fsd: Terminate PLL rate tables with sentinels

 drivers/clk/samsung/clk-artpec8.c        |  1 +
 drivers/clk/samsung/clk-artpec9.c        |  3 +++
 drivers/clk/samsung/clk-exynos-arm64.c   | 26 ++++++++++++++++--------
 drivers/clk/samsung/clk-exynos5-subcmu.c |  9 +++++---
 drivers/clk/samsung/clk-exynos5250.c     |  1 +
 drivers/clk/samsung/clk-exynos5260.c     |  2 ++
 drivers/clk/samsung/clk-exynos5410.c     |  1 +
 drivers/clk/samsung/clk-exynos7885.c     |  1 +
 drivers/clk/samsung/clk-exynos850.c      |  1 +
 drivers/clk/samsung/clk-exynos8895.c     |  5 +++++
 drivers/clk/samsung/clk-exynosautov920.c |  1 +
 drivers/clk/samsung/clk-fsd.c            |  6 ++++++
 12 files changed, 45 insertions(+), 12 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

