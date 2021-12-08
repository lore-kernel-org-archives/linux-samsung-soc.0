Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71DCC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 09:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhLHJX7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Dec 2021 04:23:59 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:32923 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhLHJX7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 04:23:59 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211208092026epoutp035ce731653120948ca017416b52402ec8~_vRhEseLK2631626316epoutp030
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 09:20:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211208092026epoutp035ce731653120948ca017416b52402ec8~_vRhEseLK2631626316epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1638955226;
        bh=RJwmvzdgB8yWSNEg1Y4Z5YLn0JaUC0CUjYvSglm1hmc=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=EIRh0KzvLg35NSOWqBTjbQyl876q6QjttOFufrR5ouvDqbgOiPZHLW4UYkeaoRzQv
         Y0G9GjEwsysx/9KHjpi44tQx1VUX71EdnWuyAN/2NKJ5+XcetcE/2xIlSvVbcyinTi
         VtNOvCnO64Ey/RiVLNfbtBpGcDWJkg0apm7sEKAA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211208092025epcas2p42c641f20f51b89e08a2413f9f21e6e7c~_vRgp8j-I2288722887epcas2p4A;
        Wed,  8 Dec 2021 09:20:25 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4J8BTf0z8Xz4x9Q9; Wed,  8 Dec
        2021 09:20:22 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.CB.10014.2D870B16; Wed,  8 Dec 2021 18:20:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211208092018epcas2p40f00b930cb277d753a3677693a8ac63a~_vRaA7NB22288722887epcas2p4q;
        Wed,  8 Dec 2021 09:20:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211208092018epsmtrp1fdc9be4ec9ff45300de6f3e36a88c919~_vRaAHQ5g1672716727epsmtrp1s;
        Wed,  8 Dec 2021 09:20:18 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-92-61b078d2a8cd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.C1.29871.2D870B16; Wed,  8 Dec 2021 18:20:18 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211208092018epsmtip2f6a90e96d6cb573113ab740ef2a2c25a~_vRZ29oix1232512325epsmtip2F;
        Wed,  8 Dec 2021 09:20:18 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>
In-Reply-To: <efa3f4ec-399c-3d86-eeb1-3c32c1b22f02@canonical.com>
Subject: RE: [PATCH] arm64: dts: exynosautov9: convert serial_0 for USI
Date:   Wed, 8 Dec 2021 18:20:18 +0900
Message-ID: <02b401d7ec14$d15b1f70$74115e50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGwlohmSPypWw3NCz9fIR383689YAK4pHokAcQYrVGsUxWoAA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmue7lig2JBuc/M1nMP3KO1WLj2x9M
        FpseX2O1mHF+H5NF694j7BbP+/YxObB5zGroZfPYtKqTzePOtT1sHpuX1Ht83iQXwBqVbZOR
        mpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdICSQlliTilQ
        KCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj8bS/
        7AU7+SuuHDrC2sD4jaeLkZNDQsBEouffeuYuRi4OIYEdjBJTu2azQjifGCWW9L9ignC+MUq8
        eNvCDNPy7v83NojEXkaJ7Q/vMEI4LxglLl6cyghSxSagL/GyYxsriC0ikC7xsOEUC0gRs8BC
        Rok5W6+xgCQ4BRwlui69AbOFBdwlVu3YxAZiswioSLy8/BhsEK+ApcT+qSfZIGxBiZMzn4DV
        MwtoSyxb+BrqJAWJn0+XQS1zkljR+58NokZEYnZnG9h3EgKdHBJHbm9jhGhwkbh3/jEThC0s
        8er4FnYIW0riZX8bO0RDN6NE66P/UInVjBKdjT4Qtr3Er+lbgLZxAG3QlFi/Sx/ElBBQljhy
        C+o2PomOw3/ZIcK8Eh1tQhCN6hIHtk9ngbBlJbrnfGadwKg0C8lns5B8NgvJB7MQdi1gZFnF
        KJZaUJybnlpsVGAMj+7k/NxNjODUqeW+g3HG2w96hxiZOBgPMUpwMCuJ8Ko9XJsoxJuSWFmV
        WpQfX1Sak1p8iNEUGNYTmaVEk/OByTuvJN7QxNLAxMzM0NzI1MBcSZzXK2VDopBAemJJanZq
        akFqEUwfEwenVAOTwS0T/tjmkkYB5i9tu3/87wvS2b1iZvKjgnV5+34LfQwK2xeWf6VUJNlH
        t5gro/+j2/eF+U+cHoXfu6QYnl2i+jcxzD1T/PvdX2G+ZQ8NtZe0GPMsVBTc9Gm5uURv8CFl
        uxtiO7895NPpj38pdTPaIGFOBpPa5LeVzrfWiR64P/F5tan6asn4mDLOmyaXmNRnqTL5p684
        JxcolXTxztoXc/e/nXdhv7v6HGedULXCc+ZHeSXL3Dauy53va/pi3u9XRyN8jGxemWyP5NzW
        84NLPFh4txg3E9cBZ5/ZHwMabIWbTKNFbyS+d1OOWHXSJoC9toHvVMyykssrPrT3/jylOjk/
        Ybv1osl374cm8ymxFGckGmoxFxUnAgBqtpxjJgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSvO6lig2JBl9ua1vMP3KO1WLj2x9M
        FpseX2O1mHF+H5NF694j7BbP+/YxObB5zGroZfPYtKqTzePOtT1sHpuX1Ht83iQXwBrFZZOS
        mpNZllqkb5fAlXF3Sk5BC3/F5O6dzA2Mu3m6GDk5JARMJN79/8bWxcjFISSwm1Gi68YzRoiE
        rMSzdzvYIWxhifstR1ghip4xStxceB2siE1AX+JlxzagBAeHiEC6xKff9SA1zAKLGSWWr2uH
        ajjGKHF89lWwSZwCjhJdl96wgNjCAu4Sq3ZsYgOxWQRUJF5efgw2lFfAUmL/1JNsELagxMmZ
        T8DqmQW0JZ7efApnL1v4mhniOgWJn0+XsYLYIgJOEit6/7NB1IhIzO5sY57AKDwLyahZSEbN
        QjJqFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNIS3MH4/ZVH/QOMTJx
        MB5ilOBgVhLhVXu4NlGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUw
        WSYOTqkGpoqdp7Qm8DD7GlWebjjvs5+tw2j1tHhpVj3uIJv9huqmDy+o3J9wqWnz/f1J/kwd
        7tOW7o21nvpw4zYn/fyY7fLzrsZeKn0a6xIozjLtvrVszr/W3vrI8Ke3z5+fufDrRH0Zebvv
        jtxJC1zMD+6O1WhMX/FSJrzt6D21NdkLZG7/O3tnYe0ftd7sLR8qWL+F1XKxmi226fv54ZDV
        WzPWyDqblz83/WdhvLjkdcj9PYf5DDf+ZRSOKJ9VyvIo4EbAohTVXUcizzuwiXPHrrA99OY0
        27yAt02sc6VU7res+Kll2l1SZ/Az/HeEtV2lDd+XUt6Yew6ML6OOKC4/UKr8y+7yVg7XuHuu
        fFdvKe6VVWIpzkg01GIuKk4EALmG6q4QAwAA
X-CMS-MailID: 20211208092018epcas2p40f00b930cb277d753a3677693a8ac63a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d
References: <CGME20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d@epcas2p1.samsung.com>
        <20211208003946.139423-1-chanho61.park@samsung.com>
        <efa3f4ec-399c-3d86-eeb1-3c32c1b22f02@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: Wednesday, December 8, 2021 6:15 PM
> To: Chanho Park <chanho61.park=40samsung.com>; Rob Herring
> <robh+dt=40kernel.org>
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> linux-samsung-soc=40vger.kernel.org; Sam Protsenko
> <semen.protsenko=40linaro.org>
> Subject: Re: =5BPATCH=5D arm64: dts: exynosautov9: convert serial_0 for U=
SI
>=20
> On 08/12/2021 01:39, Chanho Park wrote:
> > According to USI v2 driver change=5B1=5D, serial_0 node should be
> > converted to use the USI node hierarchy. syscon_peric0 will be used as
> > a syscon node to control the USI00_USI_SW_CONF register.
> > This also changes the serial node name from uart=40 to serial=40.
> >
> > =5B1=5D:
> > https://lore.kernel.org/linux-samsung-soc/20211204195757.8600-2-semen.
> > protsenko=40linaro.org/
> >
> > Cc: Sam Protsenko <semen.protsenko=40linaro.org>
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov9-sadk.dts     =7C  4 +++
> >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  =7C 36
> > ++++++++++++++-----
> >  2 files changed, 32 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > index ef46d7aa6e28..6cc903443809 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > =40=40 -41,6 +41,10 =40=40 ufs_0_fixed_vcc_reg: regulator-0 =7B
> >  	=7D;
> >  =7D;
> >
> > +&usi_0 =7B
> > +	status =3D =22okay=22;
> > +=7D;
> > +
>=20
> Put this one alphabetically in DTS.

Regarding usi / serial/hsi2c/spi nodes, I thought it looks better to keep t=
he order of DTSi.
Anyway, I'll follow alphabetical order in DTS. I'll apply this next patch.

Best Regards,
Chanho Park

