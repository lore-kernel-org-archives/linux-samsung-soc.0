From: Mark Brown <broonie@kernel.org>
Subject: Re: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 01:42:02 +0100
Message-ID: <20130816004202.GA28985@sirena.org.uk>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
 <13b101ce9a14$2cebd700$86c38500$@org>
 <20130816003557.GJ30073@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45240 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752540Ab3HPAnJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 20:43:09 -0400
Content-Disposition: inline
In-Reply-To: <20130816003557.GJ30073@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2013 at 01:35:57AM +0100, Mark Brown wrote:
> On Fri, Aug 16, 2013 at 09:04:28AM +0900, Kukjin Kim wrote:

> > NO, the build breakage is due to commit 6187288f15bc ("ARM: dts: exynos5250:
> > move common i2s properties to exynos5 dtsi" which is in Mark Brown's tree.

> > Mark, pleaser revert it in your tree...

> I'll do that but I don't know if that's then going to break anything
> else.  This sort of bisection/cross tree issue does come up a lot with
> the Samsung SoCs - it'd be good if you could remind the people working
> on them about the need to make sure that when there are dependencies
> they're handled when things are merged.

I also had to revert "ARM: dts: Change i2s compatible string on
exynos5250" from my tree since it depended on the above commit.  I
suspect this may leave the driver broken and we'll need a new version
before the merge window...

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDXVWAAoJELSic+t+oim9LjoP/25ApnsVTtpkbAbipWtAOeQ9
qu4vreg464ZGTqo9k0/GqGj09X49eSOEt72Iui9JiUuUFrG+LB53dwtQ6fBW6bB0
eUfLvWTTXz0tasnk0kXHHicoxe5zAcjwnjduF2bdU8bvhKezfNeY0MDTv5tcO0EK
02UudSS//RmGXisEdIGgZxQAvlK5r63rvEk3si0oDCw50DAdfq9YjHVM89dihgzw
LXgBWQTJi0FVOTq7QCS+yKPP9MFbm3g8LDHlu+K7WOrIlpc/GlDV/700VXBHhFW/
nnjCVeoMwR7GQAIMuepjlQ3wsC+ZoDzYO9DDcHpMjYhH9hx0SmM2ZTt9AADVe81R
zUsYlPmIH5bft+htJhRbRchhpqOMaGIVb5+awGNmQ0mEisTBV2j6f5Sr6K1fuhFU
DCh4SqGSxLO/F7KMRpLO8xGIWPlR7cL7ZOasoV0wX9nDDR9Taw63Bv6vkUDzmQA/
OjqgpWOkK2oA6bVTbJqVmfdvGYWjISNVhWDBfBSGsTvtV0NrDSnGl5Ygb0GJDs71
RJ3PhH2m1bro45lY69ycdx2ZLwqjTmm1+MNU0yqFZ7XP5Tkxy5P+1oSPCQ9HuNTs
jT0SYI5Fo4VM09KdcRbX+3UJozK8z4xZTfqnHypAuvtMwvXt8EmTfwIYAHAHsgho
IP6b+q/uGgC+I7+pGp18
=pvuV
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
