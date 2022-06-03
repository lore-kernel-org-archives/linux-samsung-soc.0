Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DCBCCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbiFCCEf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240087AbiFCCEd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:33 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D93F35DD8
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:30 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220603020428epoutp01df585e1203299f1bb33bdc4a390781b8~0_gZm5ibF1690416904epoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220603020428epoutp01df585e1203299f1bb33bdc4a390781b8~0_gZm5ibF1690416904epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221868;
        bh=9MqgwAf/KbNyp8sEkjfydslwVuQS/C9wRyn0+i9iZbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ks9SAFWkjxtGKUxC2MnvOAR+pGhfVsdAyOSFx4YyzT3SK6bHNGQn/sAfvAUb8CgbP
         Rjr8dm2paSVRdQJCs71gHspMY9GZYIalC7hwY21ZlQQW0koFq+cta78xOt0EzcNRbS
         1ifCqxvJGcLn5FCQ2JZCtgkErsH2xioztLVMwldY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220603020427epcas2p36ce32bf06567d5b49111a86d14b41c2c~0_gZAy4_l1599315993epcas2p3k;
        Fri,  3 Jun 2022 02:04:27 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LDmQz10TDz4x9QB; Fri,  3 Jun
        2022 02:04:27 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        41.F9.09764.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p484be447d93da1c015415fb2847f659a7~0_gXmjLHp2242022420epcas2p46;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp1275cef4f6bdb213646363e4e271f6122~0_gXlbrqI1338013380epsmtrp1g;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-a2-62996c2af850
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        63.FF.08924.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip1890dba263334fddc2d6eaa22a0691b05~0_gXYMxQ82850828508epsmtip1n;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
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
Subject: [PATCH v3 2/5] phy: samsung: ufs: rename cfg to cfgs for
 clarification
Date:   Fri,  3 Jun 2022 11:04:07 +0900
Message-Id: <20220603020410.2976-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603020410.2976-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmma5Wzswkg2evbCwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE749PDH6wFRyQr9vxdytjA+Em0i5GDQ0LARKJp
        hlkXIxeHkMAORolnB1YyQjifGCUWTl7FBuF8ZpR4+mgnUIYTrGPxkh/sEIldjBKnF2xhAUkI
        CXxklPhySxnEZhPQldjy/BXYKBGBdiaJE/fmgnUwC2xmlDg5YQMzyHJhgUCJz/eSQRpYBFQl
        Lp3qYAaxeQVsJfZ2zWaC2CYvsWF+L1icU8BO4vq0r1A1ghInZz4BW8wMVNO8dTYzRH0vh8SX
        FRwQtovE46nn2CFsYYlXx7dA2VISL/vboOxiiaWzPjGB3CYh0MAocXnbLzaIhLHErGftjCB3
        MgtoSqzfpQ8JL2WJI7eg1vJJdBz+yw4R5pXoaBOCaFSXOLB9OguELSvRPeczK0SJh8StHzGQ
        YJvIKNG25AHzBEaFWUiemYXkmVkIexcwMq9iFEstKM5NTy02KjCCx29yfu4mRnBa1XLbwTjl
        7Qe9Q4xMHIyHGCU4mJVEeEt2TU0S4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnAxJ5XEm9o
        YmlgYmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1CKaPiYNTqoHJsjll590Mrvnu8zdO4Fxu
        V8YXveXhzSAvDwflKzd1ptgu0+hVnDZ9+aFNUwVeidZPO/32f8aTLJk3ygr13TLbm4vyDA8s
        dN1RJHzsd6/Nbab6lxk8uVM8LidNCi9ZyeohsFNDJaqUZ89Epb5wSVafiSLbzZRW20k/DVcp
        tZfY/f9BjC2fxLQ9HgsK5mkrmL1oL6vkcNiloBenECHsJFhmeb3xtMLlVmOJNXufsbKI7Tv2
        bd+OyEmVmT85VqokRV/t+fL1ZWqHxY62HdvnSId58/6w3c/eZDo92Ub5kdNZtY13XkmcsrU8
        66vHs/LaGhfdg8fPz1w79ZcIU352k1XJhz7V4Pn63r/jTUqvrlJiKc5INNRiLipOBADaSkfq
        NAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnK5Wzswkgy+rBSwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJXx6eEP1oIjkhV7/i5l
        bGD8JNrFyMkhIWAisXjJD/YuRi4OIYEdjBKX2jYyQiRkJZ6928EOYQtL3G85wgpR9J5Ron3B
        GTaQBJuArsSW568YQRIiAt1MEnM29TOBOMwC2xklPixdxwJSJSzgLzHryHNWEJtFQFXi0qkO
        ZhCbV8BWYm/XbCaIFfISG+b3gsU5Bewkrk/7CmYLAdU873vGAlEvKHFy5hMwmxmovnnrbOYJ
        jAKzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHAlaWjsY96z6oHeI
        kYmD8RCjBAezkghvya6pSUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1I
        LYLJMnFwSjUwnfnpvurt3ZtxM/4u2y6z3fya0V15Q9vfZ2PfXO3Z2tN6LknP863KDA3dab1/
        gvQXT0r+e+4s3526cotWz18SJhOaLs+bLd8sfrKvxnKV8PqQd8eMUq5by+1YYLkxMefdwvv2
        wkbVab2WlW9VLLlVdgm//8Khq6lSw3QvLrjRw8te1t1s5XzlSeut5MpLtqk5bDJ6drNvoXTr
        g81+mw6wP36ufKK0VF6sOaTz/9z33OH/PzKuyavpd1Iwf6bRdGKdStORE7sYk7bx7j2VsHHD
        4lUZeWY3bh7zWhydknxsf7SC+mfHjfM3dS0v8lnNl7oyYt2ax/Yd8fysT2uWiKSe2vNp5cPG
        qbxXY5ed233GWYmlOCPRUIu5qDgRAF0758rzAgAA
X-CMS-MailID: 20220603020426epcas2p484be447d93da1c015415fb2847f659a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p484be447d93da1c015415fb2847f659a7
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p484be447d93da1c015415fb2847f659a7@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Rename **cfg to **cfgs to clarify the naming.

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

