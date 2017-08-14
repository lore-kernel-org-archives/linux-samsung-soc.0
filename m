From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Mon, 14 Aug 2017 17:35:45 +0100
Message-ID: <20170814163545.ofhjvl4tk7imeozm@sirena.org.uk>
References: <1501746323-5254-1-git-send-email-m.purski@samsung.com>
 <5485864.0NeJDQRaQs@avalon>
 <4d5ac06c-d396-b489-65d0-a975edf6db61@samsung.com>
 <35788498.IS2VIdUVsa@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wy4rqomatajzt4d5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47340 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751819AbdHNQf6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 12:35:58 -0400
Content-Disposition: inline
In-Reply-To: <35788498.IS2VIdUVsa@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Maciej Purski <m.purski@samsung.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, krzk@kernel.org


--wy4rqomatajzt4d5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2017 at 12:00:43PM +0300, Laurent Pinchart wrote:

> (now CC'ing Mark Brown with his correct e-mail address)

This is a *lot* of quoted discussion...

> > Okay, I see no problem adding support for all those three supplies, but
> > I was wondering how to model them in the device tree, because from the
> > software perspective ALL power supplies needed by this chip are enabled by a
> > single GPIO line switch.

> > I see 3 possible solutions:
> > 1. Keep only single vcc supply for now and use fixed gpio regulator for it
> > as a provider. Add a comment that it fact it provides 3 different power
> > signals.
> > 2. Extend fixed gpio regulator driver and bindings so it will be possible to
> > have more than one fixed regulator controlled by the same gpio pin.
> > 3. Model VCC_3.3V_MHL and VCC_1.8V_MHL providers as "vctrl-regulator" and
> > use this VSIL_1.2 as control voltage for them.

> > Which one do you prefer?

> 2 would be best I think, but that's more work. Mark, what do you think ?

Just model them all individually and let the regulator framework sort it
out.  It's got the concept of shared GPIO enables already so you should
be able to just describe the system directly and the framework will
figure things out, and even if it didn't there should be no need to
change any of the bindings here.

--wy4rqomatajzt4d5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmR0VAACgkQJNaLcl1U
h9DfWgf/YyO1TK/xOp+1UU8jORvhHJ5pa+CCz4O+RdIyvX5xz3OR4RPRScMWHSeM
GvKtsXuWHqqBgt8/NnxagK9Vf8t9AocDQxrUquxFvLxOcV8DWEKJZdwVHKGNs6bK
hKqS+wDq4EtZzzZCzGsiiJI2/nBixpNeoorqL9sNs6VoUA26nCh9ZwhnNYmDnwNF
0b/4CKkQw9XwSYKw4m3QtyTod9RGjGamAI61A5tjWTvK25E61asURSkpClQoTRaJ
OPy8rrpmdnnZI8bj5mhM70jCxP0aQ8CssaPb2S1eoWxWYLcwda8ynuHlyuvhVPiY
1C9F+0tSKBCi1mU0nLzbuOlqwvKbKA==
=0Abd
-----END PGP SIGNATURE-----

--wy4rqomatajzt4d5--
