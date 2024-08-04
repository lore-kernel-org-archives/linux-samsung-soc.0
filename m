Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A0146D42;
	Sun,  4 Aug 2024 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808552; cv=none; b=d67+O7d57Yy+1WpO48CTVhB/G5QFf83uQsiz4WVwsMnhm4A39gQMt/iNV/PISIIf5fCy8ZTlVL0j+2hKl+zT3E+siI59YTVw4dm1j+2p9GcmbDcIPF2kccuXEs9F6p7e5BZ5e6wHvoGLtIFOpC9gO66+s39lgKK04TfJWBuTDgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808552; c=relaxed/simple;
	bh=L9h/I1bRtHA/LEehkkjeUGWWcCxc1Gd492hfXf19b+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2Mjzq9CQHtkLLwf+BdYseEsIrMzO3F/jb5uzb7nUJOzISOHKGif69WmI7NNoeLRt1hoAWyPWESyv+lyT61m3rHEFBVlzI2su9sQ1vzrhUYsERZPY0YNCNipxfDI2EigCIjV3HflN+1lnTChrtFqJ8R2jEjFhY0gAhAvXJPMaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J550nWxp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J550nWxp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a94aa5080so359752666b.3;
        Sun, 04 Aug 2024 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808549; x=1723413349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LiFeuD7Lh8CbdxP7qC+zRPV9T1KjTmFlYXzr7Hej/8=;
        b=J550nWxpPPWsn5vDpuzhy/pIIUkXdLEsZ3Gfj5biBnvkaheDbdpskcc330EMb6rkZr
         LjP6lv71fU5AxqDztkbs3jwZcBlMp3EyDCJL0DbdZPvgiMkNhWRtXpQp9jt9nsWcaAQu
         jEOvTlFaoGdHJf0MPthRshOC0lE+qCkdjksVJMSeDFGHwd1zVtUaCKYe07OrJWh590Te
         tZ71KQGrG82pKaia1AszrKp9wYeriZCyfBiJVY/U//zhtSx5/3Nw58c3Xtwqjt/S3j2K
         2S8WXZAO4kHs0RlTH2uVcHQJ74Dnt1oPLKAY/3BhvqcYgyWzGezR5UQTkCt5kYEp4d0A
         jILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808549; x=1723413349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LiFeuD7Lh8CbdxP7qC+zRPV9T1KjTmFlYXzr7Hej/8=;
        b=BBP01Q3qeiVXgYpQMKG3sw6RnON7pTgQuu0KwLwIDT/iC8+FTXOLLK/HNtzCJQFL1x
         +0CZCjGTDC2gpHa89Tu4etcFRlFkeRE6StK+9rB68gVXcyqjojONHTTFDPbRLW/mhb0r
         AOGE46+LIl9z1lFCaIDW7+dc20yC1fuMZpRUYGhsqB/fJ9IffTrYkoKNmDDmdQtpbpKn
         D/KjBvc5S63Mrbp+W06khT80Mvn97Wl2asclxjIlqTqfg00//xaCmjblwBzzGTiufgdS
         29JfTfn3TDjMUcOrtUvJotGEgUk4hlshTXjVLIGNHi3q6g6imjXASUyV70+lVlozpvrI
         jFNA==
X-Forwarded-Encrypted: i=1; AJvYcCV+KAPRf577pSGJ8OopzroA2V0R8Podqr7/YS1MLzNyUSxiGv2bcRn530bBJgyl+JZI9GD1VVMUB0Nh4vu0tmzeUZRu9pxfSxlAsjKtlV1l5WENqRTqx4zywHlDtsGr6OHdpNwdpWPRQ7v5b+0yiBZ1Vceok3kMfeL9VPih3LJQDI2j6heHcxNHxmgTU+j5sorWjfEFY06Y6X1kwlyVEletrc2EZ7h/e3KVHKys8XJNVqtvO35pH4qeHSMDR0MHVj10
X-Gm-Message-State: AOJu0Ywmr5+bx+dlSb5yp2g7uD9X1EB+7lf/LtelM401XG6fdHbhLMKp
	VRN8+O6if/pw2qbQWsQhtSNeINchI4UYIn1MXY+wq+ZBygKoC7uO
X-Google-Smtp-Source: AGHT+IEKN70BYeMW7wJVS7P3SD6EXI6/VsIuEQuswfFLL8lEQzYCSy9ZqIS3EMAs+17voEHk2RUS7w==
X-Received: by 2002:a17:907:6096:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a7dc5070840mr776870966b.33.1722808548962;
        Sun, 04 Aug 2024 14:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:48 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 09/13] clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS
Date: Sun,  4 Aug 2024 23:53:54 +0200
Message-ID: <20240804215458.404085-10-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
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
 drivers/clk/samsung/clk-exynos7885.c | 73 ++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index a0c9b7cc6942..637257a6f10e 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -20,7 +20,7 @@
 #define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
-#define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
+#define CLKS_NR_FSYS			(CLK_FSYS_USB30DRD_REF_CLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -686,38 +686,66 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
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
 };
 
+static const struct samsung_pll_rate_table pll_usb_rate_table[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
+};
+
+static const struct samsung_pll_clock fsys_pll_clks[] __initconst = {
+	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
+	    pll_usb_rate_table),
+};
+
+
 /* List of parent clocks for Muxes in CMU_FSYS */
 PNAME(mout_fsys_bus_user_p)		= { "oscclk", "dout_fsys_bus" };
 PNAME(mout_fsys_mmc_card_user_p)	= { "oscclk", "dout_fsys_mmc_card" };
 PNAME(mout_fsys_mmc_embd_user_p)	= { "oscclk", "dout_fsys_mmc_embd" };
 PNAME(mout_fsys_mmc_sdio_user_p)	= { "oscclk", "dout_fsys_mmc_sdio" };
 PNAME(mout_fsys_usb30drd_user_p)	= { "oscclk", "dout_fsys_usb30drd" };
+PNAME(mout_usb_pll_p)			= { "oscclk", "fout_usb_pll" };
 
 static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_FSYS_BUS_USER, "mout_fsys_bus_user", mout_fsys_bus_user_p,
@@ -731,12 +759,16 @@ static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
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
@@ -752,9 +784,22 @@ static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
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
+
 };
 
 static const struct samsung_cmu_info fsys_cmu_info __initconst = {
+	.pll_clks		= fsys_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(fsys_pll_clks),
 	.mux_clks		= fsys_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks		= fsys_gate_clks,
-- 
2.46.0

