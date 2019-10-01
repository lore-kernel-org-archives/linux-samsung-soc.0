Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2075C352AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4BC12190F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sNFywzjz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfJANJc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 09:09:32 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37383 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfJANJb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:09:31 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191001130930euoutp015b9270278038c562d7fab253194a3fb1~Jh_bMmhrs0351903519euoutp019
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 13:09:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191001130930euoutp015b9270278038c562d7fab253194a3fb1~Jh_bMmhrs0351903519euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569935370;
        bh=3dXebAaNExUfKzVX+nSBB4G6POEd8p2Rl7wFL/2vhKY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=sNFywzjzJgEAD3ZhDhi59eGWnclkA/2jP+W27K1BaCdfXTcP98YejqO45n52h+epM
         MtV25a7sKUe9E2K96kDAxAH3E+APtHPkmMtrQRzlcAtY2DWlZR3g6EPsbUQM7tldLW
         yFrHneuhlN2c5l+dR05wH436LArqI+ZiKs1ZSkFU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191001130929eucas1p2fd508d892d70e2832ed7a4299a7588fc~Jh_apGPHs1940819408eucas1p26;
        Tue,  1 Oct 2019 13:09:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A6.A9.04469.900539D5; Tue,  1
        Oct 2019 14:09:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191001130929eucas1p114d229f779680122c629396a4fc040c0~Jh_aTTxQA2227822278eucas1p1o;
        Tue,  1 Oct 2019 13:09:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191001130929eusmtrp24f9eeb97be8f337c2ae243ebcdba80ad~Jh_aSqit-0780007800eusmtrp2T;
        Tue,  1 Oct 2019 13:09:29 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-e3-5d93500988bc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.DF.04166.900539D5; Tue,  1
        Oct 2019 14:09:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191001130928eusmtip24d4ffb4391a02d4cfcad14ad2d8e58b0~Jh_Z0-EcS0170101701eusmtip22;
        Tue,  1 Oct 2019 13:09:28 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos5433: Fix potential NULL pointer
 dereference
Date:   Tue,  1 Oct 2019 15:09:21 +0200
Message-Id: <20191001130921.24571-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djP87qcAZNjDb7tNrDYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHMVlk5Kak1mW
        WqRvl8CVsfuzfcEptoo/C4+xNjDuZu1i5OSQEDCRWLV5PWMXIxeHkMAKRolzRyazQjhfGCX+
        7exhhnA+M0rsf3uDBaZl3vuVUInljBK3WncxwbWcWPuDEaSKTcBQouttFxuILSLgIPH502uw
        JcwCjxkltp78CtTOwSEsECxx/h8zSA2LgKpE/6HlYPW8ArYSWzpesUNsk5dYveEA2DYJgRNs
        En/m/GcF6ZUQcJF4+1ofokZY4tXxLVD1MhL/d85ngqhvZpR4eG4tO4TTwyhxuWkGI0SVtcTh
        4xfBBjELaEqs3wU1yFHiw6s/LBDz+SRuvBUECTMDmZO2TWeGCPNKdLQJQVSrScw6vg5u7cEL
        l5ghbA+JzqXzmEBsIYFYiT8Nz1gmMMrNQti1gJFxFaN4amlxbnpqsWFearlecWJucWleul5y
        fu4mRmDcn/53/NMOxq+Xkg4xCnAwKvHwWjyfGCvEmlhWXJl7iFGCg1lJhNfmz6RYId6UxMqq
        1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYzbn+/jZoi86Hh23yez
        CbPljZv8dPp1zWb8+fTltTLDc501x+SF9m9b7rDuqsA+6YO+NptaVjfuEJzxciaXX8k6tt9x
        Pzqn/ozdUmq4vM5nl/werqWWVvfFuD2s+B3z3AI1tKYef/3wH+Nd+cV3vzXuDVzet10v1kx7
        ubCO1a/spPuxh2rfJmoosRRnJBpqMRcVJwIA6NkpN/cCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xe7qcAZNjDS6skbbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHKVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsfuzfcEptoo/C4+x
        NjDuZu1i5OSQEDCRmPd+JXMXIxeHkMBSRokpszYyQSRkJE5Oa4AqEpb4c62LDaLoE6NE08p1
        bCAJNgFDia63XWC2iICTxIN1b9hBipgFnjJKXN/QCNTNwSEsECjx+5QZSA2LgKpE/6HlYPW8
        ArYSWzpesUMskJdYveEA8wRGngWMDKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECw23bsZ+b
        dzBe2hh8iFGAg1GJh3fCy4mxQqyJZcWVuYcYJTiYlUR4bf5MihXiTUmsrEotyo8vKs1JLT7E
        aAq0fCKzlGhyPjAW8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
        MLY833R0zqLUAssnIqK7tTVDxI87JnVfC5I47v7QS0mmy6jqvsH12kN7WV3uXl//xHNCl96K
        1jUL9NfP12+IZtHd1GXScURJYWKu7pur0nVTrtmvbbTPF287oTHNMopXgqd4F98/mbkvGS50
        7X809++NetlJn6LlNU/fmM2n8Vxq7l892asn7yixFGckGmoxFxUnAgCma4FWTQIAAA==
X-CMS-MailID: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
References: <CGME20191001130929eucas1p114d229f779680122c629396a4fc040c0@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

devm_kcalloc might fail, so avoid accessing the allocated object in such
case.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 7824c2ba3d8e..6afbcd0ae96f 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5592,7 +5592,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	if (data->nr_pclks > 0) {
 		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
 					   data->nr_pclks, GFP_KERNEL);
-
+		if (!data->pclks)
+			return -ENOMEM;
 		for (i = 0; i < data->nr_pclks; i++) {
 			struct clk *clk = of_clk_get(dev->of_node, i);
 
-- 
2.17.1

