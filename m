Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0B1D27B6;
	Sun, 14 Sep 2025 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884759; cv=none; b=VH7RrD3n1Wq/qKVVyVEm5iNEdd2r/MgGDnzByQqoyeHxE5yrNaDF/GhN1QVn9DiXFHuphk+iFRjExfx7fEnWP6a72QePoVU3IihD9UGjbva2F0VM1ajoktnSNTRC/kT5Drn6Qqh+9K+OTVXEYSr8laf7zgKVhyOqXGJyY+9KdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884759; c=relaxed/simple;
	bh=Mp3ThDTfoGcWOtSNWR2msXKzQUo3f7rECaxqSDi7tvo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ps4TTRNWe1hxonNmKqNaD4ouJ3Ox402NauSPTPZ1JYFH2WFxfHLj+/y36QB36bFGBk1hN6CGoEgbgqwW+JhpVx8yRXt1DeAAoduZZ2X7dbQeL53qz1zZl01Yan4sGoNUW+C+YmHUfQF6e2bCan88LmMjYpbXdkcLbtlJ8ePQtIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=pjRdCZxZ; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="pjRdCZxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884755; x=1758143955;
	bh=sJdatwuItQDKsBxIYrlY3ZlspqT7UZOXCVPAjQosROw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pjRdCZxZYjv593LAaJYmmeAdRJYgbg4+m8zmgYUrZnk1HfnCX+zVZy5r516/ukeR5
	 HRyNQ1XTojQVzmtmxIbFZMEJz8hjyyPZ8SK/oy/caVDpGBqSliy0EBZWXTJb7WDdVc
	 /X6uGiLa7wje4dhrAZviuEebtrh3msO7WlgQp5NGRwOABM25CMAF72dqzsCbA2+gaS
	 bqZXHsKzBvJJIELK0BrD3O1bhVhcF4R/Dz5qgYZgSHuBGAQRxxjlo9mXEH/eu9NbtT
	 FccXs+6ZT4t3gZtcrC8uiZahoL74B62FTNss2rbvzkB4WAIeAJ21QwPsvlejEH8NsF
	 WMGN9I9MW5sKw==
Date: Sun, 14 Sep 2025 21:19:10 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/8] clk: samsung: Introduce support for Exynos9610 clocks.
Message-ID: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 7100008c38a354ce31d7f13b8a0b76ba06752ed9
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patchset adds partial support for clocks (no SHUB, USB, MIF0/1, ISP,=
=20
VIPX1/2, MFC) on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (8):
      dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
      clk: samsung: clk-pll: Add support for pll_1061x
      clk: samsung: Introduce Exynos9610 clock controller driver
      arm64: dts: exynos9610: Enable clock support
      dt-bindings: soc: exynos-sysreg: Add Exynos9610 SYSREG bindings
      arm64: dts: exynos9610: Add SYSREG nodes
      arm64: dts: exynos9610: Assign clocks to existing nodes
      arm64: dts: exynos9610-gta4xl: Assign clocks to existing nodes

 .../bindings/clock/samsung,exynos9610-clock.yaml   |  344 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   20 +
 arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts   |    2 +
 arch/arm64/boot/dts/exynos/exynos9610.dtsi         |  277 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos9610.c               | 3652 ++++++++++++++++=
++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610.h     |  720 ++++
 9 files changed, 5039 insertions(+), 7 deletions(-)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-clocks-2fba704e6030
prerequisite-message-id: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@=
chimac.ro>
prerequisite-patch-id: fb1e2f83c03a3b3a330c72d5d9c9fd8cd95ef2ce
prerequisite-patch-id: b42a7c0c72b1bfe33bb65fb911bf28e3e101fa55
prerequisite-patch-id: 4c5c21cf62e50db603fe4e2df17ee664ff0b243e
prerequisite-message-id: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chi=
mac.ro>
prerequisite-patch-id: 27e949ada132a43ba3dbf880af3e6168ec94eaf9
prerequisite-patch-id: f446d396d0258709db47aef69e68821eb72582dc
prerequisite-patch-id: e3bf016be9509ee79beb3d51907ef6cd58fb98b1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>


