Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD921C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbiFGH3q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237649AbiFGH3o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:29:44 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB29532DD
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:29:42 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220607072940epoutp03c3042ebb0b4c03741e2bfdf8c1da42d3~2RhebxrVT0966609666epoutp03E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:29:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220607072940epoutp03c3042ebb0b4c03741e2bfdf8c1da42d3~2RhebxrVT0966609666epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654586980;
        bh=TDNzEk7VSugJEA9FZ5eV6MjEUOpKJylnlO49SvxDu8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QpXo5DLJ6JwYO/zr46XLU0dxr4ypg6M2MpqyLVhHV0IyWDalJ2dBzd55AcAXMuAY7
         y0sBzoVg232SVxuXsCOmfI1UcfK8T4+4k/mJWH0HCAxpEyBZd9QXZqwLd2i7cfc/9A
         puihn5A61h6osvS4Se2iz+yzSWLzYoGIfgTuJkRo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607072939epcas2p4f6629c216ba309b34d7e8ba66e0ac1ec~2RhdzqRdS2030220302epcas2p4D;
        Tue,  7 Jun 2022 07:29:39 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHMSL6kYwz4x9QT; Tue,  7 Jun
        2022 07:29:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        67.A0.09694.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220607072938epcas2p2bdb46daf95668223a07431433d91868f~2RhcYEIa-2184221842epcas2p2L;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220607072938epsmtrp15a28170c25f06a3724015e35dc2a4506~2RhcXTE1E0498504985epsmtrp14;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-c7-629efe621318
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.53.08924.16EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220607072937epsmtip1b095d362235a013379c493462bec1b52~2RhcM57i90977809778epsmtip1C;
        Tue,  7 Jun 2022 07:29:37 +0000 (GMT)
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
Subject: [PATCH v4 2/5] phy: samsung: ufs: rename cfg to cfgs for
 clarification
Date:   Tue,  7 Jun 2022 16:29:04 +0900
Message-Id: <20220607072907.127000-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607072907.127000-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmmW7Sv3lJBisfGVs8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xpQjC5gL2qUqtj0+xdzAuEGsi5GTQ0LARKJv
        1kemLkYuDiGBHYwSN5c/Y4RwPjFKHHz7mhXC+cwo0Tn3MTtMy5PuF2wQiV2MEhdubWcESQgJ
        fGSUOH9JHcRmE9CV2PL8FdgoEYF2JokT9+aygzjMApsZJU5O2MAMUiUsECgx4cxWsLEsAqoS
        j6ddAovzCthLzF7wlxVinbzEhvm9QHEODk4BB4klp7UgSgQlTs58wgJiMwOVNG+dzQwyX0Jg
        IofE17+djBC9LhJrnk+HsoUlXh3fAvWClMTL/jYou1hi6axPTBDNDYwSl7f9YoNIGEvMetbO
        CLKYWUBTYv0ufRBTQkBZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5sn84CYctKdM/5DPWJh8St
        p9uYIWE1mVGi473OBEaFWUi+mYXkm1kIexcwMq9iFEstKM5NTy02KjCBx3Byfu4mRnBq1fLY
        wTj77Qe9Q4xMHIyHGCU4mJVEeP0nz00S4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnA5J5X
        Em9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1CKaPiYNTqoHJXCplUcBDs5Q9jqce
        tKx9eOuyxKT57pFNS59uYU79d+2CkvVyncMxua88coV01T2abubZzcl4E3ZZnvHW5HjBvf+W
        ztmksUixLkyxeFX488mqry2ex7yzTr3zuHGx1WzzrnX6akb3P4rdyJNbMflb3jYjQRadw50y
        T62fSfUI8samtl04+k9qhtyaW3WOZV8aEhiqb00V6Ts4pacq1EAleJ7jJ+bY/5LhiteFmmdv
        DHjyYl7Pwh8hXbXycxt7StzO/i5JYJKdPuGHdQs/p8fy3BeZl9ttknJPOD+9uLmS6UJh/PQF
        VbYF08MnMFak6vmvjGkP0ut7Vdb5+nNrW1O44eoNoY5CWkHb857L/FFiKc5INNRiLipOBADD
        7IoBNgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnG7Sv3lJBttuMlo8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugStjypEFzAXtUhXbHp9i
        bmDcINbFyMkhIWAi8aT7BVsXIxeHkMAORol/q26zQSRkJZ6928EOYQtL3G85wgpR9J5R4vza
        R4wgCTYBXYktz18xgiREBLqZJOZs6mcCcZgFtjNKfFi6jgWkSljAX+LrhrWsIDaLgKrE42mX
        mEFsXgF7idkL/rJCrJCX2DC/FyjOwcEp4CCx5LQWSFgIqGTWkc8sEOWCEidnPgGzmYHKm7fO
        Zp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBcaCltYNxz6oP
        eocYmTgYDzFKcDArifD6T56bJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU
        1ILUIpgsEwenVAPTjKlqM/0suAs390x68eVN5hqhrcZFi94KCJaHn2ryu7nEzEnjsZ/u4vSn
        uZv+eS75c/DbuT//e205DyanLG/J1BPO7m95ejr4iJ/24nVfrLzWLbY9ebYs5OWpC44hV49p
        5i5Tt1GsOz/7xqKQLTvc1NVlzs56+7bG7zj/OzNL8TmJn7cffz77VXfos3UVa4U6Xvi2X5Ke
        7mxxdP6xy+0WoW+CNQ5Oipt/M7ezWzue4/cnr8edPNlzOgMbfVRta94YB/S/Nb0/8ZS/fNjk
        T2HnlS9kHr2ecuqgbk1UTITeI5tHhvx7LE891s2Naa5ntfWMUXur8cL19B5hAf2DuXfULNbf
        P5dewPZaxvPOrsusSizFGYmGWsxFxYkANVyD8vICAAA=
X-CMS-MailID: 20220607072938epcas2p2bdb46daf95668223a07431433d91868f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072938epcas2p2bdb46daf95668223a07431433d91868f
References: <20220607072907.127000-1-chanho61.park@samsung.com>
        <CGME20220607072938epcas2p2bdb46daf95668223a07431433d91868f@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Rename **cfg to **cfgs to clarify the naming.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-exynos7-ufs.c      | 2 +-
 drivers/phy/samsung/phy-exynosautov9-ufs.c | 2 +-
 drivers/phy/samsung/phy-samsung-ufs.c      | 4 ++--
 drivers/phy/samsung/phy-samsung-ufs.h      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c b/drivers/phy/samsung/phy-exynos7-ufs.c
index 7c9008e163db..d1e9d0ae5c1d 100644
--- a/drivers/phy/samsung/phy-exynos7-ufs.c
+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
@@ -67,7 +67,7 @@ static const struct samsung_ufs_phy_cfg *exynos7_ufs_phy_cfgs[CFG_TAG_MAX] = {
 };
 
 const struct samsung_ufs_phy_drvdata exynos7_ufs_phy = {
-	.cfg = exynos7_ufs_phy_cfgs,
+	.cfgs = exynos7_ufs_phy_cfgs,
 	.isol = {
 		.offset = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c b/drivers/phy/samsung/phy-exynosautov9-ufs.c
index d043dfdb598a..fa4d2983eec6 100644
--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
@@ -57,7 +57,7 @@ static const struct samsung_ufs_phy_cfg *exynosautov9_ufs_phy_cfgs[CFG_TAG_MAX]
 };
 
 const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy = {
-	.cfg = exynosautov9_ufs_phy_cfgs,
+	.cfgs = exynosautov9_ufs_phy_cfgs,
 	.isol = {
 		.offset = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 602ddef259eb..ed272631e8aa 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
+	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfgs;
 	const struct samsung_ufs_phy_cfg *cfg;
 	int err = 0;
 	int i;
@@ -327,7 +327,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
-	phy->cfg = (struct samsung_ufs_phy_cfg **)drvdata->cfg;
+	phy->cfgs = (struct samsung_ufs_phy_cfg **)drvdata->cfgs;
 	phy->isol = &drvdata->isol;
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 91a0e9f94f98..1788b356cf56 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -102,7 +102,7 @@ struct samsung_ufs_phy_cfg {
 };
 
 struct samsung_ufs_phy_drvdata {
-	const struct samsung_ufs_phy_cfg **cfg;
+	const struct samsung_ufs_phy_cfg **cfgs;
 	struct pmu_isol {
 		u32 offset;
 		u32 mask;
@@ -121,7 +121,7 @@ struct samsung_ufs_phy {
 	struct clk *rx0_symbol_clk;
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	struct samsung_ufs_phy_cfg **cfg;
+	struct samsung_ufs_phy_cfg **cfgs;
 	const struct pmu_isol *isol;
 	u8 lane_cnt;
 	int ufs_phy_state;
-- 
2.36.1

