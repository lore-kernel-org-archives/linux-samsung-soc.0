Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2946C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237665AbiFGH3t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbiFGH3r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:29:47 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA1353E12
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:29:45 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220607072942epoutp015edc0b749c6ae2f5da55d3dff57c2459~2RhgN1OlN1581615816epoutp01r
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:29:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220607072942epoutp015edc0b749c6ae2f5da55d3dff57c2459~2RhgN1OlN1581615816epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654586982;
        bh=Qoxcr9pYAwshLqxQI3GLFF/ElSmyVGxjOlDsHwYgFMk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hBSjT0HA5EV0+nUSBLOCdePY8RcLNkjM33ctq3XRNF84dWzpluLGbxuxwDrHdybmj
         hdaQhPh5A6DIaVfdOAQeo4TUvgb7aBWt3E/AMBPyDE84Z0dmMXvUY2uljVTp+bZown
         OC8JELCz4d7Dvv8iGFOCptIMR32V4S1oL4QDW2p4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607072941epcas2p4c9af223fa392314818c3d05927c02368~2RhfK_7ON2030220302epcas2p4K;
        Tue,  7 Jun 2022 07:29:41 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LHMSN0VzXz4x9Pw; Tue,  7 Jun
        2022 07:29:40 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        EB.93.10069.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220607072938epcas2p4aa59fc2826fe0563bc1f8f68301e2bb4~2RhccVO3z1805518055epcas2p4j;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607072938epsmtrp2cdee827be408df6b7cd7b0d8f0e3932c~2RhcbCFu42177421774epsmtrp2G;
        Tue,  7 Jun 2022 07:29:38 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-25-629efe6218be
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6C.53.08924.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220607072937epsmtip14c868702fb2a99b8fdcb028334e7305c~2RhcQn8hj0441404414epsmtip1f;
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
Subject: [PATCH v4 3/5] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Date:   Tue,  7 Jun 2022 16:29:05 +0900
Message-Id: <20220607072907.127000-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607072907.127000-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmqW7Sv3lJBs3zFC0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y0vrAeaCTr6Kxgs/GBsYW3i6GDk5JARMJA79
        7GDvYuTiEBLYwSjxresZC4TziVHi5K5ZUM5nRolfW24xwrRMOPMOKrGLUeLlwxNgCSGBj4wS
        D1a6gthsAroSW56/YgQpEhFoZ5I4cW8u2BJmgc1AcydsYAapEhZwl3i//BIbiM0ioCqxaP8X
        dhCbV8BeomHuNWaIdfISG+b3AtkcHJwCDhJLTmtBlAhKnJz5hAXEZgYqad46mxlkvoRAL4fE
        p9tHoHpdJGZs62CCsIUlXh3fwg5hS0l8freXDcIullg66xMTRHMDo8Tlbb+gEsYSs561M4Is
        ZhbQlFi/Sx/ElBBQljhyC2ovn0TH4b/sEGFeiY42IYhGdYkD26ezQNiyEt1zPrNC2B4Sq778
        YYYE3GRGiT+9j1gnMCrMQvLOLCTvzEJYvICReRWjWGpBcW56arFRgSE8ipPzczcxgpOrlusO
        xslvP+gdYmTiYDzEKMHBrCTC6z95bpIQb0piZVVqUX58UWlOavEhRlNgWE9klhJNzgem97yS
        eEMTSwMTMzNDcyNTA3MlcV6vlA2JQgLpiSWp2ampBalFMH1MHJxSDUw5lc8WNi+7bPHmzLIP
        DQ9jL+cf+dTfwavl1PFW0frE/ew+Qe5vx9fE1uyWECrS9Pi+95PgPB1hrYUrLA8e/vs/Rbbk
        6vw9U1eoL5yZn7M6c+dFw5o58xN3iide3/DhbeyqpdqFdRuFFKSjjQ6bqS/N3OpuLqS4tCTx
        u4DB0qp74sITvvVl/65i3Jpn3ug4Nbj756SMZ5rN4SyhTAvq3p7MSGYP7bsintDVv9RMppfp
        k3hvuvGHxfxm4Ys+6+0MOlDcJRHok2+lYzGn+8H5LX+OGM1LjOL7texc4NMc4YVWIudmPXMq
        tZjp2P9vz6XzNzbIfSt8EaRjMlXtYs/cY84xlsWz+wVkU1gOaK1dZ6XEUpyRaKjFXFScCAD6
        lLaMNwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnG7Sv3lJBg2nWS0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJWxpfUAc0EnX0XjhR+M
        DYwtPF2MnBwSAiYSE868Y+li5OIQEtjBKLHr/HpGiISsxLN3O9ghbGGJ+y1HWCGK3jNK7Plz
        jhkkwSagK7Hl+StGkISIQDeTxJxN/UwgDrPAdkaJD0vXsYBUCQu4S7xffokNxGYRUJVYtP8L
        2FheAXuJhrnXmCFWyEtsmN8LZHNwcAo4SCw5rQUSFgIqmXXkMwtEuaDEyZlPwGxmoPLmrbOZ
        JzAKzEKSmoUktYCRaRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnAcaGntYNyz6oPe
        IUYmDsZDjBIczEoivP6T5yYJ8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1
        ILUIJsvEwSnVwBS95vOdo/ItX6LEktsY+Y8sD805J2rnXcRxmIHteajr8i/1G4OkF0hlz+Kf
        d+Glc3VB79Ifs63LreYF7uGz7NdfzFzqMU00e+7NSYUSF+urZncvzvwtsmvtsoxc+c2duWUr
        ZOfftZ624+KJVRwr4vJuvBE0PRsjM2Gb+d0XuYvXKXVPUSmTrzo2+0uOTaA++8QpEXI3Ym4u
        1ZcUypG99G9jb0YCD9fBw7+mv7rrl9PYXCdh/8OHfaqedh3jfql3Ycv1vxuZcJvduvDAlzVX
        /7cH70MFplLexKf9RwKlG98kbM9/aWyYJn7+Tga/rXxE6dUTVU5dlr+er3p4xOvX2fO+1QGn
        Z297wu6as1ixTomlOCPRUIu5qDgRAKwwFl7yAgAA
X-CMS-MailID: 20220607072938epcas2p4aa59fc2826fe0563bc1f8f68301e2bb4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072938epcas2p4aa59fc2826fe0563bc1f8f68301e2bb4
References: <20220607072907.127000-1-chanho61.park@samsung.com>
        <CGME20220607072938epcas2p4aa59fc2826fe0563bc1f8f68301e2bb4@epcas2p4.samsung.com>
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
index ed272631e8aa..cd1c02d2cdda 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfgs;
+	const struct samsung_ufs_phy_cfg * const *cfgs = ufs_phy->cfgs;
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
index 1788b356cf56..5cd919539a3e 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -121,7 +121,7 @@ struct samsung_ufs_phy {
 	struct clk *rx0_symbol_clk;
 	struct clk *rx1_symbol_clk;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	struct samsung_ufs_phy_cfg **cfgs;
+	const struct samsung_ufs_phy_cfg * const *cfgs;
 	const struct pmu_isol *isol;
 	u8 lane_cnt;
 	int ufs_phy_state;
-- 
2.36.1

