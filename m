Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3197DC00144
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240119AbiG0CSb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiG0CS2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 22:18:28 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E88A3C17E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:27 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220727021825epoutp031c7f15260c1106feec3156380028cd6d~Fjh-8_UON1670516705epoutp03C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220727021825epoutp031c7f15260c1106feec3156380028cd6d~Fjh-8_UON1670516705epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658888305;
        bh=mLTd9B7WRKeJi/KQFzuW4NXll551PKXDezmIYe1rT+o=;
        h=From:To:Cc:Subject:Date:References:From;
        b=M3EDEbLJWNtj86rQtAEJEAqD72Z2dC50qwBselhA1LfZdlMAgvsNHm+PC1L3L8P+j
         ftQuV9ETRrDNxyuUiaPPjfGKXojyaQxTMGQQpOAhwzkaMbVct0HgkDtEVEnU3AHjyw
         fNpbUWpCtFqRaYVUJXA1G87qxh3yWQMvaWA1xkv4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220727021825epcas2p395704318b51ec110d7d366941302c383~Fjh-c_tDm2448124481epcas2p3w;
        Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LsyB86H0yz4x9Q0; Wed, 27 Jul
        2022 02:18:24 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        34.4D.09642.070A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220727021823epcas2p2d924128dab9d449c2c6794d16aac617c~Fjh_Rf3J60393203932epcas2p2C;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727021823epsmtrp1ce2fac03d4cd9034bc1ea8de96866570~Fjh_Qrkbe3129031290epsmtrp1J;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-81-62e0a0706eb5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.E7.08802.F60A0E26; Wed, 27 Jul 2022 11:18:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021823epsmtip106be97675c2271ca9741fe9f26c632c0~Fjh_EUg_x2106521065epsmtip1Z;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [RESEND PATCH v2 0/3] fixes for exynosautov9 clock
Date:   Wed, 27 Jul 2022 11:13:54 +0900
Message-Id: <20220727021357.152421-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmhW7BggdJBovPqFk8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B4
        53hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygC5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUl
        tkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RndS9axFbxirXi8dhJjA+N1li5GTg4J
        AROJV60rGbsYuTiEBHYwSnxffB4sISTwiVGi8Z0oROIzo8TB3dvZuxg5wDqW3K2FqNnFKNF8
        Nxui5iOjxOWO2YwgCTYBXYktz1+BTRURaGGSaD24gRXEYRbYwyjxb8ladpAqYQFriR1Np8Bs
        FgFVieZ9n8FsXgF7id4na5kg7pOXuH6zjRkiLihxcuYTsPOYgeLNW2czgwyVEPjJLvFn+T8W
        iPNcJN6v8oDoFZZ4dXwLO4QtJfGyvw3KLpZYOusTE0RvA9DZ236xQSSMJWY9a2cEmcMsoCmx
        fpc+xEhliSO3oNbySXQc/gsNCF6JjjYhiEZ1iQPbp0NDVFaie85nVgjbQ+LRx93MkMCKlTj6
        YA3bBEb5WUiemYXkmVkIexcwMq9iFEstKM5NTy02KjCGx2lyfu4mRnAa1XLfwTjj7Qe9Q4xM
        HIyHGCU4mJVEeBOi7ycJ8aYkVlalFuXHF5XmpBYfYjQFBu9EZinR5HxgIs8riTc0sTQwMTMz
        NDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cAk1snP1sTa+SGl5HHFlk8X5fVFvwe/
        LP/WmLBef/HeJeLswtK7H9/UOh8blLledup2MWYNx0X74//Okyk+6le4/oNj9SXVA+/esbN+
        yNUSO1z4InDfjz2SJ7gSzHlqmxepTrXLkWZKDjjydeqB36mPJBjUc2cIGxpu/5dzLdPt3QOu
        Vf9l/zXzL56wp+HavDw9Dtf1jQ8c9K6oyS/gV5mgonR5wXzjaztdEt2mh+Q//uNd5eB4RLZW
        fbKSmWail7PwKjfOufvfrNq8ZqYA/xXtYpEHOzhfib2L15NWOb+u2cCBe7Wru+1Cs449Iolp
        Gc7TLoW9/fC/ckbapPxLadI7d+zqartln6Ks66V1ylyJpTgj0VCLuag4EQChMzVYLAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnG7+ggdJBsvOWFg8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujO4l69gKXrFW
        PF47ibGB8TpLFyMHh4SAicSSu7VdjFwcQgI7GCVaJm8FinMCxWUlnr3bwQ5hC0vcbznCClH0
        nlHi3bX5jCAJNgFdiS3PXzGCJEQEOpgkZq24CFbFLLCPUWLu8U3MIFXCAtYSO5pOgY1iEVCV
        aN73GczmFbCX6H2ylglihbzE9ZttzBBxQYmTM5+AncEMFG/eOpt5AiPfLCSpWUhSCxiZVjFK
        phYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBIe3ltYOxj2rPugdYmTiYDzEKMHBrCTCmxB9
        P0mINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGptMuH96G
        JO9scXBfteDa9J8KUZsmzvDVkZTsbBTdsPvvtrDi/uPrFGuLBE9rqccuO8M3x+HvFuk/mZsE
        v7Im7pz9jnWtMh+bTLEHE4Pj3lPqKlGfvC8s2XJec539Ye+qAL/TMu5TjDdfTxH2UfsqVGtU
        kh1Unu/2rN/tdX12ot/bztqqjJslljxSfCtjNX7/uWF3KDbOQcMnhVHjZ6nk28MmQpEfAy5e
        enxQXebYPXaR9l1TXQ/v85h28kRNEJvI2drjL0r6OExYGlR+Rp68pqF958uynuSmr7/n6wVM
        +D5lmpR7mpSH/obfd6qPROTM6Zqeoijxsee98IU5q7w1sn8eEd1z6H/QvRr1O9VsSizFGYmG
        WsxFxYkAreknBd4CAAA=
X-CMS-MailID: 20220727021823epcas2p2d924128dab9d449c2c6794d16aac617c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727021823epcas2p2d924128dab9d449c2c6794d16aac617c
References: <CGME20220727021823epcas2p2d924128dab9d449c2c6794d16aac617c@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are some fixes for exynosautov9 such as clock id numbering,
missing clocks and register offsets.

RESEND PATCH v2 with:
- Add Krzysztof's R-B tags for #2
- Add Chanwoo's A-B tags for all patches

Changes from v1:
- Add Krzysztof's R-B tags for #1 and #3 patches
- Drop fixes tag of #2 patch

Chanho Park (3):
  dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
  clk: samsung: exynosautov9: add missing gate clks for peric0/c1
  clk: samsung: exynosautov9: correct register offsets of peric0/c1

 drivers/clk/samsung/clk-exynosautov9.c        | 28 ++++++----
 .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
 2 files changed, 46 insertions(+), 38 deletions(-)

-- 
2.37.1

