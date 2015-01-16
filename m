From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/3] regmap: Use the enhancement of i2c API to address
 circular dependency problem
Date: Fri, 16 Jan 2015 18:36:35 +0000
Message-ID: <20150116183635.GH3856@sirena.org.uk>
References: <1421419194-1849-1-git-send-email-p.osmialowsk@samsung.com>
 <1421419194-1849-2-git-send-email-p.osmialowsk@samsung.com>
 <20150116162314.GB3856@sirena.org.uk>
 <alpine.DEB.2.10.1501161811280.21618@AMDC1262.digital.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1501161811280.21618-rWxBz+Dn3+580y0nlK0+ubjjLBE8jN/0@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Osmialowski <p.osmialowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2015 at 06:36:14PM +0100, Paul Osmialowski wrote:
> On Fri, 16 Jan 2015, Mark Brown wrote:

> >I don't know what this means, sorry.  I'm also very worried about the
> >fact that this is being discussed purely in terms of I2C - why would
> >this not affect other buses?

> I tried to open some gate for further extension to any bus that is used for
> regmap communications. Currently it goes down to regmap-i2c.c since I
> enhanced i2c API for this. Anyone who feels it is useful or saves oneself
> from locking troubles can voluntarily adapt other regmap-i2c.* places (as
> needed?).

> My whole point is that I proposed a way to solve nasty deadlock which is
> better to fix than just leave as it is. I got a feeling that situation I
> adressed here may occur others too, so I proposed this extension that allows
> future adaptations. I don't expect it to be accepted easily (i.e. I'm new
> here and have mixed feelins about proposing changes that go so far),
> therefore I prepared other solution for this particular deadlock that occurs
> on this particular device.

What I'm saying is that I want to understand this change from a point of
view that isn't tied to I2C - at the regmap level what is this doing,
I2C is a bus that has some properties which you're saying needs some
changes, what are those properties and those changes?

> >>+	void (*reg_unprepare_sync_io)(void *context);

> >The first question here is why this only affects synchronous I/O or
> >alternatively why these operations have _sync in the name if they aren't
> >for synchronous I/O.

> IMHO this whole idea is against asynchronous I/O.

Can you be more specific please?  If something needs preparing it seems
like it'd need preparing over an async transaction just as much as over
a synchronous one.

> >>+	if (bus) {
> >>+		map->reg_prepare_sync_io = regmap_bus_prepare_sync_io;
> >>+		map->reg_unprepare_sync_io = regmap_bus_unprepare_sync_io;
> >>+	}

> >Why are we using these indirections instead of assigning the operation
> >directly?  They...

> I followed the pattern used throughout this file.

Not in this pattern where the caller needs to check too.

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUuVozAAoJECTWi3JdVIfQbYAH/ix7oPKXdufia6/f1X0FOCBc
Vs+T5D2wsvooUXEJclL9QA4Vfz2ICeXS90RWUAlGaXWaPJbjD0Y/ywRKpvCUQLlQ
b0pVakfzjkbcPHcFZvmXuRtreFI7J6BfyJKAShpXWFN6ECTbalMWWMdhagmvpOJM
GBEdiXme90MK6jUvyL+yr6P65SV5LqW7heYikkxaAMXX2CoUjAcbxwNTWZbBQA7y
IRF6sYcjvHXEsi3yII4QXx4CWL1ZBY1qCM7DnzalpB8dOFSY27NbD5is1mZaL7tv
3cpJfV1gBByTUDTR462t/hNxb5swq4pxiDnjFd9cKP6a0XMqkMOXZNn41FLz3m4=
=fuPx
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
