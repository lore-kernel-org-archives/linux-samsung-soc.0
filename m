Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE5DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 00:16:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10F5C6109F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 00:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhJHASV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 20:18:21 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:16102 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241721AbhJHASV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 20:18:21 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211008001624epoutp03db4e28d95e277c3758fd0bf210903f3c~r5gG1HXm52330423304epoutp03d
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 00:16:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211008001624epoutp03db4e28d95e277c3758fd0bf210903f3c~r5gG1HXm52330423304epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633652184;
        bh=vC3s2pAYtonsTl4IDwDyBSlBlpH56NOePBxKa974NQU=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Rd6dviK4ooofAVW1jtaQTr7Sokxx0U2ZI2Pxn5/abCWOu7Vl8NEFZH6G6Fts2+qJs
         ydkaCl33/tZme8W+8ov904ZeaC4jIPPiTv6iLOq/AFrJlvf6s+R+C1jz7hciU6ziLv
         1ab7+lcZlfGQSBHNEhbNgZaSQEj2Mkdo9DXvyUDM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211008001624epcas2p2059152aba66b17de3fa809ca57c86318~r5gGXcTYK0235002350epcas2p2I;
        Fri,  8 Oct 2021 00:16:24 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HQTJ21hvvz4x9Qn; Fri,  8 Oct
        2021 00:16:18 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.CD.09816.ECD8F516; Fri,  8 Oct 2021 09:16:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211008001613epcas2p3ffd305d8b716d6933b4135ce760594bd~r5f8oy9Mq2339823398epcas2p3x;
        Fri,  8 Oct 2021 00:16:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211008001613epsmtrp12e08fafb39e225bdbdcf3a85baa6d47b~r5f8oCr3Y0614606146epsmtrp1O;
        Fri,  8 Oct 2021 00:16:13 +0000 (GMT)
X-AuditID: b6c32a46-625ff70000002658-03-615f8dce5138
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        76.9E.09091.DCD8F516; Fri,  8 Oct 2021 09:16:13 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211008001613epsmtip1ef7fb2c96c506b304bbe119c51920581~r5f8eYJal1479114791epsmtip1H;
        Fri,  8 Oct 2021 00:16:13 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <a6826964-5949-26b5-fc6b-7b52f7c752af@canonical.com>
Subject: RE: [PATCH 1/3] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
Date:   Fri, 8 Oct 2021 09:16:13 +0900
Message-ID: <00d101d7bbd9$b42e27a0$1c8a76e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8qcgfzGIEeaCeMM4Gv0CnAmQ4WAIQF3NaAWD9AXkB+Xv9R6tTCs8Q
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmhe653vhEgzcvdSzmHznHarHx7Q8m
        iyl/ljNZzDi/j8mide8RdovDb9pZLVbt+sPowO4xq6GXzWPnrLvsHptWdbJ53Lm2h82jb8sq
        Ro/Pm+QC2KKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTd
        MnOAblFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBka
        GBiZAhUmZGc8ffGFseCDTsXz7mvsDYzXVbsYOTkkBEwkjj+5ytzFyMUhJLCDUWLfoTNsEM4n
        RonVmxcwQTjfGCWud+5ng2k58v8GK0RiL6PEt2MnoPpfMEps69nPDlLFJqAv8bJjG1iViMBU
        Rolpl9rYQRxmgcWMEo9PrWYBqeIUcJT4NmMRmC0s4C2xfNl5sG4WARWJvlstYDavgKVE36eX
        jBC2oMTJmU/A6pkFtCWWLXzNDHGTgsTPp8tYQWwRATeJz49XsUPUiEjM7mwDO09CYCaHxPSV
        e6CecJHY9Pk8K4QtLPHq+BZ2CFtK4mU/xKUSAt2MEq2P/kMlVjNKdDb6QNj2Er+mbwFq5gDa
        oCmxfpc+iCkhoCxx5BbUbXwSHYf/skOEeSU62oQgGtUlDmyfzgJhy0p0z/nMOoFRaRaSz2Yh
        +WwWkg9mIexawMiyilEstaA4Nz212KjACB7fyfm5mxjBKVXLbQfjlLcf9A4xMnEwHmKU4GBW
        EuHNt49NFOJNSaysSi3Kjy8qzUktPsRoCgzricxSosn5wKSeVxJvaGJpYGJmZmhuZGpgriTO
        O/efU6KQQHpiSWp2ampBahFMHxMHp1QD093ClFMCXSycE4P1NeZMNZKqf6DfkX0k39HvEVf2
        BMO/K5lSr8fNM1LIfbo1r8kg8GnsjgArXtskI/M2XyaXq7Z/J6pka8r7Klq9eZoq/Z9btLz1
        wDehz6qPX1o0ft0z4Vv8Oe+Ff6S7Wp3avvIweQjOFOK7Ut8luPNOjuWi2LsNLWLvFB0dznFo
        Fdof0eqVvenp9z+Ev1bpIt9Ei/oNjluudyqb+Da+v+oSH7vEOfSl3/+gL0EK7bXbn2W8nLBH
        xS+wRcOzJchbxqNGxfTb0qPmphpnMvZM2/r27J3WhJcXsjvMnfec2XXANHrzsaML/swX5X3E
        d/useKjCipqfRya9CZ5z78bRja4vI54psRRnJBpqMRcVJwIAc5SNyDIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJTvdsb3yiwbxrBhbzj5xjtdj49geT
        xZQ/y5ksZpzfx2TRuvcIu8XhN+2sFqt2/WF0YPeY1dDL5rFz1l12j02rOtk87lzbw+bRt2UV
        o8fnTXIBbFFcNimpOZllqUX6dglcGQ//fmEr6NKumPJiL3MD40flLkZODgkBE4kj/2+wdjFy
        cQgJ7GaU+LR8PitEQlbi2bsd7BC2sMT9liNQRc8YJY5e2ckMkmAT0Jd42bENLCEiMB2o+84G
        RhCHWWApo8Sv07uYIFp+MEosOviHCaSFU8BR4tuMRSwgtrCAt8TyZefBdrAIqEj03WoBs3kF
        LCX6Pr1khLAFJU7OfAJWzyygLdH7sJURxl628DUzxH0KEj+fLgO7W0TATeLz41XsEDUiErM7
        25gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOD4
        0tLcwbh91Qe9Q4xMHIyHGCU4mJVEePPtYxOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkv
        JJCeWJKanZpakFoEk2Xi4JRqYDLskFK/J+594UAIc93x0Hwf4Rib8vnidlFFLqUsrxm3b2DZ
        nRJf/fj76vIPWvzPllfM5zyXN+f/9AerX8rvC3c8eO26U+qhvcuW5dj2JLPKSEtmfrwZlPDR
        VPDw5M1JEqwBW1dzLcjaZBHbYnhrUUtDmcwCuxrxiWd6yzlNE89netQayew8lqB/0PPOBvHZ
        Bw3jdFw0vs3827JnU37JepW2Ao3V1f48Qu4V3D4bVTIdlviGvnReWHt+riJzqvmS3o/vJ743
        Kebr+RJdJGxkzBFZ86/ImTl2xyvrvxe8lDV6tEsD3r+ff8dVt2kOy3+jGpfL744UyRyfF/9e
        4uJWhjC5b34BfimNkd/DZ/5XYinOSDTUYi4qTgQA8YGreB4DAAA=
X-CMS-MailID: 20211008001613epcas2p3ffd305d8b716d6933b4135ce760594bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed
References: <20211007120855.56555-1-chanho61.park@samsung.com>
        <CGME20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed@epcas2p2.samsung.com>
        <20211007120855.56555-2-chanho61.park@samsung.com>
        <a6826964-5949-26b5-fc6b-7b52f7c752af@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: Friday, October 8, 2021 2:55 AM
> To: Chanho Park <chanho61.park=40samsung.com>; Rob Herring
> <robh+dt=40kernel.org>; Linus Walleij <linus.walleij=40linaro.org>
> Cc: Tomasz Figa <tomasz.figa=40gmail.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; linux-samsung-soc=40vger.kernel.org;
> devicetree=40vger.kernel.org
> Subject: Re: =5BPATCH 1/3=5D pinctrl: samsung: support ExynosAutov9 SoC
> pinctrl
>=20
> On 07/10/2021 14:08, Chanho Park wrote:
> > Add pinctrl data for ExynosAuto v9 SoC.
> >
> > - GPA0, GPA1: 10, External wake up interrupt
> > - GPQ0: 2, XbootLDO, Speedy PMIC I/F
> > - GPB0, GPB1, GPB2, GPB3: 29, I2S 7 CH
> > - GPF0, GPF1, GPF2, GPF3,GPF4, GPF5, GPF6, GPF8: 52, FSYS
> > - GPG0, GPG1, GPG2, GPG3: 25, GPIO x 24, SMPL_INT
> > - GPP0, GPP1, GPP2, GPP3, GPP4, GPP5: 48, USI 12 CH
> >
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
>=20
> Thanks Chanho for the patches. It's awesome to see this work upstreamed=
=21
>=20
> Few comments below.

Thanks for your review.

>=20
> > ---
> >  .../bindings/pinctrl/samsung-pinctrl.txt      =7C   1 +
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    =7C 108 ++++++++++++++++=
++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     =7C   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     =7C   1 +
> >  4 files changed, 112 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > index e7a1b1880375..b8b475967ff9 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > =40=40 -23,6 +23,7 =40=40 Required Properties:
> >    - =22samsung,exynos5433-pinctrl=22: for Exynos5433 compatible pin-
> controller.
> >    - =22samsung,exynos7-pinctrl=22: for Exynos7 compatible pin-controll=
er.
> >    - =22samsung,exynos850-pinctrl=22: for Exynos850 compatible pin-cont=
roller.
> > +  - =22samsung,exynosautov9-pinctrl=22: for ExynosAutov9 compatible pi=
n-
> controller.
> >
> >  - reg: Base address of the pin controller hardware module and length o=
f
> >    the address space it occupies.
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index fe5f6046fbd5..3bf18e844402 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > =40=40 -538,3 +538,111 =40=40 const struct samsung_pinctrl_of_match_dat=
a
> exynos850_of_data __initconst =3D =7B
> >  	.ctrl		=3D exynos850_pin_ctrl,
> >  	.num_ctrl	=3D ARRAY_SIZE(exynos850_pin_ctrl),
> >  =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 0 (ALIVE) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks0=5B=5D =3D =7B
>=20
> This and below should be static const and __initconst.

Okay. I'll put both.

>=20
> > +	EXYNOS850_PIN_BANK_EINTW(8, 0x000, =22gpa0=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTW(2, 0x020, =22gpa1=22, 0x04),
> > +	EXYNOS850_PIN_BANK_EINTN(2, 0x040, =22gpq0=22), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 1 (AUD) */ static struct
> > +samsung_pin_bank_data exynosautov9_pin_banks1=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(5, 0x000, =22gpb0=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, =22gpb1=22, 0x04),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, =22gpb2=22, 0x08),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, =22gpb3=22, 0x0C), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 2 (FSYS0) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks2=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(6, 0x000, =22gpf0=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTG(6, 0x020, =22gpf1=22, 0x04), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 3 (FSYS1) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks3=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(6, 0x000, =22gpf8=22, 0x00), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 4 (FSYS2) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks4=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(4, 0x000, =22gpf2=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, =22gpf3=22, 0x04),
> > +	EXYNOS850_PIN_BANK_EINTG(7, 0x040, =22gpf4=22, 0x08),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, =22gpf5=22, 0x0C),
> > +	EXYNOS850_PIN_BANK_EINTG(7, 0x080, =22gpf6=22, 0x10), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 5 (PERIC0) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks5=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, =22gpp0=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, =22gpp1=22, 0x04),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, =22gpp2=22, 0x08),
> > +	EXYNOS850_PIN_BANK_EINTG(5, 0x060, =22gpg0=22, 0x0C), =7D;
> > +
> > +/* pin banks of exynosautov9 pin-controller 6 (PERIC1) */ static
> > +struct samsung_pin_bank_data exynosautov9_pin_banks6=5B=5D =3D =7B
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, =22gpp3=22, 0x00),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, =22gpp4=22, 0x04),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, =22gpp5=22, 0x08),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, =22gpg1=22, 0x0C),
> > +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, =22gpg2=22, 0x10),
> > +	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, =22gpg3=22, 0x14), =7D;
> > +
> > +const struct samsung_pin_ctrl exynosautov9_pin_ctrl=5B=5D =3D =7B
>=20
> __initconst at the end, please.

Will do as well.

Best Regards,
Chanho Park

