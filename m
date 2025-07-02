Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B481A5BA4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420021; cv=none; b=tsSycL6ytWfu/tzbZax05V1/jyANf9wfO54bom7bsS9esSnFW5Y4sbN5oICg/5NmKHCaUcfiCByOv7LjFbQjNpfGOQzAnUXybqwLoXkcMoKFjvnwTdiy73+ITQx0HXstV7YL5ItwdfBHhAAbKhJFld+hyg5BAjL1daXTg7n8yFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420021; c=relaxed/simple;
	bh=jkZu16TV++r/rlsIuFBGXESmSaZ3ViLtj2A4MmPfWFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SsJuV5EOgAZl0+/MlBMe5E9qAadoGcO3jfTOdkjYWNfZHHHWlKRlcoN2Po8oMamlm6Pd7Dq+G9YUIazMmPaz2HME+er3jmh6OaoPhK+lqlDEQMESdDbjxxTjJdrNEl3LNa84yMG9RQyKJJkb1QaPqq7RnQUJJ0Fq486mPuZYYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=By6X+rjg; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="By6X+rjg"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp02c0bdf9cd898a42cc304b601afc661744~OSzlGaUla1643316433epoutp02Z
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250702013334epoutp02c0bdf9cd898a42cc304b601afc661744~OSzlGaUla1643316433epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=zPW/2DPyUqiUpfn50eL59ou6U/1tOHY8M/++kogrQi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=By6X+rjgulRfa92N1SB9suTaQPIfLK4rrpiE3inO604obTmVKR1898GpLYFQfvpUh
	 5U5/ocI6pehm2EyoODSEkjQ8LC1ZiXm7P1mNbP/Ca0HPl6U3dqq4Il4F0YJkSgiP3M
	 njs6RKOL17atq+icpCFUtCxFSesmQt/2Z1GzSsP0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p126e7e70d4bbcfdb04833275336220291~OSzkjcO940297502975epcas2p1r;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bX2V50B51z2SSKt; Wed,  2 Jul
	2025 01:33:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p3fc1442b0c8f8b92c9cdc8dd0398ebcb6~OSzjQtsGE1201012010epcas2p3A;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip25685b13de179e059b7486107c8b990b9~OSzjMwUUK2820728207epsmtip2l;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 4/5] scsi: ufs: exynos: add support for ExynosAutov920 SoC
Date: Wed,  2 Jul 2025 10:33:10 +0900
Message-ID: <20250702013316.2837427-5-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p3fc1442b0c8f8b92c9cdc8dd0398ebcb6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p3fc1442b0c8f8b92c9cdc8dd0398ebcb6
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p3fc1442b0c8f8b92c9cdc8dd0398ebcb6@epcas2p3.samsung.com>

Add a dedicated compatible and drv_data with associated hooks for
ExynosAutov920 SoC, Samsung Autotomotive SoC series.

ExynosAutov920 has the UFSHCI 3.1 compliant UFS controller.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 drivers/ufs/host/ufs-exynos.c | 130 +++++++++++++++++++++++++++++++---
 1 file changed, 120 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3e545af536e5..32b087099ff9 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -97,6 +97,10 @@
 #define UFS_EXYNOSAUTO_RD_SHARABLE	BIT(1)
 #define UFS_EXYNOSAUTO_SHARABLE		(UFS_EXYNOSAUTO_WR_SHARABLE | \
 					 UFS_EXYNOSAUTO_RD_SHARABLE)
+#define UFS_EXYNOSAUTOV920_WR_SHARABLE	BIT(3)
+#define UFS_EXYNOSAUTOV920_RD_SHARABLE	BIT(2)
+#define UFS_EXYNOSAUTOV920_SHARABLE	(UFS_EXYNOSAUTOV920_WR_SHARABLE |\
+					 UFS_EXYNOSAUTOV920_RD_SHARABLE)
 #define UFS_GS101_WR_SHARABLE		BIT(1)
 #define UFS_GS101_RD_SHARABLE		BIT(0)
 #define UFS_GS101_SHARABLE		(UFS_GS101_WR_SHARABLE | \
@@ -417,6 +421,95 @@ static int exynos7_ufs_post_pwr_change(struct exynos_ufs *ufs,
 	return 0;
 }
 
+static int exynosautov920_ufs_pre_link(struct exynos_ufs *ufs)
+{
+	struct ufs_hba *hba = ufs->hba;
+	int i;
+	u32 tx_line_reset_period, rx_line_reset_period;
+
+	rx_line_reset_period = (RX_LINE_RESET_TIME * ufs->mclk_rate)
+				/ NSEC_PER_MSEC;
+	tx_line_reset_period = (TX_LINE_RESET_TIME * ufs->mclk_rate)
+				/ NSEC_PER_MSEC;
+
+	unipro_writel(ufs, 0x5f, 0x44);
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x200), 0x40);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x202), 0x02);
+
+	for_each_ufs_rx_lane(ufs, i) {
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_RX_CLK_PRD, i),
+			       DIV_ROUND_UP(NSEC_PER_SEC, ufs->mclk_rate));
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_RX_CLK_PRD_EN, i), 0x0);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_RX_LINERESET_VALUE2, i),
+			       (rx_line_reset_period >> 16) & 0xFF);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_RX_LINERESET_VALUE1, i),
+			       (rx_line_reset_period >> 8) & 0xFF);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_RX_LINERESET_VALUE0, i),
+			       (rx_line_reset_period) & 0xFF);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x2f, i), 0x69);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x84, i), 0x1);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x25, i), 0xf6);
+	}
+
+	for_each_ufs_tx_lane(ufs, i) {
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_TX_CLK_PRD, i),
+			       DIV_ROUND_UP(NSEC_PER_SEC, ufs->mclk_rate));
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_TX_CLK_PRD_EN, i),
+			       0x02);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_TX_LINERESET_PVALUE2, i),
+			       (tx_line_reset_period >> 16) & 0xFF);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_TX_LINERESET_PVALUE1, i),
+			       (tx_line_reset_period >> 8) & 0xFF);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(VND_TX_LINERESET_PVALUE0, i),
+			       (tx_line_reset_period) & 0xFF);
+
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x04, i), 0x1);
+		ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x7f, i), 0x0);
+	}
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x200), 0x0);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0x0);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0xa011), 0x8000);
+
+	return 0;
+}
+
+static int exynosautov920_ufs_post_link(struct exynos_ufs *ufs)
+{
+	struct ufs_hba *hba = ufs->hba;
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x9529), 0x1);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x15a4), 0x3e8);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x9529), 0x0);
+
+	return 0;
+}
+
+static int exynosautov920_ufs_pre_pwr_change(struct exynos_ufs *ufs,
+					     struct ufs_pa_layer_attr *pwr)
+{
+	struct ufs_hba *hba = ufs->hba;
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(0x15d4), 0x1);
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(DL_FC0PROTTIMEOUTVAL), 8064);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(DL_TC0REPLAYTIMEOUTVAL), 28224);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(DL_AFC0REQTIMEOUTVAL), 20160);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA0), 12000);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA1), 32000);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA2), 16000);
+
+	unipro_writel(ufs, 8064, UNIPRO_DME_POWERMODE_REQ_LOCALL2TIMER0);
+	unipro_writel(ufs, 28224, UNIPRO_DME_POWERMODE_REQ_LOCALL2TIMER1);
+	unipro_writel(ufs, 20160, UNIPRO_DME_POWERMODE_REQ_LOCALL2TIMER2);
+	unipro_writel(ufs, 12000, UNIPRO_DME_POWERMODE_REQ_REMOTEL2TIMER0);
+	unipro_writel(ufs, 32000, UNIPRO_DME_POWERMODE_REQ_REMOTEL2TIMER1);
+	unipro_writel(ufs, 16000, UNIPRO_DME_POWERMODE_REQ_REMOTEL2TIMER2);
+
+	return 0;
+}
+
 /*
  * exynos_ufs_auto_ctrl_hcc - HCI core clock control by h/w
  * Control should be disabled in the below cases
@@ -951,16 +1044,6 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	struct phy *generic_phy = ufs->phy;
 	int ret = 0;
 
-	if (ufs->avail_ln_rx == 0 || ufs->avail_ln_tx == 0) {
-		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_AVAILRXDATALANES),
-			&ufs->avail_ln_rx);
-		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_AVAILTXDATALANES),
-			&ufs->avail_ln_tx);
-		WARN(ufs->avail_ln_rx != ufs->avail_ln_tx,
-			"available data lane is not equal(rx:%d, tx:%d)\n",
-			ufs->avail_ln_rx, ufs->avail_ln_tx);
-	}
-
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
 
 	if (generic_phy->power_count) {
@@ -1065,6 +1148,16 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->avail_ln_rx == 0 || ufs->avail_ln_tx == 0) {
+		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_AVAILRXDATALANES),
+			       &ufs->avail_ln_rx);
+		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_AVAILTXDATALANES),
+			       &ufs->avail_ln_tx);
+		WARN(ufs->avail_ln_rx != ufs->avail_ln_tx,
+		     "available data lane is not equal(rx:%d, tx:%d)\n",
+		     ufs->avail_ln_rx, ufs->avail_ln_tx);
+	}
+
 	if (ufs->drv_data->pre_link)
 		ufs->drv_data->pre_link(ufs);
 
@@ -2183,6 +2276,21 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.suspend		= gs101_ufs_suspend,
 };
 
+static const struct exynos_ufs_drv_data exynosautov920_ufs_drvs = {
+	.uic_attr               = &exynos7_uic_attr,
+	.quirks                 = UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING,
+	.opts                   = EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
+				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
+				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX |
+				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
+	.iocc_mask		= UFS_EXYNOSAUTOV920_SHARABLE,
+	.drv_init               = exynosauto_ufs_drv_init,
+	.post_hce_enable        = exynosauto_ufs_post_hce_enable,
+	.pre_link               = exynosautov920_ufs_pre_link,
+	.post_link              = exynosautov920_ufs_post_link,
+	.pre_pwr_change         = exynosautov920_ufs_pre_pwr_change,
+};
+
 static const struct of_device_id exynos_ufs_of_match[] = {
 	{ .compatible = "google,gs101-ufs",
 	  .data	      = &gs101_ufs_drvs },
@@ -2192,6 +2300,8 @@ static const struct of_device_id exynos_ufs_of_match[] = {
 	  .data	      = &exynosauto_ufs_drvs },
 	{ .compatible = "samsung,exynosautov9-ufs-vh",
 	  .data	      = &exynosauto_ufs_vh_drvs },
+	{ .compatible = "samsung,exynosautov920-ufs",
+	  .data       = &exynosautov920_ufs_drvs },
 	{ .compatible = "tesla,fsd-ufs",
 	  .data       = &fsd_ufs_drvs },
 	{},
-- 
2.45.2

