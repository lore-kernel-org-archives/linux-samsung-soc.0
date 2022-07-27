Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F54AC19F21
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiG0GGZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiG0GGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:22 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255CC3ED7F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp02b282a2485eaa0ec15b1e6edb8dd1ecbc~Fmo5ky2vd0211802118epoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220727060614epoutp02b282a2485eaa0ec15b1e6edb8dd1ecbc~Fmo5ky2vd0211802118epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=s68uuFW1Zwmj+ps42G5jDdfhJ/iRJJf6MKDW+hr0Opc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=swcaPZ6XJze7zpMjJcI+4UC/P6sFfF6ebqS+uCR7BDSWowM5PQORFMcYsrJ0e9lB1
         ttYrF/T0r7aFZ860o39LsPRm8Pv5dPg81A8SUoJrW6iGY7Uh/BB4N5Qc0qS5XbhH/i
         1SvZYmUbx488bhRcERQc4Ct4UGSEOplSGiYJWXYM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p128c6bbc4078863c614ba95835ef25ce7~Fmo5DRj_j1715217152epcas2p1S;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.98]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Lt3F0717Vz4x9Q2; Wed, 27 Jul
        2022 06:06:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        A2.05.09666.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p1e3631dbc4775de76cd62554a20bae716~Fmo3_xeWo1714817148epcas2p1R;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp2248c1202f09214e9bbea13efbe3c7123~Fmo395YDy2781327813epsmtrp2y;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-cf-62e0d5d47df5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.50.08802.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip1a025c836af77d15844d948a44a7b65e3~Fmo3u2rmc2960929609epsmtip1L;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
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
Subject: [PATCH 0/6] fsys0/1 clock support for Exynos Auto v9 SoC
Date:   Wed, 27 Jul 2022 15:01:40 +0900
Message-Id: <20220727060146.9228-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRmVeSWpSXmKPExsWy7bCmue6Vqw+SDO4+NLd4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2qGyb
        jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCrlRTKEnNK
        gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGe/3
        nGUqWMJecXHfRrYGxu+sXYycHBICJhJT1u9i6mLk4hAS2MEoMXHSekYI5xOjxIenZ9ghnM+M
        Epe2fGSGaTk19ShUYhejxJIHf6Gcj4wS3dueMoJUsQnoSmx5/gpslojAYyaJw0fa2EAcZoE2
        JolpzzaCrRcWcJR4cO05mM0ioCox/1kHmM0rYCuxfP8UqH3yEtdvtjFDxAUlTs58wgJiMwPF
        m7fOhqqZyCGx80IehO0i8bJrDxuELSzx6vgWdghbSuLzu71Q8WKJpbM+gb0tIdDAKHF52y+o
        hLHErGftQGdzAC3QlFi/Sx/ElBBQljhyC2otn0THYZCPQcK8Eh1tQhCN6hIHtk9ngbBlJbrn
        fIYGsIfE2vtfmEBsIYFYib/zljBOYJSfheSZWUiemYWwdwEj8ypGsdSC4tz01GKjAkN4tCbn
        525iBCddLdcdjJPfftA7xMjEwXiIUYKDWUmENyH6fpIQb0piZVVqUX58UWlOavEhRlNg8E5k
        lhJNzgem/bySeEMTSwMTMzNDcyNTA3MlcV6vlA2JQgLpiSWp2ampBalFMH1MHJxSDUzRmt++
        rClbwpk+rU/38pUJekvUpv7+q788g61joknj09q1FzOXOOZfa6o4ViOhv+KEX9rtjU82NC/d
        MPN5+6yeSQzb0tY2ST3R9t/2JZfLYo/2zZOu82eXs6kfUl9msKEqUU61XmP5V5lu9g/J8Syr
        +b0zZ5ueNLtev1M3OK7z6h63nPnFetGmAl5eO6tM71U1XhJi/CI622Rr99fi74+c3kZvWZN9
        lM16i9r5X+nNj8Kdpi18Ifi70/l1qeiKqEir1+9+Mi0u5Pqu4Sw3J1U0TUTH1DFNK3WDLsN1
        2/gCVo47CV9zd1msmr/7/Ww+KyWdpX9e37/Fz30iNvQPXwfHjueClStuXn7JdC9u6z4lluKM
        REMt5qLiRABmaD67QwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDK6sF7Z4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6M93vOMhUsYa+4uG8jWwPjd9YuRk4OCQETiVNTj7KD2EICOxglfvQEQcRl
        JZ6928EOYQtL3G85AlTPBVTznlHiztN3zCAJNgFdiS3PXzGCJEQEnjNJTFlxEMxhFuhikrjT
        9gmsXVjAUeLBtedg61gEVCXmP+sAs3kFbCWW75/CDLFCXuL6zTZmiLigxMmZT1hAbGagePPW
        2cwTGPlmIUnNQpJawMi0ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOA60tHYw7ln1
        Qe8QIxMH4yFGCQ5mJRHehOj7SUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
        TS1ILYLJMnFwSjUwcaz556m+9pWtf7Cd8lf/+dJ/ulIfXPR1ZFx11Vx/ndylJb8frXGayjdz
        ufOcoNbO6Bn2piI7mLQurshrN4yf83fHvBuxexcUHdyUs7V0jsU7PZki7SVTWrIKN9zyVat4
        dS+6c3Je5ZZVsyIcJ6uZ3VnslePLMnPW9g+tPK+4N5iH/hCTyboYct11a1ns39U786TeyH6Y
        32rz8Ylpga2U7OW2GVNe3Zml5r4+Kkf60MnlN15bNzEIut0rDdM/Gbro1vdkJv2b21hdn6oo
        Kdlw3PQ1smXOaUtenHm+U5yvJuF10Llz1hu+qs1pCFPoVMp5XD7r6uUy21WnLC9sunX0gJ7a
        7Vc9/gwci0IW+QpdUmIpzkg01GIuKk4EAMlteb/yAgAA
X-CMS-MailID: 20220727060612epcas2p1e3631dbc4775de76cd62554a20bae716
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p1e3631dbc4775de76cd62554a20bae716
References: <CGME20220727060612epcas2p1e3631dbc4775de76cd62554a20bae716@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
Lanes. Similarly, CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1,
2 x USB 2.0) and mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also
supported as a PLL source clock provider.

Chanho Park (6):
  dt-bindings: clk: exynosautov9: add fys0 clock definitions
  dt-bindings: clock: exynosautov9: add fsys1 clock definitions
  dt-bindings: clock: exynosautov9: add schema for cmu_fsys0/1
  arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
  clk: samsung: exynosautov9: add fsys0 clock support
  clk: samsung: exynosautov9: add fsys1 clock support

 .../clock/samsung,exynosautov9-clock.yaml     |  44 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  28 ++
 drivers/clk/samsung/clk-exynosautov9.c        | 372 ++++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  |  68 ++++
 4 files changed, 512 insertions(+)

-- 
2.37.1

