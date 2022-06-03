Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5058BCCA481
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240131AbiFCCEg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240244AbiFCCEe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:34 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D8E396A4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:32 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220603020429epoutp03df06974cd09c3390dd4026643aa726da~0_ga6r_Xp2115121151epoutp03A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220603020429epoutp03df06974cd09c3390dd4026643aa726da~0_ga6r_Xp2115121151epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221870;
        bh=onMMjv0YmrPGo8mWiHDVE0940m+Wc9tprRZAWAZI0P0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mJGVvnLJqzj95JRPd3/N5njrBPe3auVJQUmlUIBhzJZCreGUtJKWxbajVBuAbMp8D
         E1pEbXVfF0Xbca2T9LllGv2PTBuoV5oobMGtS2BFrUjgSKr39In5c3mTpaVPyA3vqk
         jOYWxakHV5hyMbC/brIBXcLXSMfbpRBpzrQIo0Bw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220603020429epcas2p137b72e4b8d42f139e70e6763ebfc5cbd~0_gaSsCnm1047010470epcas2p1X;
        Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LDmR01yqnz4x9Q0; Fri,  3 Jun
        2022 02:04:28 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        AA.BD.10028.A2C69926; Fri,  3 Jun 2022 11:04:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d~0_gXtC0Ju0887208872epcas2p3p;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp2cb8901314c60d6f27ac41d37fb72afaa~0_gXsPwmG0586805868epsmtrp2M;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-d4-62996c2aba79
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        58.84.11276.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip115fffb09bd96ee17c481834abb5feec9~0_gXb4N712906529065epsmtip1Z;
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
Subject: [PATCH v3 3/5] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Date:   Fri,  3 Jun 2022 11:04:08 +0900
Message-Id: <20220603020410.2976-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603020410.2976-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmha52zswkg21LGS0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE74++8SywFv3krnu1+wNjA+Iu7i5GTQ0LAROL4
        rPnsXYxcHEICOxglvn2bygbhfGKUuL/oKguE841RYsfau4wwLfd7bkC17AWq+v4Qquojo0Tb
        swtMIFVsAroSW56/YgRJiAi0M0mcuDcXrIVZYDOjxMkJG5hBqoQF3CV2NV4Ds1kEVCVOLf7H
        BmLzCthKzDtznAVin7zEhvm9YDWcAnYS16d9ZYaoEZQ4OfMJWA0zUE3z1tnMIAskBDo5JDbP
        vswG0ewiMfHSNChbWOLV8S3sELaUxOd3e6HixRJLZ31igmhuYJS4vO0XVMJYYtazdqAfOIA2
        aEqs36UPYkoIKEscuQW1l0+i4/Bfdogwr0RHmxBEo7rEge3Toc6Xleie85kVwvaQmLT8JtgF
        QgITGSV+/mOfwKgwC8k3s5B8Mwth7wJG5lWMYqkFxbnpqcVGBcbwOE7Oz93ECE6vWu47GGe8
        /aB3iJGJg/EQowQHs5IIb8muqUlCvCmJlVWpRfnxRaU5qcWHGE2BYT2RWUo0OR+Y4PNK4g1N
        LA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTBpiBise7Oi5LFGfYf2kfcc
        pclnQwrefDo8T/+4edL+RoONJqdtYvexm+8MmX9b7O6N1N4mx5rDer84fW/9PbSQkXPWGqfs
        7y3vt2RltpeLZ7dyTNDl23OD6bn3NnaZtqv3TuRn/nCZlbfg1+J4RjXbKvWZhzvkHzs4t2i1
        LcwsmSLwakm0VfBT+QZNRqNbmevPiZR8LuWQfbSY7Zj59lM7Tc0uGymZveMxu1A6RXubUPmh
        rC8LluteCFByn6BbYhFyoP/U9IWHlzbkPlx9N8JYRsczKGv6wbwtyb+DG7SD74SfuhedKCC4
        5euWh3P+1ruJ9XreuhbwuGvesebWGRFJG/+rmO7kWSdi+nui6kklluKMREMt5qLiRADBqDKg
        OAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnK5Wzswkg/sfRSwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJXxd94lloLfvBXPdj9g
        bGD8xd3FyMkhIWAicb/nBnsXIxeHkMBuRolVX56zQCRkJZ6928EOYQtL3G85wgpR9J5RYu/r
        LcwgCTYBXYktz18xgiREBLqZJOZs6mcCcZgFtjNKfFi6DmyUsIC7xK7Ga2AdLAKqEqcW/2MD
        sXkFbCXmnTkOtU5eYsP8XrAaTgE7ievTvoLZQkA1z/uesUDUC0qcnPkEzGYGqm/eOpt5AqPA
        LCSpWUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeCluYOxu2rPugdYmTi
        YDzEKMHBrCTCW7JrapIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotg
        skwcnFINTCl9L4oUHh2L4Loq7cp8XWau+neJKvEP3AICcy8+2FS73VGu982LWTGzvnet3tHK
        wPdjsUfU+7+bIk+uq1OeofRxX4D+dJcdH6U/xN58kWPCr8cqaxgwZXZ7YPr7haGPVl60nsSz
        df68ya6RwpmLeITWexS6VbXtW1yW4Vlu/Uvefe5vpkAPjpPh/c6T09YdW6p8++pNO24G5cY8
        Aad1qtfPHDv0Tl1x+oqYDer/fRWq98ncef107aLAM1PfcRXLCO76+S1J7dJqd+8ThXVcXtr3
        1y2fkJD9MKz0E2dDWVsek9dtEztW9ZSPr45nZknW9nFknc7s3zxji/3sg3ddmy8Zy525ejE5
        0izgabgSgxJLcUaioRZzUXEiAK0aBIbzAgAA
X-CMS-MailID: 20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d@epcas2p3.samsung.com>
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
index ed272631e8aa..e1e26da27245 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfgs;
+	const struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfgs;
 	const struct samsung_ufs_phy_cfg *cfg;
 	int err = 0;
 	int i;
@@ -327,7 +327,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
-	phy->cfgs = (struct samsung_ufs_phy_cfg **)drvdata->cfgs;
+	phy->cfgs = drvdata->cfgs;
 	phy->isol = &drvdata->isol;
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 1788b356cf56..101497698f23 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -121,7 +121,7 @@ struct samsung_ufs_phy {
 	struct clk *rx0_symbol_clk;
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	struct samsung_ufs_phy_cfg **cfgs;
+	const struct samsung_ufs_phy_cfg **cfgs;
 	const struct pmu_isol *isol;
 	u8 lane_cnt;
 	int ufs_phy_state;
-- 
2.36.1

