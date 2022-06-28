Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D08C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 02:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242953AbiF1CPW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 22:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240199AbiF1CPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 22:15:21 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231AA23163
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 19:15:20 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220628021518epoutp01b76f5670a9d64998ee3f144e04a2dda6~8px-1TGU_2563125631epoutp01L
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 02:15:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220628021518epoutp01b76f5670a9d64998ee3f144e04a2dda6~8px-1TGU_2563125631epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656382518;
        bh=r0+65kei0lfUBvAYeKwnvSuCHrgIcrMa0noQrtWtUjw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=i8PGlfn+ZirdsWhjqFRICwKmgqQx8dswD1sadAP2BYWknnUFEF7FNM+KwUmyRSHgk
         zkPBraul37QkxXut6YLCNZQs4yOUcJKKfbjYR9roJ/jSZwsxDSaOeJQXmMpSxzA9nn
         Z/EhIuX8nClBOse/R+fyNZY3BLvSiHgbuMql7FlU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220628021517epcas2p3ce3731300fe4b0cd7e10fec6db27d2b5~8px-Mo73w0111301113epcas2p3r;
        Tue, 28 Jun 2022 02:15:17 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LX7Tx4b4Xz4x9Q1; Tue, 28 Jun
        2022 02:15:17 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.48.09662.5346AB26; Tue, 28 Jun 2022 11:15:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220628021517epcas2p44cffa1635e8fac5e2e0c79d5e3459dd8~8px_UcBFt3164631646epcas2p4L;
        Tue, 28 Jun 2022 02:15:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220628021516epsmtrp1c7ad43ed914cb5d0fbd5ad7405d2f52c~8px_KnCXO3080730807epsmtrp1b;
        Tue, 28 Jun 2022 02:15:16 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-2b-62ba64355ef5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BC.A0.08905.4346AB26; Tue, 28 Jun 2022 11:15:16 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220628021516epsmtip25d52296df50e367d1d40deecb5710d86~8px97zGZR2019720197epsmtip2O;
        Tue, 28 Jun 2022 02:15:16 +0000 (GMT)
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
In-Reply-To: <0e9aab63-7ddf-dead-11b2-4ba81235dcb4@linaro.org>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Date:   Tue, 28 Jun 2022 11:15:16 +0900
Message-ID: <001901d88a94$e87208d0$b9561a70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKRjrizqP7u4/W7V2kR1MW1BABg2wHSOOUnAVQrdxABdgizgavNJ6Hw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmua5pyq4kg1VHFC0ezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdotNj6+xWnzsucdqMeP8PiaLi6dcLVr3HmG3OPymndXi37WNLBar
        dv1hdOD1eH+jld1j56y77B6bVnWyedy5tofNY/OSeo++LasYPT5vkgtgj8q2yUhNTEktUkjN
        S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6VkmhLDGnFCgUkFhcrKRv
        Z1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnfH8zAnGgu0CFT/7
        XrA0MF7h7WLk5JAQMJFomHOWqYuRi0NIYAejxM0rLxkhnE+MEleWP2aGcL4xSkx//JEJpqVj
        /Q5WiMReRom1J7+xgiSEBF4wSsy9YwJiswnoS7zs2AZWJCLQzCyxd8dusLnMAjsZJS6tWMIO
        UsUpYCfxe8trFhBbWCBR4tPuBUBFHBwsAqoSG3utQcK8ApYSSy9tYYOwBSVOznwCVs4soC2x
        bOFrZoiLFCR+Pl0GdoSIgJvEjq6rTBA1IhKzO9vAXpAQOMMhMe/DMnaIBheJh3dvQ9nCEq+O
        b4GypSRe9rdB2cUSS2d9YoJobmCUuLztFxtEwlhi1rN2sEOZBTQl1u/SBzElBJQljtyCuo1P
        ouPwX3aIMK9ER5sQRKO6xIHt01kgbFmJ7jmfWScwKs1C8tksJJ/NQvLBLIRdCxhZVjGKpRYU
        56anFhsVmMBjOzk/dxMjOCFreexgnP32g94hRiYOxkOMEhzMSiK8C8/sTBLiTUmsrEotyo8v
        Ks1JLT7EaAoM6onMUqLJ+cCckFcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUI
        po+Jg1OqgWmH47+//FGxv0JCqzS33Ncq6Nz71W6veh/f5BjNJ2JbTk35YyV+6bRA7Suvlx4X
        5O7mKHjbHPT7uq758BnGlE8bf3FYsC96H6HOq+R15p9wTcEhYa71lcpncouCcnrbVJefvf6B
        9+ekIs5Px04mNDNlW3cmtFzV0krYpHWlYm/O3x3OhXm/9xkaLpztGOhaNs+AwaZsTrt5s4Nk
        VIPrCs/CTcwfN51b4iwaw/6zjMlZgH/z9xVZnp47p4Z/+Mp3tEPWsqdjxQs1+brzrT1vnlen
        XSxWucV4q+5H9RXhzDf3b3Gq820oWTG7IP1vXfW5y3lesS3Fk2bM/unwNPLAxP9TFvfrekct
        0TU3/amoo8RSnJFoqMVcVJwIAJSqMk5RBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsWy7bCSvK5Jyq4kg31H9CwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdotNj6+xWnzsucdqMeP8PiaLi6dcLVr3HmG3OPymndXi37WNLBar
        dv1hdOD1eH+jld1j56y77B6bVnWyedy5tofNY/OSeo++LasYPT5vkgtgj+KySUnNySxLLdK3
        S+DK+DjhB1NBg0DFoy0bmBsYZ/N2MXJySAiYSHSs38HaxcjFISSwm1Hib/thNoiErMSzdzvY
        IWxhifstR6CKnjFK7F+1gxEkwSagL/GyYxsriC0i0M4sceYmO0gRs8BeRokpBxZDdXxmlLix
        dgVYB6eAncTvLa9ZQGxhgXiJK68fA3VwcLAIqEps7LUGCfMKWEosvbSFDcIWlDg58wlYObOA
        tkTvw1ZGGHvZwtfMENcpSPx8ugzqCDeJHV1XmSBqRCRmd7YxT2AUnoVk1Cwko2YhGTULScsC
        RpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjB0amluYNx+6oPeocYmTgYDzFKcDAr
        ifAuPLMzSYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQYm
        oYh3F84F/Is2NeCSS3Xlerjvs+im1R1x+czVstybjWdZGmVOZpJZt5SZaVHZAxmjq4lFve4F
        rzlmzl7ypHKillKF+EHfjLqtsZOY9x/9HVrwZ06qps2H7mmZsxbOOf1uXtT7RQq8ZmJ3QhvX
        xScH8F5gXHhVq+B915q0XofmjzssTbf+ynhrfFo/5Q3XRI6eWYJfVzabx25q82y/P3sVw6sJ
        Wtv3L/jo2iU0e/eFM+ye65e9WDElx+hd1L5TC7ls//dvklYoa2o+d87F9V+g17PeRdcPfDl5
        TvqF15yaepZUsZ7UalfOpgi2UBmjCi0VFf1+rePvj6k+7Ni0MuGb7twg1X3qrZvtjv57Wlyh
        xFKckWioxVxUnAgAsgJMPz0DAAA=
X-CMS-MailID: 20220628021517epcas2p44cffa1635e8fac5e2e0c79d5e3459dd8
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: =5BPATCH 1/3=5D dt-bindings: clock: exynosautov9: correct cl=
ock
> numbering of peric0/c1
>=20
> On 27/06/2022 02:52, Chanho Park wrote:
> > There are duplicated definitions of peric0 and peric1 cmu blocks.
> > Thus, they should be defined correctly as numerical order.
> >
> > Fixes: 680e1c8370a2 (=22dt-bindings: clock: add clock binding
> > definitions for Exynos Auto v9=22)
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../dt-bindings/clock/samsung,exynosautov9.h  =7C 56
> > +++++++++----------
> >  1 file changed, 28 insertions(+), 28 deletions(-)
> >
> > diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h
> > b/include/dt-bindings/clock/samsung,exynosautov9.h
> > index ea9f91b4eb1a..a7db6516593f 100644
> > --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> > +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> > =40=40 -226,21 +226,21 =40=40
> >  =23define CLK_GOUT_PERIC0_IPCLK_8		28
> >  =23define CLK_GOUT_PERIC0_IPCLK_9		29
> >  =23define CLK_GOUT_PERIC0_IPCLK_10	30
> > -=23define CLK_GOUT_PERIC0_IPCLK_11	30
> > -=23define CLK_GOUT_PERIC0_PCLK_0		31
> > -=23define CLK_GOUT_PERIC0_PCLK_1		32
> > -=23define CLK_GOUT_PERIC0_PCLK_2		33
> > -=23define CLK_GOUT_PERIC0_PCLK_3		34
> > -=23define CLK_GOUT_PERIC0_PCLK_4		35
> > -=23define CLK_GOUT_PERIC0_PCLK_5		36
> > -=23define CLK_GOUT_PERIC0_PCLK_6		37
> > -=23define CLK_GOUT_PERIC0_PCLK_7		38
> > -=23define CLK_GOUT_PERIC0_PCLK_8		39
> > -=23define CLK_GOUT_PERIC0_PCLK_9		40
> > -=23define CLK_GOUT_PERIC0_PCLK_10		41
> > -=23define CLK_GOUT_PERIC0_PCLK_11		42
> > +=23define CLK_GOUT_PERIC0_IPCLK_11	31
> > +=23define CLK_GOUT_PERIC0_PCLK_0		32
> > +=23define CLK_GOUT_PERIC0_PCLK_1		33
>=20
> Is this a fix for current cycle? If yes, it's ok, otherwise all other IDs
> should not be changed, because it's part of ABI.

What is the current cycle? 5.19-rc or 5.20?
I prefer this goes on 5.19-rc but if it's not possible due to the ABI break=
age, I'm okay this can be going to v5.20.

Best Regards,
Chanho Park

