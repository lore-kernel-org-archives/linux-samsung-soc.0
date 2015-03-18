From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 05/10] ARM: s3c64xx: enable sparse IRQ support
Date: Wed, 18 Mar 2015 00:02:34 +0000
Message-ID: <20150318000234.GU28806@sirena.org.uk>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
 <1425299763-4066822-6-git-send-email-arnd@arndb.de>
 <20150306174316.GA26692@opensource.wolfsonmicro.com>
 <6643361.dhtMagqMYZ@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xV/tcm3TpxxBlS6c"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51255 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752669AbbCRACx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 20:02:53 -0400
Content-Disposition: inline
In-Reply-To: <6643361.dhtMagqMYZ@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org


--xV/tcm3TpxxBlS6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 08, 2015 at 10:42:59PM +0100, Arnd Bergmann wrote:
> On Friday 06 March 2015 17:43:16 Charles Keepax wrote:

> > This one appears to cause some problems with the IRQs on
> > Cragganmore, I need to look into it a bit more but it looks like
> > one of the PMICs can't allocate its IRQs:

> > [    0.961455] wm831x 1-0034: WM8311 revision C
> > [    0.965066] wm831x 1-0034: Failed to allocate IRQs: -17

> > And the CODEC can't request its IRQ:

> > [    4.252735] arizona spi0.1: WM5102 revision C
> > [    4.269763] arizona spi0.1: Failed to request primary IRQ 263: -22

> > Hopefully I can look into this a little more next week.

> My interpretation is that I mistakenly set the .nr_irqs value for
> craggamore to include all irqs that the board has, while the
> wm831x tries to allocate the irq descriptors itself and fails if
> they are already allocated. If that is the only problem here, it
> would get fixed by this change:

> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
> index f395a5617142..cbe353a5450e 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -855,7 +855,7 @@ static void __init crag6410_machine_init(void)
>  MACHINE_START(WLF_CRAGG_6410, "Wolfson Cragganmore 6410")
>  	/* Maintainer: Mark Brown <broonie@opensource.wolfsonmicro.com> */
>  	.atag_offset	= 0x100,
> -	.nr_irqs	= S3C64XX_NR_IRQS + 160,
> +	.nr_irqs	= S3C64XX_NR_IRQS,
>  	.init_irq	= s3c6410_init_irq,
>  	.map_io		= crag6410_map_io,
>  	.init_machine	= crag6410_machine_init,

> The samsung-gpio driver does not allocate irq descriptors for itself
> though, otherwise we could make the S3C64XX_NR_IRQS number smaller.

That's not the only thing, I'm still seeing an issue even with the
change above.  The VICs are also complaining about preallocated
descriptors, but they just assume the descriptors were preallocated and
carry on happily.  I'd also expect this to be affecting both wm831xs but
it's only affecting the WM8311 on the base board, not the primary
WM8312, so this seems to be a red herring.

I rather suspect that the issue is at least partly that the interrupt
numbering is off - the CODEC has 24 interrupts allocated to it in
crag6410.h which is nowhere near enough and the PMICs have 32 each
rather than the 58 they need.  This is broken for the existing code too
so we should get a fix to make that right in before anything else.  A
trivial change to fix that doesn't seem to have helped though but I
probably just miscounted or something.

--xV/tcm3TpxxBlS6c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVCMCZAAoJECTWi3JdVIfQcGwH/0ojyEH2DYpa37/C9UrgXpVF
kNiLkTYA3b198GxTopYXCu5dGkrgyKuqVcrwYTIPo1t8FHM26XCwqBQkVpMJJ1J8
aOKZjCyWMca0xwHe8NieqXkmR3cDSI7LWbC9FY9YIKwsLitLsJ5IYrGEkcZw+K9X
C22IaFbJ1tZlr8wLpVfKRX2ADY5jmVOUBD/gm0fUkh7Qm5Abr5pQ73PcbB/A0aI0
OQDG+GD54J6n49VLEciWea8G/wIew5mvefhSM4QwkrmHWeCqV3/kO92Pyr5+2C18
PgHuXRRyNo+f1l5CjrettxamMqqlleOKINaaC5LA1pr6n4o2J7QNpZxdLIkNIqc=
=SYKd
-----END PGP SIGNATURE-----

--xV/tcm3TpxxBlS6c--
