Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9192C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbiECK2e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 06:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbiECK2T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 06:28:19 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B420C17E19
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:24:47 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220503102444epoutp01d4c046029b859cdfa0924cb6da5535f6~rkVVitRcH1672116721epoutp01T
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:24:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220503102444epoutp01d4c046029b859cdfa0924cb6da5535f6~rkVVitRcH1672116721epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651573484;
        bh=pUm++TwaBZMfmIHIOg0NxGcVh/DkCsLpZQ7fNKtba60=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=CXgTTCskX+djTupcNEySCoU+uln91nYKnAjt28LJqLSZ6qCW2tVgWH77q4TkveVMo
         vZaananpfJYExDNzg4ULRN950FE4IOUplolrZ79G9J1wH4fNJzH+TwSKPfZv17wKLP
         zIW4ULWrhL9ZxIFhz8MYmoWdJJpkzUOxKiB9w0HI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503102443epcas2p25699dbc91a22febc4fefe0635e6ec6e0~rkVVF4cSh2567625676epcas2p2P;
        Tue,  3 May 2022 10:24:43 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.69]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Ksx0V4Mwwz4x9Pr; Tue,  3 May
        2022 10:24:42 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        55.EF.10028.AE201726; Tue,  3 May 2022 19:24:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220503102442epcas2p440219af6071cc596ced170e0240422cd~rkVTcQs8I0952109521epcas2p4K;
        Tue,  3 May 2022 10:24:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503102441epsmtrp10c33994b218c4619453fdea161492b37~rkVTadWFx1613516135epsmtrp1O;
        Tue,  3 May 2022 10:24:41 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-69-627102ea25cc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8A.52.08924.9E201726; Tue,  3 May 2022 19:24:41 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503102441epsmtip2d8c9d48775312b727182a55b596745aa~rkVTPKR182102021020epsmtip2U;
        Tue,  3 May 2022 10:24:41 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <42df6765-0589-bc34-7d20-a05ef3e2d057@linaro.org>
Subject: RE: [PATCH 03/12] clk: samsung: add top clock support for Exynos
 Auto v9 SoC
Date:   Tue, 3 May 2022 19:24:41 +0900
Message-ID: <02d701d85ed8$00575560$01060020$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKWF+Vk7KC4mE3H7cmUi4B2cVMtRQGdEjk0ATGrG3YB1iL0x6tsVSRg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmme4rpsIkg2k3FCwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAW1S2TUZqYkpqkUJqXnJ+SmZe
        uq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QoUoKZYk5pUChgMTiYiV9O5ui/NKS
        VIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IzNcxezFzSxVHxatpC9gXE+
        cxcjB4eEgIlE50r7LkYuDiGBHYwSU36uZIJwPjFKXGg5yAbhfGaU+PdjPWMXIydYx51rh1kh
        ErsYJZaumAVV9YJR4sfJuWBVbAL6Ei87toFViQhsYJbYuOsmWBWzwDRGicWTv7CDVHEK2Em0
        fepgAbGFBcIlpt+eCmazCKhIvN6xDczmFbCUeP30HzuELShxcuYTsDizgLbEsoWvmSFuUpD4
        +XQZK8hHIgJuEkvvWUGUiEjM7mxjBtkrIXCAQ+LZvD1QP7hIzGyeDmULS7w6voUdwpaSeNnf
        BmUXSyyd9YkJormBUeLytl9sEAljiVnP2hlBljELaEqs36UPCUlliSO3oE7jk+g4/JcdIswr
        0dEmBNGoLnFg+3QWCFtWonvOZ9YJjEqzkDw2C8ljs5B8MAth1wJGllWMYqkFxbnpqcVGBcbw
        2E7Oz93ECE7EWu47GGe8/aB3iJGJg/EQowQHs5IIr/PSgiQh3pTEyqrUovz4otKc1OJDjKbA
        oJ7ILCWanA/MBXkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGpim
        zVVeskNh+c9D88Uqrs2X+dk+2d7tdOTVVJUVvX+jrGMXpkZkvN+YsP6r75mPSXzVralCN+Ze
        UGBYH7CMff0vfQ31MwyXu22XHFt0uEL+aGG/yIOC+0Xu9+o3ndbP2Sy1Jd7+TIXOK/Z4bkH9
        5IpN/iunr/h2m7M+9KpD4tzW0N2MzPUme396nt53a6nxN4E+cdmSkzo1ftN82dOWXY28acW9
        VHftnJJrmmu3iCo6pPLPbitTv21rtVZK8od8VaSWyET+8+e3BOu+ilD6sktJpaK4y3J5kGvr
        cqm4zRtT8oxi0+/+XyFnGvXs1Zxjz9rVQw69XBk+/9yrBxo5Do/Nvxw9+pR9bXGjlcShbBEl
        luKMREMt5qLiRAAV2J+YTQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO5LpsIkg6475hYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i8Nv2lkt/l3byGLxvA8ovmrX
        H0YHXo/3N1rZPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6ALYrLJiU1J7MstUjfLoEr409f
        bcE35oqn898wNTBOZu5i5OSQEDCRuHPtMGsXIxeHkMAORom3M5vYIBKyEs/e7WCHsIUl7rcc
        gSp6xijR2f8frIhNQF/iZcc2sISIwBZmieMTvjKBOMwCMxglDpzaygbR8pVR4uLuT2AtnAJ2
        Em2fOlhAbGGBUIn+bzuZQGwWARWJ1zu2gcV5BSwlXj/9xw5hC0qcnPkELM4soC3x9OZTOHvZ
        wtdQTyhI/Hy6DOgMDqAz3CSW3rOCKBGRmN3ZxjyBUXgWkkmzkEyahWTSLCQtCxhZVjFKphYU
        56bnFhsWGOWllusVJ+YWl+al6yXn525iBEelltYOxj2rPugdYmTiYDzEKMHBrCTC67y0IEmI
        NyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGpuq4e273F6pn
        CDGF8je8XyByoWvNU8WqxismJa01fGzHuSdX6DLV815yPbZS2FfMSUf8nLW6/6KmOa/bWhY+
        fL5h3oTah/Kn/OVljf8llHwPSlrHvPnU/oBLWtq6XyYLaj2+927Ttm5Jlsbpdx8+bXh83at/
        1kfR5VM+bs6dUzfZOtXy+7sk15xfh4p1Z6/4o7aWx1Eu8cuuoIdJd6JcRN/I5TNEK041l8zp
        0z8e6xqztMhbeGqfxrq1hcnxpYuTFMRlNx2fI2FwbXL9qg23ExxWWnfyuljeSTh5aLrD6QO8
        hfo3PlRu7P/1dy/fzeVW3F39KrNjDvFNUXg312zavl//OWqW5ByROGw38duGjUosxRmJhlrM
        RcWJANCZMtk5AwAA
X-CMS-MailID: 20220503102442epcas2p440219af6071cc596ced170e0240422cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018@epcas2p3.samsung.com>
        <20220502090230.12853-4-chanho61.park@samsung.com>
        <42df6765-0589-bc34-7d20-a05ef3e2d057@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > +static
> > +const
> const goes to line above (with static).

I separated the const to avoid below checkpatch error when I put =22static =
const=22 together. It might be better to be put them as a single line :)

ERROR: Use of __initconst requires a separate use of const

=23768: FILE: drivers/clk/samsung/clk-exynosautov9.c:750:
+struct samsung_fixed_factor_clock top_fixed_factor_clks=5B=5D __initconst =
=3D =7B

total: 1 errors, 1 warnings, 966 lines checked

Best Regards,
Chanho Park

