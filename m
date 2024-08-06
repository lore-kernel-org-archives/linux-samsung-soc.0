Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6881C8239;
	Tue,  6 Aug 2024 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946300; cv=none; b=HI/RZK0hEIFjLiPZbGuOQT+dz/e8hR4/ZckQfbonRxF/tIaSGS5fu5d2HHVaYkKECOGoJ9XBnJGoVAmIXa+s/CnxkGGSqpGgyJnLgmjBYKHlHLhJbWbQjTAXtJAnyvq/ZJgh7gK8h881tgl+9fEmw+kgSPoO+GAdIgtDYNJ5SNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946300; c=relaxed/simple;
	bh=R/zw8++6HAxfElOjT2EQc7bEpx1XnGqUafF3RUDJMjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8XB5ioqww8ey3Os96GQyTiuBszlWHbQtLvAyynoEbXNEEqNG1U5JmsDEl1KSSzn2wQU45OJUeb4zeEWvCPHDyFYjq14+I9KLGxYB07znMVNzQVCeccfyWd3Ks8z1NoH17q2Fsw2K7puAGnz6I37HoOoV0wyYfaGkJ1hpmFukhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOybDVtq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOybDVtq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a83a968ddso64218766b.0;
        Tue, 06 Aug 2024 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946297; x=1723551097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PylIu4FUXlrxZkJ16yikQYZXRyjRIiQcGN1Zbu3DKVI=;
        b=TOybDVtqweyubgtuugbYjTjul2q7Nd7pDpjQ5qLSPMT75El1LA5Yi+bDX2G3t5t/Tg
         mabs9MqLS9Ne6UA+1c0V51UU1fQ10sUi7Vhqub5gdOpebunprvSKhee31BZ4o/lF4ljj
         1JPVl7097A729GcaT5lMWVXIk81zbjxbB5mv0mWRE7ZZk4eVBCdCgkntD2SxD2eMtLKK
         d8Y2t/a3cM1YKglMMKsiyGXO16W3egFzk2o3MGeVBXFkeG2owEBroyQViusQlwiQgqZR
         SumSBQQQKMZxwSuxLuGiE3Jsg0rSfitacSvWxgcvzkWUfkoHtwgEDiV5rcviGA5nM5HH
         kfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946297; x=1723551097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PylIu4FUXlrxZkJ16yikQYZXRyjRIiQcGN1Zbu3DKVI=;
        b=ZiquV4KxkrzZrP5L3Wl6Co5h8athU5WjWe8uuXCeL2/WE6QVef//kcAfdnv3ZPIWdk
         r5O9X4Db8DxBU0RcVBDvINnUnOIMvK/K0STaManq29BrPiZwnHLWHoLjztK9xfaRyHCx
         2gZ2hdHIxx152SsonWmA/CjDwPTK7DPKzxnd27PfwI29T+Q+G6YwkEtP85uOZSDq8dun
         0iVnIcc9+9Eyr0efUmlcU5brboi51U2AJO+A0Rfb64kjAVzFYjdaK03Snf8ZFwmozHny
         rRPdKnW6FrcEsL1NxY3dG/57XLdWlRqMZacQLDUtO1F8ZEkY4R2z3Be2tY6cpG8PTwWI
         Ic2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLdfhudFYYZYpNruLKCKzmo9s+JKyOZawPDSuNThD+63DYXUNMcBmG6ddtmOIorBtdUuWy1qmnB7CN+Wpisvdb46B9q/V8RQPzEMfPPEhIVbGS3qIgxm8mIsb7vEipxjYVCZzLwKQ1ylJthZC+HeyTVG6jjK87r9zddv0i6hbuq71nFQ==
X-Gm-Message-State: AOJu0YymHV7iixM+e5md7F2JGwelTEcMs3YIbHn6WUUzeo9D9mCJlyKo
	5QluhCCPnHt2YZOPhG9+pME2Jj1Sgw7xqa1ByLjlsyVeF55CK+r8aKgXr4ym
X-Google-Smtp-Source: AGHT+IG1u1GKra0yi/oRrIoZboHwG2H7ZvyJfzmU7HoQSiwDFX3wOaGLGHUiaI7hygwPilafQet2MQ==
X-Received: by 2002:a17:907:1ca2:b0:a7a:bd5a:1eb7 with SMTP id a640c23a62f3a-a7dc5105635mr1048504866b.59.1722946296637;
        Tue, 06 Aug 2024 05:11:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb546sm542080366b.224.2024.08.06.05.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:11:36 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] clk: samsung: exynos7885: Add missing MUX clocks from PLLs in CMU_TOP
Date: Tue,  6 Aug 2024 14:11:48 +0200
Message-ID: <20240806121157.479212-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806121157.479212-1-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Exynos7885 (and seemingly all modern Exynos SoCs) all PLLs have a MUX
attached to them controlled by bit 4 in the PLL's CON0 register.

These MUXes can select between OSCCLK or the PLL's output, essentially
making the PLL bypassable.

These weren't modeled in the driver because the vendor provided drivers
didn't model it properly, instead setting them when updating the PMS
values.

Not having them modeled didn't cause any problems in this case, since
these MUXes were set to the PLL's output by default, but this is not the
case everywhere in this SoC.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/clk/samsung/clk-exynos7885.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index 87387d4cbf48..a0c9b7cc6942 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -17,7 +17,7 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP			(CLK_GOUT_FSYS_USB30DRD + 1)
+#define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
 #define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
@@ -162,6 +162,10 @@ static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	    NULL),
 };
 
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p)	= { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p)	= { "oscclk", "fout_shared1_pll" };
+
 /* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
 PNAME(mout_core_bus_p)		= { "dout_shared0_div2", "dout_shared1_div2",
 				    "dout_shared0_div3", "dout_shared0_div3" };
@@ -189,6 +193,12 @@ PNAME(mout_fsys_mmc_sdio_p)	= { "dout_shared0_div2", "dout_shared1_div2" };
 PNAME(mout_fsys_usb30drd_p)	= { "dout_shared0_div4", "dout_shared1_div4" };
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	/* TOP */
+	MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+
 	/* CORE */
 	MUX(CLK_MOUT_CORE_BUS, "mout_core_bus", mout_core_bus_p,
 	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
@@ -232,17 +242,17 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
 	/* TOP */
-	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
-	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
 	DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div2",
 	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
-	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 3),
-	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "fout_shared1_pll",
+	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
 	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
-	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "fout_shared1_pll",
+	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
 	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
 	DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div2",
 	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
-- 
2.46.0

