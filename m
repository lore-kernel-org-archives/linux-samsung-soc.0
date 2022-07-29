Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5015C28B2B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbiG2AgW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiG2AgV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:21 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825B266100
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:19 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220729003613epoutp032a1f50d8af60d10ee8da27d68a4194cc~GJbVpLmbH0995709957epoutp03B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220729003613epoutp032a1f50d8af60d10ee8da27d68a4194cc~GJbVpLmbH0995709957epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054973;
        bh=u72XSaxXKW64JQEEgAonBNYCBeLU0zpLu0CuLrxeXKk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=HZRKmkJIZxD3tGm2WOS/Zav0tl2dFukUfxamOiSRQpuyjEoCOrATlNrXShyQ45jS3
         5eDLzdZVxyy773jn5Hti0KuhwcDt9PHqUB+kbmk01xffGhTSzF7K15k2TxzIepRZpJ
         9hZA5JnHpgdPpz6n4L66nHiU7pMGiR1b/FZaFuUo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220729003613epcas2p12b38fd65ad5fc19bc7d45c33ec599de9~GJbVD_OxT2881228812epcas2p1Z;
        Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Lv7qJ4S2xz4x9Q1; Fri, 29 Jul
        2022 00:36:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        53.66.09662.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb~GJbTy0YUL2881228812epcas2p1W;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220729003611epsmtrp1f452acfa76ece5e3953e99af3b2f72e9~GJbTxzOyA3230432304epsmtrp1P;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
X-AuditID: b6c32a48-20206a80000025be-af-62e32b7c60b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B7.1B.08905.B7B23E26; Fri, 29 Jul 2022 09:36:11 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epsmtip2d84882936ee2c3b0b9edf7ddfbe0b3ee~GJbTe3aNv0182201822epsmtip2h;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 0/6] fsys0/1 clock support for Exynos Auto v9 SoC
Date:   Fri, 29 Jul 2022 09:30:18 +0900
Message-Id: <cover.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmuW6N9uMkg0WbZS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xq32
        u8wFjzkq3l46xd7A2MPexcjJISFgIvH+5ArGLkYuDiGBHYwS91bdYQRJCAl8YpT4f68KIvGN
        UWLLokNsMB1/Dk9kg0jsZZQ4PbuRBaLjI6PEjL9eIDabgK7EluevwMaKCDxmkjh8pA2sg1mg
        jUli2rONrCBVwgIuEoc/3gOzWQRUJfbv3w9m8wrYSHxadYMJYp28xPWbbcwQcUGJkzOfgG1j
        Boo3b53NDDJUQmAih8TXk7eg7nOReHfrDtR3whKvjm+BsqUkXva3QdnFEktnfWKCaG5glLi8
        7RdUs7HErGftQHdzAG3QlFi/Sx/ElBBQljhyC2ovn0TH4b/sEGFeiY42IYhGdYkD26ezQNiy
        Et1zPrNC2B4Sn2ZtYoIEUKxEw+03LBMY5Wch+WYWkm9mIexdwMi8ilEstaA4Nz212KjABB6r
        yfm5mxjBKVfLYwfj7Lcf9A4xMnEwHmKU4GBWEuFNiL6fJMSbklhZlVqUH19UmpNafIjRFBi+
        E5mlRJPzgUk/ryTe0MTSwMTMzNDcyNTAXEmc1ytlQ6KQQHpiSWp2ampBahFMHxMHp1QDk+TK
        /zVViinWzxbWh1u5u5pqWq7703ey9H/QhY2Fn/JWdG/IYM1aMyWCS3bPceeN098qpx3lPfO6
        gsEvzMj0zWTnwonPWBULG/VYpgbku7LlSD3q8N/F+n8+81WXG0/YF4tc0z3yNuIPd8PTwLzZ
        O+ItO3s3bz4x/8rm5i1uZwz3lUgs1V+y/Kfa5urzM9rMJs5v+6W1g1fnd+PGCTMfCOwqtuea
        k7PErnfaia3HbizZmpU2e77qhv/2uqLec4LXLtM7f421OeaAU+iVy1blDxOqa/bf+ZmybJdL
        j+WM8Ioza/bsbJKZ+m9+ovyjE3aFOd8KVn5/GfOf3bVdzWrlXMklq/aWumrWZlvkxaVb1yux
        FGckGmoxFxUnAgA73BZmQgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvG619uMkg0f/NS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugSvjVvtd5oLHHBVvL51ib2DsYe9i5OSQEDCR+HN4IlsXIxeHkMBuRomzL9oZ
        IRKyEs/e7YAqEpa433KEFaLoPaPEtedzwRJsAroSW56/YgRJiAg8Z5KYsuIgmMMs0MUkcaft
        E1iVsICLxOGP91hBbBYBVYn9+/eD2bwCNhKfVt1gglghL3H9ZhszRFxQ4uTMJywgNjNQvHnr
        bOYJjHyzkKRmIUktYGRaxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHAlamjsYt6/6
        oHeIkYmD8RCjBAezkghvQvT9JCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGan
        phakFsFkmTg4pRqYOqS2tLG1af/d49lzwnWmcYH4+nxuf91S7oM/A9MMFrnZinhvZlh/Oa3R
        2kO7yDr0VPUCC63ZZ1+liDzYEqjWsEPqySrXox+Un/6sPLv2ps/5nQqlD1munOPn+uMw8cm+
        r9t6Dync3pIp8+7cstDGemUpznyfR3FizPunHGLO9Gd575a6PMn7Su+/h6nT5uo4qNTvWCAk
        /OKTw/tABqcngiVT2Nl2VN1mn8b8OZThwlUF83zfGZmSi/zLQx8+6/zDKXr8+GIDpljL32LF
        fTnpYYVlS3cynxUsWv7t2JmP11ceT95VOrvzXanAp5xzrKva91oy2nr3df07fd5zuoqn5uyp
        TNZ72Btt1p2KaS9WYinOSDTUYi4qTgQA4od+xfMCAAA=
X-CMS-MailID: 20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb
References: <CGME20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
Lanes. Similarly, CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1,
2 x USB 2.0) and mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also
supported as a PLL source clock provider.

Changes since v1:
- Patch 0002 and 0006: Put FYS1 prefix for CLK_MOUT_MMC_PLL as pointed
  by Chanwoo
- Add Chanwoo and Krzysztof A-B and R-B tags to 0001/0003/0004 and 0005
  patches

Chanho Park (6):
  dt-bindings: clk: exynosautov9: add fys0 clock definitions
  dt-bindings: clock: exynosautov9: add fsys1 clock definitions
  dt-bindings: clock: exynosautov9: add schema for cmu_fsys0/1
  arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
  clk: samsung: exynosautov9: add fsys0 clock support
  clk: samsung: exynosautov9: add fsys1 clock support

 .../clock/samsung,exynosautov9-clock.yaml     |  44 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  28 ++
 drivers/clk/samsung/clk-exynosautov9.c        | 373 ++++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  |  68 ++++
 4 files changed, 513 insertions(+)

-- 
2.37.1

