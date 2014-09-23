From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 12:30:20 +0300
Message-ID: <54213DAC.5010806@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo> <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JA1RRkHUaiKhBwAvN1671poC2TP1HN21I"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:58738 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751533AbaIWJae (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 05:30:34 -0400
In-Reply-To: <20140923062111.GE30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--JA1RRkHUaiKhBwAvN1671poC2TP1HN21I
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 09:21, Thierry Reding wrote:

>> Well, I can write almost any kind of bindings, and then evidently my
>> device would work. For me, on my board.
>=20
> Well, that's the whole problem with DT. For many devices we only have a=

> single setup to test against. And even when we have several they often
> are derived from each other. But the alternative would be to defer
> (possibly indefinitely) merging support for a device until a second,
> wildly different setup shows up. That's completely unreasonable and we
> need to start somewhere.

Yes, but in this case we know of existing boards that have complex
setups. It's not theoretical.

I'm not saying we should stop everything until we have a 100% solution
for the rare complex cases. But we should keep them in mind and, when
possible, solve problems in a way that will work for the complex cases al=
so.

>> I guess non-video devices haven't had need for those. I have had lots =
of
>> boards with video setup that cannot be represented with simple phandle=
s.
>> I'm not sure if I have just been unlucky or what, but my understand is=

>> that other people have encountered such boards also. Usually the
>> problems encountered there have been circumvented with some hacky vide=
o
>> driver for that specific board, or maybe a static configuration handle=
d
>> by the boot loader.
>=20
> I have yet to encounter such a setup. Can you point me at a DTS for one=

> such setup? I do remember a couple of hypothetical cases being discusse=
d
> at one time or another, but I haven't seen any actual DTS content where=

> this was needed.

No, I can't point to them as they are not in the mainline (at least the
ones I've been working on), for obvious reasons.

With a quick glance, I have the following devices in my cabinet that
have more complex setups: OMAP 4430 SDP, BeagleBoneBlack + LCD, AM43xx
EVM. Many Nokia devices used to have such setups, usually so that the
LCD and tv-out were connected to the same video source.

>> Do we have a standard way of representing the video pipeline with simp=
le
>> phandles? Or does everyone just do their own version? If there's no
>> standard way, it sounds it'll be a mess to support in the future.
>=20
> It doesn't matter all that much whether the representation is standard.=


Again, I disagree.

> phandles should simply point to the next element in the pipeline and th=
e
> OS abstractions should be good enough to handle the details about how t=
o
> chain the elements.

I, on the other hand, would rather see the links the other way around.
Panel having a link to the video source, etc.

The video graphs have two-way links, which of course is the safest
options, but also more verbose and redundant.

When this was discussed earlier, it was unclear which way the links
should be. It's true that only links to one direction are strictly
needed, but the question raised was that if in the drivers we end up
always going the links the other way, the performance penalty may be
somewhat big. (If I recall right).

 Tomi



--JA1RRkHUaiKhBwAvN1671poC2TP1HN21I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIT2sAAoJEPo9qoy8lh71b/wP/R34f0wHQrgZVWwJsZ0jc0b4
l8G24kKy4R7hQJj/7BoLzmuyofcuwOjYDhlJeJIZ6BYcOQppBpxQpRAR9OF8cxdM
lW59bBK5hYLQVjtoQQWQR/aQKr0rRdCuDV9+eQ9GEWiebHPa8rL8kLKQ3aCtZaS2
7Xq9atFuWFRrLYdOhFigTe66i3FQWmLudni7BN5mtJCWJv4fs1BscWjYkvGtmccg
nM7csOKhVFPxMJyElz2AnCYASdRjPOakcQeEGfoe0onv1vqV1p1FpeBcQ/n+Abf9
WlAHdBCfywYb6dEvSCIIYMafpzBiK/5yMcY5xvV7bUDIsQG3xa/o/Ep1ywkra162
pfN+MC1h0ljggXcStOb72Zmxrv2xaAOGIpQd6hddOnkrAeHP/W4KPUvnxabL5fmZ
lBNe2fW3Mzu2yJqY/0xAGKnpbUPBxfm2vbRdD/ufv2TYsPUOzpG4W//CpVRRc9cI
60e9SFV+1sRBXAENqMHXpDOgDQzhgodw4oTfSFdQr8c+90TDBhVWr5NglLiLU32y
VFjI5l6+/ncttUojXEobHP0H5jvuhTq2uJ+5PJlD0p7T4Xo5m3zKr9lW512QX84D
Q9zMrw+hO1+6ViEY/OTrDqJs7ZqSMpKRODFTSBdBKuKe3si+hBpfqY7if+jnJ4Jq
h1nHuVvLZrum0KsaqPpU
=q+qF
-----END PGP SIGNATURE-----

--JA1RRkHUaiKhBwAvN1671poC2TP1HN21I--
