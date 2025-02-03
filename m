Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D5210F69;
	Mon,  3 Feb 2025 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615117; cv=none; b=Dqu62hWwMrv9ncJDLrrM9+oTBWug6DUoYN1h5WD+wmwsX1+lGbedqgeMRLl8d8ID2i+RgnAstczhmhOnxdqt+PsB2Km/8I9Z8eQMM+L55WRBkpGui+7C7y3RBrKMc1EmlsFxBqUt1CDKiRGbhw36wDv88zpNwjaY7NnYbhADDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615117; c=relaxed/simple;
	bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izP1SQ/Caqc5DE7NzQ8eGMNmDvs5qGgDmnu8+oxAz4oXgLFXsART4G5leYpTGAJEfy1DW7VyiprzMQwdUclu6a4/utZrn3gpMC1CY/1pHVeO7mJ2ZwaUC9yNGFAik6nhNOsnxVj78mpJ2lrgZd+qux3h8nZ7BPrPQ05OT1tPpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=H5QU1+b/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="H5QU1+b/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 072FC25BAE;
	Mon,  3 Feb 2025 21:38:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSRCLVZYH8JC; Mon,  3 Feb 2025 21:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615114; bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H5QU1+b/tjAtTbo+RrauiaOIV4b9XflTzv/+CN0wgHDuvfDcPJQiljknbswgyRCXp
	 Q3q8SkHVJA0ycTpXrRRl8n0qLSEYjCcOnGkL18xXzEasjf+LC5ZuEowCaVd2y7+CVh
	 vAMh8YLe4kwb6SlY1wGhiTgJiOAlQdEw/5RiBBqZZU79e2qjeacZMnHmCmuII/QVbP
	 VKOh3thlUQCmvtZIDfGDy5repPgAVKy7LtMlyAKhBzVV51OuT6TccFcE1B1Fpf5IAp
	 X+YC5hxcLKIGlbAuI+mwzPGN0EyF4qyWgKQ6apuVgKklSZJw1lergBlodd37AMn5AO
	 mGgZrE0A6OYKg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:07:33 +0530
Subject: [PATCH 5/5] clk: samsung: add exynos7870 CLKOUT support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmu-clocks-v1-5-a3030ae5bb53@disroot.org>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=841;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
 b=ewtZ+O/aop7T+/sUN2yesRNovWh0Zxea8fWsw49izRwtFbjGMLlSax4wGDt8yN0mPjO2vfRjs
 9Edh/+2JkmPCILpMppxoVjmjJUQHF1jkQxT7swteg9tII9hsOS5MWtk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
compatible to the existing CLKOUT ID list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
 	}, {
 		.compatible = "samsung,exynos5433-pmu",
 		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos7870-pmu",
+		.data = &exynos_clkout_exynos5,
 	}, { }
 };
 

-- 
2.48.1

