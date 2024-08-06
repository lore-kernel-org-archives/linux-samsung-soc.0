Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506B1C8FB7;
	Tue,  6 Aug 2024 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946304; cv=none; b=gqHd9GS2bQ4T3vf/q+jiEKVHjMYvtTrx8ryVrvmDqBLeAQF00gi0qB+UkBKZBEHN8k76xmA8OeLQNPl4JkZUmbpBIgQeisFvOj0jDWVSvmZTG6PgP842eJLZUvZHyucUwd9hNNYiU2+oAlWJS4MJCIRElAIS9FiTK9bOOh2LZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946304; c=relaxed/simple;
	bh=8wZWTlDutoIdgkQonWtbC7fK/3x1PokJPYQxOF+5Oho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLFE9juGWF3cbmcqMlZiYbXVzRPV/KLtTvXPwSgRL/NmmsEjS469SIocpEhbp3AzVTa04Na7fWRTSy36YSzjEtkW2BI3B9vUM3jalgzUew/pQRK4zOA1S2cMCEJSJ3P5fDiU4uc611JH4EIrwYQ9ftp0qadigsqVPop4yjrbIhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/cbiPiP; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/cbiPiP"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so9255781fa.1;
        Tue, 06 Aug 2024 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946300; x=1723551100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0if134XhdeRkEUYfkA+1CHXu+GQYSvk7tXr14DRvpMU=;
        b=E/cbiPiPKhpRLz7L/eHH0ZXUFDP1nlPc5M/Lr6G5dhq6z9r7MPxemZHcmfcscazZ55
         6Kk3pAyw/T8hqKq+prTmB2rJNBPyqLOSBhl72uXEyXJHpvATh/ZumwJBF3Gi8Gn7qvrZ
         RQHWoDhFdnE7HbfBLOLEz9990BqGHkHpa4R9b5UxuPic7//PGwckoY/1HZCqDbiRI20x
         nTqtSdia1Np2r2GY3qbgSH6/mnAGyAUws9vjINroheMEtyZIWw403qeLws9B7P8Td76H
         eeeWF2KwFVYz4uRPRAxKfwMb0ita17LquqDaJr0Da4L4eCLZaTrLGOIcLyCW+di2ei77
         FaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946300; x=1723551100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0if134XhdeRkEUYfkA+1CHXu+GQYSvk7tXr14DRvpMU=;
        b=UXwNaTQuTvMtE8ZzqFFQBaX9iomBHG6Bqvds8NurNqeyjSZBWRNZeVQ+3KTKO0ylrd
         0zXzyQC70Bvo7cGvRn5Lzi1uGML4pIdZmXVhVn0YipN1enb2kQHhHXDkKLkCsH91AEH0
         Qd+tMUuPMy5IwuBWCV4p1JB/M0sY9cnYHfhFqo3AQ9+vVXTL4m+ah41RzI9nXYhdDeFb
         QKe61ETVBnz/vh18IizvKeeeEXRJxQyM3/lC/GzqsFOrmMX7DrbHhgoIyKep6APFlrmg
         30cPYcIPsMF0LvRYc6lhwTPp3BliZaC7ueu7LtWUqNlZSwi4ggPrzZr/BJMOrMFAUq1t
         HToQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuF4OzueuVvf+ObYtgBl2IxG3xvQdibXuJTLfs026Cxx+eT88WHpaY5bNL1sVJlWPl0rSIESuwJFyUf/pPbg59XaYcLIgiUMcp4YmNucH0BteOj+b7Sf2ygl4XHWbw/i5/bj+ubHp2rRHAC5ITZ9G02m/W/lZfAgYAWy4EA5CIzWwP7w==
X-Gm-Message-State: AOJu0YwcLe6pokf2WKNb77M+DSpDOq0i94wWK1zZeT2ghVzhtzGIi1T1
	a4yWp7SRIKqBfER0rPhGx6sVhqopdEMRPbtRcZ7YkIpwsi/hLRlyDSLxKkxj
X-Google-Smtp-Source: AGHT+IHmc+4jNVeC/deUHpKRZGlhx97wH6E6XkbGg1ilLroKPhmyzIRoqWZ0tQUgZPOVpADW7upZfw==
X-Received: by 2002:a05:6512:234c:b0:52e:d0f8:2d43 with SMTP id 2adb3069b0e04-530bb3810d0mr12841061e87.17.1722946300245;
        Tue, 06 Aug 2024 05:11:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb546sm542080366b.224.2024.08.06.05.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:11:39 -0700 (PDT)
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
Subject: [PATCH v2 7/7] clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS
Date: Tue,  6 Aug 2024 14:11:50 +0200
Message-ID: <20240806121157.479212-8-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 USB Controller with Exynos USB PHY which in
theory supports USB3 SuperSpeed, but is only used as USB2 in all known
devices.

These clocks are needed for everything related to USB.

While at it, also remove the CLK_SET_RATE_PARENT capability of
CLK_MOUT_FSYS_USB30DRD_USER, since it's not actually needed.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/clk/samsung/clk-exynos7885.c | 71 ++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index a0c9b7cc6942..fc42251731ed 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -20,7 +20,7 @@
 #define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
-#define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
+#define CLKS_NR_FSYS			(CLK_FSYS_USB30DRD_REF_CLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -686,30 +686,56 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 /* ---- CMU_FSYS ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_FSYS (0x13400000) */
-#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER	0x0100
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER	0x0120
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER	0x0140
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER	0x0160
-#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER	0x0180
-#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK	0x2030
-#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN	0x2034
-#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK	0x2038
-#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN	0x203c
-#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK	0x2040
-#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN	0x2044
+#define PLL_LOCKTIME_PLL_USB				0x0000
+#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER		0x0100
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER		0x0120
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER		0x0140
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER		0x0160
+#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER		0x0180
+#define PLL_CON0_PLL_USB				0x01a0
+#define CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE		0x200c
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK		0x2030
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN		0x2034
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK		0x2038
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN		0x203c
+#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK		0x2040
+#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN		0x2044
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL	0x2068
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0	0x206c
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1	0x2070
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY	0x2074
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK		0x2078
 
 static const unsigned long fsys_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_USB,
 	PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
+	PLL_CON0_PLL_USB,
+	CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE,
 	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN,
 	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN,
 	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK,
+};
+
+static const struct samsung_pll_rate_table pll_usb_rate_table[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
+};
+
+static const struct samsung_pll_clock fsys_pll_clks[] __initconst = {
+	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
+	    pll_usb_rate_table),
 };
 
 /* List of parent clocks for Muxes in CMU_FSYS */
@@ -718,6 +744,7 @@ PNAME(mout_fsys_mmc_card_user_p)	= { "oscclk", "dout_fsys_mmc_card" };
 PNAME(mout_fsys_mmc_embd_user_p)	= { "oscclk", "dout_fsys_mmc_embd" };
 PNAME(mout_fsys_mmc_sdio_user_p)	= { "oscclk", "dout_fsys_mmc_sdio" };
 PNAME(mout_fsys_usb30drd_user_p)	= { "oscclk", "dout_fsys_usb30drd" };
+PNAME(mout_usb_pll_p)			= { "oscclk", "fout_usb_pll" };
 
 static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_FSYS_BUS_USER, "mout_fsys_bus_user", mout_fsys_bus_user_p,
@@ -731,12 +758,16 @@ static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 	MUX_F(CLK_MOUT_FSYS_MMC_SDIO_USER, "mout_fsys_mmc_sdio_user",
 	      mout_fsys_mmc_sdio_user_p, PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
 	      4, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
+	MUX(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
 	      mout_fsys_usb30drd_user_p, PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
-	      4, 1, CLK_SET_RATE_PARENT, 0),
+	      4, 1),
+	nMUX_F(CLK_MOUT_USB_PLL, "mout_usb_pll", mout_usb_pll_p,
+	    PLL_CON0_PLL_USB, 4, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
+	GATE(CLK_FSYS_USB20PHY_CLKCORE, "clk_fsys_usb20phy_clkcore", "mout_usb_pll",
+	     CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE, 21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_MMC_CARD_ACLK, "gout_mmc_card_aclk", "mout_fsys_bus_user",
 	     CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
@@ -752,9 +783,21 @@ static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_MMC_SDIO_SDCLKIN, "gout_mmc_sdio_sdclkin",
 	     "mout_fsys_mmc_sdio_user", CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
 	     21, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_20PHYCTRL, "clk_fsys_usb30drd_aclk_20phyctrl",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_0, "clk_fsys_usb30drd_aclk_30phyctrl_0",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_1, "clk_fsys_usb30drd_aclk_30phyctrl_1",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_BUS_CLK_EARLY, "clk_fsys_usb30drd_bus_clk_early",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_REF_CLK, "clk_fsys_usb30drd_ref_clk", "mout_fsys_usb30drd_user",
+	     CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info fsys_cmu_info __initconst = {
+	.pll_clks		= fsys_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(fsys_pll_clks),
 	.mux_clks		= fsys_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks		= fsys_gate_clks,
-- 
2.46.0

