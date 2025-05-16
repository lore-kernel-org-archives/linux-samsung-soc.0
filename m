Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA4284665
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667812; cv=none; b=X194o9icyZvfkrHQD2Q02+ZR0jiGMmCmuOSggouC7xNLnEWkWQZS7pEITmfZEPgrL6aeGYw23KhyrZTtpOe8iIW7Bdl2h/9UaLSCx6hpPRgcU49agAus6fpMtVRcTulHkuefMB7JmzlUcfjZC7l/EKFr8RFw8JM1R4GchhkDEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667812; c=relaxed/simple;
	bh=IVFw3HrIbdHesxHxMYNqlJSil+s+BxmA9qKNLayR8hI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gG3MNtP1FOoiRdU7ILk0eQ06CO6U0BJdVjxSD4fcKor4MtOV8iFZX7Q+IXSHPt8MIZW8zthzDoSjKhuaJ7KSvit/J0klQjdQCXleznv9IPg/hLK+kZ1g64YK1IjYdwkgenPVOAK1uOE6FYUXIICuQvXMVzkOiO1LEmt4dNjbx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SRz1+job; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SRz1+job"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519151648epoutp0448ee128af6ae427f1761e279bb978005~A9pzWwoV62595025950epoutp04n
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519151648epoutp0448ee128af6ae427f1761e279bb978005~A9pzWwoV62595025950epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747667808;
	bh=m+GTmyVkYGq9Nxr5NyrU8UoWIkaYzR0afQVWl8NtESc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SRz1+jobZ10W2q4IRIn2pt+U3U8ZCErVbX6BLuAY+WuBapH3dp6rV4yh5ACnbN8xq
	 NIj49QWMkm6EmLyr4tZqBHqcC/8kLa2Q7XZnucVB4OeNYLfDUa7uy0CaCHEuqZN+Fd
	 6tTCwowT6Cb29uyQD22O2Vw2XrMgej+TwWIUrmMg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250519151648epcas5p263c1ab9b30a8e5f9e41b9a017d6f395c~A9pymv0u52189221892epcas5p2w;
	Mon, 19 May 2025 15:16:48 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1LrG2CLyz6B9m5; Mon, 19 May
	2025 15:16:46 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb~-_pGmyIKJ2806928069epcas5p20;
	Fri, 16 May 2025 10:18:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516101803epsmtrp1c13d36dfe36a84efdd81f24e3bae2c7a~-_pGkqkwL0890008900epsmtrp12;
	Fri, 16 May 2025 10:18:03 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-67-682710db95d0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0A.2F.08766.BD017286; Fri, 16 May 2025 19:18:03 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101800epsmtip26c728f7627cedb6679a6c418f538f7e6~-_pDs_t_O2811128111epsmtip2R;
	Fri, 16 May 2025 10:18:00 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Fri, 16 May 2025 15:56:50 +0530
Message-Id: <20250516102650.2144487-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516102650.2144487-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO5tAfUMg8az+hYP5m1js9jyajOL
	xZq955gs7u1Yxm4x/8g5VotrNxayW/z5d57N4mjrf2aLl7PusVlsenyN1eLyrjlsFhNWfWOx
	mHF+H5PF2iN32S3Ov+hitdgw4x+LxbN7K9gs/u/ZwW7x5ecDZovDb9pZLY4s/8hksfPOCWYH
	MY+T6zYzeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvjxJ61bAXP
	FCtaVrazNzBukuli5OSQEDCR+H5/P1sXIxeHkMBuRonlB3ayQCRkJB5N28gKYQtLrPz3nB2i
	6C2jxOYJ/4ASHBxsAqYSE/ckgMRFBHqYJJ5e/QE2iVngNJPEho8z2EG6hQX8JBq/TgebxCKg
	KnH06TtmEJtXwF6ief8vdogN8hL7D54Fi3MKOEhsXNPEBGILAdXs6vzEDlEvKHFy5hOw65iB
	6pu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGnpbmD
	cfuqD3qHGJk4GA8xSnAwK4nwXs9SzhDiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2x
	JDU7NbUgtQgmy8TBKdXAFOv8SoBfKYSrt/fvrAPcrU4lT89sL3r4IuTfMU7PxEf3+P1nJsw8
	78Hy8ppa1MbdX9c2ZtjNW/dvVbd+aqyO9u8Ks7X2sWfk301X6r//2vapqu0t5k3n+5/92uBY
	0bK9IbXu1/JM6y/l0/uWRX3ZkpHnyvL4wI/kN77cU1nab+1PzLl2du0OxnK7iavnd2lnv5nb
	6Lzr9718vW/RvsElJpM59S/vjjrXpL4kSS4lYdLWLoF5UZvuXzm96dnfbbN2m70KZNZ/FFOe
	fSLN9sTDV619pz4r2O/boeO8uCXFoPRo3c6DEknTP7tJibwulrtg3do6r6S9vljj/L3S4msP
	z5qc2XW3e+biiZeK/aQ2/FFiKc5INNRiLipOBADyh79vKgMAAA==
X-CMS-MailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>

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
index 634c4310c660..b440b56c6595 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -177,6 +177,9 @@
 #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
 
 /* Exynos850: USB DRD PHY registers */
+#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
+#define CTRL_VER_MAJOR_VERSION			GENMASK(31, 24)
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
+	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
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
+	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
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

