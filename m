Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2FEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 11:20:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E7FA61C48
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 11:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhKOLXX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 06:23:23 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:18378 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhKOLWd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 06:22:33 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211115111923epoutp043d244cd069aa61b5925436855290e904~3tDzuM-Bp0777307773epoutp04E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 11:19:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211115111923epoutp043d244cd069aa61b5925436855290e904~3tDzuM-Bp0777307773epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636975163;
        bh=oObEwWdeZ4972GKO2r7QRGnpiQKmJeGXlyehSdXted8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Qcf/zSjz3eiVisPXgiM2a+Yf3O35rRvLyWJeLET4ZuWENIz7r3p6Bhx0cB5wJON28
         Nk4UOmtZzyEROnTutVmGmE+WS6iNCI79/H1Ao04WyE2xV3B9ksG9BfvI2dx1h9/lzk
         HDepAS/Cya4BZ5mPvbdPsEpW1A6p+1X84ef0Fl+E=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211115111923epcas2p48327a26edc0236cdde7cb79a9a5fe373~3tDzbyFvS1533815338epcas2p4y;
        Mon, 15 Nov 2021 11:19:23 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Ht6CW2gfDz4x9Pt; Mon, 15 Nov
        2021 11:19:19 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.3F.10014.23242916; Mon, 15 Nov 2021 20:19:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211115111914epcas2p14ea9d22a4899b499866dcf549ec13c78~3tDrBR2R01727517275epcas2p1f;
        Mon, 15 Nov 2021 11:19:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211115111914epsmtrp127ea0ecc7c0796dcc445ebd38b2cc10a~3tDrArc5j0489504895epsmtrp1F;
        Mon, 15 Nov 2021 11:19:14 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-52-619242321db3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        51.5E.08738.13242916; Mon, 15 Nov 2021 20:19:13 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211115111913epsmtip1d4c0fc549c3232970ff204f2c85bbb62~3tDqzsuo02907829078epsmtip1X;
        Mon, 15 Nov 2021 11:19:13 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>
Cc:     <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
In-Reply-To: <20211102064826.15796-1-chanho61.park@samsung.com>
Subject: RE: [PATCH] arm64: dts: exynosautov9: drop
 samsung,ufs-shareability-reg-offset
Date:   Mon, 15 Nov 2021 20:19:13 +0900
Message-ID: <02d501d7da12$9ec499b0$dc4dcd10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG193NJzuVkbw8bChOjtPIyHEsMqgIIQmw5rDfzFuA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmma6R06REg4MrJSzmHznHarHx7Q8m
        ixnn9zFZtO49wu7A4jGroZfNY9OqTjaPz5vkApijsm0yUhNTUosUUvOS81My89JtlbyD453j
        Tc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgLYpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yV
        UgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Izfqxaxl5wXqhi5q3LzA2Mb/i7GDk5JARM
        JH7u72ftYuTiEBLYwSixY94KZpCEkMAnRomV//MhEp8ZJW53XmaH6dj0dj1Uxy5GiV1bLzFC
        OC8YJb5u7GEBqWIT0Jd42bGNFcQWEbCXWNfyiBHEZhbIldj/5iAbiM0JFG9eMQesXlggUqLt
        dg9YnEVAVaL5+AQwm1fAUmLns5PsELagxMmZT1gg5mhLLFv4mhniIgWJn0+XQe2ykpj/eCdU
        jYjE7M42ZpDjJAResku8Wv8YqsFFYv/i2WwQtrDEq+NboF6TknjZ38YO0dDNKNH66D9UYjWj
        RGejD4RtL/Fr+hagbRxAGzQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFd4sD26SwQ
        tqxE95zPrBMYlWYh+WwWks9mIflgFsKuBYwsqxjFUguKc9NTi40KjOGRnZyfu4kRnBC13Hcw
        znj7Qe8QIxMH4yFGCQ5mJRHehGkTE4V4UxIrq1KL8uOLSnNSiw8xmgLDeiKzlGhyPjAl55XE
        G5pYGpiYmRmaG5kamCuJ8+ax9yUKCaQnlqRmp6YWpBbB9DFxcEo1ME1d+VkrziYk29lPqFBC
        vUp6Ure218otj56sF139O+t1wFJvUdbwxhzdY77Tyy0fqbJsC9l2f0d5h2T5scAX+QtEG7Lm
        HEirf/j+5rH33yzjFyu5cpqI/5/VzT4p6EK4W2dL5qxUSQ/bdwcCDj9WbkvsO7pr8jm5rroN
        98WPHk68v+Cf0IqAufuO3b52u7hn352OEIEdy+8WKky1lr7zn31/T1ZFjHzJo7OnQvYm5z2o
        vZ41fefl6a91GC+6S917JNmU2DLx9RyLXJm3D7fIpYo6PHl1fe+GvANPyvW5ljrmX+tQvrvd
        yW6JXJfObSebUwEdW6KUHW7VT5v1gzf04oJzm3TvXuSYNX1fWN1k1yglluKMREMt5qLiRABW
        6vbyEQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnK6h06REg6ufTCzmHznHarHx7Q8m
        ixnn9zFZtO49wu7A4jGroZfNY9OqTjaPz5vkApijuGxSUnMyy1KL9O0SuDJ+Tb7PVtAmVHH6
        wmPGBsa5/F2MnBwSAiYSm96uZ+1i5OIQEtjBKHFvygt2iISsxLN3O6BsYYn7LUegip4xSpz6
        9ZMNJMEmoC/xsmMbK4gtImAvsa7lESOIzSyQLzFzx3p2iIYJjBILdi4CK+IEKmpeMYcFxBYW
        CJe4PmUVM4jNIqAq0Xx8AthQXgFLiZ3PTrJD2IISJ2c+YYEYqi3R+7CVEcZetvA1M8R1ChI/
        ny6DOsJKYv7jnVD1IhKzO9uYJzAKz0IyahaSUbOQjJqFpGUBI8sqRsnUguLc9NxiwwKjvNRy
        veLE3OLSvHS95PzcTYzg+NDS2sG4Z9UHvUOMTByMhxglOJiVRHgTpk1MFOJNSaysSi3Kjy8q
        zUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoEp2eLn4tL2ar0kqd1V52OUqpdY
        yogymQcfMl/yznbpe9NHG284X54b3rDCWix5m8Nezge/muwa2pnfa64NP1qbxb3m6X8ZqS+h
        PgIfzrUJMK0UauZ3i1pnq/KmMtX/lM/mxuQLOfysP+/o83WVnt34KXKnxv7pczTmsFlseaGk
        /KXlzIvFVd6LFfOOiG9VVWvetvGGnfrUjSKdDXsyp53Ypr/k6YmCFW4z269dnBh8UFWZkb+Z
        65ByV2cHu9cGxvSEM+miTiXzFQT2amp06exg8Nvg+rcowor/0AWJh5J7/XgCGG6c6z21YlbC
        ih0Pih/tO3Q8/9GSjKzoD7/3Ktw57GbVJusy86lBbqfGnsNKLMUZiYZazEXFiQDYK9aJ/gIA
        AA==
X-CMS-MailID: 20211115111914epcas2p14ea9d22a4899b499866dcf549ec13c78
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c
References: <CGME20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c@epcas2p2.samsung.com>
        <20211102064826.15796-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Recently, Exynosauto v9 ufs patch series have been merged at v5.16-rc1.
So, below patch is required according to the changes. Could you please revi=
ew & pick it up your tree?
Or Do I need to add =22Fixes:=22 tag?

Best Regards,
Chanho Park

> -----Original Message-----
> From: Chanho Park <chanho61.park=40samsung.com>
> Sent: Tuesday, November 2, 2021 3:48 PM
> To: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>; Rob Herrin=
g
> <robh+dt=40kernel.org>
> Cc: devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org; Ch=
anho
> Park <chanho61.park=40samsung.com>
> Subject: =5BPATCH=5D arm64: dts: exynosautov9: drop samsung,ufs-shareabil=
ity-
> reg-offset
>=20
> samsung,ufs-shareability-reg-offset is not necessary anymore since it was
> integrated into the second argument of samsung,sysreg.
>=20
> Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> ---
> This is a modification of =5B1=5D which is already started the pull-reque=
st.
> It has been changed a bit while reviewing DT property=5B2=5D and the chan=
ged
> version has been merged into scsi tree=5B3=5D.
>=20
> =5B1=5D:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=
=3Dn
> ext/dt64&id=3D31bbac5263aa63dfc8bfed2180bb6a5a3c531681
> =5B2=5D: https://lore.kernel.org/linux-samsung-
> soc/011e01d7c410=244a420340=24dec609c0=24=40samsung.com/T/=23u
> =5B3=5D:
> https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?h=3D=
5.1
> 6/scsi-staging&id=3Dcc52e15397cc5dc773d3c6792b98352d3209f93f
>=20
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi =7C 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 3e4727344b4a..a960c0bc2dba 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> =40=40 -296,8 +296,7 =40=40 ufs_0: ufs0=4017e00000 =7B
>  			pinctrl-0 =3D <&ufs_rst_n &ufs_refclk_out>;
>  			phys =3D <&ufs_0_phy>;
>  			phy-names =3D =22ufs-phy=22;
> -			samsung,sysreg =3D <&syscon_fsys2>;
> -			samsung,ufs-shareability-reg-offset =3D <0x710>;
> +			samsung,sysreg =3D <&syscon_fsys2 0x710>;
>  			status =3D =22disabled=22;
>  		=7D;
>  	=7D;
> --
> 2.31.1.442.g7e391989789d


