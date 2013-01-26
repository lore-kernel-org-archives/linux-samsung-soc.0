From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration
 implementation
Date: Sat, 26 Jan 2013 13:00:06 +0800
Message-ID: <20130126050004.GC10580@opensource.wolfsonmicro.com>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
 <50CB4E99.9060506@wwwdotorg.org>
 <20121215142135.GB22033@opensource.wolfsonmicro.com>
 <20130124111329.GC12933@pengutronix.de>
 <20130124111845.GO4955@opensource.wolfsonmicro.com>
 <20130124113948.GD12933@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130124113948.GD12933-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 24, 2013 at 12:39:48PM +0100, Wolfram Sang wrote:
> On Thu, Jan 24, 2013 at 07:18:47PM +0800, Mark Brown wrote:

> > A read is typically implemented as a write of the register address
> > followed by a read of the value, usually with the ability to free the
> > bus in between.  If two devices attempt to access the register map
> > simultaneously this results in the address going wrong.

> Could happen. But in what situations will one not use repeated start
> here? Especially when designing a multi-master bus?

Well, you're depending on the specific drivers doing things that way and
it's actually quite rare for the controller drivers in Linux to support
I2C_M_NOSTART which discourages this.

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRA2LNAAoJELSic+t+oim9Rm8P/RraYYLd7Gsa34rGslUs9cvB
NKcRmKMf3Mq0Z/rUVJKnKp6E8M9qyL8qDgx6Xw5QVnxO8qrP8UOAvxJEAG55OYl0
6kAkYqTg0f536N8kWv4X5NtdHp5lFUWSj6+llHtJTUsSQ+UhSxON79UBk1phZi9v
DTq8UE2Z1SyoOtCRpwb1403qOX7k4eqM9/yCUuNfbGEM0k/woRSGS475VoFGtU//
b5xpxqQ/pF3JJpdXRWkgI62LAcmfiYQU8TiiJWMI0CBdIyzhQfVsQyvkf/nysFOn
VzAEFMnc0xbWCQtBjULPgkiNgemAtYWAsAtlT7TqsfTXAKfXp4a/ZRWNGt9UcRYg
z8mTP1N0oKGYrgbOdIjKUyrv8ROFG95iYCgOlW2MQqZ+fQ496oTtjsZdndrhAkrg
q6qXpn7Pi7xNb1hvGCmEK3pwaIpOLfHAHyYxUk83G2vBra+SCwQkHztLAaciY/8M
OG0EUvOlRHLerJm/O1ced/VgqANhhXRFj6VYyIrnFODaAcITKMTBaOx+bpoTZP7X
3836BW18nxAGFG616zG5n0O+gsxXywFKYUSXWEjHL2MiIKXN20Pt80uIkfzPxORZ
B1xD51YgYsMsGuZ8gttQlLcAjavxH42AV6Oiuu5V1MxS3pLKpYfK2AIsutL3rcXk
+IfvjVaLvFstxEA6k4tD
=A9mH
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
