Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FE265CC9
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757861773; cv=none; b=Bo+ZzdpMgRCV3X3S7l+3p3Caf0z2vzFGRAnGIYZpKERWESJrpiB/PAl0NAEKQMaT+a0f089GNitVXnwJeKmlmbwQK8vr2ASKJ0TpkJnR5Isy7EA+voAicyCcLEDJfRtVNU4Pw4MFTO6bsyVnC0sYPH7usPvb0IaGSV2wFUnykh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757861773; c=relaxed/simple;
	bh=j8DguNXU8AFQ34L5vsT4cmjDZPqX8ltYefhsbX7KxAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=daSnDgNhloXpYW+0Os6hcHnpnO76EqNRWvg6v7VqvcaKMAQtiFYv97HL3Uxa5PyfW4kCUR0MnQxpZ1GzHQXH40sEd6vemSixoa+CIrQC4a5qn7Iie+uCCJBOZyrqTX5jQSdjI/87/qBhlqJsi+8jZ1QxSPsVALpZYVKSZahZKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sru3Y/PG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sru3Y/PG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso17597885e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861769; x=1758466569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiOb+44+abYoeDQ7m5UxjJUCp2UOVKxX0zLt82/lfMA=;
        b=Sru3Y/PG77qQoASv2kZxv7ytIkmBkjaGkj/LXGutSiNXinLztmegc9zfyqRUaBDldK
         yCcdT56Olrpl/LoUNjMLYxMt+1Pku5g3JcXmCIiiRdOti0I3/3goyF9lCDRtFP9CCe68
         tX8uFbLnJxIgrqs4PidaUvQ2EaF0/+mn1CT+Dcx7Vp8qm/wGHxsygBwQHjqCEi+M69LD
         htxL+DsZI9xt9zFT1kzvUWfg2/o9GQg9JnwSWhDO0i4sjyP6ug+HcMyNkEVC09FXwVA6
         TZoSsXCLt3+z51tL15MHiKwcjDId+LS0Wf55zpShu/64iQSux0prjfFxOs3aP3YiVVRh
         RZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861769; x=1758466569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiOb+44+abYoeDQ7m5UxjJUCp2UOVKxX0zLt82/lfMA=;
        b=omhZNNvG71hrS9P+amlpaOLZllItf7r/uH+TmytotsJC0kPrGbY/GFuWOa994zgIPt
         MwHhmYoPpDZo6usdeULptcZzdZltHka+HHAr1rJS66cfQcxQ+f4FIXw/7lFERN4TQGpz
         y0FV1J57nJF3r9sKqs4mCDY4Dpu871p2ScBnPsxg70w0+tUZt8nR2nmepkaFDRF0UkjK
         TxQWUUN5XZHMeemi5cp/eYAhsyOeXsoioeNCElQ5RWWEG0J8IlwXgZHtERR6Gu/EdXVu
         vfyA1N8UCDIyEBez7kR2Ng95dBRWE8Bw/PUTKBA+0ILnjg9WMdeoD73D0HeOpJIGc0GB
         63Vw==
X-Gm-Message-State: AOJu0Yw7XdraSw66jtfz9I02PjiNtl2ZFFVoXcZx9f/nlVZPH0G4cTU5
	+oq/vL/UhBJwa426OczHfTCaA4xBvnCcREyKQ8qwmPP2bleeR0H1ax6Q
X-Gm-Gg: ASbGncuarbaXrQn2G8+n14T8BHmEGGiTHm0gMqc84EJH3l81CHdqqZ7B2HZZ15/6jy0
	vl2LDAkhcV0kFUWbraLAnjZoOn9kjELizT6eZMNwQI0PyhvE/HCrm2rrj5Hu1Y+6L+w/ptHwOCV
	utD6fAyd78yRi228i7B4EkNh3l5cUVTzrs58+3mDUh7ya10ICFXp+Bx/J1Vl+qRScox/jbT5+q8
	JOJuJ7xUIfdNZW9QniWck8ULkncmpfDZ0d99HNifvP309ZS/RlvBq5Kq195aF5QCAScGgjNbrF1
	bb5ZoZxZxufqZ2IQGoJmUvLE/dkjXDZf2yWizgNyJfbxh9dN4xJflmnUhyDyFCOMwkNBRwQZbGS
	eJDzkC9hXBHldybrnOvSLOphSqXhsLiDhwe+DtvmDH//o6b1rH7zsLjgihYkdRw833OagoWso5g
	8gNO/EKsTrZbd1PPa2b4g=
X-Google-Smtp-Source: AGHT+IE7VjKHiHgO2N111+B32m+dnzOAE2PiQz0UAHDXt4V9pCdw6cxP1J/HBjBv/5QNe1xn2pQhKQ==
X-Received: by 2002:a7b:cb49:0:b0:45d:e326:96e7 with SMTP id 5b1f17b1804b1-45f211fe42cmr49107295e9.29.1757861769162;
        Sun, 14 Sep 2025 07:56:09 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm136303475e9.21.2025.09.14.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:56:08 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD controller
Date: Sun, 14 Sep 2025 17:55:55 +0300
Message-ID: <20250914145555.2631595-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exynos8890 USBDRD controller integrates a combined usb phy that
supports UTMI and PIPE3 interfaces. Add the required changes for USB HS
to work. USB SS is out of the scope, as the Samsung Galaxy S7 only has
a microusb 2.0 port.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 210 +++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index dd660ebe8..546c69442 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -145,6 +145,7 @@
 #define PHYUTMICLKSEL_UTMI_CLKSEL		BIT(2)
 
 #define EXYNOS5_DRD_PHYRESUME			0x34
+#define PHYRESUME_FORCE_QACT			BIT(9)
 
 #define EXYNOS5_DRD_LINKPORT			0x44
 #define LINKPORT_HOST_U3_PORT_DISABLE		BIT(8)
@@ -1302,6 +1303,158 @@ static const struct phy_ops exynos7870_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static unsigned int
+exynos8890_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
+{
+	u32 reg;
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	/* restore any previous reference clock settings */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	reg &= ~PHYCLKRST_REFCLKSEL;
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_PAD_REFCLK);
+
+	reg &= ~(PHYCLKRST_FSEL_UTMI |
+		 PHYCLKRST_FSEL_PIPE |
+		 PHYCLKRST_MPLL_MULTIPLIER |
+		 PHYCLKRST_SSC_REFCLKSEL);
+	reg |= FIELD_PREP(PHYCLKRST_FSEL_UTMI, phy_drd->extrefclk);
+
+	if (phy_drd->extrefclk == EXYNOS5_FSEL_26MHZ)
+		reg |= FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER, 0x60);
+
+	return reg;
+}
+
+static void exynos8890_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 reg;
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	reg |= PHYCLKRST_EN_UTMISUSPEND;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* UTMI Power Control */
+	writel(PHYUTMI_OTGDISABLE, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+	reg &= ~PHYTEST_POWERDOWN_HSP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+}
+
+static int exynos8890_usbdrd_phy_init(struct phy *phy)
+{
+	int ret;
+	u32 reg;
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Reset USB 3.0 PHY */
+	writel(0x0, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
+	writel(0x0, phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+
+	/*
+	 * Setting the Frame length Adj value[6:1] to default 0x20
+	 * See xHCI 1.0 spec, 5.2.4
+	 */
+	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
+		FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+	reg |= PHYRESUME_FORCE_QACT;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
+	/* Select PHY CLK source */
+	reg &= ~PHYPARAM0_REF_USE_PAD;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	/* reference clock settings */
+	reg = inst->phy_cfg->set_refclk(inst);
+
+		/* Digital power supply in normal operating mode */
+	reg |=	PHYCLKRST_RETENABLEN |
+		/* Enable ref clock for SS function */
+		PHYCLKRST_REF_SSP_EN |
+		/* Enable spread spectrum */
+		PHYCLKRST_SSC_EN |
+		/* Power down HS Bias and PLL blocks in suspend mode */
+		PHYCLKRST_COMMONONN |
+		/* Reset the port */
+		PHYCLKRST_PORTRESET;
+
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	fsleep(10);
+
+	reg &= ~PHYCLKRST_PORTRESET;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Configure OVC IO usage */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+	reg |= LINKPORT_HOST_PORT_OVCR_U3_SEL | LINKPORT_HOST_PORT_OVCR_U2_SEL;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynos8890_usbdrd_phy_exit(struct phy *phy)
+{
+	int ret;
+	u32 reg;
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	reg =	PHYUTMI_OTGDISABLE |
+		PHYUTMI_FORCESUSPEND |
+		PHYUTMI_FORCESLEEP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	/* Resetting the PHYCLKRST enable bits to reduce leakage current */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	reg &= ~(PHYCLKRST_REF_SSP_EN |
+		 PHYCLKRST_SSC_EN |
+		 PHYCLKRST_COMMONONN);
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Control PHYTEST to remove leakage current */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+	reg |= PHYTEST_POWERDOWN_SSP | PHYTEST_POWERDOWN_HSP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynos8890_usbdrd_phy_ops = {
+	.init		= exynos8890_usbdrd_phy_init,
+	.exit		= exynos8890_usbdrd_phy_exit,
+	.power_on	= exynos5_usbdrd_phy_power_on,
+	.power_off	= exynos5_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static void exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	/* Configure non-Samsung IP PHY, responsible for UTMI */
@@ -1897,6 +2050,15 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	},
 };
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynos8890[] = {
+	{
+		.id = EXYNOS5_DRDPHY_UTMI,
+		.phy_isol = exynos5_usbdrd_phy_isol,
+		.phy_init = exynos8890_usbdrd_utmi_init,
+		.set_refclk = exynos8890_usbdrd_utmi_set_refclk,
+	},
+};
+
 static
 const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 	PHY_TUNING_ENTRY_PHY(EXYNOS5_DRD_PHYPARAM0,
@@ -2025,6 +2187,51 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const char * const exynos8890_core_clk_names[] = {
+	"ref",
+};
+
+static const char * const exynos8890_clk_names[] = {
+	"phy", "pipe",
+};
+
+static
+const struct exynos5_usbdrd_phy_tuning exynos8890_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS5_DRD_PHYPARAM0,
+			     (PHYPARAM0_TXVREFTUNE | PHYPARAM0_TXRISETUNE |
+			      PHYPARAM0_TXRESTUNE | PHYPARAM0_TXPREEMPPULSETUNE |
+			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
+			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
+			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 11) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 7) |
+			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 4) |
+			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 0))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos8890_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos8890_tunes_utmi_postinit,
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynos8890_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos8890,
+	.phy_tunes		= exynos8890_tunes,
+	.phy_ops		= &exynos8890_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos8890_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos8890_clk_names),
+	.core_clk_names		= exynos8890_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos8890_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
 	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
 			     (HSPPARACON_TXVREF |
@@ -2257,6 +2464,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos8890-usbdrd-phy",
+		.data = &exynos8890_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
-- 
2.43.0

