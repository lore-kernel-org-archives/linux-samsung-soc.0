Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDE4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 23:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiEBXci (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 19:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiEBX35 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 19:29:57 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749E9E42
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 16:26:19 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502232531epoutp04d9d763c7a08fce7cdcc4d88c03db3069~rbVxkBCsX0845108451epoutp04B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 23:25:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502232531epoutp04d9d763c7a08fce7cdcc4d88c03db3069~rbVxkBCsX0845108451epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651533931;
        bh=3N2I7qmDp7lj0+tSQ1TZE7VWMESaoLp3YbZNN7qczhY=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Frvk/SxOjPm21dj7apMUT16G175DaJPqQnk/xzcqu00tP+XjTzp1cvvkc5omVhVok
         0FTM06pFsfZ8IU81cr9q2afNtQqDNsj0LW8bam9AYiGhPDbT8WLN8MXvtFOw8TKDYb
         9r4xLZFAUxRyOauAimjFlrkH6zH1l4Qpe9TdbCZM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220502232531epcas2p1c44a39cb6d5e08f4ffd5dbf5e44927d1~rbVxC5RYi0824408244epcas2p19;
        Mon,  2 May 2022 23:25:31 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KsfMp6hglz4x9QB; Mon,  2 May
        2022 23:25:26 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E2.DA.09764.66860726; Tue,  3 May 2022 08:25:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220502232525epcas2p35ddc33ebd701580408dea940d7d5402b~rbVrrDI8I2133321333epcas2p3y;
        Mon,  2 May 2022 23:25:25 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220502232525epsmtrp1e4456371fb8cbfcd8dacfcb4d0687cf3~rbVrqJerY1330013300epsmtrp1X;
        Mon,  2 May 2022 23:25:25 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-67-627068660ad7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        37.57.08924.56860726; Tue,  3 May 2022 08:25:25 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220502232525epsmtip253d3ee8c10d9bc5693ea93624b3b5fb7~rbVrZ2D3h1236612366epsmtip2v;
        Mon,  2 May 2022 23:25:25 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        <devicetree@vger.kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        <linux-clk@vger.kernel.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1651505609.463240.1161770.nullmailer@robh.at.kernel.org>
Subject: RE: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Tue, 3 May 2022 08:25:25 +0900
Message-ID: <000001d85e7b$e6d42200$b47c6600$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKWF+Vk7KC4mE3H7cmUi4B2cVMtRQINDJS1AbFzEhMB/+acK6ti008Q
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmqW5aRkGSwbydbBYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i/97drBbHH7Tzmrx79pGFovn
        fUDJVbv+MDrweby/0crusXPWXXaPTas62TzuXNvD5tG3ZRWjx+dNcgFsUdk2GamJKalFCql5
        yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUDXKimUJeaUAoUCEouLlfTt
        bIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM+Z8CSk4L1YxddZR
        tgbGf0JdjJwcEgImEq/XvGQHsYUEdjBK3JoAFOcCsj8xSjxqesMO4XxmlLjX+oQNpmN7w0Im
        iMQuRok/X36wQDgvGCW2dhxlBKliE9CXeNmxjRXEFhFQlWia9QCsiFngCItEy49rYAlOATeJ
        XXt6wZYLC4RIrNx7A2wFi4CKxNJNM8HivAKWEq3vG1khbEGJkzOfsIDYzALyEtvfzmGGOElB
        4ufTZUA1HEDL3CSOPJeEKBGRmN3ZxgyyV0LgAodE68adjBD1LhJPu29C2cISr45vYYewpSRe
        9rdB2cUSS2d9YoJobmCUuLztF9T/xhKznrUzgixjFtCUWL9LH8SUEFCWOHIL6jQ+iY7Df9kh
        wrwSHW3QoFaXOLB9OguELSvRPecz6wRGpVlIHpuF5LFZSD6YhbBrASPLKkax1ILi3PTUYqMC
        I3hcJ+fnbmIEp2Mttx2MU95+0DvEyMTBeIhRgoNZSYS3bUNOkhBvSmJlVWpRfnxRaU5q8SFG
        U2BQT2SWEk3OB2aEvJJ4QxNLAxMzM0NzI1MDcyVxXq+UDYlCAumJJanZqakFqUUwfUwcnFIN
        TEkd6mu/bMoI25Azz1dC0sqybkZkQ5bJXl7hjWnzCpbm61zsN+3ImeLk17J30dPXQn0n6yts
        lnx6zLhiM1/lFLvHvGJuWeLWQbNvvA9uE9U0b1y2n/lx2UKdN8s2Mb+z2q1Up8um+e7JTjXx
        Oce7qtJ4BXy2v93b9rhLI5n5d5TOzxLT99nsuxbVdV3o4g6etj/KVvbUxelJsQJVW/O+yq5K
        XrzcqThso9Lf0xrXVt6tTdlzmVFLuNrmlr7XxKe/7/fP0FY9+alyt8GKzTW+pVJf7M/vfHPT
        fFLPk0btYJMNvGuYr6j4CvRsKD8iV31kLdOT2hXndN/NlpvsPmXu8ybm60X+3589Ur3nes/+
        mhJLcUaioRZzUXEiAHZhjthQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvG5qRkGSwdfZshYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i/97drBbHH7Tzmrx79pGFovn
        fUDJVbv+MDrweby/0crusXPWXXaPTas62TzuXNvD5tG3ZRWjx+dNcgFsUVw2Kak5mWWpRfp2
        CVwZc76EFJwXq5g66yhbA+M/oS5GTg4JAROJ7Q0LmboYuTiEBHYwSrT1vGGFSMhKPHu3gx3C
        Fpa433KEFaLoGaPE4cMT2EASbAL6Ei87toE1iAioSjTNesACUsQscIZF4veFiUwgCSGBv4wS
        MzergticAm4Su/b0gk0VFgiSODHpODOIzSKgIrF000ywOK+ApUTr+0ZWCFtQ4uTMJ0BDOYCG
        6km0bWQECTMLyEtsfzuHGeI4BYmfT5exgpSIAI0/8lwSokREYnZnG/MERuFZSAbNQhg0C8mg
        WUg6FjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI5LLa0djHtWfdA7xMjEwXiI
        UYKDWUmEt21DTpIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwc
        nFINTJGxbFxz3ePsvWdefHOYq/Dmdq8StrW75B+nswtPkTHoXZFYydW95uW8+8vKLv1U0Eqv
        n13pt8jAXD/p18LSu3eljDQm+R2auu9mztVK4wRl1vMruW1Xas1QWluoMf/90ykbP9RMVk62
        lxH/XbHY8059UqBWkf7yqDe2S47vU7vNdF7mdELe0pP6rz88PHj08yGX2y1hXwSZNxY8ujlF
        O+NUWORFgxj5zr4pW1lOmWwyCmi+deZVh2KxhYzPVKUvH6Ij0nzbTMsmPlU4vibnXz77E6kd
        Ex1VJ9SnLO+15go9veViFFdm5rtSG88vLII/fA8fZFq0LWHjt6k62o8j+Mold4tPeGwy7XBz
        sNnvHCWW4oxEQy3mouJEANNnmkA6AwAA
X-CMS-MailID: 20220502232525epcas2p35ddc33ebd701580408dea940d7d5402b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234@epcas2p4.samsung.com>
        <20220502090230.12853-2-chanho61.park@samsung.com>
        <1651505609.463240.1161770.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, May 3, 2022 12:33 AM
> To: Chanho Park <chanho61.park@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>; Stephen Boyd <sboyd@kernel.org>;
> Sylwester Nawrocki <s.nawrocki@samsung.com>; devicetree@vger.kernel.org;
> Rob Herring <robh+dt@kernel.org>; Sam Protsenko
> <semen.protsenko@linaro.org>; linux-samsung-soc@vger.kernel.org; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; linux-clk@vger.kernel.org;
> Alim Akhtar <alim.akhtar@samsung.com>; Chanwoo Choi
> <cw00.choi@samsung.com>; Michael Turquette <mturquette@baylibre.com>;
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: Re: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
> bindings
> 
> On Mon, 02 May 2022 18:02:19 +0900, Chanho Park wrote:
> > Add dt-schema for Exynos Auto v9 SoC clock controller.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov9-clock.yaml     | 217 ++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yam
> > l
> >
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/samsung,exynosautov9-
> clock.example.dts:20:18: fatal error: dt-bindings/clock/exynosautov9.h: No
> such file or directory
>    20 |         #include <dt-bindings/clock/exynosautov9.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:364:
> Documentation/devicetree/bindings/clock/samsung,exynosautov9-
> clock.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1401: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://protect2.fireeye.com/v1/url?k=7dfbde9a-1d1943c7-7dfa55d5-
> 000babd9f1ba-7ad186e2087fa86f&q=1&e=efa8c437-0972-4987-b5b9-
> 27572ea7f351&u=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

I need to adjust the patch order. The clock binding definitions patch should
be prior than others.
I'll apply this adjustment next patchset.

dt-bindings: clock: add clock binding definitions for Exynos Auto v9
dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings

Best Regards,
Chanho Park

