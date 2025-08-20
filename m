Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA33469F0;
	Wed, 20 Aug 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701968; cv=none; b=Z2zvxH5LkGNYVkNZLI7/Q0EbC8hZIGtlADw5dwBAiyWz9PH4nTdCYdrJ68lRjZQeNlvhzkEwgtCFEVYRrKvjoslH/yhh5I1myBp3wtM1eEC0g0n6h4wcA5QqbkltNm9hDOaz9RTmCt5UJVOrzqCg0a0lgEreeSr81QljHerNA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701968; c=relaxed/simple;
	bh=75MeJfcBxXyVJ1uuKMywshUfE9yrQQgMLZJ8oZLt3BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEGbF4DHb5VwDuRc3ow/+bNJIgytxfUvl1xjTuMR4HqBkjS1VeJqA8uGc1LkVe4f6c9ymNpYk7lcs/iaMjc7SvZJzFOPeZmOPIeu3W+Md7iiqP4eauE/mabqnitm4J+h4x19kE/3/82xFznily0xN8X1pJU7/C362zZBADDksl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyMoKASM; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyMoKASM"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-324e3a0482dso8408a91.2;
        Wed, 20 Aug 2025 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701966; x=1756306766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf6FhaKwIZpsGRJ8iywvEpIPBHixoD4pqeGRPdOAMJ8=;
        b=TyMoKASMRBfxNcurwrwDm25haq760f5l0PyWdnes0DKRY4FDs5pqzSX6xdIqlm8R+i
         HSzZ2ehj9e4TRIvzrbeK1Ka4IolHqutxs7c0UPTntNO8+tnlABQ+yC+vYLAURxWSS8fG
         DMRQfSfMpPi/dSuXh5ojQtfFiQFNOvqwsv/4nci+Lx5Qwt8WhcxvYBDHrW4I37aLDHv1
         JwmH5iSYg3F2IhjpDxt7sKXtiu2xCn+c6K4uDzH65mAAgxLvjKB1MKilGOhNptKgmHBU
         he1EMrwTBIpbhlKa4Tq0cO9xmXyNVsxGbPPlGK9aj8sZQEEP+2MjNYyVapaWfRJJqkjr
         V3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701966; x=1756306766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zf6FhaKwIZpsGRJ8iywvEpIPBHixoD4pqeGRPdOAMJ8=;
        b=MVAmI3S3Gct+IU+yuSNpPL4yB3W7um/gJL9dhGOHuhUscrM5oiIsAsh8ivx3dJKDQy
         1IH863G4W25AOeVzPi34Szu95UOUdlszZrn0aOb5XSk6BaSXz5dehJl4dWICDnUY2EoY
         /zktSyWmPIdVG9NeGirfdD3bx+uQP9syN/8cR4lc/3jfveoYAJeXQlR/aWa/cupAWg/T
         j8dvQdYr6migIlVvfAs2pIEDqnEZFAw2APjFp5vIKeID5rfHAOWVxK67kwUhqTiiy8kT
         PVXTuPSXL9Qn0EW5OM7Y1/OEC7EK4qQfYqN7CsbDieCdxMP9D/deA5E1Jr6Lbbh7BKvY
         1AtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAmvvBfDiSCDA4MDB7tqJBHc5MFxEnkrbuoObk27Gdc8nGyyNd4zV0TZDP5aFfVzy7VA+qrDnMohGY@vger.kernel.org, AJvYcCVEEJbOWB/GwqaqDWED9tfhJvgixu79UgjhaAOK/XI7VvCHKQ/bZHmY+Q/gFrJEBAKWCr6Cr01nsmq8iceU@vger.kernel.org, AJvYcCWTSWfcAzN/+gfHqksd/7hworLHGvxMUQ5oYt10BOziltT0KH+W8YReZVVkbAUuTFsyqyZO5PjLxmdB@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrM0V+qScdA3dOhAJDl9cxLP3Q1yRYfM5IgSXP6erqCw12ML/
	kDqyp2zFiJgHirFb8Pjb3eRGwpUhKWBZae9U1+TdyxjKlXcsPc+ax1Ny
X-Gm-Gg: ASbGncscv/Y78eqcVvs7ZKGjs72UIRbO5XkWvUx1MRKxsEpTuP/NccrujRtO0hr6Alg
	GXeUu0ZdU0Be4JJSQBXxxD2Nl9MasM6bdDzBrZWQR6iUZZujlTps72rJsm9WnLGTqa0vACOpS6Z
	NRjeUvxnQTmDDnJAKC4HnCIG6jvD0CZBh3xUjjNA2jlCkz35fS700I8isTYV5In7hKMi2V8gZGS
	C+VOgl6vPihdfyH4luR3j8W566hkYaCLsgyFTRq0kiaru939yjITyWceshtCTsQoMoTsjijoSWO
	R+TPKihTPGWtHitSK1y5x1N5XE20b5EfBHefDKC1W7jCn6BCeJmmpf2KRijdJbkn9Pf1gDlkjhq
	Y4OOeHpnuRuFPjIt0Wn0W8tzRirZkrFYbz5pzUfpl/pzFFvu65sl/87Ocbg==
X-Google-Smtp-Source: AGHT+IE6gwzcq0H8sG3ST968DMBdN4Sg7+1cZP/DbzhRz387D/2KP4ifE4ageujdnnFwaZrjf1+ZVw==
X-Received: by 2002:a17:90b:2e0b:b0:31e:3bbc:e9e6 with SMTP id 98e67ed59e1d1-324e1423f77mr4524742a91.19.1755701966192;
        Wed, 20 Aug 2025 07:59:26 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:25 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 20 Aug 2025 09:57:24 -0500
Subject: [PATCH v2 3/3] clk: samsung: exynos990: Fix PLL mux regs, add
 DPU/CMUREF
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-2-v2-3-bd45e196d4c4@gmail.com>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
In-Reply-To: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701949; l=12553;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=75MeJfcBxXyVJ1uuKMywshUfE9yrQQgMLZJ8oZLt3BQ=;
 b=GNLgLwHOzJTaYMyZSnDeXi/AthRaY4rYpuwrZ13rHY/uV4RT8GklCA1jTQwa6h7hAHSSYfw9s
 k5x6RpduTeED2h+ug+FpeOK+DDOpypArXEKVHz12F/rO9tvrTh5rD8x
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Switch PLL muxes to PLL_CON0 to correct parent selection and
clock rates. Add DPU_BUS and CMUREF mux/div and their register
hooks and parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 75 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index a55991ebb77bcb2988071fc156dbe5c9b100215f..c5f1dbaf45b6a718994c1dfa9f204cfccd74cb16 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -45,6 +45,7 @@
 #define PLL_CON3_PLL_SHARED3				0x024c
 #define PLL_CON0_PLL_SHARED4				0x0280
 #define PLL_CON3_PLL_SHARED4				0x028c
+#define CLK_CON_MUX_CLKCMU_DPU_BUS			0x1000
 #define CLK_CON_MUX_MUX_CLKCMU_APM_BUS			0x1004
 #define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU			0x1008
 #define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS			0x100c
@@ -103,6 +104,8 @@
 #define CLK_CON_MUX_MUX_CLKCMU_SSP_BUS			0x10e0
 #define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS			0x10e4
 #define CLK_CON_MUX_MUX_CLKCMU_VRA_BUS			0x10e8
+#define CLK_CON_MUX_MUX_CLK_CMU_CMUREF			0x10f0
+#define CLK_CON_MUX_MUX_CMU_CMUREF			0x10f4
 #define CLK_CON_DIV_CLKCMU_APM_BUS			0x1800
 #define CLK_CON_DIV_CLKCMU_AUD_CPU			0x1804
 #define CLK_CON_DIV_CLKCMU_BUS0_BUS			0x1808
@@ -162,6 +165,7 @@
 #define CLK_CON_DIV_CLKCMU_VRA_BUS			0x18e0
 #define CLK_CON_DIV_DIV_CLKCMU_DPU			0x18e8
 #define CLK_CON_DIV_DIV_CLKCMU_DPU_ALT			0x18ec
+#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF			0x18f0
 #define CLK_CON_DIV_PLL_SHARED0_DIV2			0x18f4
 #define CLK_CON_DIV_PLL_SHARED0_DIV3			0x18f8
 #define CLK_CON_DIV_PLL_SHARED0_DIV4			0x18fc
@@ -239,13 +243,21 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED2,
 	PLL_LOCKTIME_PLL_SHARED3,
 	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_G3D,
 	PLL_CON3_PLL_G3D,
+	PLL_CON0_PLL_MMC,
 	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
 	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
 	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
 	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
 	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
+	CLK_CON_MUX_CLKCMU_DPU_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
@@ -304,6 +316,8 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_MUX_MUX_CLKCMU_SSP_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_VRA_BUS,
+	CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
 	CLK_CON_DIV_CLKCMU_APM_BUS,
 	CLK_CON_DIV_CLKCMU_AUD_CPU,
 	CLK_CON_DIV_CLKCMU_BUS0_BUS,
@@ -363,6 +377,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_DIV_CLKCMU_VRA_BUS,
 	CLK_CON_DIV_DIV_CLKCMU_DPU,
 	CLK_CON_DIV_DIV_CLKCMU_DPU_ALT,
+	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
 	CLK_CON_DIV_PLL_SHARED0_DIV2,
 	CLK_CON_DIV_PLL_SHARED0_DIV3,
 	CLK_CON_DIV_PLL_SHARED0_DIV4,
@@ -434,6 +449,10 @@ static const unsigned long top_clk_regs[] __initconst = {
 };
 
 static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	PLL(pll_0718x, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_G3D, PLL_CON3_PLL_G3D, NULL),
+	PLL(pll_0732x, CLK_FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
 	PLL(pll_0717x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
 	PLL(pll_0717x, CLK_FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
@@ -444,20 +463,18 @@ static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
 	PLL(pll_0717x, CLK_FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
-	PLL(pll_0732x, CLK_FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
-	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
-	PLL(pll_0718x, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk",
-	    PLL_LOCKTIME_PLL_G3D, PLL_CON3_PLL_G3D, NULL),
 };
 
 /* Parent clock list for CMU_TOP muxes */
+PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
+PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
 PNAME(mout_pll_shared0_p)		= { "oscclk", "fout_shared0_pll" };
 PNAME(mout_pll_shared1_p)		= { "oscclk", "fout_shared1_pll" };
 PNAME(mout_pll_shared2_p)		= { "oscclk", "fout_shared2_pll" };
 PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
 PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
-PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
-PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
+PNAME(mout_cmu_dpu_bus_p)		= { "dout_cmu_dpu",
+					    "dout_cmu_dpu_alt" };
 PNAME(mout_cmu_apm_bus_p)		= { "dout_cmu_shared0_div2",
 					    "dout_cmu_shared2_div2" };
 PNAME(mout_cmu_aud_cpu_p)		= { "dout_cmu_shared0_div2",
@@ -507,7 +524,7 @@ PNAME(mout_cmu_cpucl0_switch_p)		= { "fout_shared4_pll",
 					    "dout_cmu_shared0_div2",
 					    "fout_shared2_pll",
 					    "dout_cmu_shared0_div4" };
-PNAME(mout_cmu_cpucl1_switch_p)	= { "fout_shared4_pll",
+PNAME(mout_cmu_cpucl1_switch_p)		= { "fout_shared4_pll",
 					    "dout_cmu_shared0_div2",
 					    "fout_shared2_pll",
 					    "dout_cmu_shared0_div4" };
@@ -577,7 +594,7 @@ PNAME(mout_cmu_hsi1_bus_p)		= { "dout_cmu_shared0_div3",
 					    "dout_cmu_shared4_div3",
 					    "dout_cmu_shared2_div2",
 					    "fout_mmc_pll", "oscclk", "oscclk" };
-PNAME(mout_cmu_hsi1_mmc_card_p)	= { "oscclk", "fout_shared2_pll",
+PNAME(mout_cmu_hsi1_mmc_card_p)		= { "oscclk", "fout_shared2_pll",
 					    "fout_mmc_pll",
 					    "dout_cmu_shared0_div4" };
 PNAME(mout_cmu_hsi1_pcie_p)		= { "oscclk", "fout_shared2_pll" };
@@ -672,6 +689,12 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 					    "dout_cmu_shared4_div2",
 					    "dout_cmu_shared0_div4",
 					    "dout_cmu_shared4_div3" };
+PNAME(mout_cmu_cmuref_p)		= { "oscclk",
+					    "dout_cmu_clk_cmuref" };
+PNAME(mout_cmu_clk_cmuref_p)		= { "dout_cmu_shared0_div4",
+					    "dout_cmu_shared1_div4",
+					    "dout_cmu_shared2_div2",
+					    "oscclk" };
 
 /*
  * Register name to clock name mangling strategy used in this file
@@ -688,20 +711,22 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
  */
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
+	    PLL_CON0_PLL_MMC, 4, 1),
+	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
+	    PLL_CON0_PLL_G3D, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
-	    PLL_CON3_PLL_SHARED0, 4, 1),
+	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
-	    PLL_CON3_PLL_SHARED1, 4, 1),
+	    PLL_CON0_PLL_SHARED1, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED2, "mout_pll_shared2", mout_pll_shared2_p,
-	    PLL_CON3_PLL_SHARED2, 4, 1),
+	    PLL_CON0_PLL_SHARED2, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED3, "mout_pll_shared3", mout_pll_shared3_p,
-	    PLL_CON3_PLL_SHARED3, 4, 1),
+	    PLL_CON0_PLL_SHARED3, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED4, "mout_pll_shared4", mout_pll_shared4_p,
 	    PLL_CON0_PLL_SHARED4, 4, 1),
-	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
-	    PLL_CON0_PLL_MMC, 4, 1),
-	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
-	    PLL_CON0_PLL_G3D, 4, 1),
+	MUX(CLK_MOUT_CMU_DPU_BUS, "mout_cmu_dpu_bus",
+	    mout_cmu_dpu_bus_p, CLK_CON_MUX_CLKCMU_DPU_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus",
 	    mout_cmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_AUD_CPU, "mout_cmu_aud_cpu",
@@ -830,37 +855,13 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_cmu_tnr_bus_p, CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_VRA_BUS, "mout_cmu_vra_bus",
 	    mout_cmu_vra_bus_p, CLK_CON_MUX_MUX_CLKCMU_VRA_BUS, 0, 2),
+	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref",
+	    mout_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+	MUX(CLK_MOUT_CMU_CLK_CMUREF, "mout_cmu_clk_cmuref",
+	    mout_cmu_clk_cmuref_p, CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
-	/* SHARED0 region*/
-	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
-	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
-	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
-	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
-
-	/* SHARED1 region*/
-	DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
-	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
-	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
-	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
-
-	/* SHARED2 region */
-	DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
-	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
-
-	/* SHARED4 region*/
-	DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
-
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
 	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
@@ -887,7 +888,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_CMU_BOOST, 0, 2),
 	DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_debug",
+	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_dbg_bus",
 	    "gout_cmu_cpucl0_dbg_bus", CLK_CON_DIV_CLKCMU_CPUCL0_DBG_BUS,
 	    0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
@@ -972,8 +973,36 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
+	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+	DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
+	DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
+	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
+	/* SHARED0 region*/
+	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
+	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
+	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
+	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
+	/* SHARED1 region*/
+	DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
+	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
+	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
+	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
+	/* SHARED2 region */
+	DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
+	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
+	/* SHARED4 region*/
+	DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
+	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
+	    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "dout_cmu_shared4_div2",
+	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 };
 
 static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {

-- 
2.49.0

