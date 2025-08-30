Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6592D0C8A;
	Sat, 30 Aug 2025 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571324; cv=none; b=f8rnt/cwuZLC/eieB+RDwsG8vrATUWx+K8JIzV3rCYrVNzsI6Zn+dP1JF7ua0uY+r1wnADri36+XqQmw2qCrXaKho2U5KBnBEPr3wbt9XRxqkGXAQybP4njPHsZzdD/aCl1f9pEimX7gs5FVcjG7Y+/VIwRMRWqqeWp5lebHVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571324; c=relaxed/simple;
	bh=eG/sqPWtkgzTsSio4RUmLrcfnT+7wa1K05i+7zQ30C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUtPi07lcTYfaykYx5RgZtMuLSIaMihLjspAXQHTjRF6PdwBPmutTDwOYOra9lGTa6Fm43+8BCeAE0YDEGaazfRsGBItkF/XJ0TMAdUg5d9GvNW87XylI3lLmZKDzvsV47saJBYE7mLBSwC0P5Ja67XsusHRZ8csEv95ShxDLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdwF8qkM; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdwF8qkM"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-70ba7aa13dcso25285466d6.3;
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571322; x=1757176122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l20Ejg3eGN0MMaA6lUsOBsRKWq9HxWnc6pYE73v7Hlc=;
        b=PdwF8qkMPDdTs/jQNINFmNzKWMNtwWBAXAN0sgcjJkaCM1+toCxzbiC79cuhJukssM
         xII4g0FhSx4fQsrFF68ZgVy6dZ8LsE4Vb5GRen3hccmo2BNbG//pdaeumEE6fhbZiz49
         F4CANjrIAFV4eHSAeGYSS62Al/ijC2XRZqvaE95tljUpQLnRra0KXarVYaQyhOhE91yl
         hVelcUeS5Zc6BYj7lmPhOCXckGO9Mbu2hGwDPvebCBaXK3mImJ7qp9BI5Z7OmKwcoBVW
         CB2sWw47LTlwKVEjV8YpOolloq5J7rNDiWEi7YWq5iCs4jKG+H7X8iOtynFsYqVd1PcN
         gvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571322; x=1757176122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l20Ejg3eGN0MMaA6lUsOBsRKWq9HxWnc6pYE73v7Hlc=;
        b=amxRitNRQ/j+EjwmJsnBDaSN+kt6GyRr1TB5xwVuNpDmSnHuKuT4+5NDIz7eOx5Q+q
         pZowLhNW95NHKMGUNCtAWudtd4gahfc7r9VuZth1pRzid7ZM4ck8QJlnhyq8rejHdR7w
         kssNVGdYf4CDhVznF5GztaeAXYR5hW7gwXUa5WmfwiU2+uR3nrcgBcmktnHnt9d10ymp
         kJe3JIskxNTBTCTBtijN1hqm/AuzU6OU1yCEbj5hwusIgrvSv+ef/bPFRslJMlFxRexR
         1T1Wo29z1wIXJ4AZNxph8snhWU2BzxF8fawQeF0MLqvaipxkhRNbkKX/zKcKF/wMNV9M
         UcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRM48uTaPubIQXDNgHvNB+Cmb3frNwv36iNxR48/H4yey2r31GCnA/ZuUDQdnYKXDFE/f5my8gRyIu@vger.kernel.org, AJvYcCWkHSp2lh8dznyarXDv/QFxxHu3NRmcuk/8ARscSDTN1LHsOdr/yXl/88fE431vVNXOIcYot7BiH2zGnOSE@vger.kernel.org, AJvYcCXNyZzsuSiVQ9yexdBEgG0LlYtBqU8wKhj7o8HuxFIiyHsBkZOekESuBt99Y7/BRVP8jLJa074oYSSK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7lqbXIqU/zDkHtUgscd9fniSzmUKBmT70o01k1Ui3KF2qWN5a
	w5cbSc/Do19Mf7cbdL6CSFsSZNE6ONx+FjlnnZ57kHCUyI+Lg2UVup2i
X-Gm-Gg: ASbGncsQyFgWVc74ywFzAKLcoeqEWrhhOi/GaSPVO3YG+9m2mviNmif98FW0Nra6Gqp
	CBgy/ZVepmv6mMqZRDYJ3hG58pZuVVZ/yazUcPb46saWuesHUbujAVSm6rNYBxI8Oz53B0cyECj
	xMDjRQS5zFUjZcVN5EDcBGeaBkFKCjfAqziZDFMrPslgVDVuWKcWkq9EVmAncJ3CTWsiSK05Pnt
	qDqFCVGjwIZNJhJ3DbRatZfT+lF2Ax9cLa3cGAu0/qWtQSPDrtW5flzgXU6pyr8LwAamWR6iGUp
	1tDM/SxCAoVGqhoaULIRvr6kSrb8/UhFQFqFAhGd6+PIT3c6UXO9FWn+cW0MBrsRmULwwcPdd71
	5Oi+2eSW0qsXhxU9C/Rlv9M6mowS+
X-Google-Smtp-Source: AGHT+IGgD56T8rFSPjDXiXJt9jRvp9L/KlBHuDxS4C1LX1Fq+IuTna6soZQ73OXkifSOFU1gsKQr4w==
X-Received: by 2002:ad4:5aac:0:b0:70d:ea79:b37f with SMTP id 6a1803df08f44-70fac940ad0mr26642316d6.62.1756571322175;
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:39 +0000
Subject: [PATCH v5 2/5] clk: samsung: exynos990: Fix CMU_TOP mux/div bit
 widths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-2-7c62f608309e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=4124;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=eG/sqPWtkgzTsSio4RUmLrcfnT+7wa1K05i+7zQ30C0=;
 b=FqjDR3kxtVKWkMfPKMbdpzUivCRJC3agpWnZo2mbw7MmxwpKp79EfVLlkbkY6Ra3EANpcmECo
 VBq21rBMxfvBgeU+JMbz66hcgPA7l2PO7aR/GL7yTt0oef4SE7Q2n7n
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

Correct several mux/div widths (DSP_BUS, G2D_MSCL, HSI0 USBDP_DEBUG,
HSI1 UFS_EMBD, APM_BUS, CPUCL0_DBG_BUS, DPU) to match hardware.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 12e98bf5005ae2dc32da0da684a15133d64ed305..385f1d9726675b37a901e1bb6172dc839afbb209 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -766,11 +766,11 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
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
@@ -782,7 +782,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_USBDP_DEBUG, "mout_cmu_hsi0_usbdp_debug",
 	    mout_cmu_hsi0_usbdp_debug_p,
-	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 2),
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI1_BUS, "mout_cmu_hsi1_bus",
 	    mout_cmu_hsi1_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_HSI1_MMC_CARD, "mout_cmu_hsi1_mmc_card",
@@ -795,7 +795,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI1_UFS_EMBD, "mout_cmu_hsi1_ufs_embd",
 	    mout_cmu_hsi1_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_UFS_EMBD,
-	    0, 1),
+	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI2_BUS, "mout_cmu_hsi2_bus",
 	    mout_cmu_hsi2_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI2_PCIE, "mout_cmu_hsi2_pcie",
@@ -869,7 +869,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -894,9 +894,9 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
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
@@ -986,8 +986,8 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
+	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
 };
 
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {

-- 
2.50.1

