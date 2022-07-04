Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78424C43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Jul 2022 07:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbiGDHcn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Jul 2022 03:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbiGDHcm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 03:32:42 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EBC659D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Jul 2022 00:32:38 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220704073233epoutp01270ae55611d1a537d3d00e4c51bd07b7~_j_tZFN1z0766107661epoutp01K
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Jul 2022 07:32:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220704073233epoutp01270ae55611d1a537d3d00e4c51bd07b7~_j_tZFN1z0766107661epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656919953;
        bh=W/2AzVoHDGBvQb/JQ8punKLYBb40zrcx/jVl/6/Xq/E=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=bwNvoNbgSBip4sly+Fh9KQXljKQ3oJNpZYRZxtqjvzHV8QnvjdySWgAAMVY2AeFzy
         cyN8zM3bL+W8ipu3A67geCN+A8xuGYWmh6NE8+2qEVYm8MGKdRrUn8scMGOrP9XTyw
         vDT7Bum49knMMpRdj4LIvSdyiwQe4K80ePX70EgM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220704073233epcas2p1f891751dd8ae5052521da938c2c50388~_j_s7VLis1585915859epcas2p1a;
        Mon,  4 Jul 2022 07:32:33 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.90]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LbyFD5Yv3z4x9QC; Mon,  4 Jul
        2022 07:32:32 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        A4.20.09666.09792C26; Mon,  4 Jul 2022 16:32:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220704073232epcas2p302f4cdc6e57c2d7a523ccb9cd446b688~_j_rr2PWl1631116311epcas2p3F;
        Mon,  4 Jul 2022 07:32:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220704073232epsmtrp1df4f211ea8ba6131c12eb73f729b7888~_j_rq-ZEj1477314773epsmtrp1x;
        Mon,  4 Jul 2022 07:32:32 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-4f-62c297901d62
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A6.0D.08905.F8792C26; Mon,  4 Jul 2022 16:32:31 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220704073231epsmtip2f87466c0bd8b14ac5551389596775fec~_j_rcoiUe0533005330epsmtip2U;
        Mon,  4 Jul 2022 07:32:31 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <354b2ae2-92b4-bb56-387a-599f0451a1c0@linaro.org>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Date:   Mon, 4 Jul 2022 16:32:31 +0900
Message-ID: <001801d88f78$38ca9e40$aa5fdac0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQKRjrizqP7u4/W7V2kR1MW1BABg2wHSOOUnAVQrdxABdgizgQGGL2ieAjAJ/4yruTxuoA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmqe6E6YeSDI591rR4MG8bm8X1L89Z
        LeYfOcdq0ffiIbPF3tdb2S02Pb7GavGx5x6rxYzz+5gsLp5ytWjde4Td4vCbdlaLf9c2slis
        2vWH0YHX4/2NVnaPnbPusntsWtXJ5nHn2h42j81L6j36tqxi9Pi8SS6APSrbJiM1MSW1SCE1
        Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWCWFssScUqBQQGJxsZK+
        nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbV/5cYC2aJVXza
        sZClgXGnUBcjJ4eEgInE0UuHWEFsIYEdjBKvjjt3MXIB2Z8YJRasbWSCcL4xStxuesTcxcgB
        1tH6uxQivpdRYuu8sywQzgtGie+HD4KNYhPQl3jZsY0VJCEi0Mwssad5DxuIwyywk1Hi0ool
        7CBVnAJ2EvM//GcGsYUFEiU+7V7ACGKzCKhIzLs8AyzOK2Ap0XGglx3CFpQ4OfMJC4jNLKAt
        sWzha2aIJxQkfj5dxgoRF5GY3dkGFhcRCJNYuPgOM8hiCYELHBIblu1ig2hwkZh5eAOULQz0
        9BZ2CFtK4mV/G5RdLLF01icmiOYGRonL235BNRhLzHrWzggKDGYBTYn1u/Qh4aIsceQW1G18
        Eh2H/7JDhHklOtqgYa0ucWD7dBYIW1aie85n1gmMSrOQfDYLyWezkHwzC2HXAkaWVYxiqQXF
        uempxUYFhvDYTs7P3cQITsharjsYJ7/9oHeIkYmD8RCjBAezkgjvqkkHk4R4UxIrq1KL8uOL
        SnNSiw8xmgLDeiKzlGhyPjAn5JXEG5pYGpiYmRmaG5kamCuJ83qlbEgUEkhPLEnNTk0tSC2C
        6WPi4JRqYCr+8aUyMON4ruLj6aG1OksYvkz8FJ6vMct85/IZu1SbuhiZv/6RYupLyOk1e3c+
        dp75XTvlFrY7PIkPp++Of/A+5f2enYcTFRh847eqfzhjayjI4xRV8/y37VPNwP86myv+njJe
        d6qL89vjBPYTFenZ26PXJ2yV5Wielf3oRrREwy0b+SevwxlXND/uPCW0Qq//JWP4CumF25ou
        1BtnNK9pYqzVOOXutGGno7LMQS39ffei5eqkLi89L3Luza6gX417l7D/59l+y3pp2OwchYmx
        z0PK074KGdnXrBJg32j7yOrOXyG92uL0C43iy3W9TVzLZTUNxW73ZTdf8prJKFbCuMOVbXFU
        QXvkq6AeJZbijERDLeai4kQAQSQv1FEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSvG7/9ENJBnuvWVk8mLeNzeL6l+es
        FvOPnGO16HvxkNli7+ut7BabHl9jtfjYc4/VYsb5fUwWF0+5WrTuPcJucfhNO6vFv2sbWSxW
        7frD6MDr8f5GK7vHzll32T02repk87hzbQ+bx+Yl9R59W1YxenzeJBfAHsVlk5Kak1mWWqRv
        l8CV8W7TMaaCe6IVH99cZm5g/CnYxcjBISFgItH6u7SLkYtDSGA3o0TTzEnsXYycQHFZiWfv
        dkDZwhL3W46wQhQ9Y5T4OnkJC0iCTUBf4mXHNrCEiEA7s8SllodMIA6zwF5GiSkHFkO1XGaS
        aFjZDjaLU8BOYv6H/8wgtrBAvMSV14/B4iwCKhLzLs8Ai/MKWEp0HOhlh7AFJU7OfAK2jllA
        W6L3YSsjjL1s4WtmiPsUJH4+XcYKEReRmN3ZBhYXEQiTWLj4DvMERuFZSEbNQjJqFpJRs5C0
        L2BkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyfWpo7GLev+qB3iJGJg/EQowQH
        s5II76pJB5OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRq
        YOosnuWqf6Lj8pSUnuAzbiuypi7ZdFNg4p9Pjwz2sVtuW8Taw56/h68x+nTCJW4PNf6Psw9M
        X1anJaKs82tFfOv3Az7Ptt57ut3HLl/Pvk/5YqyYyfR/Gh939TaannzNXX74QtMVF7vn/w/H
        t54Ut2J9+vqjSRyD1Rl1Phlfpoc61Vx/pPSEN4YsTed/eTLroA7v/YJes5MuPi45031Nsvfm
        q3gU37KWcpl98PuBU1IlK18mz3jLM/X8b9n1ybaB67/OO396qWf/9kdLt+53mX2sbV/mnmtx
        Vo1z9//3F5P9MGUz8+THWfX2F0I1/ByaFJVmJ0hnVmwI8/m/SvDjJ6sHG78cVJ6oyhVzszsj
        PluJpTgj0VCLuag4EQCxNCXpPgMAAA==
X-CMS-MailID: 20220704073232epcas2p302f4cdc6e57c2d7a523ccb9cd446b688
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p39750fb5876366881b8535ee516c1bebe
References: <20220627005210.6473-1-chanho61.park@samsung.com>
        <CGME20220627005413epcas2p39750fb5876366881b8535ee516c1bebe@epcas2p3.samsung.com>
        <20220627005210.6473-2-chanho61.park@samsung.com>
        <0e9aab63-7ddf-dead-11b2-4ba81235dcb4@linaro.org>
        <001901d88a94$e87208d0$b9561a70$@samsung.com>
        <354b2ae2-92b4-bb56-387a-599f0451a1c0@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: =5BPATCH 1/3=5D dt-bindings: clock: exynosautov9: correct cl=
ock
> numbering of peric0/c1
>=20
> On 28/06/2022 04:15, Chanho Park wrote:
> >> Subject: Re: =5BPATCH 1/3=5D dt-bindings: clock: exynosautov9: correct
> >> clock numbering of peric0/c1
> >>
> >> On 27/06/2022 02:52, Chanho Park wrote:
> >>> There are duplicated definitions of peric0 and peric1 cmu blocks.
> >>> Thus, they should be defined correctly as numerical order.
> >>>
> >>> Fixes: 680e1c8370a2 (=22dt-bindings: clock: add clock binding
> >>> definitions for Exynos Auto v9=22)
> >>> Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> >>> ---
> >>>  .../dt-bindings/clock/samsung,exynosautov9.h  =7C 56
> >>> +++++++++----------
> >>>  1 file changed, 28 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h
> >>> b/include/dt-bindings/clock/samsung,exynosautov9.h
> >>> index ea9f91b4eb1a..a7db6516593f 100644
> >>> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> >>> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> >>> =40=40 -226,21 +226,21 =40=40
> >>>  =23define CLK_GOUT_PERIC0_IPCLK_8		28
> >>>  =23define CLK_GOUT_PERIC0_IPCLK_9		29
> >>>  =23define CLK_GOUT_PERIC0_IPCLK_10	30
> >>> -=23define CLK_GOUT_PERIC0_IPCLK_11	30
> >>> -=23define CLK_GOUT_PERIC0_PCLK_0		31
> >>> -=23define CLK_GOUT_PERIC0_PCLK_1		32
> >>> -=23define CLK_GOUT_PERIC0_PCLK_2		33
> >>> -=23define CLK_GOUT_PERIC0_PCLK_3		34
> >>> -=23define CLK_GOUT_PERIC0_PCLK_4		35
> >>> -=23define CLK_GOUT_PERIC0_PCLK_5		36
> >>> -=23define CLK_GOUT_PERIC0_PCLK_6		37
> >>> -=23define CLK_GOUT_PERIC0_PCLK_7		38
> >>> -=23define CLK_GOUT_PERIC0_PCLK_8		39
> >>> -=23define CLK_GOUT_PERIC0_PCLK_9		40
> >>> -=23define CLK_GOUT_PERIC0_PCLK_10		41
> >>> -=23define CLK_GOUT_PERIC0_PCLK_11		42
> >>> +=23define CLK_GOUT_PERIC0_IPCLK_11	31
> >>> +=23define CLK_GOUT_PERIC0_PCLK_0		32
> >>> +=23define CLK_GOUT_PERIC0_PCLK_1		33
> >>
> >> Is this a fix for current cycle? If yes, it's ok, otherwise all other
> >> IDs should not be changed, because it's part of ABI.
> >
> > What is the current cycle? 5.19-rc or 5.20?
> > I prefer this goes on 5.19-rc but if it's not possible due to the ABI
> breakage, I'm okay this can be going to v5.20.
>=20
> The change was introduced indeed in v5.19-rc1, so this should go to
> current cycle as well (v5.19) and your patch is fine.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>=20
> Sylwester or Stephen,
>=20
> Please kindly grab it for fixes.

Hi Sylwester or Stephen,

Gently ping to not miss this in v5.19 rc cycle.
Below patch as well.

https://lore.kernel.org/linux-clk/7415fba0-ac04-e764-aa46-2c63b8568ac3=40gm=
ail.com/

Thanks.

Best Regards,
Chanho Park

