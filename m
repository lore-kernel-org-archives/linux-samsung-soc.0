From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 06/10] ARM: EXYNOS: Add support for mapping PMU base address
 via DT
Date: Mon, 07 Apr 2014 08:02:23 +0200
Message-ID: <53423F6F.5010504@monstr.eu>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com> <1396425058-4012-7-git-send-email-pankaj.dubey@samsung.com> <533BF905.6070701@samsung.com> <533BFF69.1060701@monstr.eu> <533D24D6.2030103@samsung.com> <533FE1BC.7050300@samsung.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="gSAAimj8V1TXmNtGpKOHiBX1WX7LpFTmI"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:41352 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbaDGGC1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 02:02:27 -0400
Received: by mail-ee0-f52.google.com with SMTP id e49so197714eek.25
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Apr 2014 23:02:26 -0700 (PDT)
In-Reply-To: <533FE1BC.7050300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gSAAimj8V1TXmNtGpKOHiBX1WX7LpFTmI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/05/2014 12:58 PM, Pankaj Dubey wrote:
> On 04/03/2014 06:07 PM, Sylwester Nawrocki wrote:
>> On 02/04/14 14:15, Michal Simek wrote:
>>>> There were some patches posted for syscon to make it available in ea=
rlier
>>>> system initialization stage: https://lkml.org/lkml/2014/2/19/218
>>> I haven't finished this yet. I have to look at it again.
>> Thanks for the information, I assume this would be also useful
>> on the Exynos SoC series, so I'd be happy to see continuation
>> of those works.
>=20
> It is useful for Exynos SoC series and I have modified this patch serie=
s to use early syscon
> initialization API and I can see it's working.
> I have some observation for early initialization of syscon API which I =
will
> update in corresponding message thread.

Great. Please update that thread we should finish this implementation
to be useful for everybody.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--gSAAimj8V1TXmNtGpKOHiBX1WX7LpFTmI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNCP28ACgkQykllyylKDCEAygCfQXdUMqZAYvviJyhWQsglE87a
8xQAn0dkthqUz7uIx9Hm99SxWewBojNb
=mtGD
-----END PGP SIGNATURE-----

--gSAAimj8V1TXmNtGpKOHiBX1WX7LpFTmI--
