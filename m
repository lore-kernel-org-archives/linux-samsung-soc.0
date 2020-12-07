Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A66C19437
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B6B2313E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgLGHab (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 02:30:31 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44834 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgLGHab (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 02:30:31 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201207072939euoutp017399c1757f40702a052effc278977298~OXqT-wYf02701127011euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Dec 2020 07:29:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201207072939euoutp017399c1757f40702a052effc278977298~OXqT-wYf02701127011euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607326179;
        bh=ReHrsg4zRLZ/ldZndSJEbKiFyBueDHzsfOqDV6x944w=;
        h=From:To:Cc:Subject:Date:References:From;
        b=g0CrSE2gr1UF3scerOe4FTC1E6xdQDn0R5M3LPk54lVXSV97ozzG4aRGHeXBi1UBN
         EyZKrbY+GR5jrDUOOH0lvvzyusCvP3wOLdoPeqe01L65UVoMndzFh9vMVZXD1o8i/2
         2VW8Jk302vOoE8DucJi718W7JTw4Uqm3kbM6op40=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201207072939eucas1p1020ce9229e2f32b19788613c115cc7c8~OXqTve3pO2277922779eucas1p12;
        Mon,  7 Dec 2020 07:29:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1D.A0.45488.3E9DDCF5; Mon,  7
        Dec 2020 07:29:39 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002~OXqTXCeTa1988419884eucas1p1v;
        Mon,  7 Dec 2020 07:29:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201207072939eusmtrp1fdf06a1b5dcc11821872441acf80a6a8~OXqTWaIvA1366113661eusmtrp1J;
        Mon,  7 Dec 2020 07:29:39 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-39-5fcdd9e30531
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 78.A7.16282.2E9DDCF5; Mon,  7
        Dec 2020 07:29:39 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201207072938eusmtip1fcdaef0f97e5b22e34118f49994a933d~OXqS-PrVb2615526155eusmtip14;
        Mon,  7 Dec 2020 07:29:38 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] soc: samsung: asv: don't defer early on not-supported SoCs
Date:   Mon,  7 Dec 2020 08:29:28 +0100
Message-Id: <20201207072928.20010-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsWy7djP87qPb56NN3jVI22xccZ6Vovz5zew
        W8w4v4/JYu2Ru+wW7U9fMjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBktP1cz
        FZzhrHi2dBd7A+M39i5GTg4JAROJdY+XMXcxcnEICaxglNh4fAcThPOFUeLZ9uNQzmdGibuH
        OtlgWp6ubGKDSCxnlGj4fokZrmXd+aWsIFVsAoYSXW+7wDpEBFQlPrctYAcpYhbYzSix++Mc
        FpCEsIC3xO8Z78FsFqCiGVf3gTXzCthKTO/vglonL7F6wwGwDRIC99gldk5ZwQSRcJF4tBgk
        AWILS7w6vgXqJRmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x59wvoBUcQDdpSqzfpQ8R
        dpRY9A3kOg4gm0/ixltBkDAzkDlp23RmiDCvREebEES1msSs4+vg1h68cAnqHA+J2Zuvgt0v
        JBArceruSpYJjHKzEHYtYGRcxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJERjpp/8d/7qD
        ccWrj3qHGJk4GA8xSnAwK4nwqkmdjRfiTUmsrEotyo8vKs1JLT7EKM3BoiTOu2vrmnghgfTE
        ktTs1NSC1CKYLBMHp1QDU/mdJeE6i3W+7b0/V/rM9WWuhaICS+NDC32nX9czmee+ev+r9adT
        LiofTqtfFBE0pfwqT3vJLcFbM47k/z3LWsXw03F+5swdVmWLj2Sd/LxJlue06taWFQuE1v7T
        XKrjds5h1yu25d+T+w9nJ1qKV6/03CTCL+msV9H8uaOv4umPA8s9Hc0b9u8/0yFjm874cu+S
        T7I5D3/OqRFdHpnMt+pbevn1ueE8ImYqSx1kGVeoNU3suvzh+AXb2NZQzlBjfb/0yv09dVrt
        56+vym/eX1uzI4jVOEdBOO7LuqNPlWNdON30e07edc/re8msrnAz38m4O+LYTp7Wj97ML7t9
        OQM1pj66NFPqy5UtfA/eK7EUZyQaajEXFScCAOEdq/NjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsVy+t/xu7qPb56NNzhwndFi44z1rBbnz29g
        t5hxfh+Txdojd9kt2p++ZHZg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJafq5mKjjDWfFs6S72BsZv7F2MnBwS
        AiYST1c2sXUxcnEICSxllFh7cjsbREJG4uS0BlYIW1jiz7UuqKJPjBJfZmxjBEmwCRhKdL3t
        AmsQEVCV+Ny2gB2kiFlgL6PEwq9TwbqFBbwlfs94zwJiswAVzbi6DyzOK2ArMb2/C2qbvMTq
        DQeYJzDyLGBkWMUoklpanJueW2ykV5yYW1yal66XnJ+7iREYXtuO/dyyg3Hlq496hxiZOBgP
        MUpwMCuJ8KpJnY0X4k1JrKxKLcqPLyrNSS0+xGgKtG8is5Rocj4wwPNK4g3NDEwNTcwsDUwt
        zYyVxHlNjqyJFxJITyxJzU5NLUgtgulj4uCUamBi2NrF9kLoHHPKffuuOfZa/kwv027cjzjn
        MFHvN2uLrrnB05ClcgILAh5rrtkZOnsN264L15Z6nLM0r+M7s/156zWlp3wxKzUfK3wyWhg0
        /2Dov4rr64w1+yffWeL5TWDjBLE4zo/z/iSWvHPcwv7BWvN++dcO05zp6SUx8r23RZ0Y648o
        iXIv97tc/MPv/dJ7j88embL/svqMCPY0022Vcsc/FVVf6qk5Y2ST/SH2H+dhywme88L6XV1e
        sKxu/BD8/8PVxdydhtdbytUSQ732P2NIamYTrfp6ersl04wLsiKdG+8u4Q1IffnvY+QJjyVd
        DbumPs9QLrz4Rk381VfTSy/n8agrSDfv/Dg77m28EktxRqKhFnNRcSIAboN3vrgCAAA=
X-CMS-MailID: 20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002
References: <CGME20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Check if the SoC is really supported before gathering the needed
resources. This fixes endless deffered probe on some SoCs other than
Exynos5422 (like Exynos5410).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/soc/samsung/exynos-asv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
index 8abf4dfaa5c5..f653e3533f0f 100644
--- a/drivers/soc/samsung/exynos-asv.c
+++ b/drivers/soc/samsung/exynos-asv.c
@@ -119,11 +119,6 @@ static int exynos_asv_probe(struct platform_device *pdev)
 	u32 product_id = 0;
 	int ret, i;
 
-	cpu_dev = get_cpu_device(0);
-	ret = dev_pm_opp_get_opp_count(cpu_dev);
-	if (ret < 0)
-		return -EPROBE_DEFER;
-
 	asv = devm_kzalloc(&pdev->dev, sizeof(*asv), GFP_KERNEL);
 	if (!asv)
 		return -ENOMEM;
@@ -144,6 +139,11 @@ static int exynos_asv_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	cpu_dev = get_cpu_device(0);
+	ret = dev_pm_opp_get_opp_count(cpu_dev);
+	if (ret < 0)
+		return -EPROBE_DEFER;
+
 	ret = of_property_read_u32(pdev->dev.of_node, "samsung,asv-bin",
 				   &asv->of_bin);
 	if (ret < 0)
-- 
2.17.1

