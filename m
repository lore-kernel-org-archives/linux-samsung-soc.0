From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 16:39:19 +0100
Message-ID: <20140910153919.GH7960@sirena.org.uk>
References: <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33214 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094AbaIJPj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 11:39:57 -0400
Content-Disposition: inline
In-Reply-To: <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2014 at 03:56:16PM +0100, Grant Likely wrote:
> On Wed, Sep 10, 2014 at 3:31 PM, Mark Brown <broonie@kernel.org> wrote:

> > As far as I can tell the problem here is coming from the decision to
> > have simplefb use resources without knowing about them - can we agree
> > that this is a bad idea?

> No, I don't think we can... there is a certain amount of "firmware got
> things working for us, and we're going to use it for a while" that is
> absolutely reasonable. simplefb is a good example, but there are
> certainly others.

That bit is fine - I definitely think it's reasonable to have things
like this where the device is initialized prior to the kernel starting
and we use some simplified subset.  What I think is a big problem here
is that we're not being told what parts of the system state are relevant
to this initialization (worse, we're being told things that are actively
wrong for some of the resources).  This seems inherently fragile.

> I /do/ think it would be better for the simplefb data to get embedded
> or linked into the node of the graphics controller so that it can be
> torn down appropriately, and we need a rule for how long boot-state
> can be considered valid so that a proper driver can either reserve the
> resources for a given SoC, or do a full handoff from the simplefb.
> Even without that though, we need to be able to handle the case of an
> anonymous simplefb node with no regulator information. If that means
> the default simplefb behaviour is to inhibit runtime pm on all
> resources until a real driver show up, then that might just be what we
> need to do.

I think saying that it's a good idea to have an simplefb node without
resource management is exactly the problem here - if we start from the
assumption that this is a good idea we do get dragged down this path but
it seems like we took a wrong turn going that way in the first place.

It's not just regulators - we've got exactly the same problem with
clocks on this system for example, they're also getting disabled because
they seem unused and users have to pass in a kernel command line bodge
to avoid that.  We'd also have an issue if something decided to change
the rates of some of the clocks, and power domains have the same problem
(Ulf's patches to genericise their code has the same behaviour with
regard to powering off unused domains, some of the existing
implementations do that already).

> Two things should probably be changed from the current setup. 1)
> simplefb shouldn't be a platform driver. It is a boot thing that
> handles initial state from the graphics chip. By implementing it as a
> platform driver, it prevents the real driver from binding to the real
> device if the simplefb data embedded into it. 2) make sure that an SoC
> driver can protect the needed resources before they are automatically
> disabled. Either by putting them in an earlier initcall, or handling
> it in the subsystem code. I don't know enough about the regulator and
> clock runtime PM to know what the best way to do this is.

Right, I agree with what you're saying here but what I'm saying is that
the way to ensure that the resources are protected is for the simplefb
node to tell the kernel what resources are being used, otherwise it
seems like we're just guessing and will fall over ourselves sooner or
later. =20

We can't use initcall hacks as these only work in cases where we will at
some point hand over to a real driver and there seems to be a clear use
case for using simplefb prior to that driver being written; even where
we will hand over to a real driver we can't put a definite timescale on
that happening since in the distro case it might be being loaded from
disk at some point after userspace is running.

There's not a lot the subsystem can do without breaking other users or
making the system substantially worse if we don't tell it what resources
are affected, we'll end up being forced to tend too far towards being
conservative about what we allow to happen.

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEHCmAAoJECTWi3JdVIfQad0H/Awme/2QnuZ/thJqplUUm5MZ
9af6AKVDmQVGnQdB3v4cVMngz5q7qTxkr36e/EJYwzP0LdaO9dPWcbOKU+5RqryC
sjA8ErghfmqrO/Pf8oHh+uqpwkBR9DiS139kf2lhCByVLGyE4E9pFFLFohCPFooo
adgE68XIORm0RJxPg1vdPJRZMZrxhipEpFEKN2BwT1b2ANwMqpa1vSwgL58C6jLO
3LPIrn1Pt0paGsarhnCiwuqYPI3FQR86r4ucEtqdL4ufszK2cDf0IqtecaD6s8Ph
4ce56yU+BaW5buWSjsc7bVRiTp7bEU0teEE1uskYi8JQ7CDjY5vitBxzPG95Eqs=
=uL0q
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
