From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] exynos: Support big endian mode in secondary_startup
Date: Fri, 25 Jul 2014 11:16:43 +0100
Message-ID: <20140725101643.GN17528@sirena.org.uk>
References: <1405958507-8606-1-git-send-email-broonie@kernel.org>
 <073c01cfa7c3$39ec6a10$adc53e30$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jOWcLJj2EpBZWei/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54334 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760034AbaGYKQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 06:16:53 -0400
Content-Disposition: inline
In-Reply-To: <073c01cfa7c3$39ec6a10$adc53e30$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Victor Kamensky' <victor.kamensky@linaro.org>


--jOWcLJj2EpBZWei/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2014 at 01:45:14PM +0900, Kukjin Kim wrote:

> Basically, I have no objection on this, BTW is there any requirement to support
> big endian on exynos stuff? Just wondering...

We've been using it for testing within Linaro.  I don't know of any real
world users.

--jOWcLJj2EpBZWei/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT0i6IAAoJELSic+t+oim9cbIP/jpaNewUE3ySU3reSCBE7OPW
VhT+2SVglinRLGQ6quEULnaDEzx6V8TAGNWlV+n3ZAw4x8gE+KVgVk2ctumSP2n7
P8LHI+E61jMIlwAru7pwBF+xjzZsU99LzJ3v0PNxyvqtOh4U98lWNw3ZReU9/KeR
mryZiOxsefQY3mY2YjnRgmbQCSP/+34UHMRuieYlhg1FGOK/pDvXmAYB9yUoyozz
ReD+WT0YoWK8+RXgsybv9zBOXf8Cbf5vDrbHIjcPfLssqTQTZyJQi3rNpgW0AVcK
EZJxv6TpcFTV/HqqXXwOLzclQM+x9855/SAK6+8vVKJxsgxEBa86edPcvlAnb+IM
xGEAONDSogqxX16IvYk/xJSOU7pZ6aML0yHKY7aOdFbKdtBmtpLbbO14WvLe0Clm
9H5hAZ6UfZGkSxdNr5UECj0KnDI2XetB7HTT5CoZdnCxAh+9t1KK1g+YB4Cei3Ee
H9HoHc2LMmOY8ny/i6cDo9H/p8U3/+n1SI5an/zWNjNfSah1RdAh1K3fmNavQghJ
+XFrQvnriK74E+7rAEDs7BPQUzpIdMollgmINBH2n6ScChbQ54bzi5NsdWnSY2y9
HzDAyjLsoi+IIzw7FCyMCLI9w+zdpjQsoPprb/6z46oDvZY1pURs5QwYM1Rx1V7l
bndpn1CH7fHXWmvucHFt
=ybbU
-----END PGP SIGNATURE-----

--jOWcLJj2EpBZWei/--
