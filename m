Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081FCC64E75
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99BFB22256
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GMCpYuVV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgKTI5Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:57:16 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38310 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbgKTI5M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 03:57:12 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201120085701euoutp011bb117c8473bb73b94de4335d16da3a8~JK4uyueOR2603226032euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 08:57:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201120085701euoutp011bb117c8473bb73b94de4335d16da3a8~JK4uyueOR2603226032euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605862621;
        bh=C9Yy36CRzv0kPeDDkHKP+m55/CV/ES66S5cLSnbEMJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GMCpYuVVHUwSxc30z7cpTM618fIZJ+eQpA3hgzPnLjPpIQopmL2MbGo/N/0UDOGzf
         +EZCpdm5k/xIhAIVSzJZXNjqpIMvdvBeUxCNnV9wALlyzSooUQCQIL5Mksaoab0a3F
         Jw3I87QpCm7FVMgR/pHLNMLvvefjYzoWkATBkqVE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201120085652eucas1p1c5eea8ac6ced4e689ad707589e192862~JK4nMCk8b2683026830eucas1p1G;
        Fri, 20 Nov 2020 08:56:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.7B.27958.4D487BF5; Fri, 20
        Nov 2020 08:56:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737~JK4mev1HU0943709437eucas1p1y;
        Fri, 20 Nov 2020 08:56:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201120085652eusmtrp262cbbfecce3e8c0c14e9d047037ae1ff~JK4meChe62026420264eusmtrp2d;
        Fri, 20 Nov 2020 08:56:52 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-af-5fb784d4e75b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 11.3E.21957.4D487BF5; Fri, 20
        Nov 2020 08:56:52 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085651eusmtip159e3b8b71081a0d4f50aa65469b5099e~JK4l-Qbkr0452604526eusmtip1D;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY
 compatible
Date:   Fri, 20 Nov 2020 09:56:37 +0100
Message-Id: <20201120085637.7299-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120085637.7299-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsWy7djPc7pXWrbHG/R1mltsnLGe1eLC0x42
        i/PnN7BbXN41h81ixvl9TBZrj9xlt1g/7SerxeE37awWO++cYLb4duIRowOXx85Zd9k9Nq3q
        ZPPo27KK0eP4je1MHp83yQWwRnHZpKTmZJalFunbJXBlvFuyjKlgCWfF1d13mRoYt7B3MXJy
        SAiYSJxZdATI5uIQEljBKDGpfQkzhPOFUeLTj8NMEM5nRomLbz8wwrTcevCdFSKxnFHi+8TL
        THAt8y7MYQWpYhMwlOh628UGYosIqEp8blsAtpBZ4D+TxM0NnCC2sECoxI91+5lBbBagmrMT
        PwFt4ODgFbCRWP8+B2KZvMTqDQfASjgFbCW2TLoMdquEwBYOic2zdrNBFLlIfHp9FsoWlnh1
        HOY5GYn/O+czQTQ0M0o8PLcWqruHUeJy0wyof6wl7pz7xQaymVlAU2L9Ln2IsKPEy/erWEDC
        EgJ8EjfeCkLczycxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJGcL2kFjc9QIapBMYJf63nmCd
        wCg/C2HZAkbGVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIFJ5PS/4592MM599VHvECMT
        B+MhRgkOZiUR3rWaW+OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ866avSZeSCA9sSQ1OzW1ILUI
        JsvEwSnVwBTH5c0nGiuy+5156PL7RzR//S0zDz91uUSC58u9w+Xns3lOfZuq83rm7qnX9+kt
        F1s/+aea1hK2hR80Re1aNU5Pnvud4xXHjZ7wVYJJL1d/0L13Y2eu7/PZsllPr06zKxERdfO/
        NU9sd4mRSvSHN3MdxFOmKi1YbvVc+M7ljm+L5CcsX3fsmNrKSwzS6icfrzr+wG6JUPxOC+7i
        4/vSNlqsa7y28eLG9/NLHG1KvT/w9JzrZP+pUG1Q4c/IEPf1657Minq72H9P5zUGcqz8/SLE
        4LVT4fQlDfs+tknHGNqIcLYwRYtovldiWax332HN//jHOiVSPwUspW5VMV0XM2Rh0fm90Htj
        jUPJmZ9z88SUWIozEg21mIuKEwEYiPrukQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsVy+t/xu7pXWrbHG3zYzGGxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVmsPXKX3WL9tJ+sFofftLNa7Lxzgtni24lHjA5cHjtn3WX32LSq
        k82jb8sqRo/jN7YzeXzeJBfAGqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSq
        pG9nk5Kak1mWWqRvl6CX8W7JMqaCJZwVV3ffZWpg3MLexcjJISFgInHrwXfWLkYuDiGBpYwS
        Zw/dYoRIyEicnNbACmELS/y51sUGUfSJUaJhxVQWkASbgKFE11uQBCeHiICqxOe2BWBTmQVa
        mSX+dFmB2MICwRLHHjUwgdgsQDVnJ34CWsDBwStgI7H+fQ7EfHmJ1RsOMIPYnAK2ElsmXQYb
        IwRU8ur4OsYJjHwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBAb0tmM/N+9gnPfqo94h
        RiYOxkOMEhzMSiK8azW3xgvxpiRWVqUW5ccXleakFh9iNAU6YyKzlGhyPjCm8kriDc0MTA1N
        zCwNTC3NjJXEebfOXRMvJJCeWJKanZpakFoE08fEwSnVwFRx0I9/8vu7yZM+1slvVAzYKnVk
        WXWMUpdH0pKundP1GzqDuZ82Xfk49bLiuj8H2rfYfU4+WJahriP4Z5tRRkSf29ud/DKrI1o8
        5jKorr9l8uLrmyWONvaBMs5sx47P6NgovHWV69unK04rqOdy8hUbMtwXuR9zNeT6+z7xzfdm
        f3XOs7/AtmJ5wnHhzgdf55q9/dv5lfOv9NJUxuf2d6Yw1rzerL4tU3n9Of8FDR1hCWsf7rt9
        WekM//onlVMv7bXXEOj88+9oG8vr59323n4FB/mYW5aUrnCdI5WpwhT4IeTA1OWKsSU/OtM4
        N/EYiaxI//Kyld+k0+a769wFTxkE5fidVpSnzHv/5L2E2QwlluKMREMt5qLiRAC5qMla8QIA
        AA==
X-CMS-MailID: 20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
        <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

USB2.0 PHY in Exynos5420 differs from Exynos5250 variant a bit, so use the
recently introduced dedicated compatible for Exynos5420.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos54xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index fe9d34c23374..2ddb7a5f12b3 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -188,7 +188,7 @@
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0x12110000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&usb2_phy 1>;
+			phys = <&usb2_phy 0>;
 			phy-names = "host";
 		};
 
@@ -196,12 +196,12 @@
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0x12120000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&usb2_phy 1>;
+			phys = <&usb2_phy 0>;
 			phy-names = "host";
 		};
 
 		usb2_phy: phy@12130000 {
-			compatible = "samsung,exynos5250-usb2-phy";
+			compatible = "samsung,exynos5420-usb2-phy";
 			reg = <0x12130000 0x100>;
 			#phy-cells = <1>;
 		};
-- 
2.17.1

