From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 11:20:10 +0100
Message-ID: <20140908102010.GF4015@sirena.org.uk>
References: <20140905115704.GO13515@arm.com>
 <20140905122232.GP13515@arm.com>
 <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk>
 <540C7F5B.6070307@gmail.com>
 <CAD=FV=UYDDhL02CrhPUAHPncepwAF2-BgTmXOamy-Mdz80S-vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56847 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990AbaIHKUc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 06:20:32 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=UYDDhL02CrhPUAHPncepwAF2-BgTmXOamy-Mdz80S-vw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Will Deacon <will.deacon@arm.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 07, 2014 at 09:36:56PM -0700, Doug Anderson wrote:
> On Sun, Sep 7, 2014 at 8:52 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> > So I believe we've got a process issue here. If you don't have normal
> > support for display hardware, but you want to keep the display
> > operational thanks to bootloader already initializing it, you should not
> > add anything to the kernel which breaks it, until full support comes in.

> > This means that respective regulators should be either always-on or not
> > listed at all (I'd favor the former) and respective clocks either
> > somehow enabled at boot-up or completely ignored, including all their
> > parents capable of being gated.

> It seems slightly broken to hack the device tree in this way.  I'll be
> the first to admit that I often list regulators as "always-on" during
> bringup when not everything is done, and I guess it's not that
> different.  ...but given everything going on upstream (and people
> working on Suspend/Resume, DRM, etc) it seems like it might be a bit
> of a pain.  ...but if that's what everyone agrees on, I won't disagree
> too strongly.

> One (ugly?) solution would be to add a feature to your bootloader to
> modify the device tree to mark regulators as "always-on".  Since the
> booloader gets to touch the device tree and the bootloader is involved
> in communicating into about SimpleFB, it kinda makes sense.

That would seem to make sense, yes - we're apparently communicating this
as a virtual device so we should make sure that virtual device has the
resources it needs either directly or by reference to other devices so
the driver can keep them on.  Ideally we'd be doing this with fallback
compatibles or something but this will probably work OK.

I'd expect we're also going to run into the same problems with what
people are currently doing with the SoC power domains, we also have code
to power them off when they're idle, and this whole performance with
adding hacks isn't going to be robust or scale - it's essentially just
praying that nothing turns off the resources we need as far as I can
tell.

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDYLVAAoJECTWi3JdVIfQqYcH/1Y8P1yHUXsXl9+i/gpw/YZl
+cmprPAOccDqakra3lB9BUGU5ftE4QkJHZVTEMrTuLU1otHI/hMcwlxfSicsFDM2
skOL3iAa2oyF5KpIIEaiSst6DPWr+fNs78CHekzx00CFmjMD+HxRjdgTKKgK/Jpi
qQRyQBUldRmEzgapiQG4wh+CaZ3xsop4rv2yQSXtBQ7RzQDzPCT6E/a/BYkqkfdC
XKDykQjadBA5uIUFYG4PAg0s/XV8Y2DY0gx+BXoYfog+zCxpQeo3t9ZMgoOTJuvg
0F/RnJO4u6Wzd1r/7JKPkh2aNVerU/4P4KJjCqNJ21PUtIxlr+x09TiA0Ef3GSw=
=W6Tx
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
