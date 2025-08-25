Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263ED230D0F;
	Mon, 25 Aug 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090551; cv=none; b=iwQLl+HcFSDBgO2pO1ASg3Owx2xja4/wszmTDFaOuvWACPQfS1F3ZXK7Nd0MZDS1vglHl9s6l3P7rRS8UMxTaQre3lHRpk1ILdD/MQyWDzRkCvfis+WOmcucFu5WSve7eSOpfFS115h5LPRdPe7flEqZpVXZTgb+RUpxy4g9Vi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090551; c=relaxed/simple;
	bh=WFncasnVl4c9X1Gr26kTZOOG/41f6AQgcFmAGnTMK1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMWS0G0S3gIZAf3pexA93+lKX+MVIK0JcOdYLB1me1IQG8HWYmvtwRPKiLvorhIYWNILMtTxtYpSuq8EfFmwNBpwWXIgtz/7nhAvNJO7rB9uQJ/UqdA1kpPeVMU+caBtVvo1eg40jESGibpYjBguMxtOHtewdNgU6rQKhmoqG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5f+c9cq; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5f+c9cq"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b134f1c451so57372061cf.1;
        Sun, 24 Aug 2025 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090548; x=1756695348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCe5L0csbysWCAQAXGClB5ZlpD9pY8zUZkyz6n8jnUY=;
        b=B5f+c9cq9HMfd2DBL2K4Bsste3De031koUMzeCxeif3SvSW2phm2+gEE1DLCatiknf
         U4C5CC5bM1pLKSsmNCrz+y3Xux/x1lHcxcymLavZQVI9b+LAqY3ZE6003amAn/OPHCkt
         EPjy4xV7kqBnPtCKzxgbipk9J0YO8W5V0bvkyFEIlDAQy7dK2F48Xkh3wXBv60iVbvgF
         37VO1bj4z1nwW3USjJ20LMWpvrub12uwxt9BoJSGTXUyQpAxkuPZSSUi/badbzkw1amq
         CBPzvxcBryIKOQgtTx5TCCIDzdvlrFbcZlMD/SppzqZGOp2Yy8a5dyZspnVI6SeMIDLE
         tDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090548; x=1756695348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCe5L0csbysWCAQAXGClB5ZlpD9pY8zUZkyz6n8jnUY=;
        b=BZmTiDQ9P7knG0p6AYeCjWh3DZjhYbokhdY6YyvqFM2tD9EVYE2QSOcC8UNgXqfo64
         AJ+q0uKGqnkSjXXHZ51GEo9KvyWF7XOgrFcOLsXgKzDY9MGwtvJsQfYdqxxi0Qa573/X
         X0OrpI5obqp1dDsVCKeD/AfurcyJuzUjwZrVlvg/8CIgntyEQCfX2tP8khEprzmElhzz
         5nEU0BcSmT+6N6x8pLYEYr8FylxLO/az+2Uy9TKaHwO51oalkEpb16Zxic+w0XQbJwU+
         9Fy+KvNOsJ89RhLnnVJeZ2V3qS+FsxSLWgLsYz3ctoNLMNZy2iGr/qXT0xZeUjUXu5kn
         bqkg==
X-Forwarded-Encrypted: i=1; AJvYcCUYzz3AZ9rcrrOCjDIGmreJHDJqnbDmOblgsd94qbTyaTZNYD9Ij9t/Zo75zKvQmh8lEmI0JwMJW1ND@vger.kernel.org, AJvYcCVzz1w7m5b8AF5zz66yl9ie6j5Cjey0T+/0iudzYV6xSVsER4lTD5KmrpB0sxsTPwGMKJ2YLL8FEqBZ@vger.kernel.org, AJvYcCXuNNtxSsrujYH6qXMJvbp67+AW+KA6Qm1XBX6gWVivLFgCN8syjPDPspKZwDU05LwosLqqtqvZoUPtDShe@vger.kernel.org
X-Gm-Message-State: AOJu0YwpG94uQnSpU7D8CmRHSediML8LDSDobNFZR3CgWR5piIw0f6lF
	X83gfPApxzbYKDwCPR/g5GTxjNcES7Ty3EojvFjFmAmW6/AWFyvgwT0C
X-Gm-Gg: ASbGncsU1QjF6ijADKB/J2YzrBsjk+zcHJ4VpcH0YdjxYrvQ5CBsWaTpgKPBCFKodoT
	OFXAwXtVNazAB72eOFp5VBuMGw05yhpr/R/oVsXxm80XzIrPqVGxqYMZBZsbMogZ/TT8Jwfrx+k
	T83WoUkCuZOHwiQFiLGghLxj778zIyFYg00n+TG4Aob7OjxGDYjNcOt4cgw8QwK7qoH26/LqZ/a
	FEe9aSH/mFIyr1cQZF1glLVabKH9cvgkOWGC0MW5mfltm68U+gIHZrgEAIyJlPrzIJ84YQq8lAC
	X55dJW1NjHjIPV08bV5Pv+9A0bbCMLnA9V4o9CofZEvfLLhJ8d4ao1wF9ato6pqRMVCkqUgS+N7
	iIdP/60tYzTEX8PAJb1e0g+54nTkAtw==
X-Google-Smtp-Source: AGHT+IHgUZ9+Jx3/fy4Dl0nJjG319S4p/fQ+Si7LSCfcEkeSLWjn+z71kEZ/k9GyFMLhulYyDv0T7g==
X-Received: by 2002:ac8:5992:0:b0:4b2:8ac5:27c5 with SMTP id d75a77b69052e-4b2aab52f84mr111438831cf.80.1756090547883;
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:46 +0000
Subject: [PATCH v3 4/4] clk: samsung: exynos990: Fix PLL mux regs, add
 DPU/CMUREF
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-4-8838641432dc@gmail.com>
References: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
In-Reply-To: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=10122;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=WFncasnVl4c9X1Gr26kTZOOG/41f6AQgcFmAGnTMK1Q=;
 b=FT6mepiwgP1FOw/ojGNuM3AGv/aJwejE//K73Nl21KtOkxB0DscG/Zb6AFVy0H53O9WVtvQmI
 Z2YTGD2k2BkCWiBl4qgdCAmnYnpSlVdcbw08DY+auR7LaBSAJpbjFOX
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

Switch PLL muxes to PLL_CON0 to correct parent selection and
clock rates. Add DPU_BUS and CMUREF mux/div and their register
hooks and parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 97 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 59b05ea55..d4d932c48 100644
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
@@ -458,6 +473,8 @@ PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
 PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
 PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
 PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
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
@@ -689,19 +712,21 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
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
 	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
 	    PLL_CON0_PLL_MMC, 4, 1),
 	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
 	    PLL_CON0_PLL_G3D, 4, 1),
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
@@ -974,6 +975,34 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
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
2.50.1

