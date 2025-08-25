Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4541C4A0A;
	Mon, 25 Aug 2025 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090548; cv=none; b=bWWLAyasIiX4zsoDl72gcv2NgDHiwlbmyjJPVs5I7vSjxfS6P8bwhU0CmJhv4Bzo8eJrNqZnaE7xvxrRC7mb/8VqXgjLSDkp1Wob6/6Y/g7HhRBxnyx7Fgq9C/BQ92NDcJlNpnj9ykX/ofRhvvWBtJ4FpKeY+Xqcwu0uyISmOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090548; c=relaxed/simple;
	bh=20mWLZEGgEbpDt41ggUQHBXHpARZ9CqTlFdX4+rxceg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crx0Ee5/X8hs/aZSOb6iZQNCiRD0xOUaZFrQxD5/i+KjGeqGyIA+f7VKg+TMH94MLsJAKEoet9U092zfUMuE0xEEMcniAxkiDQ40g/4lRy68E5U7Atks5AIxH5TEGjyL6bJq8L4ZFSA5yY1ttNoZ/YzRbF6HvEtaurWIWWRYwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL7ApEZV; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL7ApEZV"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b1099192b0so70426551cf.0;
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090546; x=1756695346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=JL7ApEZVL9OcYQxWz0qox9sZf71dFhK3plxC7hRVbh275uWFJF5DUfe96wSNDUKR+J
         xmDnmm6V6vDLPmMGeUEyTUC/5FBWI/C08PzWne8O6wLDKUBj6pnZWPpvVK64L1imU8nq
         HwrNZyVQ/TYWFTi2XS4yCukEzCEsyFl/6cX5+3u/WD5Gdjt4dUMDjSpl9Ahs3P605dyt
         UAVRGg4g9GhDVJgbp+67jREYvwtHAangCnNU7ACrMwC6GvG2gZRlf77zjAmII+Xf8XU3
         V9VC4Y/PlpzFpv9yMi4q52lm7KPJ8zCrsxKznk9b2204Pi6W8CO/Jodp2Ouf/ugG0lxz
         JWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090546; x=1756695346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=Mwn1JaWsnBS2EwOJSaBxn+zkeHngzo1nDRv0ZsmJx0lR4qcQRvNR24AHWxenlUMybW
         HWmtp+G6gDxH19zkLBFvp8mK6jKDqacnoGwbEosOiyzzvj1k8kJKMCVcmBQKaLSnlm0f
         2UxQ0Yqx8oBLK+XHZ/VP6ZSOq76ivT/Wa3bGCvZMNAvMvx+JEFSJiL1Az9k35GfI1jsH
         cRN/MlzexKKFLFR8Elb2k/2bNa0ESa1BG23EGAMqdLnHBWrZji8nTkoe7UJOB7Iw3sOQ
         DW8CKMzIZpLU0P2a/6/taoaEC84PjKABMLO2KusnLuR5boZ/0o5gzbQEtXbtX8KHoPNR
         yVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+cCJfFg3rlqLbU1ztxvfaHaTzi7lE96w1kHugWph5MLG3HU5il6snvMsEL8RUae0U80ab2QDBwXVYprgP@vger.kernel.org, AJvYcCWhtqDhKqGX5rrNMuc9AITNvoeNolVS+beolMu4f5Foi0VRHjVjdwBiDBUwXXjCsBArDtftUAKwfEOx@vger.kernel.org, AJvYcCXoyHGLfKDDBN12TcKw2hevDjVUvs1Q6CZumhrlqQ1tfDzy6zFnbUVfZYDngg5dzhs91iN7eRVgGsID@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIF073mdnbdVuT7EN6WMe0/vK7nA7uEn+4UljnOpmOJFgb0Wn
	zk+P7bT/mUzRXd6kDo/ani6UpUIbyCM+SfitqfwAN/d4ObYCEwDaFP/C
X-Gm-Gg: ASbGnctY8Phn5ErVrNzMp1hFKG+MF51yCPhov/ni719YC4Nd/7Uo5/hzaAnrUnd8wn8
	oK782vYIllTqB4Dt/ndwhZ2r7O+COKTYETUg3ORCp6qQWf9J5ue9Fo80mB96ku1QhabWN8yV9Fv
	S6rB20BfVu/kwAxYH1Cv9pxiy6G0tbaB9TuA8KcF269H+24WcV77QfQUnyjTrS1fbK30Ou231B3
	LMc4FpatLBP7UlNOtgIJDjLhhqsuXkVhSEMbYRCcEQ+3AgOkJm+7XMXP0fbuOUlpl5DG+GW2VRw
	iSgnirLUuX2teoMO878jtjM5Jij+k52s0M6vwZH53x/sLTnkKhtCG/56bAnHSYGt7VEE1TX82iy
	fUYon8P/RHZ2ljjvVVuME42dfxOKi/A==
X-Google-Smtp-Source: AGHT+IFWf+0yFKOAjNKcLyByBbWIg5yxPlSf1hO+uUtWIIIIVmxke6gbxyvdbizcCOTEM6m28gQ2yA==
X-Received: by 2002:a05:622a:144d:b0:4af:195a:b92e with SMTP id d75a77b69052e-4b2aab49916mr128691271cf.39.1756090545693;
        Sun, 24 Aug 2025 19:55:45 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:45 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:43 +0000
Subject: [PATCH v3 1/4] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-1-8838641432dc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=6467;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=20mWLZEGgEbpDt41ggUQHBXHpARZ9CqTlFdX4+rxceg=;
 b=9eQUrHFA6JWiUOj54Of+ZRMj8QCvqjd9UJnx8FYg3p3AOXXkhni3E4qcxIyzUy4XPrPm3x2Zg
 y6ItJ8CskQ1DTmpTiIaeN6nS9qzy743P+DY2EByLJaf+1FfzWVulCey
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

Correct mux/div bit widths in CMU TOP (DPU, DSP_BUS, G2D_MSCL,
HSI0/1/2). Replace wrong divs with fixed-factor clocks for
HSI1/2 PCIe and USBDP debug. Also add OTP rate in ffactor.
These align with Exynos990 downstream cmucal and ensure correct
parent/rate selection.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2..105ba0363 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -759,11 +759,11 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_CMU_DPU_ALT, "mout_cmu_dpu_alt",
 	    mout_cmu_dpu_alt_p, CLK_CON_MUX_MUX_CLKCMU_DPU_ALT, 0, 2),
 	MUX(CLK_MOUT_CMU_DSP_BUS, "mout_cmu_dsp_bus",
-	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 2),
+	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_G2D_G2D, "mout_cmu_g2d_g2d",
 	    mout_cmu_g2d_g2d_p, CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
 	MUX(CLK_MOUT_CMU_G2D_MSCL, "mout_cmu_g2d_mscl",
-	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 1),
+	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
 	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm",
 	    mout_cmu_hpm_p, CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_BUS, "mout_cmu_hsi0_bus",
@@ -775,7 +775,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_USBDP_DEBUG, "mout_cmu_hsi0_usbdp_debug",
 	    mout_cmu_hsi0_usbdp_debug_p,
-	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 2),
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI1_BUS, "mout_cmu_hsi1_bus",
 	    mout_cmu_hsi1_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_HSI1_MMC_CARD, "mout_cmu_hsi1_mmc_card",
@@ -788,7 +788,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI1_UFS_EMBD, "mout_cmu_hsi1_ufs_embd",
 	    mout_cmu_hsi1_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_UFS_EMBD,
-	    0, 1),
+	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI2_BUS, "mout_cmu_hsi2_bus",
 	    mout_cmu_hsi2_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI2_PCIE, "mout_cmu_hsi2_pcie",
@@ -862,7 +862,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -887,9 +887,9 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_CMU_BOOST, 0, 2),
 	DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_debug",
+	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_dbg_bus",
 	    "gout_cmu_cpucl0_dbg_bus", CLK_CON_DIV_CLKCMU_CPUCL0_DBG_BUS,
-	    0, 3),
+	    0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
 	    "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
 	DIV(CLK_DOUT_CMU_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
@@ -924,16 +924,11 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
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
@@ -942,8 +937,6 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    0, 3),
 	DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
 	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
 	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
@@ -979,8 +972,18 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
+	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+};
+
+static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+	FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
+		"gout_cmu_hsi1_pcie", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
+		"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
+		"gout_cmu_hsi2_pcie", 1, 8, 0),
 };
 
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {
@@ -1126,6 +1129,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
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

