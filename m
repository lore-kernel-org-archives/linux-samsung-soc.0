Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26E1E51EE;
	Tue, 18 Feb 2025 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904695; cv=none; b=jJxrg8Oti3KxaolsP4hlRLzqj6ATp8AfGDLb+/yjRTbU/tVNjXk7R5RW0D3GCg5WnLHa1o1GAo2aJbcrd7+x3ZURlOxQov4+N8Wy2lvZB/WgI38T4grZkWh1t8syWs9F3wI7Jh4MnQsRP1c5Dm/fuGRCO0g9IaBUrHKFASu7DFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904695; c=relaxed/simple;
	bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oK3PM1OClB40Z1KJ1wo+HcgRcy2DxiUF+WjrLLnNBmMx+uIrhe5zyvbSO5U5dmBflRRoH0+kpYuLw/kKtXVb6hDScnGCJdLq7mKrXlcM/ZCJTf+BAR1OP7lMd3eW003xyfFWfVPXQp5jVgj94ebmsULsQF6NH8oAEINVzlrLYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UplHpz/l; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UplHpz/l"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2C17725238;
	Tue, 18 Feb 2025 19:51:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf0up5s3SQFp; Tue, 18 Feb 2025 19:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904687; bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UplHpz/lNdkdG5iWDlvvSkHfsOV8boPdkiMoa02+tFheflLeVZcdKur+A3BJT8P4x
	 lz7K3hqiM5t5J9gQ5Mj0kijSLPIJL6CGqbBCsOmc+Md4xv6fkGDYr9QLzJ5f+Oehix
	 T37umopUao2Je3IIve3keko17YjI26YotemfExmzHX5/sCZ/UQFngB3dik8la5+5p1
	 vIt2awlFC5RZ+0dH90jCUUFTpqfwSg+bPv/AImCn6oCEiL8h17WPyqTUdCJrR1FX5/
	 cSI4rV29+m1IOwcXTKA6RpPXF8kgB6iw+m42wE0wCg+ODraxrME4i22nhlGJBr2JGq
	 ozRo6jfKCYoEw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:20:32 +0530
Subject: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=841;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
 b=R4UsGuQHOnJi5OrVwA2SQghzy7AexOBZ3mXaQzIBNSBHoCSV/gvsQ1xdHkXcPqYIhPvXHgpYX
 sy1SONeTq0uAcWDivRJCVJD/DmZn75uo024qiNmA9ncVjMfZN1Ot1wD
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

