From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 14:49:37 +0100
Message-ID: <20140908134937.GK4015@sirena.org.uk>
References: <20140905115704.GO13515@arm.com>
 <20140905122232.GP13515@arm.com>
 <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk>
 <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wZdghQXYJzyo6AGC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57142 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751781AbaIHNuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 09:50:05 -0400
Content-Disposition: inline
In-Reply-To: <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Stephen Warren <swarren@nvidia.com>


--wZdghQXYJzyo6AGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 08, 2014 at 01:20:11PM +0100, Grant Likely wrote:
> On Mon, Sep 8, 2014 at 12:21 PM, Will Deacon <will.deacon@arm.com> wrote:

> > Whilst I'm sympathetic to people working to enable DRM, I think this is
> > the right solution to the problem. The transition from simplefb to DRM
> > shouldn't break display for a bunch of kernel revisions whilst the code is
> > in flux.

> I would go further. The kernel behaviour has changed, and we have to
> deal with platforms that assume the old behaviour. That means either
> defaulting to leaving enabled regulators/clocks alone unless there is
> a flag in the DT saying they can be power managed, or black listing
> platforms that are known to depend on the regulator being on.

For regulators there is essentially a flag in DT already - the
regulators should not be described in DT if the OS isn't supposed to be
managing them.

> Updating the device tree must not be required to get the kernel to
> boot, but it is valid to require a DT upgrade to get better
> performance (battery life) out of the platform.

This has got to be a blacklist then, and it seems like we've got to fix
simplefb to actually support managing the resources it's using.  The
current plan does not seem at all sensible - we're talking about adding
hacks in every subsystem that provides resources and bodging DTs in
order to work around simplefb.

--wZdghQXYJzyo6AGC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDbPwAAoJECTWi3JdVIfQe60H/0Xh0CCNufK362TTDmZ3bSN+
6K7hBMQ/7quCdPZFeW3W3SIxd4omZCgytJIePlYi/59qbXSED1d+kWazIcHSpOs1
VGS/aD8t/qwYuTmmTXdYK7nnC+YT3XT55sNA8nG8l9QfOjiwktWe/fo2wJTlHp5W
z5TreVpNixDcYedYXstuKpNXnerMz97gLJ+DJA1Cz4kiZM5s5/sYefLs8jJWRS41
WQ5wbA/qt7BdDt8R68fIQA+DXXoQnUHRJY+LpFyfstM3KX0f4OFr3HCqECkeT5gv
ttdFxl3ziFmjJVQjEzlTj+/kJCNPJ0oCiGN702mdGn+BUbPJGfW2nVDDph4ZZuw=
=cjyz
-----END PGP SIGNATURE-----

--wZdghQXYJzyo6AGC--
