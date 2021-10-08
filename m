Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC72DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 00:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA5EA6105A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 00:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJHAzJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 20:55:09 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:64303 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhJHAzE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 20:55:04 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211008005308epoutp0153d3453eed666aba694d27c91491fdde~r6ALU2Sx40674906749epoutp010
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 00:53:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211008005308epoutp0153d3453eed666aba694d27c91491fdde~r6ALU2Sx40674906749epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633654388;
        bh=AsJGEdeumnqRshVzXQsUarwE1bqiuJ+Bjtw0GGpreUI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=ZxLjWz7sFVkHsW/owCC1WwAeyW7QB4hUwP6TW3fJZXFCPE1+TOCiWG/zrlejMT0Ky
         8obZv4+V1KVyfau2l3/ZS2AGeQHG9SBeXzfLF9pwi6in7v87PMNl8isvLNyWSwoBXg
         JztfYkgohxT2FmlG+V9fRXhytaPCC487JpSSNqKg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211008005308epcas2p149e135462c772d765663605b9a1c4886~r6AKvLwI53031230312epcas2p1A;
        Fri,  8 Oct 2021 00:53:08 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.98]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HQV6L6QvRz4x9QJ; Fri,  8 Oct
        2021 00:52:58 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.7A.09717.9669F516; Fri,  8 Oct 2021 09:52:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211008005254epcas2p3bbceec52d2b57d48a27d7277b5a28110~r5-_WHeHf2954229542epcas2p3M;
        Fri,  8 Oct 2021 00:52:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211008005254epsmtrp2469607dfc5d81aee32abe6f8278f9c73~r5-_VYYuG0107501075epsmtrp2G;
        Fri,  8 Oct 2021 00:52:54 +0000 (GMT)
X-AuditID: b6c32a45-4c1ff700000025f5-09-615f96695b4a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.F1.09091.6669F516; Fri,  8 Oct 2021 09:52:54 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211008005254epsmtip18c1895c1eef202a6f9f0d109f343dc36~r5-_Frf290494004940epsmtip1k;
        Fri,  8 Oct 2021 00:52:54 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <67df638a-5415-0107-1b83-287f0f871817@canonical.com>
Subject: RE: [PATCH 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Date:   Fri, 8 Oct 2021 09:52:54 +0900
Message-ID: <00d301d7bbde$d4096bc0$7c1c4340$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8qcgfzGIEeaCeMM4Gv0CnAmQ4WANqV7KaAkcmW50CLuFCeqs/Y4Ng
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmhW7mtPhEgz+rWS3mHznHarHx7Q8m
        iyl/ljNZzDi/j8mide8RdovDb9pZLVbt+sPowO4xq6GXzWPnrLvsHptWdbJ53Lm2h82jb8sq
        Ro/Pm+QC2KKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTd
        MnOAblFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBka
        GBiZAhUmZGc8fvCeveCjbMXk1sIGxnPiXYycHBICJhLbP39l6WLk4hAS2MEo0XahmxXC+cQo
        sfjOamYI5xujRMvVX8wwLVtutTOC2EICexkl7nyC6njBKPHqwQEWkASbgL7Ey45tYAkRgamM
        EtMutbGDOMwCixklHp9aDVbFKeAosX/BejYQW1ggTuLI1rVgNouAisS1VbPZQWxeAUuJRf+n
        MkPYghInZz4B62UW0JZYtvA11EkKEj+fLmMFsUUE3CSa96xihqgRkZjd2QZVM5dDYssiBQjb
        ReLGl4nsELawxKvjW6BsKYnP7/aygRwqIdDNKNH66D9UYjWjRGejD4RtL/Fr+hagZRxACzQl
        1u/SBzElBJQljtyCOo1PouPwX3aIMK9ER5sQRKO6xIHt01kgbFmJ7jmfWScwKs1C8tgsJI/N
        QvLALIRdCxhZVjGKpRYU56anFhsVGMIjOzk/dxMjOJlque5gnPz2g94hRiYOxkOMEhzMSiK8
        +faxiUK8KYmVValF+fFFpTmpxYcYTYFBPZFZSjQ5H5jO80riDU0sDUzMzAzNjUwNzJXEeef+
        c0oUEkhPLEnNTk0tSC2C6WPi4JRqYMpktAy10jrqWGVuc9mwMPbb0Yn3E+T/Vv7Kl76cfXn1
        2oTzMcwvlz18ubLDbsOEu4sFkypCzf7aC4Uu797yT+hb37k1Z89/kmd0L5iXHK4jcLvt9T0t
        /scX7/IJZUdub/VdKLFYc+671ekTHmofSDu3XUP4QKEi99y26y0889IKY2x6UizPMu3Uf+6i
        8rt8t8ZN9sTfqcLtecLn2erEQm/uiOqN6T7e92jhrIRvqaaMv+xObjf2qf97cWIdR9+Fpe9t
        vkx7c4xPxvulxc/y9+L53esO+c74ly/2PYJ7/XKVPn7Vs69Oz/vVuJZ785WnaYeyTNOdts8U
        FpdbdGb/dTel80dyGRfZd+eL25yos1ViKc5INNRiLipOBABCjjzBLwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJTjdtWnyiwdm9ahbzj5xjtdj49geT
        xZQ/y5ksZpzfx2TRuvcIu8XhN+2sFqt2/WF0YPeY1dDL5rFz1l12j02rOtk87lzbw+bRt2UV
        o8fnTXIBbFFcNimpOZllqUX6dglcGd/+97IUTJateL1nBVsD4xuxLkZODgkBE4ktt9oZuxi5
        OIQEdjNKLG9/xgaRkJV49m4HO4QtLHG/5QgriC0k8IxRoulqIIjNJqAv8bJjGytIs4jAdEaJ
        T3c2gE1iFljKKPHr9C4miLE/GCVONp4Da+cUcJTYv2A92AphgRiJSxO7wGwWARWJa6tmg63j
        FbCUWPR/KjOELShxcuYTFhCbWUBbovdhKyOMvWzha2aI8xQkfj5dBjZfRMBNonnPKmaIGhGJ
        2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZG
        cHRpae5g3L7qg94hRiYOxkOMEhzMSiK8+faxiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3Sd
        jBcSSE8sSc1OTS1ILYLJMnFwSjUwbT7eEpildvTSh5f9cRoZ09h9XD/kH37JKGPYqHb30s02
        28anLUZvnuh/l/SZIvJza+Wqfwb3P7ZF7/r26HxhY9bZbhbeyetrvlR9C/ixK8Z4Pqv3ASOD
        g7KfZi6apOGkES62jHHd8rpDRSWOMfvNJn+V8rNqCWAMduK9dO7Dpaw/FxRS0y58EtGoiTAQ
        Z/Can6HnoPVkmd36VwtbA26e8Uo/UmN8Pu9ZfGjNOeZczZ/2lu579v5k3RFlOVNe49STV89V
        ujY9WTjX7K2g/+0+8WsLLtgcfBJjPFNM8jXnfsaPK+e81pour/ujY6HWHOU3l9W3O/j8UPu9
        6Ob5HfZzLxzV/X230KjxDm+Oku+HCiWW4oxEQy3mouJEAMjJvQsdAwAA
X-CMS-MailID: 20211008005254epcas2p3bbceec52d2b57d48a27d7277b5a28110
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41
References: <20211007120855.56555-1-chanho61.park@samsung.com>
        <CGME20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41@epcas2p3.samsung.com>
        <20211007120855.56555-4-chanho61.park@samsung.com>
        <67df638a-5415-0107-1b83-287f0f871817@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: Friday, October 8, 2021 3:31 AM
> To: Chanho Park <chanho61.park=40samsung.com>; Rob Herring
> <robh+dt=40kernel.org>; Linus Walleij <linus.walleij=40linaro.org>
> Cc: Tomasz Figa <tomasz.figa=40gmail.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; linux-samsung-soc=40vger.kernel.org;
> devicetree=40vger.kernel.org
> Subject: Re: =5BPATCH 3/3=5D arm64: dts: exynos: add minimal support for
> exynosautov9 sadk board
>=20
> On 07/10/2021 14:08, Chanho Park wrote:
> > SADK(Samsung Automotive Development Kit) is the development kit to
> > evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two 256GB
> > Samsung UFS. This patch enables only serial console and ufs0 device.
> >
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../bindings/arm/samsung/samsung-boards.yaml  =7C  6 +++
> >  .../boot/dts/exynos/exynosautov9-sadk.dts     =7C 52 +++++++++++++++++=
++
>=20
> You need also Makefile entry.

I missed this because I'm building the dtb with the command line parameter.=
 I'll add this.

>=20
> >  2 files changed, 58 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> >
> > diff --git
> > a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > index 0796f0c87727..2147e664d5bc 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yam
> > +++ l
> > =40=40 -199,6 +199,12 =40=40 properties:
> >                - samsung,exynos7-espresso        =23 Samsung Exynos7 Es=
presso
> >            - const: samsung,exynos7
> >
> > +      - description: Exynos Auto v9 based boards
> > +        items:
> > +          - enum:
> > +              - samsung,samsung,exynosautov9-sadk   =23 Samsung Exynos=
 Auto
> v9 SADK
>=20
> Double samsung.

Typo. I'll remove it.

>=20
> > +          - const: samsung,exynosautov9
> > +
> >  required:
> >    - compatible
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > new file mode 100644
> > index 000000000000..e59ef39a368f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> > =40=40 -0,0 +1,52 =40=40
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung ExynosAutov9 SADK board device tree source
>=20
> Any Copyrights? Not needed, just mentioning...

Will add it.

>=20
> > + */
> > +
> > +/dts-v1/;
> > +=23include =22exynosautov9.dtsi=22
>=20
> Include gpio.h here, because it is used. Probably you can also remove it
> from dtsi - I did not see it being used in there.

Okay. I'll move the inclusion from soc dtsi.

>=20
> > +
> > +/ =7B
> > +	model =3D =22Samsung ExynosAutov9 SADK board=22;
> > +	compatible =3D =22samsung,exynosautov9-sadk=22, =22samsung,exynosauto=
v9=22;
> > +
> > +	=23address-cells =3D <2>;
> > +	=23size-cells =3D <2>;
> > +
> > +	aliases =7B
> > +		serial0 =3D &serial_0;
> > +	=7D;
> > +
> > +	chosen =7B
> > +		stdout-path =3D &serial_0;
> > +	=7D;
> > +
> > +	memory=4080000000 =7B
> > +		device_type =3D =22memory=22;
> > +		reg =3D <0x0 0x80000000 0x0 0x77000000>,
> > +		      <0x8 0x80000000 0x1 0x7ba00000>,
> > +		      <0xa 0x00000000 0x2 0x00000000>;
> > +	=7D;
> > +
> > +	ufs_0_fixed_vcc: fixedregulator=400 =7B
>=20
> Node name: =22regulator=22 or =22regulator-0=22 if you think you will hav=
e more of
> them.

I need one more gpio regulator for ufs_1. So, I'll use regulator-0 for this=
.

Best Regards,
Chanho Park

