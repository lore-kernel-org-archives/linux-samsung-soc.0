From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 08:21:12 +0200
Message-ID: <20140923062111.GE30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo>
 <54202C86.3040808@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372092648=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54202C86.3040808@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0372092648==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 05:04:54PM +0300, Tomi Valkeinen wrote:
> On 22/09/14 10:54, Thierry Reding wrote:
>=20
> >> I wish all new display component bindings would use the video
> >> ports/endpoints to describe the connections. It will be very difficult
> >> to improve the display driver model later if we're missing such critic=
al
> >> pieces from the DT bindings.
> >=20
> > I disagree. Why would we want to burden all devices with a bloated
>=20
> I agree that the .dts becomes more bloated with video graph.
>=20
> > binding and drivers with parsing a complex graph when it's not even
>=20
> Hopefully not all drivers will need to do the parsing themselves. If
> it's common stuff, I don't see why we can't have helpers to do the work.
>=20
> > known that it will be necessary? Evidently this device works fine
> > using the current binding. Just because there are bindings to describe
>=20
> Well, I can write almost any kind of bindings, and then evidently my
> device would work. For me, on my board.

Well, that's the whole problem with DT. For many devices we only have a
single setup to test against. And even when we have several they often
are derived from each other. But the alternative would be to defer
(possibly indefinitely) merging support for a device until a second,
wildly different setup shows up. That's completely unreasonable and we
need to start somewhere.

The same issue exists whether you use the video graph or not. But like I
said elsewhere, I think the key to making this work is by keeping the DT
simple and making sure we can properly use the devices at the OS level
so that we only need to make sure we have the right connections in the
DT.

> > ports in a generic way doesn't mean it has to be applied everywhere.
> > After all the concept of ports/endpoints applies to non-video devices
> > too, yet we don't require the bindings for those devices to add ports
> > or endpoints nodes.
>=20
> I guess non-video devices haven't had need for those. I have had lots of
> boards with video setup that cannot be represented with simple phandles.
> I'm not sure if I have just been unlucky or what, but my understand is
> that other people have encountered such boards also. Usually the
> problems encountered there have been circumvented with some hacky video
> driver for that specific board, or maybe a static configuration handled
> by the boot loader.

I have yet to encounter such a setup. Can you point me at a DTS for one
such setup? I do remember a couple of hypothetical cases being discussed
at one time or another, but I haven't seen any actual DTS content where
this was needed.

> > Also it won't be very difficult to extend the binding in a backwards
> > compatible way if that becomes necessary.
>=20
> I don't know about that. More or less all the cases I've encountered
> where a binding has not been good from the start have been all but "not
> very difficult".
>=20
> Do we have a standard way of representing the video pipeline with simple
> phandles? Or does everyone just do their own version? If there's no
> standard way, it sounds it'll be a mess to support in the future.

It doesn't matter all that much whether the representation is standard.
phandles should simply point to the next element in the pipeline and the
OS abstractions should be good enough to handle the details about how to
chain the elements.

While it's entirely possible to represent that using a generic graph, in
most cases (at least the trivial ones) I think that's completely
redundant. If you have a pipeline of two (single input/output) elements
where video flows from the first to the second, then all you need is a
phandle from the first element to the second element. Everything else
can easily be derived. The input for the second device will be the first
implicitly. No need to explicitly describe that in DT. Doing it
explicitly would be redundant.

Thierry

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIRFXAAoJEN0jrNd/PrOh9M0P/1vuI+W9BEtmNvCz3C2BXOcS
dHjmCH61uLcQrf9+BFtPZQw590IUbHLLCEWSFEfeXJaoWWzolitQyYY8R+qR0LIt
YaEcO12Xr5Mta93Sup6sqdVg2n+wFOmUNurWqWVcrq3Y30duTS2Xp8XLPuwg2c8t
em7g5y4rzWQE+APFSoMJSgdPSzym4HbgvBMulGRJR6cPsHI9SbBAmxnkAkaL8Wr8
CcCd8mJxej/mTl1OzTGZyV27WMXgZfptYgncSAI5pd+4uVotX6feilrnsoFXefBs
KiNhNTAQQy1lD6zT0BffbyGVNAERbaFdvvS35teymGjSDcdTeRk/sV0ptfVn5ZYE
sH4pBYfnL//DInl8ONZnS7HuzK8yuBn9MfBPOAC/f9S2aXQWtrXL+fai7m5mG3nz
0jdeVi/rPPJCh7pO5IwkLenD1S3EI6EFvM+L3/DWD/mMoUJlHwsw2y+QqW4+jt3c
KpOGs68TEusnU2AAhnaPj43RmulbdL/axg2+A2EcnmPTR3y1uoRKNXnwufl3V0eY
0OHslz8JrpdoftTc8t5Bids720IZRG5fRVjFU28asYv4cBaYGg8sN1v4EqEqPy0f
a6aK4PjbbVeOjBevP5cZM/xcbo0PGw7I3aJk/InNMTVzyooy5J1l7xkV6gTQVk64
TRcc6LjyO9VgephwZkHU
=MV0y
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--

--===============0372092648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0372092648==--
