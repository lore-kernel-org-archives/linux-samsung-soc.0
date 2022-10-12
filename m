Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AE0C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 Oct 2022 12:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJLMyv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 Oct 2022 08:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiJLMyr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 08:54:47 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7884B111
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2022 05:54:34 -0700 (PDT)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20221012125428epoutp01cecba9c485cedc69166db65c1baec87f~dU4U-2Ffm0353303533epoutp01C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2022 12:54:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20221012125428epoutp01cecba9c485cedc69166db65c1baec87f~dU4U-2Ffm0353303533epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1665579269;
        bh=TIZ+90NjmK8GlLtfIWETUWYIx+4NieEBiUUq9DU2zoA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=uNQUrl7QnKJub5DAe8EPRVWCJ3y+Nl4DfiL3yoX1wkailQK55UNPdRr5Nb5YcalQf
         zNnitoQm1ZZZuv2jRnaDRT+R4u5nASDK2ov8YyI93OkmuApcFRXjvxQPbIdUlrluMY
         2yZYM/4OdUATE/fh4undImH0SfZMind9iRAGztmI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20221012125428epcas5p20b0a7ee1be0543cbf35d7938fbd2950d~dU4UNZUxN0493404934epcas5p2K;
        Wed, 12 Oct 2022 12:54:28 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4MnXfT2qWMz4x9Pq; Wed, 12 Oct
        2022 12:54:25 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E0.2B.56352.109B6436; Wed, 12 Oct 2022 21:54:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20221012083058epcas5p4e706c2396a492ac60234ea1286467992~dRSQmku3b1855818558epcas5p46;
        Wed, 12 Oct 2022 08:30:58 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221012083058epsmtrp26b191784c535a1204b36927fc2c80bfa~dRSQlb9vB0346803468epsmtrp2n;
        Wed, 12 Oct 2022 08:30:58 +0000 (GMT)
X-AuditID: b6c32a4b-383ff7000001dc20-a1-6346b901b632
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.54.18644.24B76436; Wed, 12 Oct 2022 17:30:58 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20221012083056epsmtip1c51f7bf9bc28460843b662f8dd839e0d~dRSO7ZVKV2740327403epsmtip1K;
        Wed, 12 Oct 2022 08:30:56 +0000 (GMT)
From:   "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <alim.akhtar@samsung.com>, <chanho61.park@samsung.com>,
        <linus.walleij@linaro.org>, <pankaj.dubey@samsung.com>
Cc:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <fa7c6054-7076-299d-ed0f-9e4fc0ffc194@linaro.org>
Subject: RE: [PATCH V2] arm64: dts: fix drive strength macros as per FSD HW
 UM
Date:   Wed, 12 Oct 2022 14:00:55 +0530
Message-ID: <00d401d8de14$f40db1c0$dc291540$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJk+NbFvx0TMYgY6fQwuHFOTIN1bQKGmwhfAVNgZ0Ws02cq4A==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmpi7jTrdkg80NAhYP5m1js7i8X9ti
        /pFzrBZ9Lx4yW+x9vZXdYsqf5UwWl3fNYbOYcX4fk8WirV/YLVr3HmF34PLYtKqTzePOtT1s
        Hn1bVjF6fN4kF8ASlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk
        4hOg65aZA3SPkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafApECvODG3uDQvXS8v
        tcTK0MDAyBSoMCE749HJrawFKxUr3u8/xdbA2C/dxcjJISFgItF1ezNbFyMXh5DAbkaJH+sv
        skA4nxgl9iz6yAzhfGaUWHztCztMS9/DnVAtuxglXjXtYIVwXjBKnGncywhSxSZgLrFo71JG
        kISIwFtGiRWzZ4MlmAXSJU7Ong02ilPATuL7uWlgtrBAgMTvOeuZuhg5OFgEVCXe9aqChHkF
        LCUm7d7NCGELSpyc+YQFYoy2xLKFr5khLlKQ+Pl0GSuILSLgJLGotZcJokZc4ujPHrAXJAQW
        ckgcnLCQCaLBReJG/wWoZmGJV8e3QL0mJfH53V42CDtfYtrHZii7QqLt4waoXnuJA1fmsIDc
        ySygKbF+lz5EWFZi6ql1UHv5JHp/P4Eq55XYMQ/GVpVYv3wTI4QtLbHv+l7GCYxKs5C8NgvJ
        a7OQvDALYdsCRpZVjJKpBcW56anFpgXGeanl8BhPzs/dxAhOr1reOxgfPfigd4iRiYPxEKME
        B7OSCK9LiFuyEG9KYmVValF+fFFpTmrxIUZTYHBPZJYSTc4HJvi8knhDE0sDEzMzMxNLYzND
        JXHexTO0koUE0hNLUrNTUwtSi2D6mDg4pRqYdoUk/w7hMpD6NLs4/VFecfsX90NHV7ziyjP6
        +naLf2T//t2OUhd8Nvg4bNGY4iu86b/cJrfdwkGfvnif0VrHNO24moVw8/TdC4yYd+jHTJRt
        fZhcsOWtCNOv6VbHyy5bLUmX/vz3fGbakl8GKdMUGjatvhFyqExo6pT379+pfA38rzTFJOPD
        zxOld1LfFQnIpqrofGviMAv5y9Uk/jLLIj5qRcJ8yxk70pRFTs+UauZ875N0do7vnqZZYi3F
        dZ8WVZqqTFcVSnRQXr6EMf+deIXyOfVqtTnSF9mfOOxXTjn9ztGkPm1qhOdJtVPvpbaFhOX1
        Tzquv0ht9cev+zm9+pdWsgXOWmFtb833oypMiaU4I9FQi7moOBEAJreOuTgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTtep2i3ZYOcpVYsH87axWVzer20x
        /8g5Vou+Fw+ZLfa+3spuMeXPciaLy7vmsFnMOL+PyWLR1i/sFq17j7A7cHlsWtXJ5nHn2h42
        j74tqxg9Pm+SC2CJ4rJJSc3JLEst0rdL4MrofD6FueCKQsWl6wdYGhg3SHUxcnJICJhI9D3c
        ydbFyMUhJLCDUeJn71M2iIS0xPT+PVC2sMTKf8/ZIYqeMUocOfcbLMEmYC6xaO9SRpCEiMBn
        Rol1M5aAJZgFMiW6jx5lgeg4wCixfMd5VpAEp4CdxPdz09hBbGEBP4ndTU1ARRwcLAKqEu96
        VUHCvAKWEpN272aEsAUlTs58wgIxU1vi6c2ncPayha+ZIa5TkPj5dBnYeBEBJ4lFrb1MEDXi
        Ekd/9jBPYBSehWTULCSjZiEZNQtJywJGllWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmb
        GMExpqW1g3HPqg96hxiZOBgPMUpwMCuJ8LqEuCUL8aYkVlalFuXHF5XmpBYfYpTmYFES573Q
        dTJeSCA9sSQ1OzW1ILUIJsvEwSnVwFT04lKK7jr7Bcatf23XV5ksl9r6QMi/NOdN4OlpJ09z
        bznk1BEdOnXKfUvOrxUqqvv3Gj7fOb+XJ/LuQlmNkouTxIs0ar42/8iS5lDY9zWi6sjE8wlP
        10w8P+elm9Dq6n6mB/nT/d6f0k3a1ppQxqHGxVfsUXnazm/aJGnfAqawl/r/sh/rrJxUcCHg
        48G72fMymnsljqVNyq1gu7Je9M8S9vPiEe4aCzUnhW/5M505faGJqj9fblel/eujO24ai9av
        8/xcYxlxWOiai5khi/d3vhsxEYaxgTMeO2fuPjfpZuO3vdmFiv07VwTnLdkjppO35L268fUL
        D3ryAs9NuqAZ1fn4x6nzsy5eltfZxqHEUpyRaKjFXFScCACgwHbBIAMAAA==
X-CMS-MailID: 20221012083058epcas5p4e706c2396a492ac60234ea1286467992
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221011083029epcas5p3cef6047d23d0682a9cb70ba6178067a8
References: <CGME20221011083029epcas5p3cef6047d23d0682a9cb70ba6178067a8@epcas5p3.samsung.com>
        <20221011080359.76220-1-p.rajanbabu@samsung.com>
        <fa7c6054-7076-299d-ed0f-9e4fc0ffc194@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=5D
> Sent: 12 October 2022 02:28 AM
> To: Padmanabhan Rajanbabu <p.rajanbabu=40samsung.com>;
> robh+dt=40kernel.org; krzysztof.kozlowski+dt=40linaro.org;
> alim.akhtar=40samsung.com; chanho61.park=40samsung.com;
> linus.walleij=40linaro.org; pankaj.dubey=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> samsung-soc=40vger.kernel.org
> Subject: Re: =5BPATCH V2=5D arm64: dts: fix drive strength macros as per =
FSD HW
> UM
>=20
> On 11/10/2022 04:03, Padmanabhan Rajanbabu wrote:
> > Drive strength macros defined for FSD platform is not reflecting
> > actual name and values as per HW UM. FSD SoC pinctrl has following
> > four levels of
>=20
> s/name/names/
Okay.
>=20
> > drive-strength and their corresponding values:
> > Level-1 <-> 0
> > Level-2 <-> 1
> > Level-4 <-> 2
> > Level-6 <-> 3
> >
> > The commit 684dac402f21 (=22arm64: dts: fsd: Add initial pinctrl
> > support=22) used drive strength macros defined for Exynos4 SoC family.
> > For some IPs the macros values of Exynos4 matched and worked well, but
> > Exynos4 SoC family drive-strength (names and values) is not exactly
> > matching with FSD SoC.
> >
> > Fix the drive strength macros to reflect actual names and values given
> > in FSD HW UM. This also ensures that the existing peripherals in
> > device tree file is using correct drive strength MACROs to function as
> > expected.
> >
> > Fixes: 684dac402f21 (=22arm64: dts: fsd: Add initial pinctrl support=22=
)
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu=40samsung.com>
> > ---
>=20
> Rest of commit msg looks ok.
>=20
> >  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi =7C 34 +++++++++++---------=
--
> >  arch/arm64/boot/dts/tesla/fsd-pinctrl.h    =7C  6 ++--
> >  2 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > index d0abb9aa0e9e..e3852c946352 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > =40=40 -55,14 +55,14 =40=40
> >  		samsung,pins =3D =22gpf5-0=22;
> >  		samsung,pin-function =3D <FSD_PIN_FUNC_2>;
> >  		samsung,pin-pud =3D <FSD_PIN_PULL_NONE>;
> > -		samsung,pin-drv =3D <FSD_PIN_DRV_LV2>;
> > +		samsung,pin-drv =3D <FSD_PIN_DRV_LV4>;
> >  	=7D;
> >
> >  	ufs_refclk_out: ufs-refclk-out-pins =7B
> >  		samsung,pins =3D =22gpf5-1=22;
> >  		samsung,pin-function =3D <FSD_PIN_FUNC_2>;
> >  		samsung,pin-pud =3D <FSD_PIN_PULL_NONE>;
> > -		samsung,pin-drv =3D <FSD_PIN_DRV_LV2>;
> > +		samsung,pin-drv =3D <FSD_PIN_DRV_LV4>;
> >  	=7D;
> >  =7D;
> >
> > =40=40 -239,105 +239,105 =40=40
> >  		samsung,pins =3D =22gpb6-1=22;
> >  		samsung,pin-function =3D <FSD_PIN_FUNC_2>;
> >  		samsung,pin-pud =3D <FSD_PIN_PULL_UP>;
> > -		samsung,pin-drv =3D <FSD_PIN_DRV_LV2>;
> > +		samsung,pin-drv =3D <FSD_PIN_DRV_LV4>;
> >  	=7D;
> >
> >  	pwm1_out: pwm1-out-pins =7B
> >  		samsung,pins =3D =22gpb6-5=22;
> >  		samsung,pin-function =3D <FSD_PIN_FUNC_2>;
> >  		samsung,pin-pud =3D <FSD_PIN_PULL_UP>;
> > -		samsung,pin-drv =3D <FSD_PIN_DRV_LV2>;
> > +		samsung,pin-drv =3D <FSD_PIN_DRV_LV4>;
> >  	=7D;
> >
> >  	hs_i2c0_bus: hs-i2c0-bus-pins =7B
> >  		samsung,pins =3D =22gpb0-0=22, =22gpb0-1=22;
> >  		samsung,pin-function =3D <FSD_PIN_FUNC_2>;
> >  		samsung,pin-pud =3D <FSD_PIN_PULL_UP>;
> > -		samsung,pin-drv =3D <FSD_PIN_DRV_LV1>;
> > +		samsung,pin-drv =3D <FSD_PIN_DRV_LV4>;
>=20
> You are now changing both the value for register and the meaning (name).
> Your commit msg indicated that the names are not correct, not the values.
> Based on the commit msg, I expect the DTBs are the same. Are they? If not=
,
> it these are two different commits with their own explanations/reasoning.
In some cases, yes, both name and values requires modification. I understoo=
d=20
that I have to split this into two patches, correcting the MACRO names and =
values
in one patch and fixing the drive strength for some of the IPs in other pat=
ch.
>=20
> Best regards,
> Krzysztof


