Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2E26A1C4;
	Mon, 25 Aug 2025 05:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101082; cv=none; b=gwui84BA/QJLhL5/5mBTCccbHNEpAPt9a+jpLfsJB4v21ZfRMbaVlt+0uzpBJz3uDZsMI8/7v6Qjcob0eBTnRtfSa/WNL4RTHbn5+Oj6hZ3BK4OjcEhetfZLEuuJjv9pJCfxVz4Nz/RfDtmk6r8J0MTnfNXw8w/s1698CxWbmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101082; c=relaxed/simple;
	bh=20mWLZEGgEbpDt41ggUQHBXHpARZ9CqTlFdX4+rxceg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTkX1pin/y3pH1a+rKQ/0qyvL4QLG4WSialqHNOws6zqZv6UzfO6RgZVmavKLEuKcRMkDM0ux6QPE3dMOViXxpERkXOeE/xzM1ZiyTdFujOPkXNm8UznBzAV7nTJgZ5w2pFO04qaTR6nh58xaEA+c9c4yPFrq3joBX3OSbPbd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6JmBOIF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6JmBOIF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-70d9f5bdeb4so19056296d6.0;
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101078; x=1756705878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=K6JmBOIFKIk0M1RYBrRxjtZUGVQ5AA5Q1TQoCqRGCbK0QC/DWKlQ7LiU+bva5r+hg9
         niMIl3/9i6gmP4IwHyHytVmhq2DKlMsFhWpme5DtgZxjSuI/02vTm9xPYoC9KAQ/8J7o
         p2GzMQPg+jUME9nsZoz2eABKBuZ6ZRuAh8ecpAKjA0WExtq3KhuU2sYMvTj/Vt5Wregw
         0RLofHiQRkLyVYWEhcFajih0Y7ZEV9uneBsxrd6t524mnkTCzeW1KPhgia5mfybltCO6
         7N/sgEoVEYTMf7RXqaJCo/khYySAVlozu9WAwCxR1DnsJQn4PNydne6T8ybbWvLj+xjz
         qDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101078; x=1756705878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=igkvcQ+knApAVIikYcPkKsm1iaynd0v97AgZctvoO/EOdcDa2NSWJ3W1lb4eWdGJjz
         35w31NEYlhwcSnCqVHa7g467bQv2DPSiABqCCQRzT40fPm9B6mnfBlPcRdwPnCq74DqW
         7mSQ2OAIiqN0orzYFV62DPS3Sz20gJAOEA2eB0IgtZtracGuOQiB0k9EQhj4+JdmlMnd
         hc0TE15wyrRjEUUfqkTlH/jjLH4VA8RkiC/EUBnZNGIQosKgNkHCu2UTS3yBTWh4eO9P
         r/GhxR9uOYniB54qQH+tHpbYc8xR51Ile4euiM0UKCxNY3zltV1J1NrlFRzUIqyeK762
         W7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWccam90qtAKzGrRKepCWHRLH0zueviCBttuIhod9xwSS/uy/ky6EaZjH84ez5NjgRZEFcaLs67FSg+@vger.kernel.org, AJvYcCXGWtDd9PG2de4Sj3jMhDn/ELyGd6W1dGhG/BfuSVSqrtN9XN4tzYXK4UiFNXFFEiGT1c/kGeqvByx2@vger.kernel.org, AJvYcCXeosI0SRRCkDKVqNWpom3w8zvpXmpF7PTLbLdKHpUYmYRJXaoK9wU2tj+yVG/nMVTUDgtjvm6tYF42Ru5H@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92CF8XJANidEQeGn1Tk9JhNJG5uksTVvyfTJa/yxFe5YbCHQE
	urlcoX5n/LBbwPVHg27ItvNdGQ2QaEgu/n5LXUDoOM74xQoWTLXvZGFDQezidvhV
X-Gm-Gg: ASbGncsFofUd4nv9HcZq9gpwkBcXHHJOmGj9wKbySJHkRKubKQnOr+8cME/VnCohzou
	M2L9XDSde1gpMBgmCGSxYp4kLSQkai0g9KiA7M4nKZVUOMOPc4epnAbd/ZlKeZEwn3+oIvgzJsg
	sYWiHVSLZH5VURR8ZI+Id4HiG+Bnofvrq5HPLevlBJWXmJykiOWriNk5MPs0jMKID39PYXCLFaa
	eabbO6vUntaEUnp34jq70TyDSANXTk+qpeNSiYJXBz0glor/fiuA5M4fe6gaign8qjKgsfOHIik
	8lFq8iUdusCwmChVLn5blWDX1QZsI1MmDr9qzAd493HofuuYmBi4sCifziUiqyY9I3pfBT43oTW
	Az3QgkSZniKSbiCui6XerTuZTOpjPqQ==
X-Google-Smtp-Source: AGHT+IFQlUtFOy5uV9bcc38nkfyLfs6R38ntew/7v3Vz12/PxTN8KVE2tNFunOishso8IRIS4DbLcg==
X-Received: by 2002:a05:6214:e81:b0:70b:a2b7:21cb with SMTP id 6a1803df08f44-70d970a5f43mr120868536d6.9.1756101078397;
        Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:17 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:15 +0000
Subject: [PATCH v4 1/4] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-1-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=6467;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=20mWLZEGgEbpDt41ggUQHBXHpARZ9CqTlFdX4+rxceg=;
 b=Zri0g7KTRqMlS6NXZPNPZ2GsLp22QhlEGJhIAojRC7rJQvKzBzlzXB2Hhzt6LVv14Vxw22iGu
 Zh1DMhIjqkPBVXfKgGtLVZwq2cp9QQpmGEbBdIjw5tvSITyd+NIoPPq
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

