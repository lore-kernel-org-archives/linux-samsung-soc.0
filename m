Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC829710E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292358; cv=none; b=CFP3PdaPsPcFokVve2RZL77AlaFoOkcnHDfEYgLyEpz6YvqgOYc4P0A1jjEFSsD8JaUmGeWnfusTqde4Wcq6WotzyBatjk77P2rBEG4VAC25vwC0ZE25RwsYVt6NoxYpz5EXyj6sjGqVpSIzRFcka/m6sWRq/X8oDxFDJSZQcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292358; c=relaxed/simple;
	bh=VzHZDzeGcAsxMELQfK+UwdZld386ICntUsLleK7v4Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ezbuWIumepIKlewQYsBhLxf28rUcCcqk+EBY0T/BOxzHKqW20AHr/k6A68ma1KyvvBgFSyM9hDM7A5aGTrAmR74GGFd6DmXMDGyPJ05TxWikfWXtqcQdGot5rBR6qup/NjGJLvBIzr2fOBknn3GrlpFeCT98HXjWzjGwIrzVUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NUSHZHNn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NUSHZHNn"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250515065911epoutp049873c6e9d4a810a9c10be02bea782713~-oSL2qhh91743017430epoutp04I
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:59:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250515065911epoutp049873c6e9d4a810a9c10be02bea782713~-oSL2qhh91743017430epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747292352;
	bh=nWQ9RbDTr3QMZkhm5WS2CLAMcWq0hIzn+BFwoQi0ZFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUSHZHNn0UfU+uauxVsFHBlO30U2nXa43Ta9wgRyrTovrukJrikapiLJxxyBTzXYT
	 HEe1drXetLTkCPkSunVB5C6XaFbgl/R2+5TIDPq17KETQ241Q67oQTaIUayDeN22jm
	 0N1AYF+o03qu3/GtPWDhBT2IysVzW9HMQpnkWSJw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250515065911epcas5p41bcb1de9e7512ca25c97cd03b5c83acc~-oSLQfaaI0776807768epcas5p4f;
	Thu, 15 May 2025 06:59:11 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4Zygzy0944z6B9m4; Thu, 15 May
	2025 06:59:10 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c~-aFyjmUrV2287522875epcas5p4L;
	Wed, 14 May 2025 13:38:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514133847epsmtrp1b613b8402e1c69fca9dc0a3110e1fa28~-aFybYbdn2249722497epsmtrp1z;
	Wed, 14 May 2025 13:38:47 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-f9-68249ce7dbf3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.C5.19478.7EC94286; Wed, 14 May 2025 22:38:47 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514133844epsmtip2f6b992b0d8003f6c607207d2258a7f39~-aFvlXfuT2568925689epsmtip2C;
	Wed, 14 May 2025 13:38:44 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Subject: [PATCH 2/2] phy: exyons5-usbdrd: support HS phy for ExynosAutov920
Date: Wed, 14 May 2025 19:18:13 +0530
Message-Id: <20250514134813.380807-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514134813.380807-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvO7zOSoZBjuXilg8mLeNzWLLq80s
	Fmv2nmOyuLdjGbvF/CPnWC2u3VjIbvHn33k2i6Ot/5ktXs66x2ax6fE1VovLu+awWUxY9Y3F
	Ysb5fUwWa4/cZbc4/6KL1WLDjH8sFs/urWCz+L9nB7vFl58PmC0Ov2lntTiy/COTxc47J5gd
	xDxOrtvM5LFpVSebx51re9g8Ni+p9+jbsorR4/MmuQC2KC6blNSczLLUIn27BK6M/6svsRTc
	VKy4ei61gXGpTBcjJ4eEgInE8j9rmboYuTiEBLYzSmx9fJMJIiEj8WjaRlYIW1hi5b/n7BBF
	bxklTm/YwdzFyMHBJmAqMXFPAkhcRKCHSeLp1R9sIA6zwCMmiQNbvoB1Cwt4S5yc+JsRpIFF
	QFWisyMVxOQVsJN4cEQdYr68xP6DZ5lBbE4Be4nuR//AbhACKnl09Ak7iM0rIChxcuYTFhCb
	Gai+eets5gmMArOQpGYhSS1gZFrFKJpaUJybnptcYKhXnJhbXJqXrpecn7uJERxpWkE7GJet
	/6t3iJGJg/EQowQHs5II7/Us5Qwh3pTEyqrUovz4otKc1OJDjNIcLErivMo5nSlCAumJJanZ
	qakFqUUwWSYOTqkGJn6BCe3vu/+u/cR4e8653NNzWKJO5dXrb9njcVbjjOBk47e3dkuYhLBW
	fHy9wfaBTPmZtHvSIUbTj1uUlmbrPFryf4rh3JmdH+YHrzv5f+kuR60OI78apw8rzxQ9t+af
	J6/ydsYBG/NbR+bfbdzqXLjvdr3K9NZ3mud0GvoKDqw+u3Npn6WuV5rchwsfOg3tXqx79/Tb
	L7viDblnQgVU63PSm9lyhZ+tvP0rfnLmxB0Wz2z7bI6fbbt5yIHLxOzq3AOJJ58lnPsiLn/+
	AJcA9/lU8xIX48n1Z8/bH/SK4VWzc38X5hUS5Dizg/nAnDUPo2+4FF7ec61G6YmQX9bjp4U3
	7oo8/31imeNZ3/ttT/qUWIozEg21mIuKEwEf6NV8IwMAAA==
X-CMS-MailID: 20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c
References: <20250514134813.380807-1-pritam.sutar@samsung.com>
	<CGME20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c@epcas5p4.samsung.com>

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD HS phy controllers those only support the UTMI+ interface.

Support only UTMI+ for this SoC which is very similar to what
the existing Exynos850 supports.

The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is
out of scope of this commit.

Add required change in phy driver to support HS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660..7b4b80319c5c 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -177,6 +177,9 @@
 #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
 
 /* Exynos850: USB DRD PHY registers */
+#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
+#define GET_CTRL_MAJOR_VERSION(_x)		(((_x) >> 24) & 0xff)
+
 #define EXYNOS850_DRD_LINKCTRL			0x04
 #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
 #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
@@ -1772,6 +1775,10 @@ static const char * const exynos5_regulator_names[] = {
 	"vbus", "vbus-boost",
 };
 
+static const char * const exynosautov920_clk_names[] = {
+	"ext_xtal",
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
@@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 version;
+
+	version = readl(phy_drd->reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
+	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
+
+	if (GET_CTRL_MAJOR_VERSION(version) == 0x3)
+		/* utmi init for exynosautov920 HS phy */
+		exynos850_usbdrd_utmi_init(phy_drd);
+}
+
+static int exynosautov920_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret = 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static void exynosautov920_v3p1_phy_dis(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 version;
+
+	version = readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
+
+	if (GET_CTRL_MAJOR_VERSION(version) == 0x3)
+		exynos850_usbdrd_phy_exit(phy);
+}
+
+static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+		exynosautov920_v3p1_phy_dis(phy);
+
+	return 0;
+}
+
+static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_init	= exynosautov920_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_phy = {
+	.phy_cfg		= phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
+	.clk_names		= exynosautov920_clk_names,
+	.n_clks			= ARRAY_SIZE(exynosautov920_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2047,6 +2129,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usb31drd-phy",
+		.data = &exynosautov920_usb31drd_phy
 	},
 	{ },
 };
-- 
2.34.1

