Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025D4C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCE3A21D91
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kf1g/UiL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgKCRmL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:42:11 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35544 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgKCRmL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 12:42:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103174159euoutp013bb365202d23fa3479debf8bcb9c0fee~EEFPSGfxs0187501875euoutp018;
        Tue,  3 Nov 2020 17:41:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103174159euoutp013bb365202d23fa3479debf8bcb9c0fee~EEFPSGfxs0187501875euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604425319;
        bh=+c191vStEcBpp0tReQUjkojqVkYelLLRiqQLkPx/3k4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kf1g/UiLgfg/+XsZl01UBhHqH1oezVmE746M3TyUxQYTzoXWGva32AoS0qmnky1Vw
         HXLZJod6N6kSdHC1XW+GN0PCI5Np2/tXtdL5L8UYIanE6PNSSgqrBcpbxIt0huyAf3
         ZLURvcQjGg796yyCI4Lg2ZcaElXKDn4Rp2dxWPpU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103174153eucas1p1416a579a93f01ee5edda3ed9d09f0051~EEFKGr5rt2033320333eucas1p1N;
        Tue,  3 Nov 2020 17:41:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 59.AE.05997.16691AF5; Tue,  3
        Nov 2020 17:41:53 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103174153eucas1p1bde36909139c5662249eb5a1586504d7~EEFJtwfjM0849308493eucas1p1V;
        Tue,  3 Nov 2020 17:41:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103174153eusmtrp2c52df24de6776f2f90da3349495fad6b~EEFJtHyrH2875328753eusmtrp2e;
        Tue,  3 Nov 2020 17:41:53 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-3e-5fa19661e461
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2C.98.06314.06691AF5; Tue,  3
        Nov 2020 17:41:53 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103174152eusmtip1d6ba58782f21b6cc48051c9d6017211a~EEFIxVs9X2413224132eusmtip1S;
        Tue,  3 Nov 2020 17:41:52 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkie?= =?utf-8?Q?wicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos: Fix ethernet description for
 Odroid XU3
Date:   Tue, 03 Nov 2020 18:41:42 +0100
In-Reply-To: <20201103163610.GA14739@kozik-lap> (Krzysztof Kozlowski's
        message of "Tue, 3 Nov 2020 17:36:10 +0100")
Message-ID: <dleftjo8kes5gp.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djP87qJ0xbGGzxcrm+xccZ6Vov5R86x
        WvQ/fs1scf78BnaLTY+vsVpc3jWHzWLG+X1MFus23mK3WHvkLrtF694j7A5cHjtn3WX32LSq
        k81j85J6j74tqxg9Pm+SC2CN4rJJSc3JLEst0rdL4Mq48+MjU8Fp0Yp3Z3azNzB+Fuxi5OSQ
        EDCRePb3C2MXIxeHkMAKRokHsyeyQzhfGCXW/toPlfnMKHF8ySpGmJbWnZ1sEInljBKLv9+D
        annOKLFk1VbmLkYODjYBPYm1ayNAGkQENCWu//3OClLDLNDALNH/cQ/YJGGBEIkFJ64zgdgs
        AqoS1989ArM5BUoletoegNm8AuYSr27PZwexRQUsJba8uM8OEReUODnzCQuIzSyQKzHz/Buo
        6+6xS1z/KQVhu0hMfHIGKi4s8er4FnYIW0bi/875TCB3SgjUS0yeZAZym4RAD6PEtjk/WCBq
        rCXunPvFBmE7SjxbMIUNop5P4sZbQYi1fBKTtk1nhgjzSnS0CUFUq0is698DNUVKovfVCqgL
        PCRa502ChlsTo8SNnXsZJzAqzELyzSwk38wCGssMDLr1u/QhwtoSyxa+ZoawbSXWrXvPsoCR
        dRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZg4jr97/iXHYy7/iQdYhTgYFTi4XVIXRAv
        xJpYVlyZe4hRBWjSow2rLzBKseTl56UqifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzX
        eNHLWCGB9MSS1OzU1ILUIpgsEwenVAOjqZ+e6GbjixP3N9ybp9aTMu2WS+xF/eM/zbrtqmR5
        m2/fii2u7tG1V2bhu3vFMX6lSGSHhsZayXn9urf3PG7r99ysu17AfOqMt3k9gvKzAtK6Hu9v
        ND3xf8tmB6lkOYkZJh8E12SWMgvcMwlqYDF8pih25r/XwuUPjUyXrG9kvPt990qj81ZKLMUZ
        iYZazEXFiQCDSAiLZAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7qJ0xbGG8zfJmGxccZ6Vov5R86x
        WvQ/fs1scf78BnaLTY+vsVpc3jWHzWLG+X1MFus23mK3WHvkLrtF694j7A5cHjtn3WX32LSq
        k81j85J6j74tqxg9Pm+SC2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXS
        t7NJSc3JLEst0rdL0Mu48+MjU8Fp0Yp3Z3azNzB+Fuxi5OSQEDCRaN3ZydbFyMUhJLCUUWL2
        z1XMXYwcQAkpiZVz0yFqhCX+XOtiA7GFBJ4ySizuEAQpYRPQk1i7NgIkLCKgKXH973dWkDHM
        Ak3MEo9vzgCrFxYIkvjxeh5Ur57E0pvbWUBsFgFVievvHjGBzOEUKJU4+tYTJMwrYC7x6vZ8
        dhBbVMBSYsuL++wQcUGJkzOfgLUyC2RLfF39nHkCo8AsJKlZSFKzgKYyA520fpc+RFhbYtnC
        18wQtq3EunXvWRYwsq5iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjLhtx35u3sF4aWPwIUYB
        DkYlHl6H1AXxQqyJZcWVuYcYVYDGPNqw+gKjFEtefl6qkgiv09nTcUK8KYmVValF+fFFpTmp
        xYcYTYHenMgsJZqcD0wSeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4
        OKUaGBe68Pcv/O1TaSUqErGnN8n6LFuEZMLXEDEtkX279kX/Mmo/8Nt8+uPvS4ysyu5tU7wS
        c+Pxa1XNamFWhlwbF5MSDxEzHxlHppC7n9jceuxqN3Q07S1T2uEvs1W2I3G5TKPQlb8NczL1
        fs/fudu5yW/XiewD//wzPl89NjP26P0DTV2Pwhm2KLEUZyQaajEXFScCAJfE29jaAgAA
X-CMS-MailID: 20201103174153eucas1p1bde36909139c5662249eb5a1586504d7
X-Msg-Generator: CA
X-RootMTR: 20201103174153eucas1p1bde36909139c5662249eb5a1586504d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103174153eucas1p1bde36909139c5662249eb5a1586504d7
References: <20201103163610.GA14739@kozik-lap>
        <CGME20201103174153eucas1p1bde36909139c5662249eb5a1586504d7@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-11-03 wto 17:36>, when Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2020 at 01:46:14PM +0100, =C5=81ukasz Stelmach wrote:
>> Create ethernet alias=20
>
> Your commit msg should explain why.
>

OK. (And a separate patch - ack)

>> and assign appropriate compatible properties.
>
> Then what was before? Indeed they do not look like anything
> reasonable... old VID do not appear on any of Odroid boards.
>

The first is acutally an Intel hub, the second is a webcam. Where did
I=C2=A0found them? I can't be sure today.

In case of USB devices the kernel uses topology information to match
devices instead of compatible properties and u-boot uses
aliases. Therefore, bad IDs don't break anything.

>>=20
>> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> ---
>
> Best regards,
> Krzysztof
>
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/=
dts/exynos5422-odroidxu3.dts
>> index d0f6ac5fa79d..2a4153484664 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -15,6 +15,10 @@
>>  / {
>>  	model =3D "Hardkernel Odroid XU3";
>>  	compatible =3D "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung=
,exynos5";
>> +
>> +	aliases {
>> +		ethernet =3D &ethernet;
>> +	};
>>  };
>>=20=20
>>  &i2c_0 {
>> @@ -76,13 +80,13 @@ &usbhost2 {
>>  	#size-cells =3D <0>;
>>=20=20
>>  	hub@1 {
>> -		compatible =3D "usb8087,0024";
>> +		compatible =3D "usb0424,9514";
>>  		reg =3D <1>;
>>  		#address-cells =3D <1>;
>>  		#size-cells =3D <0>;
>>=20=20
>>  		ethernet: usbether@1 {
>> -			compatible =3D "usb0c45,6310";
>> +			compatible =3D "usb0424,ec00";
>>  			reg =3D <1>;
>>  			local-mac-address =3D [00 00 00 00 00 00]; /* Filled in by a bootloa=
der */
>>  		};
>> --=20
>> 2.26.2
>>=20
>
>

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl+hllYACgkQsK4enJil
gBBYcAf/d7j1CpbaTmFNiujiCo6TDDWRAeGAmrF3cIl6O+gtIROgWHb7Jfp9dxv2
6jf6GvuU6UaxIBpWtE/UZQDOT/w1hVOWFeGrSZWRp3QbSWBv1xB6JoNW7F0K/58C
lwHAONduwJ3/VW5WeKi2Q0XZ+X0Lo7G6lFIMRT5rTXt0pboSg5peFlCRUi9QrdpF
mxodMNks+IOQxBfXSgfGPmOMYAj33pUBD+xHQqKx/QQqX4Aor0zIhnKqHYpx9Hwo
Z0+FAQZfhVL+rr2ZGi9VUF+dYoehjlQHtk6DXSYjzKk84CxkSDsVKkJ9ZRDy91yX
MHszzZurciEOJ1k8g/V5qHeiOM+ZNQ==
=o+JZ
-----END PGP SIGNATURE-----
--=-=-=--
