Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D42ECE58A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 12:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B881621D71
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 12:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GGfHUxGT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfJAMgk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 08:36:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52459 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732921AbfJAMgk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:36:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191001123637euoutp0194ba466fa95e0fa0c97ccea2e24cf000~JhhuLHYZX0997909979euoutp01H
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191001123637euoutp0194ba466fa95e0fa0c97ccea2e24cf000~JhhuLHYZX0997909979euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569933398;
        bh=2CZIhLH33tEifh3ALDvkkJLDMm/NCNj9OqRYGF4YRHk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=GGfHUxGT6qQe3L/snWrFtB3et8la6jJvNbaFwDkA1BTRWTQSA/yAOKk6F4ACEnNv4
         WLSwt6KTqw7wH0ly8RqL8FJcvOs20DbqDonV4YNKLNrbR1Y8/60+eMfQERqlEQ9kU3
         rRohc0h0b8PBaK/bArv+s4PY4dWY7fSNAUse7c6g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191001123637eucas1p1a5a031dcebe72e27a5623cf58ee42ea4~Jhhtzy6gb1358913589eucas1p1C;
        Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 28.19.04309.558439D5; Tue,  1
        Oct 2019 13:36:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5~JhhtfxpQU2028820288eucas1p27;
        Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191001123637eusmtrp144f2a02a099c64eb7f5304a4055ad78f~JhhtfBv3U0398103981eusmtrp1h;
        Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-06-5d9348554c06
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.33.04117.558439D5; Tue,  1
        Oct 2019 13:36:37 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191001123636eusmtip2b2bcedc6b7a6d9d900c1886ae301bccc~Jhhs5dkDU0870908709eusmtip2d;
        Tue,  1 Oct 2019 12:36:36 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        sbkim73@samsung.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 RESEND 1/3] ASoC: samsung: arndale: Simplify DAI link
 initialization
Date:   Tue,  1 Oct 2019 14:36:23 +0200
Message-Id: <20191001123625.19370-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTcRTudx+71+HiOhV/rbIaSQ/IF2UXtNAQvD3+kCDKZOktLyq5abs+
        siDNWJmPtZSaicEITZmYOkVSydl8LDK5CfOFiJUSJJngRPKR5na1/vvO953vfIfDIVF5Ga4g
        UzWZnFbDpiklUqytf1k4dokpVwV/+n6AdgzZELq5ohGnn32dkdAOnQXQgtBE0EuOQoS2TI/g
        dIXQhdANvZME7Zy34nTPz0c4PVS3iER6Mk3OAgnTXjlJMBbzYwnTUp3HGKs2AKNvNQPGafGP
        Ja5KI5K4tNRsTht0OlGa0qFrITJ0vrcHBwUsH4x4FQEPElLH4ZihBC8CUlJO1QHYZ23dKhYB
        FOx6VCycAOpWOiXbFuNoMyIKtQDWLy+Bf5aBj+uoq0tChcDSPj1wYR/qEJyqKHDPRal2BH4b
        nsJcgjcVBy0fTJujSBKjAmD+E7dXRoXDggk7ENP2wfqmbvcakCom4MK7WUIUomGN/hcuYm84
        a2/d4vfAgfISTDQ8ALCkc4IQCwOAU3bT1thw2GMfwl3JKHUENnYEiXQU7Kl+j7poSO2EY3Pu
        K6GbsKzNuEXLYOFDudh9EK6ajYiIFbB4ZgMTMQOnC7vc15JTKtg72okYgH/l/ywTAGbgx2Xx
        6mSOD9VwOYE8q+azNMmBN9LVFrD5KQPr9sW3oGPtug1QJFB6ygw/nqrkOJvN56ptAJKo0kcW
        sVamksuS2Nw7nDY9QZuVxvE2sJvElH6yuzu+xMupZDaTu8lxGZx2W0VID0U+2D/PelQ6VgXm
        d2P8m7AY2wnTRM3zFLz9yquVbgTBNmw56tUz45qSvMtz1wRFWHn+Z8VF75jw3HMJoQHRp4jE
        w82l49HKqKI5r07rvCPyfN9rhfcf68AF8GLBEB83/vL+yaTgW6aq4fUutnbXvZU2c46vc0f6
        3tizDWT/5t7tSoxPYUOOolqe/QvfcePkJQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsVy+t/xe7qhHpNjDW7O4rC4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
        wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
        bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexq3Uze0GraMXZs+dZGhivCXYx
        cnJICJhITL++kQnEFhJYyijx/XBBFyMHUFxKYn6LEkSJsMSfa11sXYxcQCWfGCUWvtjCDJJg
        EzCU6D3axwhiiwhoSnTMu80KUsQscJhJYnHHQRaQhLBAuMTNhxOZQIayCKhKNPSD9fIKWEs0
        3T7OCLFAXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgM4m3Hfm7Zwdj1
        LvgQowAHoxIPr8XzibFCrIllxZW5hxglOJiVRHht/kyKFeJNSaysSi3Kjy8qzUktPsRoCrR7
        IrOUaHI+MMLySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwcr7S
        DHqiE7VtuWcq25sN79b8yFyXqnh774ZFAs5t6d0detbROaGLFprdkp/jyDRR0FCs65isbmKr
        ZvqLC/7ssXd0j7kfOl33ZEGB3byCa/Ovmp+qjrXx2S7PdnD1akHGk0GmdzXuec3lYnvm+EF8
        bV3AlldZB8/f/vfq5lz1FcuVZVndHqi8U2Ipzkg01GIuKk4EANvBA+t4AgAA
X-CMS-MailID: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
X-Msg-Generator: CA
Content-Type: text/plain; charset="UTF-8"
X-RootMTR: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
References: <CGME20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001123623.1ghcrM1OB7c-B5uzkOqZMFLMzXsLuexVFKzRMmZ2kXY@z>

There is only one DAI link so we can drop an unnecessary loop statement.
Use card->dai_link in place of direct static arndale_rt5631_dai[] array
dereference as a prerequisite for adding support for other CODECs.
Unnecessary assignment of dai_link->codecs->name to NULL is removed.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - rebased due to reordering patches in the series
---
 sound/soc/samsung/arndale_rt5631.c | 42 +++++++++++++-----------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index fd8c6642fb0d..004c84fafad9 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -88,36 +88,30 @@ static void arndale_put_of_nodes(struct snd_soc_card *card)
 
 static int arndale_audio_probe(struct platform_device *pdev)
 {
-	int n, ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
 
 	card->dev = &pdev->dev;
+	dai_link = card->dai_link;
+
+	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
+	if (!dai_link->cpus->of_node) {
+		dev_err(&pdev->dev,
+			"Property 'samsung,audio-cpu' missing or invalid\n");
+		return -EINVAL;
+	}
 
-	for (n = 0; np && n < ARRAY_SIZE(arndale_rt5631_dai); n++) {
-		if (!arndale_rt5631_dai[n].cpus->dai_name) {
-			arndale_rt5631_dai[n].cpus->of_node = of_parse_phandle(np,
-					"samsung,audio-cpu", n);
-
-			if (!arndale_rt5631_dai[n].cpus->of_node) {
-				dev_err(&pdev->dev,
-				"Property 'samsung,audio-cpu' missing or invalid\n");
-				return -EINVAL;
-			}
-		}
-		if (!arndale_rt5631_dai[n].platforms->name)
-			arndale_rt5631_dai[n].platforms->of_node =
-					arndale_rt5631_dai[n].cpus->of_node;
-
-		arndale_rt5631_dai[n].codecs->name = NULL;
-		arndale_rt5631_dai[n].codecs->of_node = of_parse_phandle(np,
-					"samsung,audio-codec", n);
-		if (!arndale_rt5631_dai[0].codecs->of_node) {
-			dev_err(&pdev->dev,
+	if (!dai_link->platforms->name)
+		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
+	if (!dai_link->codecs->of_node) {
+		dev_err(&pdev->dev,
 			"Property 'samsung,audio-codec' missing or invalid\n");
-			ret = -EINVAL;
-			goto err_put_of_nodes;
-		}
+		ret = -EINVAL;
+		goto err_put_of_nodes;
 	}
 
 	ret = devm_snd_soc_register_card(card->dev, card);
-- 
2.17.1

