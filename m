From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/6] ARM: s3cxxxx: Use PWM lookup table
Date: Tue, 6 Oct 2015 10:43:04 +0200
Message-ID: <20151006084304.GA22087@ulmo.nvidia.com>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
 <561315C2.9040506@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:35470 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbbJFInI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 04:43:08 -0400
Received: by pacfv12 with SMTP id fv12so208203406pac.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2015 01:43:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <561315C2.9040506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 09:28:50AM +0900, Krzysztof Kozlowski wrote:
> On 05.10.2015 21:47, Thierry Reding wrote:
> > Back when the PWM framework was introduced the concept of PWM lookup
> > tables was added to allow board code to register a table of PWM devices
> > and their association with consumers. The goal is to allow drivers to
> > use a unified method to request PWM devices. At the same time, since no
> > boards were exposing these tables, fallback code was kept in drivers to
> > allow old code to remain functional. In order to get rid of the legacy
> > fallback code, legacy users need to be updated to register PWM lookup
> > tables.
> >=20
> > This series converts all s3c24xx and s3c64xx boards that hook up a pwm-
> > backlight device to use the new PWM lookup tables. All patches have been
> > compile-tested, but I don't have access to any of these boards, so I
> > couldn't verify that they really work.
>=20
> Unfortunately I can't verify them neither. I don't have these boards. In
> that case I would prefer approach "if it ain't broken, don't touch
> it"... unless someone tests the patches of course.

Backlight on these boards is likely to be currently broken anyway. In
fact this series is part of an effort to restore backlight support for
these legacy boards (I sent out a similar series for PXA boards).

We're going to need to have this series merged so that we can remove the
legacy code that's being a lot of trouble maintaining. If this series
ends up breaking anything, I'd be happy to help fix things up.

Thierry

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWE4mVAAoJEN0jrNd/PrOhERwP/3GMtdMrw055GiJ9laC+r5Pi
1Fhe9LMGoXa+t/UqbKQikrMoL1MRE/lz6+QpQKGByHJKdbh9Lc8iqHrcGFpvVDe+
FR6l6Qh1gUQoEF/Z4vL2oqS2k++HOquH5JJ7N5pEIM0r107YfrNAsEqbD8ylU7gP
4Xzxzoc1RIGAkls4tE/mItZI+vRqdBBFU9uhbEkV3fLJc+mcXglLJ1mJAcOfPSNr
1NTGa/Bkez5IbkH7U8BGBD/2p98twH4Ml/ll9Am/5PpKXFwelPKKL+pc5ic0sn3/
aumFmPKEVOjRPPRDwQFLFl6Zb/kjO1roPMRCADCbeOxGJ5OOyzPp2H7M3NzsGTdS
bbFtfBMAnlMjI/SEX3fUadySQpO98u8tmOq/fZDJLnAf16LiWaL1iAX7Fk2iGuch
FdgZ8vZpX0L3WfCIxoulYwQ8cj8LjTOpR6ZiDxw5QooqcE8G/7VFitWuSY8SdibJ
BVgfhkaIjOXY9QCLUNT1MLilmWizrB1SIjk2Iz1xmM/NTdA3yrIMdk+uoEUapKl1
GI8uCzK6vAmC8799TwVL541+L1YrjuniBK/BXYis/FNPhJw/MHvXt+hXeugThHar
JmaTbgphdT0vpU4QMS4T4A+XOzOaS5XTYFrjDpAkfCOpNNqALgPg2XevGiR7oPsk
3EG1ANpyeqXzDvvKbzg9
=n4zE
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
