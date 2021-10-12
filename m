Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A2C60E8B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhJLA1B (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 20:27:01 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:60780 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbhJLA0z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 20:26:55 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211012002453epoutp011186013bfe5e2e95873bf8ca35211037~tIMpW3zmL1061910619epoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 00:24:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211012002453epoutp011186013bfe5e2e95873bf8ca35211037~tIMpW3zmL1061910619epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633998293;
        bh=H5AJAy+00bzflJo+Iw5UPr64NmQqZXC2efY7FpHUbm0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=TFaG8RoOsmAgzwvX+oHiGo14DdaZNqzTJasW/3o3aVYIqwfmPi8nnqUCvTuVFWvEu
         IhpGk2cbRtKy/1UJxJ+WmxvsuID9T5yTvZys0dSNy9R5nrBg/3VHXpzM55sHBylLOP
         dP8hdlQkS71wo8y7LL0oE1GzGnpV7VkG8zrCGuCg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211012002452epcas2p43b52629ccf9d556c03b4878f3e9fb5f2~tIMo7U6Xd0345403454epcas2p4y;
        Tue, 12 Oct 2021 00:24:52 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.101]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HSxHz1S56z4x9bg; Tue, 12 Oct
        2021 00:24:47 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.E3.09816.7C5D4616; Tue, 12 Oct 2021 09:24:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211012002439epcas2p31b6a92e4177975eb7e3da0bff9a595ea~tIMcgqEBK1744917449epcas2p3y;
        Tue, 12 Oct 2021 00:24:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211012002439epsmtrp1e3effbce2cb1264b659a62d126b61e51~tIMcf6ALi2224722247epsmtrp1v;
        Tue, 12 Oct 2021 00:24:39 +0000 (GMT)
X-AuditID: b6c32a46-625ff70000002658-d5-6164d5c77951
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.87.09091.7C5D4616; Tue, 12 Oct 2021 09:24:39 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211012002439epsmtip2775d63b5b79799bbef086a05fe141b0b~tIMcUdkVg1424314243epsmtip27;
        Tue, 12 Oct 2021 00:24:39 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Linus Walleij'" <linus.walleij@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>
In-Reply-To: <f5905ed6-31fe-f7da-8af3-e1a0965b0ce6@canonical.com>
Subject: RE: (subset) [PATCH v3 2/3] arm64: dts: exynos: add initial support
 for exynosautov9 SoC
Date:   Tue, 12 Oct 2021 09:24:39 +0900
Message-ID: <000001d7beff$8b32a910$a197fb30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKtSnlnxiiQHbSrjwu7CErH5CvMkAJ7EgFtAaoOgzUBW1Oj3AJvWHRmqePq4aA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmme7xqymJBsd+WlvMP3KO1WLj2x9M
        FlP+LGeymHF+H5NF694j7BaH37SzWqza9YfRgd1jVkMvm8fOWXfZPTat6mTzuHNtD5tH35ZV
        jB6fN8kFsEVl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6
        ZeYA3aKkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0
        MDAyBSpMyM5oWPSNqeCCasWV2VMZGxh3yHYxcnJICJhI7H07mamLkYtDSGAHo8SJzVOYQBJC
        Ap8YJR4dyYNIfGOU2DbrARtMx/sru9ggivYySqxr4YQoesEosXHiGxaQBJuAvsTLjm2sIAkR
        gamMEv93d4M5zAKLGSVW75/KCFLFKeAoMf/uO7AOYYFkib0P/4PtZhFQlbj0thnM5hWwlJh3
        toMFwhaUODnzCZjNLKAtsWzha2aIkxQkfj5dxgpiiwj4STw6dpMRokZEYnZnGzPIYgmBmRwS
        D47dZYVocJE4/vIEI4QtLPHq+BZ2CFtK4mV/GztEQzejROuj/1CJ1YwSnY0+ELa9xK/pW4AG
        cQBt0JRYv0sfxJQQUJY4cgvqNj6JjsN/2SHCvBIdbUIQjeoSB7ZPZ4GwZSW653xmncCoNAvJ
        Z7OQfDYLyQezEHYtYGRZxSiWWlCcm55abFRgBI/t5PzcTYzgdKrltoNxytsPeocYmTgYDzFK
        cDArifC+5UhJFOJNSaysSi3Kjy8qzUktPsRoCgzricxSosn5wISeVxJvaGJpYGJmZmhuZGpg
        riTOO/efU6KQQHpiSWp2ampBahFMHxMHp1QD0zQ7t7s+2gnSUX1v9tmf+dizeC5Tpxn7uufu
        ccteMH5yNs/U/yZYtEHrwoJw/pfN/R9vPxdbv1mv4tWdpLRL+87uZF3jcEQn62Lm1ILPhipz
        tmnNyxRuMM7c6rFsbfuLJn7DuIZNbiJ98rNEHsSld8XOc3ztp8k8r/7fV43pwQp3Xz6v9NKq
        ydHROFXnuWTFjg0rs53+J186Id7e4rZ2jfJjpg3NhgeErRfeV5/9XdDh9wEeV7ea0wedQpVV
        OGdllFUotcZnnrfTOWX9727iXo+iE08zeHbdTL/Gmaze/XIRn/ut3S53uWscn0/03cvZbpD6
        IcTSX85Uxck58sX6Dt2yyQy6z6WPVnYfMO5VYinOSDTUYi4qTgQAWdz9STAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXvf41ZREg8lXhS3mHznHarHx7Q8m
        iyl/ljNZzDi/j8mide8RdovDb9pZLVbt+sPowO4xq6GXzWPnrLvsHptWdbJ53Lm2h82jb8sq
        Ro/Pm+QC2KK4bFJSczLLUov07RK4MpbP+MhesFylYtrZe8wNjBNluhg5OSQETCTeX9nF1sXI
        xSEksJtR4tTvBcwQCVmJZ+92sEPYwhL3W46wgthCAs8YJbZvSgSx2QT0JV52bAOLiwhMZ5To
        WSQGMohZYCmjxNOr15khpm5nkvj/dRsTSBWngKPE/LvvWEBsYYFEidamP2DdLAKqEpfeNoPV
        8ApYSsw728ECYQtKnJz5BMxmFtCWeHrzKZy9bOFrqEsVJH4+XQZ1hZ/Eo2M3GSFqRCRmd7Yx
        T2AUnoVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBsaWl
        uYNx+6oPeocYmTgYDzFKcDArifC+5UhJFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBA
        emJJanZqakFqEUyWiYNTqoFJ6fLjfbuL+V+7nosr/ZN05rn7rCtf3E4GKje5BrN0TM8TuLki
        esc+9v0Maic2991U1LLseeJ4xPwv/5cbcevKjNn+sRQ/vS73SSc1/ji/xtWJoteDX3a8OKN3
        RdH21hvPue6/d6ocqJ3u7bEhl8m+vXLy87kW3FXvv1w5s8naSF/Og5fryiXBvaE+ScwW4mWb
        56TXGPCLx7y22lB5sqhLnqmCP+ftVHVNzgtuDfq5wlsen6hO27Nn1rVl60/qrJAvX6l1/ufZ
        6U6t6xJUl04IVDzDdHLJqolBOZO1MqddFnUQMXb4fnvB9+Mi+01/myTe7NVdX/Jni8nDUzNF
        KlcmxrC97F7dkPqsvEFu0bNOJZbijERDLeai4kQAYqgVhRwDAAA=
X-CMS-MailID: 20211012002439epcas2p31b6a92e4177975eb7e3da0bff9a595ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211010032456epcas2p29de8e098493cbe21a08db86d8253787e
References: <20211010032246.146939-1-chanho61.park@samsung.com>
        <CGME20211010032456epcas2p29de8e098493cbe21a08db86d8253787e@epcas2p2.samsung.com>
        <20211010032246.146939-3-chanho61.park@samsung.com>
        <163388622664.8712.13686604427243111750.b4-ty@canonical.com>
        <f5905ed6-31fe-f7da-8af3-e1a0965b0ce6@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: Monday, October 11, 2021 2:34 AM
> To: Linus Walleij <linus.walleij=40linaro.org>; Chanho Park
> <chanho61.park=40samsung.com>; Rob Herring <robh+dt=40kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki=40samsung.com>;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org; Tomasz=
 Figa
> <tomasz.figa=40gmail.com>
> Subject: Re: (subset) =5BPATCH v3 2/3=5D arm64: dts: exynos: add initial
> support for exynosautov9 SoC
>=20
> On 10/10/2021 19:17, Krzysztof Kozlowski wrote:
> > On Sun, 10 Oct 2021 12:22:45 +0900, Chanho Park wrote:
> >> Add minimal support for ExynosAuto v9 SoC=5B1=5D.
> >>
> >> - Enumarate all pinctrl nodes
> >> - UART with exynos850 compatible
> >> - UFS0 HCI + Phy
> >>
> >> Like exynos850, this also uses fixed-rate clock nodes until clock
> >> driver has been supported. The clock nodes are initialized on
> >> bootloader stage thus we don't need to control them so far.
> >>
> >> =5B...=5D
> >
> > Applied, thanks=21
> >
> > =5B2/3=5D arm64: dts: exynos: add initial support for exynosautov9 SoC
> >       commit: f695b3f4c45d0051416fa7315cf553bec70198d8
>=20
> ... and dropped as build system found dtc W=3D1 warnings:
>=20
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:78.20-83.5: Warning
> (unit_address_format): /cpus/cpu=40000000: unit name should not have lead=
ing
> 0s
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:85.20-90.5: Warning
> (unit_address_format): /cpus/cpu=40000100: unit name should not have lead=
ing
> 0s
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:92.20-97.5: Warning
> (unit_address_format): /cpus/cpu=40000200: unit name should not have lead=
ing
> 0s
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:99.20-104.5: Warning
> (unit_address_format): /cpus/cpu=40000300: unit name should not have lead=
ing
> 0s
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:187.38-198.5: Warning
> (simple_bus_reg): /soc=400/interrupt-controller=4011001000: simple-bus un=
it
> address format error, expected =2210101000=22
> ../arch/arm64/boot/dts/exynos/exynosautov9.dtsi:255.28-264.5: Warning
> (simple_bus_reg): /soc=400/uart=40103000000: simple-bus unit address form=
at
> error, expected =2210300000=22
>=20
> Please fix them plus these fixes:

Sorry for your inconvenience. I'll fix above and below what you changed as =
well.

>=20
>=20
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> =40=40 -570,14 +570,14 =40=40 hsi2c1_bus: hsi2c1-bus-pins =7B
>         =7D;
>=20
>         /* PERIC0 USI01 */
> -       hsi2c2_bus_pins: hsi2c2-bus-pins =7B
> +       hsi2c2_bus: hsi2c2-bus-pins =7B
>                 samsung,pins =3D =22gpp0-4=22, =22gpp0-5=22;
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
>         =7D;
>=20
>         /* PERIC0 USI01_I2C */
> -       hsi2c3_bus_pins: hsi2c3-bus-pins =7B
> +       hsi2c3_bus: hsi2c3-bus-pins =7B
>                 samsung,pins =3D =22gpp0-6=22, =22gpp0-7=22;
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>; =40=40 -1066,=
7 +1066,7
> =40=40 spi9_cs_func: spi9-cs-func-pins =7B
>         =7D;
>=20
>         /* PERIC1 USI10_SPI */
> -       spi10_pins: spi10-pins =7B
> +       spi10_bus: spi10-bus-pins =7B
>                 samsung,pins =3D =22gpp5-2=22, =22gpp5-1=22, =22gpp5-0=22=
;
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>; =40=40 -1088,=
7 +1088,7
> =40=40 spi10_cs_func: spi10-cs-func-pins =7B
>         =7D;
>=20
>         /* PERIC1 USI11_SPI */
> -       spi11_pins: spi11-pins =7B
> +       spi11_bus: spi11-bus-pins =7B
>                 samsung,pins =3D =22gpp3-6=22, =22gpp3-5=22, =22gpp3-4=22=
;
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>; diff --git
> a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index d884ae421e12..1dd1d73a52b8 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> =40=40 -171,7 +171,7 =40=40 uart_clock: uart-clock =7B
>                  * Keep the stub clock for ufs driver, until proper clock
>                  * driver is implemented.
>                  */
> -               ufs_core_clock: uart-core-clock =7B
> +               ufs_core_clock: ufs-core-clock =7B
>=20

Thanks.

Best Regards,
Chanho Park

