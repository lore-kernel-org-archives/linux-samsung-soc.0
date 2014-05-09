From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C
 controller early
Date: Fri, 9 May 2014 15:54:25 +0100
Message-ID: <20140509145425.GP12304@sirena.org.uk>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com>
 <20140424162558.GB12304@sirena.org.uk>
 <CAHfPSqB5+mLiC07jbEpeUgW63pZVk700SkYGxToO7GRAsFm_nQ@mail.gmail.com>
 <20140509135153.GM12304@sirena.org.uk>
 <CAHfPSqDSTyQXPT-NCZ2hE01qpdmaR54tbWCUYC_zSDGFp58+7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G/DxHU2WzS4MrbHf"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHfPSqDSTyQXPT-NCZ2hE01qpdmaR54tbWCUYC_zSDGFp58+7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--G/DxHU2WzS4MrbHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2014 at 08:12:47PM +0530, Naveen Krishna Ch wrote:
> On 9 May 2014 19:21, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, May 09, 2014 at 05:50:00PM +0530, Naveen Krishna Ch wrote:

> >> DRM related drivers like DP, FIMD, HDMI, Mixer wants to be probed ASAP
> >> during the boot.
> >> The real problem comes when, one of these drivers do a regulator_get().

> >> If the physical supply  is not enabled/hookedup the regulator_get() call
> >> assumes that physical supply is present and returns a
> >> "dummy_regulator" (But, not an error).

> >> Because of which, Display and several other devices fails to work.

> > These drivers are buggy, if they geniunely expect and handle a missing
> > supply then they should be using regulator_get_optional() to request the
> > regulator and even if they don't the use of subsys_initcall() is not
> > going to fix anything here - if a dummy regulator is going to be
> > returned the time things are probed won't make a difference.

...

> If all the I2C, SPI, DMA, I2C_TUNNEL, DRM based LCD are all mod_probes()
> DRM drivers are probing a head of the PMIC probe. Which is causing the
> display drivers to get "dummy_regulators" instead of the real supplies.

No, it really won't - I have no idea what you are doing but it's not
mainline.  If you are getting dummy regulators then you don't have a
supply present at all and probe ordering isn't going to make a blind
bit of difference.

Please provide a specific technical description of the problem you are
seeing in mainline.

--G/DxHU2WzS4MrbHf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTbOweAAoJELSic+t+oim9qmEQAIBgTYCj60m9MycyLdqiu1x+
jZERq9chAR4ARa1ga781Hz2p9J+vbRFw7wJQkpn38DjMY3s3dK5T6BQ8g3zEydn6
C21FAOQFiomQJqs2wPQgUxoYFQQuwbhLci80GIsCkbU4gFRGHpKraEyXqPtq45cf
V4Mb8FWkAQZ7xF5LsdtqWDhzdiHon1XKc5CT3WIt+Vnny21O6OQDc0i6FDpC6M6K
4fKLDJ3ZPiDATR6IBjtns/erw2FrWvivNTyzwCKMPGnu5UGZ+2jNngcOZJybtDhJ
zr5phiJfeFC01jMUo7SWs44YB55bx3SF8r81agvq6gagDPifL6jKoconxLJRLhLq
IUuOv43fqfWhjLRQBmpERdO/YDXYY0wTdhRbpwY32qxSX+UWRxJPGJFEhqLfEkp0
v1j5xvyQmZHQ0076ppVtFI/8JBZjM58xah41gWKnDXlUWgE/Vvl6KaU2yh4x8h1T
jqNYuEgERl3mH5vCPa+SAMyLOS4GzYeRTX2KsJWMhi+rhopkvLN5JrakybgZD38C
iHolRU5hpn3MGBVYPeAWwTJvrwznEHfw4XUIvLTbB3h8XR95Vw8PIgxp4nVULXg3
OtTf5/IDeCuThuAygDxeR+RMMnRz5RMcxnc3DE+uFPdEE6UkJRhc+jH0wtCPXN9C
CHVao7NHXm9e9bCK++MA
=2eJK
-----END PGP SIGNATURE-----

--G/DxHU2WzS4MrbHf--
