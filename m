From: Mark Brown <broonie@kernel.org>
Subject: Re: XCLKOUT in exynos5250 clock driver
Date: Fri, 26 Jul 2013 15:27:24 +0100
Message-ID: <20130726142724.GG9858@sirena.org.uk>
References: <20130725145158.GI9858@sirena.org.uk>
 <51F247B6.9010902@linaro.org>
 <51F2695B.8020109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EQULBRs4nj4AMCRW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60289 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755806Ab3GZO13 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 10:27:29 -0400
Content-Disposition: inline
In-Reply-To: <51F2695B.8020109@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>, Padmavathi Venna <padma.v@samsung.com>


--EQULBRs4nj4AMCRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2013 at 02:19:39PM +0200, Sylwester Nawrocki wrote:
> On 07/26/2013 11:56 AM, Tushar Behera wrote:
> >On 07/25/2013 08:21 PM, Mark Brown wrote:

> >>I appear to be missing something in the clock driver for the exynos5250.
> >>I'm looking at the Arndale schematic and I see that the audio master

> This is something that's not yet supported in the mainline kernels I'm
> afraid.

I was trying to be polite :)

> I suspect that the same, you can easily verify that by checking what ball
> identifier corresponds to XCLKOUT pin and how the routing looks like on
> the schematics.

Right, for what it's worth it's ball AJ27 marked as XCLKOUT/ETC6_1

> We have a bit hackish patch that adds support for the CLKOUT at the
> Exynos4 clocks driver to enable the audio codec. An issue here is that the
> CLKOUT mux and divider control bitfield is in the PMU registers (as opposed
> to CMU where the clock  control registers normally are) and additionally
> single register contains the clock mux/divider bitfield as well as couple
> other unrelated control bits. Depending if those other bits are considered
> really important or not it it might another reason to expose (part of ?)
> PMU registers through syscon-like interface. There are registers in PMU

Sounds like it'd be a good idea to do that if only for the purpose of
describing things clearly in the DT.

> It can be seen in the Galaxy S3 kernel code how the Exynos5 CLKOUT handling
> might look like. See enum xclkout_select [1], exynos5_pmu_xclkout_set [2].
> It would be good someone who has access to the datasheet come up with at
> with some patch so the audio works are not blocked. I'm not working right
> now on Exynos5 :P.

I suspect I can reverse engineer something from this, though it would be
much easier for someone with the datasheet.

--EQULBRs4nj4AMCRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8odJAAoJELSic+t+oim9h6QP/Am4LAAkH/pOQ/Ql5eplQVs0
KUKf5W5i2WGOG98P8668oeDeT6Z807QxwCeGTC1pMAORxXqOj7+3UlqqYf7mUZJw
v3l6C+IOlXC0K8SDjHoQwF9kvNgig40PL2ntNShxTDs8l09+PGKMxJqKSnXuOhSY
4TAMAl4s7dpA98sDwDSb4ek+hDP+bMe+TrChKEICV9LBbfpjsrx6ZcVKBViB54PG
SgXOLX3Z8/5QIaFcpWSFb/b2MP2KAAVfs247XlVZGB2lMqldmjXxyE5RWHD3Pg3o
tKRlo3gkvaZfAeV2Zl4bWLIldsN88F8XCOOm5pMzdarnGxESWwls6p0QC21+iXyr
wpE67i0rG3ZkAXU5a6hPWbmouBW16/bMMYdQa56Eradk+Z1BiLRWvF5R0npC9B/b
JEgQ8toWp+dt7rwhlTEyY2kuQZPqYtzQU22NjaPvG4yLZfM5+Fo2enkW7RUZ42Nt
f97wGjMHr0fHilxjB5T86/Q9AtBwFWTy6jmXUd/qh6gLkHdJZbNc/MoUvhkWoHG8
oz25W2nsZ4X5P/Q3fvHOyaQBsFlJ3rzwX9DTnrM1e/z9ip+L7QQC1slprSHMyghZ
/V3FUuMZ5R3bJ7OUmnFMdcDrGiN4qig9lZiDZ9Urug8W5m90VT/wNG0+N89q2eTX
MrunXGI5Tv0eZO5SZNEg
=ImDg
-----END PGP SIGNATURE-----

--EQULBRs4nj4AMCRW--
