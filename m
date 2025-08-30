Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CF52D3758;
	Sat, 30 Aug 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571327; cv=none; b=bYvLtnWKvU/s3dV9fUAZ5H4x2/b9chw5tHwlmVvxU7PRQMbX0B3/6q76a1xNjIlJj1QiERjAoO3qpnIc1h9WfLG2Wi1L83ZaS802rlS1zT42TimVAL+Qpa4xSlKeX4Wk+ocBnilJVJ+9PvateJc4OEQOtPQy3wgg33U46tLR9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571327; c=relaxed/simple;
	bh=5IPuwTPYxNGQIBDJPCqLNlhrVjtDtNs6m7JTklARsrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWciIvx9isruxRzLxa8iMxTAa9gljU6S+MhuDHb06JwKq/bG32jVjJPdYNYOtseD0cHwvSwBsPP3TkEMTUcEnO359nx8f3FQ5PN6ppD6rzogS+/vX/dDVi69CwWWFSVU4PvhZ65brMZXqDVS9sEuqviNVk8v/WXSMdKEgZsrakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L12eiNY/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L12eiNY/"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70df91bdc53so23391056d6.3;
        Sat, 30 Aug 2025 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571325; x=1757176125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emZkWDIm/t5c5gZiLUdjkY64mxwXxHIrDh9PX4vUBWQ=;
        b=L12eiNY/PA7acm5XYaB7mC3xswJclo4QdMzGfAsB3NPEGaAZrdyvtFSG+OAmAv0EBP
         0QZvHbwNeecdV7g2bqGngirgFJK84IGCrmX0ZdoPCFdrvreAHf8sXNSBh+KfcK9qTY8h
         hBOdIcf6u8TEIakG+WQ+xqYRcq5I9DJc4evcwJVipTDijDTRAhi5lPNGUHt8oYgGAnT8
         RXrQP10YOrUxcCw8KW5fwAWIyUFcTrW3/w+YBbVAZ5GXl/bdRIqj/DRaYjRWqvbDzRTv
         TDkrHntnf/mj1fRFnvxsHAV6ya5ZBXPT4EArAIaNEvEVSwpiTqwelqUCD1rVxxG1NksP
         GUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571325; x=1757176125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emZkWDIm/t5c5gZiLUdjkY64mxwXxHIrDh9PX4vUBWQ=;
        b=DbdcouWM5CP502KTmiYt3R41KqcaMqNaEs5Sj5oDKS2BUZHxf+0vEMyxAeS07kt6bR
         CXyeZJbC9PpRAS8jvklMMcnXYik3fbF9sL0EZWCiEPm7kNG4lX+6xIswZnDBWWviIAZw
         dxaAqOabqDnwHQnIBFWNyYqu+Ugzc+1jUGhTkIvwy6E8lxYvMsHHfs1wLYW9+8K5K13G
         NC6gLE3lOTaZmPDD4uMHGkf+WXSJU1J4KRQFajc+LkUqoARdPyiA/lXRslOHUreJRAc3
         yRguBXNOOfO9I4KG7fSSV+zR9dS/ljL+miIA1V95lE/4zzefEx5+vbttv8XBl5GixXrd
         CVXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6lHul1m9+b8PZ/HpoOoe6f2zd5DCUWyrcAf7RVxG78cOW5picmoYenAp9NqeLhzdXLHJawj/E4u4f@vger.kernel.org, AJvYcCVDuuKB/4OkGx0xkCQGhbA8QcbUoVjmBIJCMRhd3l+mymgmM0vUK0xqxPBKAwHpdxAqdrCj9dGSUtdoNIo9@vger.kernel.org, AJvYcCVJsGtIfqJaXg2j3XVyKI93MOMLLpKLwiTWq+nMWeWQssUbCnYfZtKqQoDcYnrglrarX1A+PV5uz3+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8mad9Q5PXsbkPomIss0aEYzIIbqO2VpIz2ZangxNm1BM7zhs
	LFJbguhprl+wv1qTFAWpaKL9vUWn8OpzqjqT2VroTa6gi7FooJBWJNv6
X-Gm-Gg: ASbGncvJEdwNBF5Iqm9PITBLMZ3Nua96niXrE8xYWeWHjs6gUqehf3K//gztqt31l4x
	BLaH+xS5fZ7C9P1B1WZfVxPiwnf2zSpccWKuGZ6jdIJgDSoyv6/D1kB1MIsS8ddJwbckxLQ67m0
	fBSTYhDlb0U+tJDtFbQd40CHjBAL8wtnqlkRWj7g6mFSIR4+kAxWQP6PxraPBLh9EMqVcaZvWuw
	VjK4BqbBvC4ZnWnoOC25/KkzqgZoHawp2TbkPNwH98x225GyXvApvqNP6e47BcQt7P3Afs9eXj1
	MW1B2LPfwezaLWDedHtPARKUcHcukEX3TCgqqYtoWZ4f8X4co7TLrMr6EAI3UPD+3esRLaryEsP
	BMd6WxK0xraibg9ouVdpTpuKuxMy8Jy9u79kRjLw=
X-Google-Smtp-Source: AGHT+IFpNpM1hvW9chxsQmi7d0czGq1O/qS8qHHkp52KwpLCkNld7aFsu3xbEQ3CJnMfEy0jJkWeFQ==
X-Received: by 2002:a05:6214:5010:b0:70d:d36e:964 with SMTP id 6a1803df08f44-70fac898f06mr30513146d6.39.1756571324515;
        Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:42 +0000
Subject: [PATCH v5 5/5] clk: samsung: exynos990: Add DPU_BUS and CMUREF
 mux/div and update CLKS_NR_TOP
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-5-7c62f608309e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571320; l=5654;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=5IPuwTPYxNGQIBDJPCqLNlhrVjtDtNs6m7JTklARsrQ=;
 b=CvwDr0wXhmzZT+RELAeJJ1yiEwqe5yMi7s5f4NyHS4xmHtZvt/7vrTANzyvxMaEuG7HHsuMwn
 2NmBW5cswaGDDBohXFGDWB0dI0sOYtTb9DOG5TIzsGVpHBgr+EnMkjN
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

Add DPU_BUS and CMUREF mux/div, wire their registers and parents,
and update CLKS_NR_TOP. These use the new IDs appended to the
bindings to avoid ABI changes.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8571c225d09074cfd1c299879c1e6b4a7322520a..91736b15c4b4a0759419517f7b04dd0a8f38a289 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
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
@@ -253,6 +257,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_CON3_PLL_SHARED3,
 	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
+	CLK_CON_MUX_CLKCMU_DPU_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
@@ -311,6 +316,8 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_MUX_MUX_CLKCMU_SSP_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_VRA_BUS,
+	CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
 	CLK_CON_DIV_CLKCMU_APM_BUS,
 	CLK_CON_DIV_CLKCMU_AUD_CPU,
 	CLK_CON_DIV_CLKCMU_BUS0_BUS,
@@ -370,6 +377,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_DIV_CLKCMU_VRA_BUS,
 	CLK_CON_DIV_DIV_CLKCMU_DPU,
 	CLK_CON_DIV_DIV_CLKCMU_DPU_ALT,
+	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
 	CLK_CON_DIV_PLL_SHARED0_DIV2,
 	CLK_CON_DIV_PLL_SHARED0_DIV3,
 	CLK_CON_DIV_PLL_SHARED0_DIV4,
@@ -465,6 +473,8 @@ PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
 PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
 PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
 PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
+PNAME(mout_cmu_dpu_bus_p)		= { "dout_cmu_dpu",
+					    "dout_cmu_dpu_alt" };
 PNAME(mout_cmu_apm_bus_p)		= { "dout_cmu_shared0_div2",
 					    "dout_cmu_shared2_div2" };
 PNAME(mout_cmu_aud_cpu_p)		= { "dout_cmu_shared0_div2",
@@ -679,6 +689,12 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
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
@@ -709,6 +725,8 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    PLL_CON0_PLL_MMC, 4, 1),
 	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
 	    PLL_CON0_PLL_G3D, 4, 1),
+	MUX(CLK_MOUT_CMU_DPU_BUS, "mout_cmu_dpu_bus",
+	    mout_cmu_dpu_bus_p, CLK_CON_MUX_CLKCMU_DPU_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus",
 	    mout_cmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_AUD_CPU, "mout_cmu_aud_cpu",
@@ -837,6 +855,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_cmu_tnr_bus_p, CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_VRA_BUS, "mout_cmu_vra_bus",
 	    mout_cmu_vra_bus_p, CLK_CON_MUX_MUX_CLKCMU_VRA_BUS, 0, 2),
+	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref",
+	    mout_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+	MUX(CLK_MOUT_CMU_CLK_CMUREF, "mout_cmu_clk_cmuref",
+	    mout_cmu_clk_cmuref_p, CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
@@ -981,6 +1003,10 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+	DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
+	DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
+	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {

-- 
2.50.1

