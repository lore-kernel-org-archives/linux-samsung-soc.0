Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BC42D2488;
	Sat, 30 Aug 2025 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571325; cv=none; b=Fm31SyWYkO3h6D0qS85J/CM/fuZXkJA/+Thig7eP1m44Dg/MoNSZksnfuhn/BihgvcmAYRfBfRUXjPO3zci6oxGWi2xxY9iEUFbaYYllkH9mU+/UK1kBBv+TlBJnanWO9M8wo+H1mtMp/W+GpVxdr5XunGoCw9IAnL/SLOdgmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571325; c=relaxed/simple;
	bh=l3sVrdnJv1dCoe2zTIV4QQOQgosblDanMaN6/DUrxNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GttNx2C2INi3CF9oE6Il4kjeXIZJhxcOm+8Is6mNuAj3s5hFHtc0GBJv9KW5Wrgr2nbqP1zdHOZpgKrN+eIoS1KdnLMoY2XZ8MfPx8nxH/LS+WhCPdfxoJtYmEiiqOajxyir3Ms3RsFTndLn3aJ6UoGwDFUWQHnNcfOb/ln+fDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATmjCr+F; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATmjCr+F"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70def6089b2so39751196d6.1;
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571323; x=1757176123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jp3335aj9Yj2UDZJ9eBt4OQD1bDQLXy/33bZdHwnWV8=;
        b=ATmjCr+FlhLRKMXWQ2zTIrzEpHRxwd27xOouVYmFUg1gYwHVtlN5uzo7599eO7fZgV
         VfIagkDS4LI5VmhfPuY0u2fFnH9qOxZdlrnXuuy9hOFJvn25FF5ubZwET0J5sODlck+0
         EKD3B0vbeF6i0cn0FoVCsL8DKGbifpr/Ry6m+3BEu1Jao2LAwsAdDvC+WvZZBPN9zBqt
         cSeESzUAKdRDeNNj8ejVO7TDQFiGlj/Ri9JlYQ/yzYR9TozeEUpDndQeVpvy3CqQip5O
         XQg7yI6qY2ux/Cx5ZseADjEzD0GE5hOj+SAgCBq9wOrl1LiOXyUEr+t7ishpa+c2cQzX
         upXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571323; x=1757176123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp3335aj9Yj2UDZJ9eBt4OQD1bDQLXy/33bZdHwnWV8=;
        b=KkOK70XyoJXp6HH8sC5LG45wfXKfFrct6Gn5VAohIGU3q11h5VcsBeC84sBbjnGOOg
         uKwlprIl2c/DBKDE1A9+j7KbsLCsu2fVQY7OcYC2Sj9snllvGjum5Ax73r7e3zO0WQPg
         3i1vf3/Yh4E7I4Gk4jDCZ7lIO03bMKFdGSDJB8wW8T07hBlxvg2ODn+MIS+y6Ocl3hpc
         l8kNz3GXrougG81NBbUZFzmI3SNG3O/rkhZHBw3O1MiORUpaIK2wlbBPWsbYagKWrbDz
         WYxKkktRjFNUJCLauInFrA7UQ7tx+4YF6BoASFEEyrrLWU8aXAIIR6Ti24hWz4PmzOQy
         gSTg==
X-Forwarded-Encrypted: i=1; AJvYcCUB2vhc2pD9pk5rFSRCwnh+denmKHddPTr3azZbsZ9AEb/6vCvJupawY9wQuoriA4fO8AVaYb48QihDSIoO@vger.kernel.org, AJvYcCVDjqZoAYmavWksZxCqGIHID9yXl9ozbG5gtoQ2HBgq9durs56ChVkh4kLZoGYp8ZAfat432OM3FKBf@vger.kernel.org, AJvYcCWjiQK3m4iMZVTFOzHoFjFynzL+JyCHIReNkt/+8SQZaLELVTayKCgnXmB8q+dj2FkL6SYIDK9XLixy@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHkmerFlzYCtRM461rcUsVHqhpvSAOY5GVS+ooTNw6AyMx7Wg
	0fG4M2/3c6UvMIMI2n5hHNq5wYAMk7t8advL+Cy823rAkp+l6Eapnre5BVOAFy/uPkw=
X-Gm-Gg: ASbGncsxdYKYK8rNT/bVtfavOZSeNnrjfXD1rnuWyVYMOxqXmoe5boChnF45NF3Sp2L
	2zoV+oIMbVHmb3dniItw4kJIIWKh+EbHbHg26PlPkS2nSETmfbshx2qA5h3bBGLJA9nkuEoj47g
	NF26XFNyPMNdDC582b+GvbjJX9/3s8erYRLAp+nPfReoGWdiH82EH2jCq/pJBCKEUGkyRPdRMSX
	Or/W3RlDJIE30pMojQje3u8H/r0PfoZka9PU0Ew4MGvA8mCVw+J8+KObF+YLUeIpPei2gmJcDMF
	zOEoAkdAgUxOcww2J5UgpjZVbHQ0VQKov5gErLI13NApkcEtqV9+be4e8bVLNkzYcXLMZRa7pWj
	DwtPO+LVOrYH7hArkX37eolvkD7WbA2G7iuIDjSc=
X-Google-Smtp-Source: AGHT+IHJtM2kf2fYzkUBRN/B3fRR3u9p+22MDICe9V4EbnQskhGNSNPZfIs+JlGxxe2YE1fIADbAsg==
X-Received: by 2002:a05:6214:2425:b0:70d:6df4:1b07 with SMTP id 6a1803df08f44-70fac906e41mr26867476d6.53.1756571322917;
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:40 +0000
Subject: [PATCH v5 3/5] clk: samsung: exynos990: Replace bogus divs with
 fixed-factor clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-3-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=3403;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=l3sVrdnJv1dCoe2zTIV4QQOQgosblDanMaN6/DUrxNk=;
 b=bWMZV72hCHH8WTWopB+8nMN/ZoLxLeornlqLEOU4HlDU74gAsMkfzBr1KtoTAEUavVR3m27N0
 O068adzet0EBjyq3Y9B/1dU1Q72rC7iHtzDEUHXbNaxrP+Cpov3S/C2
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

HSI1/2 PCIe and HSI0 USBDP debug outputs are fixed divide-by-8.
OTP also uses 1/8 from oscclk. Replace incorrect div clocks with
fixed-factor clocks to reflect hardware.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 385f1d9726675b37a901e1bb6172dc839afbb209..8571c225d09074cfd1c299879c1e6b4a7322520a 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -931,16 +931,11 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
 	    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
-	    "gout_cmu_hsi0_usbdp_debug", CLK_CON_DIV_CLKCMU_HSI0_USBDP_DEBUG,
-	    0, 4),
 	DIV(CLK_DOUT_CMU_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
 	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI1_MMC_CARD, "dout_cmu_hsi1_mmc_card",
 	    "gout_cmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
 	    0, 9),
-	DIV(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_HSI1_UFS_CARD, "dout_cmu_hsi1_ufs_card",
 	    "gout_cmu_hsi1_ufs_card", CLK_CON_DIV_CLKCMU_HSI1_UFS_CARD,
 	    0, 3),
@@ -949,8 +944,6 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    0, 3),
 	DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
 	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
 	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
@@ -990,6 +983,16 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
 };
 
+static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+	FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
+		"gout_cmu_hsi1_pcie", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
+		"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
+		"gout_cmu_hsi2_pcie", 1, 8, 0),
+};
+
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMU_APM_BUS, "gout_cmu_apm_bus", "mout_cmu_apm_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, CLK_IGNORE_UNUSED, 0),
@@ -1133,6 +1136,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_mux_clks = ARRAY_SIZE(top_mux_clks),
 	.div_clks = top_div_clks,
 	.nr_div_clks = ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks = cmu_top_ffactor,
+	.nr_fixed_factor_clks = ARRAY_SIZE(cmu_top_ffactor),
 	.gate_clks = top_gate_clks,
 	.nr_gate_clks = ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids = CLKS_NR_TOP,

-- 
2.50.1

