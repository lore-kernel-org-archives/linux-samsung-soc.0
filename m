Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9750BCCA479
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 05:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiFBFdt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 01:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiFBFdp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 01:33:45 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F3D6C578
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 22:33:37 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220602053332epoutp0457ef34da3b3ce4ec11d5efe1aaa6afad~0ttpdIo600848808488epoutp04r
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:33:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220602053332epoutp0457ef34da3b3ce4ec11d5efe1aaa6afad~0ttpdIo600848808488epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654148012;
        bh=WgvzKcHvfk9gUWzad49jIUGGE8V9NcBo2HSwvhCse7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XIr0Ip6Q/tMQGKh1eLkIUsOqVr2Ul3wy2AWoPuInz90yBJ5xsZ1OzN+N0sUAlexfG
         JBm8R7TSgPQWDpDY8O7LMORI840EqKBD9UBLxJSxG3wdCrcsKAjHa90maCCHAKbJ/C
         i3XgJYkps790s4Z+OaeUFVhvDL8oUjTq3p9GKd0I=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220602053331epcas2p324cc6438bffd229c8daab763e0e2539f~0ttolIAsP1927619276epcas2p3L;
        Thu,  2 Jun 2022 05:33:31 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LDF6f0hf2z4x9QB; Thu,  2 Jun
        2022 05:33:30 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7E.23.09764.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9~0ttm2BqXV0634006340epcas2p2h;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602053329epsmtrp13bb802533e673910d4ffa5b7c371d124~0ttmzRqyB1617116171epsmtrp1W;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-ec-62984ba95338
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BC.28.08924.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epsmtip2e0bed9f29b22452577a1e10eeaa6eeee~0ttmoIUeT0736507365epsmtip2f;
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
Subject: [PATCH v2 2/6] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Date:   Thu,  2 Jun 2022 14:32:46 +0900
Message-Id: <20220602053250.62593-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602053250.62593-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmhe5K7xlJBreeG1o8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xsTFX9kLPvNWbP20jb2B8RN3FyMnh4SAicT1
        bfcYuxi5OIQEdjBKLHnznR3C+cQoseXNHSYI5zOjxOqDW5lgWi60P4Zq2cUoMa/lGBuE85FR
        4vLn/ewgVWwCuhJbnr8CqxIRaGeSOHFvLthgZoHNjBInJ2xgBqkSFnCXuHT9JSuIzSKgKtGz
        dhFYN6+AncTkJadYIfbJS2yY3wtUz8HBKWAvseWMB0SJoMTJmU9YQGxmoJLmrbOZQeZLCPRy
        SHxa/okZotdFYv+b2+wQtrDEq+NboGwpiZf9bVB2scTSWZ+YIJobgF7Y9osNImEsMetZOyPI
        YmYBTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehoE4JoVJc4sH06C4QtK9E95zPUJx4Sl26u
        BdsqJDCJUWJhq+EERoVZSL6ZheSbWQh7FzAyr2IUSy0ozk1PLTYqMIJHcXJ+7iZGcHLVctvB
        OOXtB71DjEwcjIcYJTiYlUR4S3ZNTRLiTUmsrEotyo8vKs1JLT7EaAoM6onMUqLJ+cD0nlcS
        b2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1Oqgcn5mOD0A6KBNtovU7Xu
        Z5rzbJsao/KD9fI3JjeOGca6AaVLVb5OTPt/9nq+seUn/U3+xxPjy55UL9WZnKmtuGb9XX0H
        4ydK3bJXai+e31HwfLHI1UnBHyduUgjYcU/D6WBd17NaE5kzDF6XeH92Jy55K7jnsMi3jXPi
        1Z59idvJxDb5RJKGuLWwUVC9q4P03IrQREf/Nx9drsW5rAxUeWpoFDZnoczUvlkPdhnHhD65
        teOUooCadKU9R2zOwhMbZui9NNixzDo3PJDxg/+h9ntC71ftF/Ex5euYp5vyPjUu5lUBe5Dc
        jmDtlpCeVjl9fY5NC/VkPk9ztJr+/kCc6qOdR1/N+dD/6PPO+7eMIpVYijMSDbWYi4oTASmv
        tZI3BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSvO5K7xlJBr8/8Fo8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugStj4uKv7AWfeSu2ftrG
        3sD4ibuLkZNDQsBE4kL7Y8YuRi4OIYEdjBInmh4xQSRkJZ6928EOYQtL3G85wgpR9J5R4kXr
        ImaQBJuArsSW56/AukUEupkk5mzqZwJxmAW2M0p8WLqOBaRKWMBd4tL1l6wgNouAqkTP2kVg
        Y3kF7CQmLznFCrFCXmLD/F6gqRwcnAL2ElvOeICEhYBKNl/ewApRLihxcuYTsJHMQOXNW2cz
        T2AUmIUkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOA40NLawbhn1Qe9
        Q4xMHIyHGCU4mJVEeEt2TU0S4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6Yklqdmpq
        QWoRTJaJg1OqgWniMRV7VSmOM33l+4Jc5YVYTgpLPXRQe8hQWqT6V7lf1sjjVOhtBY537prr
        m4OMuKcnPX3xWvfHg1fx017r7rZdck1u+qOy6buYTgSnGKke9fWIar568ajQXVuXyrRnvdtP
        mt2a0lDHXha/LO7svNNtDyLfSR92Pc+w4scvow/2NqsvbXy5u+jrbwY5tk+cSX9+dhw022m8
        wTAh+lp3asQ3Nt3o8rlVVWp/XgYdX/OkVZu9/4XHCq+5lv7MKocPBM5TZppRK6LwkZchKtWm
        liWqPuyXetHSR0FsT/KX7f3X3LvIyc1U996CAw8vVNZ8LXCefLZl7rnG3LaJjNVtFSvy2quP
        C5gp+rb8bTC6rsRSnJFoqMVcVJwIAPwPwazyAgAA
X-CMS-MailID: 20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Put const qualifier of samsung_ufs_phy_cfg pointer because they will
not be changed from drvdata.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 4 ++--
 drivers/phy/samsung/phy-samsung-ufs.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 602ddef259eb..b7ddb91a02be 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
+	const struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
 	const struct samsung_ufs_phy_cfg *cfg;
 	int err = 0;
 	int i;
@@ -327,7 +327,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
-	phy->cfg = (struct samsung_ufs_phy_cfg **)drvdata->cfg;
+	phy->cfg = drvdata->cfg;
 	phy->isol = &drvdata->isol;
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 91a0e9f94f98..8c3696b3c5ec 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -121,7 +121,7 @@ struct samsung_ufs_phy {
 	struct clk *rx0_symbol_clk;
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	struct samsung_ufs_phy_cfg **cfg;
+	const struct samsung_ufs_phy_cfg **cfg;
 	const struct pmu_isol *isol;
 	u8 lane_cnt;
 	int ufs_phy_state;
-- 
2.36.1

