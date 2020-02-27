Return-Path: <SRS0=luaX=4P=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45379C4BA3B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 09:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B14A82067C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 09:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N/EvvF14"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgB0Jak (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Feb 2020 04:30:40 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41587 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgB0Jak (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 04:30:40 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200227093038euoutp025f080222593a5ca8440b87f8be1bb943~3OG2-j-Da2248022480euoutp02c
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2020 09:30:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200227093038euoutp025f080222593a5ca8440b87f8be1bb943~3OG2-j-Da2248022480euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582795838;
        bh=Hlp3dc4GWSJNveuuopZWoe96J/37rNcI78H3KwCW+5o=;
        h=From:To:Cc:Subject:Date:References:From;
        b=N/EvvF14QmFm/MSGgk3EWHw9LWAqtejploJ/fLR3OS5i6S5UOYDN+vp7nAuQ+iWoV
         0favD/HI/JaIIrAhT6FgN8RCPZFFE5YHJH6UV5k6F8QxM/sbiz+PFLm0LpTPlbKw7r
         lqFvU0L2kCVrA0M/dak8npsJ5DgGxl8kfuNDiMbw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200227093037eucas1p11143217d5e232215fd24de8f7c3c1c9c~3OG2uwGVX2640426404eucas1p1X;
        Thu, 27 Feb 2020 09:30:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 30.F1.60679.D3C875E5; Thu, 27
        Feb 2020 09:30:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d~3OG2UtRKD2287322873eucas1p22;
        Thu, 27 Feb 2020 09:30:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200227093037eusmtrp28e9b9eb87b1ba51b1cbfd37ec344e845~3OG2UKeCB0825008250eusmtrp2e;
        Thu, 27 Feb 2020 09:30:37 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-eb-5e578c3d6930
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B7.CB.07950.D3C875E5; Thu, 27
        Feb 2020 09:30:37 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200227093036eusmtip1788d5461e6ce33300baf63a1b11a97cd~3OG1-tRte2521225212eusmtip1U;
        Thu, 27 Feb 2020 09:30:36 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: make Samsung USB2 PHY built-in
Date:   Thu, 27 Feb 2020 10:30:27 +0100
Message-Id: <20200227093027.17349-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWy7djP87q2PeFxBo+bNC02zljPanH+/AZ2
        ixnn9zFZrD1yl92BxWPTqk42j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4Mr4+fASc8Ek9oqn
        hw4wNjDOYeti5OSQEDCRaHywnBHEFhJYwSjx7mxaFyMXkP2FUWLbv+eMEM5nRok13xazwHT8
        vryZHSKxnFFiw5KbrHAt+98vZQapYhMwlOh62wW2Q0RAVeJz2wKwDmaBPkaJ63vnghUJC3hI
        /L36lhXEZgEqerD5LlADBwevgK3E8fnhENvkJVZvOMAM0ishsIZNYt/SS+wQCReJ/l2PmSFs
        YYlXx7dAxWUk/u+czwTR0Mwo8fDcWnYIp4dR4nLTDEaIKmuJO+d+gW1jFtCUWL9LHyLsKHF1
        71YmkLCEAJ/EjbeCIGFmIHPStunMEGFeiY42IYhqNYlZx9fBrT144RLUOR4SJ7bcYYWEaazE
        9svNrBMY5WYh7FrAyLiKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMLZP/zv+ZQfjrj9J
        hxgFOBiVeHglEsLihFgTy4orcw8xSnAwK4nwbvwaGifEm5JYWZValB9fVJqTWnyIUZqDRUmc
        13jRy1ghgfTEktTs1NSC1CKYLBMHp1QD4/SKH1/FWkz9uw0M99XEct+Ys192+gY+bsnH96Yy
        qBk7/l7FEPTjQ8rHdL29Aq1eE2e6PD/9/+3Gqp6Z3BJ+k3tXiM6Zf3gPS9HLeF7pyleGzIdP
        /Gc5Y3n6NOdjiU8BPNZfN3v5bXo837iR6WDdvKm84q6eG+MmuHJP8v73al/6Nwld8dCXckos
        xRmJhlrMRcWJAFGYcrrpAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xu7q2PeFxBqtmCltsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
        ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfx8+El5oJJ7BVPDx1gbGCcw9bFyMkhIWAi8fvy
        ZvYuRi4OIYGljBIXO2ezQiRkJE5Oa4CyhSX+XOsCaxAS+MQosfaWNojNJmAo0fUWIi4ioCrx
        uW0B2CBmgQmMEuc7Z4AlhAU8JP5efQs2iAWo6MHmu0BxDg5eAVuJ4/PDIebLS6zecIB5AiPP
        AkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIEBte3Yzy07GLveBR9iFOBgVOLhLUgKixNi
        TSwrrsw9xCjBwawkwrvxa2icEG9KYmVValF+fFFpTmrxIUZToN0TmaVEk/OBwZ5XEm9oamhu
        YWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxpUEihb1vssF0Z6uvvBePLE15
        6fRa7XXi64dzJsoelLskLciw2Cvq2EQ/6dQk8UdFNpZiHne6DHwPiBQYhL5TeX30uhLrbDGD
        HcnBmzeI1T3R2VX36EOWZFlU8b7Z9xc4z5ubxsbanxG4facN9/HleiyJ3FZf3si8LrAKPb6y
        qn65aN+9KE0lluKMREMt5qLiRAA4TmXiPgIAAA==
X-CMS-MailID: 20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d
References: <CGME20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos OHCI and EHCI drivers are already selected as built-in, but they
both require Samsung USB2 Generic PHY driver to operate properly. Mark
that driver as built-in, otherwise having Exynos OHCI and EHCI drivers
built-in makes no sense.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7c8a1c310bbb..04a68efb3ddb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1055,7 +1055,7 @@ CONFIG_PHY_QCOM_APQ8064_SATA=m
 CONFIG_PHY_RCAR_GEN2=m
 CONFIG_PHY_ROCKCHIP_DP=m
 CONFIG_PHY_ROCKCHIP_USB=y
-CONFIG_PHY_SAMSUNG_USB2=m
+CONFIG_PHY_SAMSUNG_USB2=y
 CONFIG_PHY_EXYNOS5250_SATA=m
 CONFIG_PHY_UNIPHIER_USB2=y
 CONFIG_PHY_UNIPHIER_USB3=y
-- 
2.17.1

