From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 17:57:23 +0100
Message-ID: <20140910165723.GK7960@sirena.org.uk>
References: <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140910153919.GH7960@sirena.org.uk>
 <CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n83H03bbH672hrlY"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33347 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222AbaIJQ6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 12:58:05 -0400
Content-Disposition: inline
In-Reply-To: <CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--n83H03bbH672hrlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 05:29:32PM +0100, Grant Likely wrote:

> What we can do is have an inhibit flag for
> simplefb/simpleuart/simplewhatever that holds off PM. When a real
> driver, or a stub that understands parsing the resource dependencies,
> takes ownership of the device (or userspace tells the kernel to stop
> caring) it can clear the inhibit.

It's not quite as simple as just disabling PM - for example in the
clocks case we've also got to worry about what happens with rate changes
(which is going to get more and more risky as we get smarter about being
able to push configuration changes back up the tree), regulators have a
similar thing with voltage changes.  With simple enables and disables we
have to worry about things like handling users who actively want to
power things on and and off but may potentially be sharing a resource
with an undeclared dependency.

If we are going to go with an approach like you suggest I think that
rather than require a userspace notification that everything is OK we
should have the stub drivers do something which causes the appropriate
behaviour to happen so long as they're loaded.  This means userspace
doesn't need an update and ensures it doesn't have to worry about cases
where we're using the stub driver at runtime due to a real driver not
being available - we can figure this stuff out within the kernel
oureslves.

That said a kick from userspace when the first round of module loading
has finished would be very helpful, I just don't think we should rely on
it for this behaviour.

> I don't want to build knowledge of resource dependencies into the
> simple case. We'll simply frequently get it wrong. For example: A
> future kernel will have better PM and will turn off more devices which
> isn't accounted for in an older DT.

That is tricky and there will be problems.  Being fairly aggressive
about doing these things and avoiding having runtime configuration hacks
since it makes it harder for people to introduce problems without
noticing them, and requiring an explicit request to do resource
management at all is the most conservative option.  Between them those
strategies should help for anything that's getting tested at least, it
makes it hard for the kernel to learn about a resource without it being
handled safely from the get go.

--n83H03bbH672hrlY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEILwAAoJECTWi3JdVIfQV10H/3WC18SrKEI2KL3GDj0mIqgA
F7MLQWzw6DiLwK1nRfipVqOke6EELTU7f733z7kfeC+4hP2M5YnO7T1UK1KcBlBj
Ioe5QOFBCfTWhMzZxjJnseJDn9HTqEHy7qlKIUWqMo9narGqTJWGbJe1oSjIQpk+
/MbI4QvzY2tfhOKLmCDyzMZpDBIf0dfxsLD2XCTEfnwIO0ej+/65SvOALaNBVl68
jtW7mdJ5/JUoouEsSvzdv5kpBcxNwQsoLKWEZ3MU/PZGdyimd7sPwQ2fy+bYbT40
SiyKu6R6wL/fOoBE0KP6n7cUo9H3CXerNlG/ME3pJh6IOF690uDjFHEDgjEoBA0=
=TV2f
-----END PGP SIGNATURE-----

--n83H03bbH672hrlY--
