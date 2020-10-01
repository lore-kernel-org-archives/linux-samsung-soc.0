Return-Path: <SRS0=2c9Z=DI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56901C4727C
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 08:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEE5208B6
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 08:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NgtWmCrf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgJAIgS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:36:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45117 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgJAIgS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 04:36:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201001083616euoutp02c9c496347da66331fcf5ee2cb947fc7f~50WV7dqVQ1018010180euoutp02J;
        Thu,  1 Oct 2020 08:36:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201001083616euoutp02c9c496347da66331fcf5ee2cb947fc7f~50WV7dqVQ1018010180euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601541376;
        bh=Du4vwZJ/JAps9yonoLiRI3YVp38qBjcXvexM7y7EYH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NgtWmCrfoyNKfNMC3y9DnpD/lyCkIkKqFjqrc8dvQrmBFI92h/NHcChANUx8N1VUP
         +/G29NdFveRA4MqKnsu49/MuJ7CigEUjJc9CFPcSmGAE66XN9t5Akbo7sRfxwwFKIZ
         R+x/gIiQhM4vlOXH+h566fX1D934neca53TBTOHo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201001083615eucas1p27fb62b0bbef1a6c3cbba058520c1a157~50WVZZNFN1491414914eucas1p2K;
        Thu,  1 Oct 2020 08:36:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8D.97.06318.FF4957F5; Thu,  1
        Oct 2020 09:36:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201001083615eucas1p2886f47d032844823b419a92fa02994ad~50WU508-K1494214942eucas1p29;
        Thu,  1 Oct 2020 08:36:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201001083615eusmtrp14450d5e1b05ee5c5c965b65955dc40d4~50WU5L3Pi1380613806eusmtrp1T;
        Thu,  1 Oct 2020 08:36:15 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-f0-5f7594ffc8ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.24.06017.FF4957F5; Thu,  1
        Oct 2020 09:36:15 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201001083615eusmtip226c5a87fc5df7b60a47af4b2afd5f63e~50WUvyoy62832128321eusmtip2g;
        Thu,  1 Oct 2020 08:36:14 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
Subject: Re: [PATCH] ARM: dts: exynos: Add a placeholder for a MAC address
Date:   Thu, 01 Oct 2020 10:36:14 +0200
In-Reply-To: <20201001072236.GA4815@kozik-lap> (Krzysztof Kozlowski's
        message of "Thu, 1 Oct 2020 09:22:36 +0200")
Message-ID: <dleftjr1qigx6p.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk750yanDbLtyUS04gs7WLkiTI0I1b+KPoVQtmqk1Zu1s6m
        qVCGXYf3WypSaRdjtbXWErFcMVZSw2kFXa1WaitnBV0wyy4ePwP/Pe/zPc/z8rx8DKHwSFXM
        Lr2RN+i1WWoqhGy9O+KL/VttSl94rDaGu1p3Rcqd9vikXFlfkOC6u+005+h7LOUetTdSXF23
        S8JZPS9p7kiHh06SaRyWE5Tm2rmDmlKnBWm+OiI3kGkhK3bwWbtyeMOClVtDMi0jN6i9A8r9
        5iEnXYh8rBnJGGCXQPvzaokZhTAK9iIC/6tHUjx8Q9Do76BElYL9iqC0BpkRM+44ZU3GmhYE
        /X8OEXgIICjz9ZKiiGLjwGrdJHrD2Lnw5PfweCjBHpXA1ZZf46FKdh087HWNh5LsbOhpiBRp
        GWsEq9dHiFjOJsCXkacSEU9jl4Hz/Wsa81PhXn0/KWKC1UF99xAS84H10XC+6bIUV1sNfbZR
        CmMlDHY6aYwjwFtVTOIyB6Gqcin2FiNobfxBYs1y6PX9nPAmw5FnvonyofD041S8NxQqW08S
        mJbD8aMKrI4GW9nNiRQVlAxeRBhr4M39NhKf8xCCisD8cjSrYVKbhkltGsZSibHLXWlfgOl5
        cKEpSGCcCDbbZ/IMklpQOG8SdBm8EK/nc+MErU4w6TPitmfrHGjsP3n/dH5vQ67RbW7EMkg9
        RV6uN6YrpNocIU/nRtFjSW/tl3qQitRn63l1mHxVl3eLQr5Dm5fPG7LTDaYsXnCjmQypDpfH
        N3/YrGAztEZ+D8/v5Q3/XyWMTFWIKGXqvs7ptz5pbkcXRaw32b1F1WFRJS9s11+mdb1LmT9D
        EnSWJkWFMfKZD3YG5qQnDLQ3RfxdrJT5pxn1/RUpqmBifEtbf+bhpLa1PXfMKe6zqamhgcMx
        w1EFBxI33/OvcaGN1O6hxfYuKrygOVhT6x+Ijc/J55rqaTrXElc0qiaFTO2iGMIgaP8Baih+
        vFcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xe7r/p5TGG/xew2mxccZ6Vov5R86x
        WvQ/fs1scf78BnaLTY+vsVpc3jWHzWLG+X1MFmuP3GW3aN17hN2B02PTqk42j81L6j36tqxi
        9Pi8SS6AJUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjf
        LkEvY9XP3WwFT4Urut5sYW9gPCfQxcjBISFgIjFvrWMXIxeHkMBSRomfd2YzQcSlJFbOTe9i
        5AQyhSX+XOtig6h5yihx8lAXK0gNm4CexNq1ESA1IgKaEtf/fmcFqWEWaGSS2H7wLjtIQljA
        S+LSnX2MILaQgK7EqvZ/YPNZBFQlLsySAzE5BUok/t1lBqngFTCX+PTzBhOILSpgKbHlxX12
        iLigxMmZT1hAbGaBbImvq58zT2AUmIUkNQtJahbQVGagi9bv0ocIa0ssW/iaGcK2lVi37j3L
        AkbWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGxte3Yzy07GLveBR9iFOBgVOLhnZBXEi/E
        mlhWXJl7iFEFaMyjDasvMEqx5OXnpSqJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6MuJzFKi
        yfnAdADUb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgfHI7dXrMrNk
        q+d+mKaWyG58My8gSevW0bdK4ifv9ricjcxoaPz59fGk7UFpecES/Rvvh7f9+XzgcoPahFU2
        i78LrSiNjNfnzjK3nFXeIRziOs8nZ+a3ZoVFjzIeppgvkfHWCjH1WLzApqbw4j8VY7auvSz7
        l94KEFFzmFK+pTTllWFRz55kZSWW4oxEQy3mouJEAI9iE1PPAgAA
X-CMS-MailID: 20201001083615eucas1p2886f47d032844823b419a92fa02994ad
X-Msg-Generator: CA
X-RootMTR: 20201001083615eucas1p2886f47d032844823b419a92fa02994ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201001083615eucas1p2886f47d032844823b419a92fa02994ad
References: <20201001072236.GA4815@kozik-lap>
        <CGME20201001083615eucas1p2886f47d032844823b419a92fa02994ad@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-10-01 czw 09:22>, when Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2020 at 04:31:51PM +0200, =C5=81ukasz Stelmach wrote:
>> Add a placeholder for a MAC address. A bootloader may fill it
>> to set the MAC address and override EEPROM settings.
>>=20
>> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/=
dts/exynos5422-odroidxu3.dts
>> index db0bc17a667b..9f7f3eacb750 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -70,3 +70,21 @@ &pwm {
>>  &usbdrd_dwc3_1 {
>>  	dr_mode =3D "peripheral";
>>  };
>> +
>> +&usbhost2 {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +
>> +	hub@1 {
>> +		compatible =3D "usb8087,0024";
>> +		reg =3D <1>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		ethernet: usbether@1 {
>> +			compatible =3D "usb0c45,6310";
>> +			reg =3D <1>;
>> +			mac-address =3D [00 00 00 00 00 00]; /* Filled in by a bootloader */
>
> Why do you need a placeholder? U-Boot can just append the
> address/property.

Several other dts files have such placeholder

git grep 'mac-addr.*\[00 00 00 00 00 00\]' arch/arm/boot/dts/ | wc -l
26

I can see two scenarios where this patch may be helpful. Another
(simple) boot loading code might be used. The value may also be
customized during build time and used without any support of a
bootloader.

Finding and filling a placeholder would be easier in u-boot too.

And it serves as a reference how to configure a USB device in a dts
file.

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl91lP4ACgkQsK4enJil
gBC7CQf8Daar9/v03mcyngKOdjq/OdNBbF8xnkL8pJ4B4VmhjtmdszYH+P9+p4KI
GZAMGardhItVjNrHJlkxHXly7z3eqy/lwSgU2BnXOshpSEGmG0cIYPKs3hjBBzzD
gIxOlVvgBoKJnQe/RSOSX+Exra8VaS+5Xtcv+fQq3XHWAEUm14VY8IbqICuGUeNS
FyIhvfHjxUKCwvO0NMWJaSIp6XjECchhHi8gwhJ8bvEV9xzm3EgOAuhfaHGw3BxW
9hdVqVuLr6Yl+hm2+rf35q/qmMVpGGaBxfH2xFgpIq4kjtEKIHT0rnokUaNbRnZ1
BTFUWia9Fk44U0B/rKB73c3ItaU50Q==
=hQtz
-----END PGP SIGNATURE-----
--=-=-=--
