From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Cleanup Security Subsystem nodes for
 Exynos5
Date: Thu, 23 Nov 2017 19:05:53 +0100
Message-ID: <87vai0dg5a.fsf%l.stelmach@samsung.com>
References: <CAJKOXPcOKRGg2robtWS9apVrXzZVHgugb_n3JBBsVeSEkvJnFg@mail.gmail.com>
        <CGME20171123180559eucas1p2c07a9d1de1e00e725b9fcda657d44be5@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35959 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753143AbdKWSGE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 13:06:04 -0500
In-reply-to: <CAJKOXPcOKRGg2robtWS9apVrXzZVHgugb_n3JBBsVeSEkvJnFg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo?= =?utf-8?Q?=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2017-11-23 czw 17:16>, when Krzysztof Kozlowski wrote:
> On Thu, Nov 23, 2017 at 3:34 PM, =C5=81ukasz Stelmach <l.stelmach@samsung=
.com> wrote:
>> Move Security Subsystem nodes to exynos5.dtsi. Adjust clock entries for
>> Exynos 5250 and Exynos 54xx.
>
> From the code I can figure it out, but the commit msg should say why
> you are doing this. Actually the "why" is more important then "what"
> because I can easily see "what" the patch is doing.

Marek, can you tell us more? It was your idea ;-)

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJaFw4BAAoJELCuHpyYpYAQcKoH/iv3bHCHMEN3t34F7j1tV6C0
VD1Ccy3L6XoY7JzW3TTk5glijDDEQLSjOsYpsCkAl3DQOzdwkT/NiisodHPlccF+
6FePxRUHYaeKeIxnXChqYRH2k5lD2PedP6Xzt73zuwTHX3W4D34eDxWXUQpPyAkc
KIhMakmCZf6XpKzXkOKZ0TVtMgUEeVYHswaG/RVaVR345QJd3oDGnTDQw4zvNwOV
zytj6kA2XkRs1LFZOeRVpeJAeXRZw3YOLeKp3GG+deXE7uinYnYC3mvlogI8foRh
IRsB1cK2JYp6rMPJyrpyybkui7wckfUWRknBTA9497fLBjpbl/fdlt2/oqSMpio=
=xR/y
-----END PGP SIGNATURE-----
--=-=-=--
