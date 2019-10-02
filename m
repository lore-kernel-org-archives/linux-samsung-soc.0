Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D817EC35280
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 08:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A797821A4C
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 08:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BVs5qQa4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfJBIxY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 04:53:24 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53753 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfJBIxX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:53:23 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191002085321euoutp0174a1ae4ec414c1ab8e577cb1f1ede1fd~JyIENidAO1504015040euoutp019
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2019 08:53:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191002085321euoutp0174a1ae4ec414c1ab8e577cb1f1ede1fd~JyIENidAO1504015040euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570006401;
        bh=MnXaUYuEAohAtC2FHsIuzLDXlz81hjmPhN4i/nld/kc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=BVs5qQa4NvplCV3bsy+zlzoJjQMzjgXppXQqGXt4XiWRYMttv8TYqhbUHZwSFe6Bm
         uAo4ohHI5kuLYIn9yGU4h3tGilPvfHD6aZdvN28hBKG1N0PMDhWgEvSVaN/UTRuaxx
         x3I0EjsfY1A84Gm1vFL8qTpEj4NZLv4Tk3y/CGcs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191002085321eucas1p1add21893275cb5c088f68cea28a53b46~JyID8DAaq3021030210eucas1p1k;
        Wed,  2 Oct 2019 08:53:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.AB.04374.185649D5; Wed,  2
        Oct 2019 09:53:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234~JyIDhpCrq3164031640eucas1p2M;
        Wed,  2 Oct 2019 08:53:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191002085320eusmtrp1b29df999c4aff39ebc3d455bdaad1fbe~JyIDg--2q2399823998eusmtrp1T;
        Wed,  2 Oct 2019 08:53:20 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-50-5d9465815cfe
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5D.53.04117.085649D5; Wed,  2
        Oct 2019 09:53:20 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191002085320eusmtip2dc968cf2ef2f25c29e6d19e5412542c5~JyIDHytO72990529905eusmtip21;
        Wed,  2 Oct 2019 08:53:20 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos5433: Fix error paths
Date:   Wed,  2 Oct 2019 10:53:09 +0200
Message-Id: <20191002085309.9473-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7djP87qNqVNiDW6sFbfYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHMVlk5Kak1mW
        WqRvl8CVcftbE2PBR+6Ks91bmBoYr3F2MXJySAiYSNzZspUFxBYSWMEocfhZbhcjF5D9hVFi
        z5ddTBDOZ0aJ8/9Ps8B0rPs+lQUisZxRYnHvXna4ljs/b4FVsQkYSnS97WIDsUUEHCQ+f3rN
        CFLELPCYUWLrya/MIAlhASuJtilfwRpYBFQlPr17zApi8wrYSFx438AKsU5eYvWGA8wgzRIC
        R9gkDk6ZBZVwkXjz+DcbhC0s8er4FnYIW0bi9OQeFoiGZkaJh+fWskM4PYwSl5tmMEJUWUsc
        Pn4RaBIH0E2aEut36UOEHSW2v/jEAhKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6
        uLUHL1xihrA9JJbPWscKCdRYiT+H21knMMrNQti1gJFxFaN4amlxbnpqsXFearlecWJucWle
        ul5yfu4mRmDsn/53/OsOxn1/kg4xCnAwKvHw3giZHCvEmlhWXJl7iFGCg1lJhNfmz6RYId6U
        xMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYwCvSte8q5SPMcu
        svvhHS63F90/cx+xRMxmSj3vf+vD5QfPjYSUn/1mD73awhnplmkh3WbKdSJaT2CvYUXFq4XW
        pQePf59ya6JIrNuOT3P9uNw3TMydKX+6/Xz0Md44x5DgT2WyBU8WXFvUrXljvWmdAseCbZKf
        hR8nF66d+7vkgUNG8yKPtItKLMUZiYZazEXFiQBmJ4uI+QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xe7oNqVNiDY4fNrfYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHKVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXcftbE2PBR+6Ks91b
        mBoYr3F2MXJySAiYSKz7PpWli5GLQ0hgKaPEyelfmCASMhInpzWwQtjCEn+udbGB2EICnxgl
        znaLg9hsAoYSXW8h4iICThIP1r1hBxnELPCUUeL6hkawZmEBK4m2KV9ZQGwWAVWJT+8eg8V5
        BWwkLryHWSAvsXrDAeYJjDwLGBlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBAbctmM/t+xg
        7HoXfIhRgINRiYe3IWhyrBBrYllxZe4hRgkOZiURXps/k2KFeFMSK6tSi/Lji0pzUosPMZoC
        LZ/ILCWanA+MhrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxb
        PXJ+M6xucE/+3vHh2ml56adrbQv3pITy/NOzenZH5dBlLrF9AXaWihJ/lOJ2aLp+epY+d1Xv
        1EXX9R4efFYiHbW+4+tvnXe3XGYpf16g/+u8+P9PZxtjWsRWnVMoalWNVTD7efLUo1XyD6WV
        v2n2qE2x/rhnk2HSjFKe410tklNj5aTmVMkqsRRnJBpqMRcVJwIA2prboE4CAAA=
X-CMS-MailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add checking the value returned by samsung_clk_alloc_reg_dump() and
devm_kcalloc(). While fixing this, also release all gathered clocks.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 7824c2ba3d8e..0b60316331a0 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5584,6 +5584,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 
 	data->clk_save = samsung_clk_alloc_reg_dump(info->clk_regs,
 						    info->nr_clk_regs);
+	if (!data->clk_save)
+		return -ENOMEM;
 	data->nr_clk_save = info->nr_clk_regs;
 	data->clk_suspend = info->suspend_regs;
 	data->nr_clk_suspend = info->nr_suspend_regs;
@@ -5592,12 +5594,19 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	if (data->nr_pclks > 0) {
 		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
 					   data->nr_pclks, GFP_KERNEL);
-
+		if (!data->pclks) {
+			kfree(data->clk_save);
+			return -ENOMEM;
+		}
 		for (i = 0; i < data->nr_pclks; i++) {
 			struct clk *clk = of_clk_get(dev->of_node, i);
 
-			if (IS_ERR(clk))
+			if (IS_ERR(clk)) {
+				kfree(data->clk_save);
+				while (--i >= 0)
+					clk_put(data->pclks[i]);
 				return PTR_ERR(clk);
+			}
 			data->pclks[i] = clk;
 		}
 	}
-- 
2.17.1

