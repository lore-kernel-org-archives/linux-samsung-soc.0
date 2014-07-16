From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi: s3c64xx: move "cs-gpio" from subnode to SPI DT
 node
Date: Wed, 16 Jul 2014 18:09:05 +0100
Message-ID: <20140716170905.GT17528@sirena.org.uk>
References: <1405426860-18404-1-git-send-email-ch.naveen@samsung.com>
 <1405426860-18404-2-git-send-email-ch.naveen@samsung.com>
 <53C56520.8030801@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40510 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934006AbaGPRJp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 13:09:45 -0400
Content-Disposition: inline
In-Reply-To: <53C56520.8030801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 07:30:08PM +0200, Tomasz Figa wrote:
> On 15.07.2014 14:20, Naveen Krishna Chatradhi wrote:

> >  	/* The CS line is asserted/deasserted by the gpio pin */
> > -	if (sdd->cs_gpio)
> > -		cs->line =3D of_get_named_gpio(data_np, "cs-gpio", 0);
> > +	cs->line =3D spi->cs_gpio;
> > =20
> >  	if (!gpio_is_valid(cs->line)) {

> This check is wrong when native chip select is used. However I'm not
> sure how to distinguish this from a situation when invalid GPIO was
> specified, because cs->line will be -ENOENT in both cases. Mark, any idea=
s?

Hrm.  I'd *hope* that of_get_named_gpio() would distinguish between the
property being there but unparsable and the property being absent.  Does
it not do this?

> > -		if (!of_find_property(pdev->dev.of_node, "cs-gpio", NULL))
> > +		if (!of_find_property(pdev->dev.of_node, "cs-gpios", NULL))
> >  			sdd->cs_gpio =3D false;

> What is this boolean flag used for now? If cs->line now either contains
> a valid GPIO or a negative error, why gpio_is_valid() couldn't be used
> on it? I believe it was done correctly in previous version.

We ought to handle the errors differently depending on where they came
=66rom - an unspecified GPIO means use the physical chip select but a GPIO
we fail to obtain is an error we should handle.

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxrGuAAoJELSic+t+oim9LwoP/R8wzPlGpAG2STM+UebYlxVk
nSXWfKaaykxsMY0nZqR7F8AmqBhiC9EX0OGSRWFtcs/xH+AbRhEHsx8VtP8oqQz3
SjhauMBHQcdNC7sYHD+8gle8gNtqYJ5K52a76dy248AzBs5w9NtHSm/Bf14zb2Td
stKw9ypAzR7bDBa6S1i72apua7cELovpRkW3vFPv+hs0R0dban/ohg9MDblxMMkw
yHGS81mRWP/tx6z39/v0JiOaQ2U6o8mJ/bKMalhf0JWderInBU3Ym3bheDY+Fpk0
V/YEuT++944ztci2N9s3E09CdnlNwEIdH0evT0O6RWh6Yu/7jW53Jm6AdeX2U0lI
foKQAI+noQVIunOZNDJW9R/MGQycZpfAsLJmDK70WIgdhu6/qKWU0cNaB69AKU58
pnXcYFBMXVfKCt+Lnmvo59ibRybJFsqps/s0O3Cnq2N7Eb7cOLBU6ULc+DY1TGXz
QD9rf602rBUI8h9tFFGDtF2vAM5Skkfk2E7uDsfuG9877JWtmOBMxEZ3KPzXIb0Q
olM+Pi2kQndtDt3/IfnJwEO2uykTH9FQjf5FMlvjOnYYYrMHwJk0RHFmSIYIeZ0q
O17hoM5FcQiW57zE1eL1ab1czE+icnjMMLmoWfM/Q40k6QjBDvlnH970bCMQPYe4
o8FtDxzUibIe184OFfXi
=J8YI
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--
