Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABC5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240193AbiFCCEj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240231AbiFCCEe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:34 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AC03969D
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:32 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220603020429epoutp0284d94de3ea39b90f0748d4860b86922d~0_gazld8C0744207442epoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220603020429epoutp0284d94de3ea39b90f0748d4860b86922d~0_gazld8C0744207442epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221869;
        bh=J1b1YzG7fCcaLDe0+O1yUP/X0404BWjJ2qJu95CE+nc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UoLqi8fDR323OtxraMbspI93f9zAX2rZYOyndc+1z668EZ3TTSRmsrv1O9os6sboI
         a7uIreilHCG9cpioJ1M8c6BvTfnd1c4WXSTACybXJDmIEr9QELsDdmG7311Ojy4rhw
         YNiyeCaUVtgvP/YPL7w5+Afbmq6YSCH9WZ6CdYuw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220603020429epcas2p2c12d82ba4017ee76d7eb03781253beb2~0_gaLYKwY1635016350epcas2p2d;
        Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LDmR01mtTz4x9Q2; Fri,  3 Jun
        2022 02:04:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        71.F9.09764.B2C69926; Fri,  3 Jun 2022 11:04:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p43c70afe414dc36f3abb18cbdb1d450a4~0_gXsrGqo2972129721epcas2p4b;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp15d7668f406c1327a9a43d687506526fd~0_gXrgC111338013380epsmtrp1h;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a46-79619a8000002624-a4-62996c2bc3ae
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D4.FF.08924.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip1410415a756c30d1e70ed40e4f0cf4024~0_gXgJX2o2850828508epsmtip1o;
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
Subject: [PATCH v3 4/5] phy: samsung: ufs: remove drvdata from struct
 samsung_ufs_phy
Date:   Fri,  3 Jun 2022 11:04:09 +0900
Message-Id: <20220603020410.2976-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603020410.2976-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmqa52zswkg28drBYP5m1js7i8X9ti
        /pFzrBYXnvawWfS9eMhssff1VnaLTY+vsVpMWPWNxWLG+X1MFq17j7Bb7LxzgtmB22PTqk42
        jzvX9rB5bF5S79G3ZRWjx/Eb25k8Pm+SC2CLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUz
        MNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpOSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQ
        klNgXqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdcWmbasEKqYpJBxewNDDOFuti5OSQEDCR2PXm
        P0sXIxeHkMAORolTc7eyQzifGCUerf8P5XxmlJi04QkbTEv/wxuMEIldjBIzf/2Gcj4ySuw8
        3cICUsUmoCux5fkrsISIQDuTxIl7c8FmMQtsZpQ4OWEDM0iVsEC4ROeLs6wgNouAqsSb2RDd
        vAK2EpcWT2SE2CcvsWF+L1g9p4CdxPVpX5khagQlTs58AlbPDFTTvHU2M0R9K4fE9XsOELaL
        xKXP65kgbGGJV8e3sEPYUhIv+9ug7GKJpbM+MYEcJyHQwChxedsvqEeNJWY9awc6ggNogabE
        +l36IKaEgLLEkVtQa/kkOg7/ZYcI80p0tAlBNKpLHNg+nQXClpXonvOZFcL2kOh+dhAsLiQw
        kVHifX/wBEaFWUiemYXkmVkIexcwMq9iFEstKM5NTy02KjCCx3Byfu4mRnBq1XLbwTjl7Qe9
        Q4xMHIyHGCU4mJVEeEt2TU0S4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnA5J5XEm9oYmlg
        YmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1CKaPiYNTqoFp3c9laUfD9zya3/CauSu8kd+3
        eJnjp21X7jL7yBo8WZ8/cf3EED32Z3piiT+lDUtFpxtLZ6w+sH6KQVwOr6my9O9jkr/eiL05
        6OD0wkfdyj/33KetK24um/ZB0krn+RQuBmM2RY/fp3Z+UxWUrq7JvRL/1W2V+MeCvLm5xw1/
        /lApy1+bJd+UkVv9S/Jrcp/z9VsKB9f/jVt/58Rfpdg9ky42LLsU+LZDl6dv74OSBdWxSzbr
        V282+Va9hs/iw1eZubf5Jy3iOHqwv//ZldKrExQDBLyvKWmcTjxdU99Wb/BwSUlDwM5jep9S
        1s+Ub7putSTZ93f/15dKKzqu5fM/K9u4a2PHuskRJ0PmLrXdpcRSnJFoqMVcVJwIAAsYbbI2
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnK5WzswkgwMfJCwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJVxaZtqwQqpikkHF7A0
        MM4W62Lk5JAQMJHof3iDsYuRi0NIYAejxNnT5xkhErISz97tYIewhSXutxxhhSh6zyix9eRB
        ZpAEm4CuxJbnr8C6RQS6mSTmbOpnAnGYBbYzSnxYuo4FpEpYIFRi5sQfYDaLgKrEm9ktYDav
        gK3EpcUTodbJS2yY3ws2lVPATuL6tK9gthBQzfO+Z1D1ghInZz4Bs5mB6pu3zmaewCgwC0lq
        FpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwXGgpbWDcc+qD3qHGJk4GA8x
        SnAwK4nwluyamiTEm5JYWZValB9fVJqTWnyIUZqDRUmc90LXyXghgfTEktTs1NSC1CKYLBMH
        p1QDk8rH0tvbS1RCV96TmbX43bO7n5P/bnkq+E04Ulouwn/ChS+bHpplb2PInNExo+1EpsS7
        rGOBF27eCk3cH5DZ9v9nj1ylccLmZf9lPaKSdob8rDySJug/c+Obc2ZtCx79dvvrPNG6PnfG
        7DOKl1Qs9FezfE9nmWz4O/vsEi6LQ/ZSc1dJmBUYv+FbEy3lm+ecafise67W84US29wnH3Nk
        rbinWMDr5Od/aLNCh+JmG02782cM3z3PvMe0NuHWzssbq+V+5C/pWZDpl1a12eDQ0hX/Xwen
        f407fmxVwwzRyslf9wToOQdteR28gNdmqwDzb4nFQWX5l9vvrNBr1czyUTxeNJPJRNZ7zj3/
        uDuh/5VYijMSDbWYi4oTAZcowULyAgAA
X-CMS-MailID: 20220603020426epcas2p43c70afe414dc36f3abb18cbdb1d450a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p43c70afe414dc36f3abb18cbdb1d450a4
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p43c70afe414dc36f3abb18cbdb1d450a4@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To change an offset of pmu_isol, we need to store its data instead of
having drvdata's pointer. The definition of the pmu_isol structure
should be extracted from samsung_ufs_phy_drvdata and rename the name
with samsung_ufs_phy_ prefix.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c |  9 +++++----
 drivers/phy/samsung/phy-samsung-ufs.h | 20 +++++++++++---------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index e1e26da27245..0530513f2263 100644
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
index 101497698f23..79b535923844 100644
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
 
@@ -120,9 +122,9 @@ struct samsung_ufs_phy {
 	struct clk *tx0_symbol_clk;
 	struct clk *rx0_symbol_clk;
 	struct clk *rx1_symbol_clk;
-	const struct samsung_ufs_phy_drvdata *drvdata;
 	const struct samsung_ufs_phy_cfg **cfgs;
-	const struct pmu_isol *isol;
+	struct samsung_ufs_phy_pmu_isol isol;
+	bool has_symbol_clk;
 	u8 lane_cnt;
 	int ufs_phy_state;
 	enum phy_mode mode;
@@ -136,8 +138,8 @@ static inline struct samsung_ufs_phy *get_samsung_ufs_phy(struct phy *phy)
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

