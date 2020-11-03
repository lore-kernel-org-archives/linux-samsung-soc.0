Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2DBC55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3943D20E65
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="l5GF3+UA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgKCRNj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:13:39 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58420 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgKCRNj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 12:13:39 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103171327euoutp02d3922ca81977dce748f5c8cbc457db81~EDsU0INnd0968709687euoutp02d;
        Tue,  3 Nov 2020 17:13:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103171327euoutp02d3922ca81977dce748f5c8cbc457db81~EDsU0INnd0968709687euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604423607;
        bh=4+R92XtKdFg0pbHY8n6lWZbiD2Yi0RLFMFQuW88KsPw=;
        h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
        b=l5GF3+UAqmIF6KoyEi5l6XkJ1GBRLtBJIRYsCXIVQrdZft6rD4o1wZ7h7gLOLoFFC
         SwldEEXQycmIT106lSk8Kx8QXYNSRRK0xJrUE1Iuzf0YRNA/n2R79+bTiqQ0cnorPO
         6DO9aS0DjjBJclReXXH+Op5y2faUzBFEtEcyT9RQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103171327eucas1p2e869ff30350112f45b98d062d2f58f0e~EDsUhYPQT1934319343eucas1p2x;
        Tue,  3 Nov 2020 17:13:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id BB.5C.06456.6BF81AF5; Tue,  3
        Nov 2020 17:13:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40~EDsUAZ9fm2801528015eucas1p2Q;
        Tue,  3 Nov 2020 17:13:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103171326eusmtrp2e614f4d1e9fe67d9b82df845fdeb7d47~EDsT-srQh1227412274eusmtrp2w;
        Tue,  3 Nov 2020 17:13:26 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-e7-5fa18fb637f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.CE.06017.6BF81AF5; Tue,  3
        Nov 2020 17:13:26 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103171326eusmtip13e52bf20cf5be4a1a17a190283d29085~EDsT0GxUk3053630536eusmtip1F;
        Tue,  3 Nov 2020 17:13:26 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkie?= =?utf-8?Q?wicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add Ethernet interface
 description for Odroid X/X2
In-Reply-To: <20201103164423.GE14739@kozik-lap> (Krzysztof Kozlowski's
        message of "Tue, 3 Nov 2020 17:44:23 +0100")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date:   Tue, 03 Nov 2020 18:12:51 +0100
Message-ID: <dleftjsg9qs6ss.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeT3nbMfh5HWtfFgRMuxDRVOxyymzq9goiOpDlGVr6mld3JQd
        L2mQyy7UslYaZBJ5qay8zLmm6bqRaVIzV4kapgUqWJmWzi42urgdBb/93uf5/58bL01InJSM
        PqBLYfU6daJcICJrn407F9WailWhHyoimOr8KoopbGylGFPfIME4nRYhY+3roJg2+1UBk+98
        5MOYq7uETGVjj5A5+bBRuEakrC/oESqtZWcEyrs3spTnbWVI6bLO3ULFiFYmsIkH0lh9yKq9
        ov15Z/sFyX1w2PFovgGNS43Ilwa8GK6PuCgjEtESfBuBramX5B9jCFqGLk1mXAjsQwNoytI0
        bPGyBN9C0NuZwYsGEDRWjwiMiKYFWAGVlTs8GimeD51/fnoLEdhAgGnkgdc8A6ugosHgZV+c
        CgMvjgk9PBMvB9vHD14m8TyocbspD4vxMii994PgOQCeX+knPUxgLVxxfkGeBoDfC8FgaJ6c
        NAqud+T78DwDPjfbhDzPgX/1hT6eQQFnQV7uUt6bg6D26i+S10RAd+tvAa9ZC+72OB794e1Q
        AN/WH3JrLxN8WAynT0l4YzCYTQ8mi8jg3Ofbk8MooX/YLuBPlY3gZlEbdQEFFUzbpmDaNgUT
        ZYmJ01XZQ/jwQigtHiR4jgSz+StZhKgyFMimcloNy4Xp2HQFp9ZyqTqNIj5Ja0UTX8vxt3m0
        Dn1/E9eAMI3kfuI1bJFKQqnTuAxtAwqeqNRrKX+FZKQuScfKpeJ1Lx17JOIEdUYmq09S6VMT
        Wa4BzaZJeaA4vORTrARr1CnsIZZNZvVTWR/aV2ZA5mUOixtHdsuP/+zaOWvM+OXZnRpNyXbT
        +OjB8PZwv8KM9BWy+0+po0s4k2/HO8umb5pq/9BXYReviQbFUdaDhpxQI6pzZe/c/T5h34kj
        zifbXLuC4tdZups2Vka7Y2uyqwYc9sy8DQxWKGyj2163nEoZjS7Hm2O2SgO1+asfr5eT3H51
        2AJCz6n/A75wMHxiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7rb+hfGG2xZI22xccZ6Vov5R86x
        WvQ/fs1scf78BnaLTY+vsVpc3jWHzWLG+X1MFus23mK3WHvkLrtF694j7A5cHjtn3WX32LSq
        k81j85J6j74tqxg9Pm+SC2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXS
        t7NJSc3JLEst0rdL0MuY3P2EreCxRMXpfZoNjD9Fuhg5OSQETCSOvtvA2MXIxSEksJRRomdS
        K5DDAZSQklg5Nx2iRljiz7UuNoiap4wSSxp6wWrYBPQk1q6NAKkREdCUuP73OytIDbNAE7PE
        45sz2EASwgKxEu3LvzKB2JwCpRLLPs8Gs4WAejd83c4OYosKWEpseXEfzGYRUJXY+vs3K4jN
        K2AusWz7N2YIW1Di5MwnLCA2s0C2xNfVz5knMArMQpKahSQ1C+g8ZqCb1u/ShwhrSyxb+JoZ
        wraVWLfuPcsCRtZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgTG37djPLTsYu94FH2IU4GBU
        4uF1SF0QL8SaWFZcmXuIUQVozKMNqy8wSrHk5eelKonwOp09HSfEm5JYWZValB9fVJqTWnyI
        0RTon4nMUqLJ+cA0kVcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1Oq
        gfEUX/hhseY4kc1T3k8z2ltZcW6GPdM0sx1ujUXZIRkHXxtNiu/8cI9heeXfLr+qRttM2e41
        /CV/66vnNr/+FPX0jqqxqHnEhSdLk9Zc/8TQ43fteFnk7kMV1h1RS/Mlrm65dNvEwXnusrOf
        X+u2h+UeCqu2LD/I1Xn78acXCsubXGcatn7ullViKc5INNRiLipOBABo+zhJ2wIAAA==
X-CMS-MailID: 20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40
X-Msg-Generator: CA
X-RootMTR: 20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40
References: <20201103164423.GE14739@kozik-lap>
        <CGME20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-11-03 wto 17:44>, when Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2020 at 01:46:18PM +0100, =C5=81ukasz Stelmach wrote:
>> Add Ethernet interface description for Odroid X/X2.
>>=20
>> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4412-odroidx.dts | 28 ++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dt=
s/exynos4412-odroidx.dts
>> index 3ea2a0101e80..8f154f431f6c 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
>> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
>> @@ -15,6 +15,10 @@ / {
>>  	model =3D "Hardkernel ODROID-X board based on Exynos4412";
>>  	compatible =3D "hardkernel,odroid-x", "samsung,exynos4412", "samsung,e=
xynos4";
>>=20=20
>> +	aliases {
>> +		ethernet =3D &ethernet;
>> +	};
>> +
>>  	memory@40000000 {
>>  		device_type =3D "memory";
>>  		reg =3D <0x40000000 0x3FF00000>;
>> @@ -72,8 +76,32 @@ &buck8_reg {
>>  };
>>=20=20
>>  &ehci {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>>  	phys =3D <&exynos_usbphy 2>;
>>  	phy-names =3D "hsic0";
>> +
>> +	hub@2 {
>> +		compatible =3D "usb0424,3503";
>> +		reg =3D <2>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		hub@1 {
>> +			compatible =3D "usb0424:9514";
>
> Does not look like correct compatible.

As odd as it may seem (and considering my mistakes) this is correct.

=2D-8<---------------cut here---------------start------------->8---
root@target:~# cat /proc/device-tree/compatible ; echo
hardkernel,odroid-x2samsung,exynos4412samsung,exynos4
root@target:~# lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 480M
    |__ Port 2: Dev 2, If 0, Class=3DHub, Driver=3Dhub/3p, 480M
        |__ Port 1: Dev 3, If 0, Class=3DHub, Driver=3Dhub/5p, 480M
            |__ Port 1: Dev 4, If 0, Class=3DVendor Specific Class, Driver=
=3Dsmsc95xx, 480M
root@target:~# lsusb
Bus 001 Device 004: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 =
Fast Ethernet Adapter
Bus 001 Device 003: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 002: ID 0424:3503 Standard Microsystems Corp.=20
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
=2D-8<---------------cut here---------------end--------------->8---

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl+hj5MACgkQsK4enJil
gBAtWgf/VVpoZimv8UPfw0nTkbc3kZSq2lB8r5ucz9yMeT9FMTVxrVwuj1qmk7No
VyOzVQmP3+zIAGjOLF5RsYOz0RNXNw2d5DVTLY0HVOeM53UfK3EhNL1v7DbZC/dV
N6lG09htOMTFK87Y62idffwPx70ev5w+crR5bahDuui8RdxjgYTMflpxlCF7UKkG
i3je+q+5S8FaV3oL8hHbgbqTxFPvlLY6m8IW1aa+W4opUK8p+xeKzhj4COFBlsmR
F/+NUmH+80oOgODqGKeumiteLjgZ9Eu7SnD3ydNMkg/FWaCaWKuvMKrgu7E9sfss
Wnrx7myESmsitc9iveZnE6xcrr30lg==
=/8Mr
-----END PGP SIGNATURE-----
--=-=-=--
