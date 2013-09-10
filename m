From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Tue, 10 Sep 2013 18:41:13 +0100
Message-ID: <20130910174113.GB4708@sirena.org.uk>
References: <1378491435-15624-1-git-send-email-broonie@kernel.org>
 <20130910173548.GA18878@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51051 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911Ab3IJRlU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 13:41:20 -0400
Content-Disposition: inline
In-Reply-To: <20130910173548.GA18878@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2013 at 06:35:48PM +0100, Mark Rutland wrote:

> It seems far more sensible to me to mark devices disabled by default in
> shared dtsi files and then okay them as needed in particular dts files.
> I'd be happy with more of this.

Yeah, me too - though only for devices that have an external impact, for
things that are internal only (eg, a crypto engine) it makes sense to
enable them by default since they should normally be usable regardless
of the system configuration.

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL1m2AAoJELSic+t+oim90tkP/RT+a05HwQwaHjU5j9VdguDI
H8o1HS53Vm5dYV0aSdXuhaZtgfX39VovpNiwm2urHyiqLYZla8/K/I/vRd9u1188
vMlfGjYyhOjoOh3oZQMVbIKoWhhl/JXY1hRxhZtRFvYsC8rBgAo07LOOUIkBzwC1
LufNN0LPeFJlzyFn6Ebd+fhKZA52VZeGiIkPBZIJL0mQO2r45mbWB+hGmAAe84H6
xlAfHQS6dkL0x0oYnTVmrWezLAUuGtx7kwtCSYvFl6S+2OD1I3NXWmNBYiQTaPRP
A3xeXMevxNyRFZc1aZQqQWNICHWK5GE++DZUeHNsEquM1J38QB4L/CYBxqDwTqQW
p1fGUS3w4SDKgg7Frss5wERSviLOhJf8raNNb1FIG4uD1iaLZMmpLnZoLM70L5FZ
hSskjfkmITdOsQmsl0ga4aRa8e6O0ATfYSWWDxqlElTxPxpNVZHzK0tOD2CTpenQ
eRs8YOj1RmPLJlJ4iYgJl1Fu22/c9HyXVK7h6k1CChfqXLtfsiEoJTz2aNeBcxZB
8qbnmp20SOqkonpdFkb69sURICyH4BGmmngEfHb6RxZS1P8Qc+uxFaOKNeXB9FtL
B7vrNMU6frj2FUv7IcmesMVLgz0rOjDzy8lHusk7ww/YdIYcPfIz+yF3u608ApZN
1uV9W8Coj126o4ub6RsZ
=aBGa
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
