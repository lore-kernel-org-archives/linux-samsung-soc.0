Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA20CCA47D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 05:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiFBFdr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 01:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiFBFdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 01:33:44 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680C2A0D33
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 22:33:37 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220602053333epoutp042d6cb9217af46365737ccfd9e5b31002~0ttqlEa670845408454epoutp04t
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:33:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220602053333epoutp042d6cb9217af46365737ccfd9e5b31002~0ttqlEa670845408454epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654148013;
        bh=o7bKOgQqbI2VTypSvHHm073NNT2b9Nxi77ZmZqtwTLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZYgQoVyBWB+FnGZvGXLVG+oqCwhdNYeZTxDN0C5WMd/w8Q6cOiPW/ZcGWM178ofJu
         a8X8lqvo3GYUO0tnGiGnss+jVKSvMOD6+U93YBtkH0I4a2ftV+ZK5wVBQzD30+pcQ7
         DwoQsTK7UmgkTb3XsYjQJX2vXcAyTr4MvgKbnxUA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220602053332epcas2p13e2946d2fce19d8cf92cbaa0fb8b8187~0ttp9Zf8D2241822418epcas2p1G;
        Thu,  2 Jun 2022 05:33:32 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LDF6g46Wvz4x9Pr; Thu,  2 Jun
        2022 05:33:31 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        1F.06.10028.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epcas2p19785735bcbf08ad274ff887797485b8c~0ttm6D4va2241822418epcas2p1_;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602053329epsmtrp1c992b5af223f7be6caad72ea3ea56cc6~0ttm44SRO1617116171epsmtrp1X;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-73-62984ba9442d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F3.1E.11276.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epsmtip265b5ee48c36a66ac17e60881deec68cc~0ttmtnTpb0505705057epsmtip2I;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
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
Subject: [PATCH v2 3/6] phy: samsung: ufs: support secondary ufs phy
Date:   Thu,  2 Jun 2022 14:32:47 +0900
Message-Id: <20220602053250.62593-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602053250.62593-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmqe5K7xlJBve26Vg8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xv3Ph1kLLgtW7O3/w97A+ISvi5GTQ0LAROLx
        m0csXYxcHEICOxglDi96wgqSEBL4BOSsV4NIfGOUmNRyiRmm4+u51VAdexklmt+2QzkfGSUu
        //zNAlLFJqArseX5K0aQhIhAO5PEiXtz2UEcZoHNjBInJ2wAmyUs4CKx5McjsA4WAVWJ47f6
        weK8AnYSW460M0Lsk5fYML8XKM7BwSlgL7HljAdEiaDEyZlPwFqZgUqat85mBpkvIdDLITF9
        wTQWiF4XiVvz9rNB2MISr45vYYewpSRe9rdB2cUSS2d9YoJobgB6YdsvqAZjiVnPQI7gANqg
        KbF+lz6IKSGgLHHkFtRePomOw3/ZIcK8Eh1tQhCN6hIHtk+HukBWonvOZ1YI20Piy52j7JDA
        msQo0bv7GcsERoVZSN6ZheSdWQiLFzAyr2IUSy0ozk1PLTYqMIZHcXJ+7iZGcHLVct/BOOPt
        B71DjEwcjIcYJTiYlUR4S3ZNTRLiTUmsrEotyo8vKs1JLT7EaAoM64nMUqLJ+cD0nlcSb2hi
        aWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1OqgUnBdnHg2ag0tt2hWhohy8+d
        bvfVf/TruvfKu7b8CfJ37CtucCjXtgYFfrx7V23JmtaDf39ryW//u8QzSeeEZ8Wfc4fP+35l
        ldqQVGQZFdyQfqf64m4NiW1XZrvsYlCfeG3d+9YSHfb8pk05NxLEn1vwlM2zao2S+WZY8/LY
        49p17csqu2fqbjWa55ngsM9Db0ULc4RL6uHQpD62xPz/n3e0Bdrz/Lhr6mCwgPGWYt3Hw1Zz
        LCVUD84/dp8368rTifPDVnc/S5sRXHyAJXbTF21tPQ7Oe7xRQk37f1vM1N7/Y3vahZKsrT6f
        DBX8xU88TjJ/tnlqQ95kp0ajCJeI65d2aW/9J/rluoH3+4lpIkosxRmJhlrMRcWJAH5WGw83
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSvO5K7xlJBssuCVk8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugSvj/ufDrAWXBSv29v9h
        b2B8wtfFyMkhIWAi8fXcapYuRi4OIYHdjBIv3y9ihEjISjx7t4MdwhaWuN9yhBXEFhJ4zygx
        fXEhiM0moCux5fkrRpBmEYFuJok5m/qZQBxmge2MEh+WrmMBqRIWcJFY8uMRmM0ioCpx/FY/
        M4jNK2AnseVIO9Q2eYkN83uB4hwcnAL2ElvOeEAss5PYfHkDK0S5oMTJmU/AxjADlTdvnc08
        gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgqNAS3MH4/ZVH/QO
        MTJxMB5ilOBgVhLhLdk1NUmINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakF
        qUUwWSYOTqkGpkNP+GLknc939Goce+3euGyJskA3/wNPtaZft1bzzQqYnlh0jvNGulFL+Ble
        /gCZvz8ihScz1mh+q9C/fEBwwtlZ/lf8tkfnNugwlEmaiyTEG9x8Nat9+r6noTq2TxZNF3Sc
        Hbe+spBP4njw2sPHr8uZ9t2PnCfjXxHgs21DZBi/J4/u/dNneEqDPOdWbpnKlesf+ft+QcOr
        zxe3BLOER0xk+Fj64+jLg9H+5ga7N0+y2HyCLcj46bWK9b0eRcstNvb79s3uXmb2wjDB9ab3
        gnXatlyHtt8LfDKvzV//3/wopq4kKevl0VpagVaVDS97TBckRP37FrTXVNG6YqYt5/uND5u3
        LF5sG7k0+/8sJZbijERDLeai4kQAr3T7JvECAAA=
X-CMS-MailID: 20220602053329epcas2p19785735bcbf08ad274ff887797485b8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p19785735bcbf08ad274ff887797485b8c
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p19785735bcbf08ad274ff887797485b8c@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support secondary ufs phy device, we need to get an offset for phy
isolation from the syscon DT node. If the first index argument of the
node is existing, we can read the offset value and set it as isol->offset.
To allow this assignment, we need to change the field so the isol data
needs to be allocated and copied from drvdata.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 14 +++++++++++++-
 drivers/phy/samsung/phy-samsung-ufs.h |  2 +-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index b7ddb91a02be..7716b6dc955b 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -288,6 +288,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	struct phy *gen_phy;
 	struct phy_provider *phy_provider;
 	const struct samsung_ufs_phy_drvdata *drvdata;
+	u32 isol_offset;
 	int err = 0;
 
 	match = of_match_node(samsung_ufs_phy_match, dev->of_node);
@@ -324,11 +325,22 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	phy->isol = devm_kzalloc(dev, sizeof(struct pmu_isol), GFP_KERNEL);
+	if (!phy->isol) {
+		err = -ENOMEM;
+		goto out;
+	}
+
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
 	phy->cfg = drvdata->cfg;
-	phy->isol = &drvdata->isol;
+	memcpy(phy->isol, &drvdata->isol, sizeof(struct pmu_isol));
+
+	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
+					&isol_offset))
+		phy->isol->offset = isol_offset;
+
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
 	phy_set_drvdata(gen_phy, phy);
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 8c3696b3c5ec..d3e1c2016b27 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -122,7 +122,7 @@ struct samsung_ufs_phy {
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
 	const struct samsung_ufs_phy_cfg **cfg;
-	const struct pmu_isol *isol;
+	struct pmu_isol *isol;
 	u8 lane_cnt;
 	int ufs_phy_state;
 	enum phy_mode mode;
-- 
2.36.1

