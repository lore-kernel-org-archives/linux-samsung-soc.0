Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25FCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbiFGH3q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiFGH3o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:29:44 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F70E53722
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:29:42 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220607072940epoutp02b48d3c40243312562db72fcf89179f2c~2RhebisHf0761307613epoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:29:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220607072940epoutp02b48d3c40243312562db72fcf89179f2c~2RhebisHf0761307613epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654586980;
        bh=m9YTaw8QCCZT36Ok9LFuaA4+fVLObZmPAUiV0wh0I68=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E0j8ORz8H/CXI0yTxbDV2ZHiWYnACkJdKil+xoD/IJO+O6tA+SLln+zanStoYWbzy
         UzFWn792lSqqbvRJglf8AdvbbUVR6x6RvarD8f6fBPEon5vzz5vq1eXxkTMT8cdJ81
         SZ2Zf8XZCPeD7Tre3C6b/EalFsFic6EzBGctpGwM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607072939epcas2p48db3cfefc523ab93885a7dff217ddc03~2Rhdzpquv1805918059epcas2p4Z;
        Tue,  7 Jun 2022 07:29:39 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHMSL6kpMz4x9QV; Tue,  7 Jun
        2022 07:29:38 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.A0.09694.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220607072938epcas2p1bb5de39d25c45540c01fa5dfda5bb891~2Rhciwnie1437714377epcas2p1h;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220607072938epsmtrp13c10ff3ab9a2495a2e4c43aee29212ba~2Rhch73TI0498404984epsmtrp18;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-c8-629efe62bb3b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B7.77.11276.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220607072938epsmtip1336aa726c79d726c0536b025796e66dd~2RhcVGPJO0977809778epsmtip1D;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 4/5] phy: samsung: ufs: remove drvdata from struct
 samsung_ufs_phy
Date:   Tue,  7 Jun 2022 16:29:06 +0900
Message-Id: <20220607072907.127000-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607072907.127000-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmuW7Sv3lJBt+nmlo8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xsUDixkLNktV3Fp0jqmBcZVYFyMnh4SAicTX
        548Yuxi5OIQEdjBKHO5fzQrhfGKUeLLlKTOE841R4tjX00wwLe+mXWYFsYUE9jJKvF/iD1H0
        kVHi47KH7CAJNgFdiS3PX4HNFRFoZ5I4cW8uO4jDLLCZUeLkhA3MIFXCAuESL++9YgGxWQRU
        JW7t2MEIYvMK2Evsnn4dap28xIb5vUD1HBycAg4SS05rQZQISpyc+QSslRmopHnrbLBTJQQm
        ckjc63/JDlIvIeAi0bpBD2KMsMSr41vYIWwpiZf9bVB2scTSWZ+YIHobGCUub/vFBpEwlpj1
        rJ0RZA6zgKbE+l36ECOVJY7cglrLJ9Fx+C/UJl6JjjYhiEZ1iQPbp7NA2LIS3XM+s0LYHhIL
        J91kh4TVZEaJI1c2MU1gVJiF5JtZSL6ZhbB4ASPzKkax1ILi3PTUYqMCE3gMJ+fnbmIEp1Yt
        jx2Ms99+0DvEyMTBeIhRgoNZSYTXf/LcJCHelMTKqtSi/Pii0pzU4kOMpsCgnsgsJZqcD0zu
        eSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1MLUotg+pg4OKUamKKf7UyoFRGY/qFE
        OSbuUMD9o3dnzTf7oXyLlX2v9WYNP8bGbP9NquYHNnV9OavbZCmm6aZzoj9pxt+DTnbSESyO
        Vye1cL9xFFeda8d+07r42al3l1f1nfrSPD3BVq6NMajFqqNuW9euxXfb+t6IfF4hzDv/fNL9
        OYmG3RskGT6Hecuvedcj+lzz6Bx703VCvu9b7Q3eRrTxGxpUXFp/LWX1Nm2bT+wmhzfMi1ua
        szCySyzxP5OdLWMmI19miUDPlqCrczf0G15qby7r0VzOyX988kzfcvXIs8zXzAU/6j/rvb87
        2urRtCvhx5/ZNFeumiy/1jiitUv4ywGlZ3v7E0+ape2cz3e41KiM56GUEktxRqKhFnNRcSIA
        LsM8XjYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnG7Sv3lJBqvfclk8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugSvj4oHFjAWbpSpuLTrH
        1MC4SqyLkZNDQsBE4t20y6xdjFwcQgK7GSU2n5vFBpGQlXj2bgc7hC0scb/lCFTRe0aJ7qkL
        mEASbAK6Eluev2IESYgIdDNJzNnUzwTiMAtsZ5T4sHQdC0iVsECoRPv8nYwgNouAqsStHTvA
        bF4Be4nd068zQayQl9gwv5e5i5GDg1PAQWLJaS2QsBBQyawjn1kgygUlTs58AmYzA5U3b53N
        PIFRYBaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLjQEtzB+P2VR/0
        DjEycTAeYpTgYFYS4fWfPDdJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2amp
        BalFMFkmDk6pBia/jS8WVj533mWySF/fP+/5/DkLNhU/vcSxQ849zF83ket4z95XX97/M449
        x+898dKCTTb2kUv+PHFfpe99eLKJneAH1ewFP9ryN5rFV+XeLd5z5r/zlpLHcyXKXhmV33/y
        vlnCI9rWOtutQHfBgl/vtjo++N91Sir38ZKGuq1nrn3bsqDVXq+Qye7bZ3GjC3fZZR5mrF1W
        5hixSblNbfUCyy28V/u/7fvNVbKna+amIyFfZPUdRW75BfkbyRxawv+rZV2YgobjQ7mPSVHn
        ZLWZnT5V/e5iLF7s0XP9W0X9///Hrhy/LPLt2fxJk8wq5i3pWpfjt/iCt2BlQsb0u+uXVSvt
        YyzdmHtjx9Lnmlf8lViKMxINtZiLihMBs35tYPICAAA=
X-CMS-MailID: 20220607072938epcas2p1bb5de39d25c45540c01fa5dfda5bb891
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072938epcas2p1bb5de39d25c45540c01fa5dfda5bb891
References: <20220607072907.127000-1-chanho61.park@samsung.com>
        <CGME20220607072938epcas2p1bb5de39d25c45540c01fa5dfda5bb891@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To change an offset of pmu_isol, we need to store its data instead of
having drvdata's pointer. The definition of the pmu_isol structure
should be extracted from samsung_ufs_phy_drvdata and rename the name
with samsung_ufs_phy_ prefix.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c |  9 +++++----
 drivers/phy/samsung/phy-samsung-ufs.h | 19 +++++++++++--------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index cd1c02d2cdda..0c933e364064 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -207,7 +207,7 @@ static int samsung_ufs_phy_init(struct phy *phy)
 	ss_phy->lane_cnt = phy->attrs.bus_width;
 	ss_phy->ufs_phy_state = CFG_PRE_INIT;
 
-	if (ss_phy->drvdata->has_symbol_clk) {
+	if (ss_phy->has_symbol_clk) {
 		ret = samsung_ufs_phy_symbol_clk_init(ss_phy);
 		if (ret)
 			dev_err(ss_phy->dev, "failed to set ufs phy symbol clocks\n");
@@ -259,7 +259,7 @@ static int samsung_ufs_phy_exit(struct phy *phy)
 
 	clk_disable_unprepare(ss_phy->ref_clk);
 
-	if (ss_phy->drvdata->has_symbol_clk) {
+	if (ss_phy->has_symbol_clk) {
 		clk_disable_unprepare(ss_phy->tx0_symbol_clk);
 		clk_disable_unprepare(ss_phy->rx0_symbol_clk);
 		clk_disable_unprepare(ss_phy->rx1_symbol_clk);
@@ -326,9 +326,10 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 
 	drvdata = match->data;
 	phy->dev = dev;
-	phy->drvdata = drvdata;
 	phy->cfgs = drvdata->cfgs;
-	phy->isol = &drvdata->isol;
+	phy->has_symbol_clk = drvdata->has_symbol_clk;
+	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
+
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
 	phy_set_drvdata(gen_phy, phy);
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 5cd919539a3e..854b53bdf347 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -101,13 +101,15 @@ struct samsung_ufs_phy_cfg {
 	u8 id;
 };
 
+struct samsung_ufs_phy_pmu_isol {
+	u32 offset;
+	u32 mask;
+	u32 en;
+};
+
 struct samsung_ufs_phy_drvdata {
 	const struct samsung_ufs_phy_cfg **cfgs;
-	struct pmu_isol {
-		u32 offset;
-		u32 mask;
-		u32 en;
-	} isol;
+	struct samsung_ufs_phy_pmu_isol isol;
 	bool has_symbol_clk;
 };
 
@@ -122,7 +124,8 @@ struct samsung_ufs_phy {
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
 	const struct samsung_ufs_phy_cfg * const *cfgs;
-	const struct pmu_isol *isol;
+	struct samsung_ufs_phy_pmu_isol isol;
+	bool has_symbol_clk;
 	u8 lane_cnt;
 	int ufs_phy_state;
 	enum phy_mode mode;
@@ -136,8 +139,8 @@ static inline struct samsung_ufs_phy *get_samsung_ufs_phy(struct phy *phy)
 static inline void samsung_ufs_phy_ctrl_isol(
 		struct samsung_ufs_phy *phy, u32 isol)
 {
-	regmap_update_bits(phy->reg_pmu, phy->isol->offset,
-			   phy->isol->mask, isol ? 0 : phy->isol->en);
+	regmap_update_bits(phy->reg_pmu, phy->isol.offset,
+			   phy->isol.mask, isol ? 0 : phy->isol.en);
 }
 
 extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
-- 
2.36.1

