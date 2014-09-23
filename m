From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:29:43 +0200
Message-ID: <20140923142941.GC5982@ulmo>
References: <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <541C279A.2030601@ti.com>
 <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
 <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo>
 <54203561.5090306@ti.com> <20140923055352.GB30514@ulmo>
 <54213250.8050107@ti.com> <20140923092815.GQ30514@ulmo>
 <5421566A.7050905@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1886796120=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5421566A.7050905@ti.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1886796120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 02:15:54PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 12:28, Thierry Reding wrote:
>=20
> >> But, for example, let's say that the board is designed in a way that f=
or
> >> panel0 the bridge needs to output a bit higher level voltages than for
> >> panel1. That's not a property of the panel, so it can't be queried from
> >> the panel.
> >>
> >> That feature (varying the voltage level) is specific to the bridge, and
> >> thus the properties should be in the bridge's DT data. So we need two
> >> different configurations in the bridge, one for panel0 and one for
> >> panel1. This is what endpoints give us.
> >=20
> > You could get the same by moving the mux in front of the bridge instead.
>=20
> I didn't understand. Moving the mux between the SoC and the bridge? How
> would that solve the problem. Or what do you mean with "in the front of
> the bridge"?

Because then you'd have multiple instances of the bridge that could
describe which parameters it wants. But writing it out loud this is
equally bad. More below.

> > Trying to do this within the bridge's node directly has two flaws:
> >=20
> > 	1) It violates the DT principle of describing hardware. The
> > 	   device itself does not know anything about multiple streams
> > 	   and deals only with a single input and output. You'd be
> > 	   describing a board specific aspect in the device binding.
>=20
> We _are_ describing board specific aspects in the board.dts file. That's
> what it is about.
>=20
> If the board's hardware is such that the bridge's voltage level needs to
> be higher when using panel0, that's very much describing hardware.

You misunderstood. It's describing a use-case rather than the device
itself. You describe, *within the device node*, that it can be muxed
whereas the device itself doesn't know anything about muxing. That's
where the violation is. You require a board-integration issue to be
described in the binding of a specific device.

> > 	2) Such a solution would have to be implemented for all bridge
> > 	   devices that can potentially be muxed (really all of them).
> > 	   If you describe it accurately in a separate mux node you get
> > 	   genericity for free and it will work for all bridges.
>=20
> I do agree that a generic mux is better if there's nothing special to be
> configured. But how do you use a generic mux node for bridge device
> specific features?

Good question. I don't have an immediate answer to that and would have
to think about it for some more.

> >> I disagree. If we don't have a common way to describe the connections
> >> between video devices, we cannot:
> >>
> >> - have a common helper library to parse the connections
> >=20
> > We have a common helper already. It's called of_parse_phandle().
>=20
> Yes, but what is the name of the property, and where does it go? Does
> the panel have a phandle to the bridge? Does the bridge have a phandle
> to the panel?

My point was that we don't need a common helper library if we have a way
of getting at the phandle and resolve the phandle to a bridge or a
panel. While I think standard names can be advantageous, using the
regular of_parse_phandle() and a lookup function we don't even need
them.

> >> - study the connections before the drivers are loaded
> >=20
> > Why would you need that?
>=20
> I think this was discussed earlier, maybe Laurent remembers the use cases.
>=20
> I think one possibility here is to have an understanding of the
> pipelines even if the modules have not been loaded or a single device
> has failed to probe.

I don't see how that would be useful.

> >> - handle the connections anywhere else than the specific driver for the
> >> component
> >=20
> > Why should we do that?
>=20
> We could, for example, have a single component (common or SoC specific)
> that manages the video pipelines. The drivers for the
> encoders/bridges/panels would just probe the devices, without doing
> anything else. The master component would then parse the links and
> connect the devices in whatever way it sees best.

You don't need any of that. The SoC driver simply obtains a phandle to
the first bridge connected to it. That bridge will already have done the
same for any chained bridges. There's no need to connect them in any way
anymore because they are already properly set up.

> > Having a standard representation only matters if you want to be able to
> > parse the pipeline without knowing about the device specifics. But I'm
> > not sure I understand why you would want to do that. This sounds like
> > you'd want some generic code to be able to construct a pipeline. But at
> > the same time you can't do anything meaningful with that pipeline
> > because the generic code doesn't know how to program the pipeline. The
> > only thing you'll get is a list of devices in the pipeline, but you can
> > do that by looking at the bindings and the DT content, no matter what
> > the properties are named
>=20
> You can, but then you need to know all the possible variations and ways
> the phandles are used.

Which is described in the DT bindings. Really, the DT should be
describing the device in whatever is the most natural way for that
device. It is the job of the OS to abstract things away so that
components can be seemlessly integrated. The DT doesn't need to (and
shouldn't) have that kind of abstraction.

> >> Even if the points I gave about why a common way to describe connectio=
ns
> >> is important would not be relevant today, it sounds much safer to have=
 a
> >> standard representation in the DT for the connections. I'd only go for
> >> device specific custom descriptions if there's a very important reason
> >> for that. And I can't come up with any reason.
> >=20
> > One of the good practices in DT is to keep property names similar to the
> > signal names of the chip to make it easy to correlate. So if you have a
> > bridge that converts RGB to LVDS and DSI for example, you'd have to
> > describe two outputs. That's kind of difficult to do with standard
> > property names. Well, it depends, you could do this:
> >=20
> > 	bridge {
> > 		panels =3D <&lvds &dsi>;
> > 	};
> >=20
> > Alternatively:
> >=20
> > 	bridge {
> > 		lvds-panel =3D <&lvds>;
> > 		dsi-panel =3D <&dsi>;
> > 	};
>=20
> Nothing says the bridge is connected to a panel, so "output" or such
> would probably be better there.

Hmm? How does the above not say that the bridge is connected to a panel?

Thierry

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYPVAAoJEN0jrNd/PrOh02YQAJT4bOz8amRiYoCBUWbfimtc
kiAYAKkGk25z3WFTk+ymVhsLdjzNL+1JqIpmW9XTFA4Frjcg5ZqFudp6YFVAy0EO
gZs9fZoc/0L6upeshSk9gctb9JwpOQ5/yAIVeJMtTRR7/i08y1sZ9YasYOO6Und/
pEiCRMVkjxorr6SyAv5zcK7fNk9+DNY8GIzB1eZKQG6WJFlwlCukRFkSByuhSevw
voMaIo5eCXFufDIAqbB/Su8C+yT6LCnOzo7foH4v3Gttpw6Psh+ANFd4l46Cnsd0
o2+bpStcniqTWha93JELUHOjK3aU1MxOtnITkVgCJHUbE+pJYT5omrka1HZoZZUo
zap8Upid7yBJEYbFiYjpgPQcOs3xY/os6VMJhqdXh64GyOLV0hCQvctb9NrimSJM
B0C6Lrk9s20t5QJejKuZIDgEcXcGaX6Q+WoQlbXR+Q1ajqlsDTCTxtxj+sFH54bN
+xqclOYAO6Ej204GGueUpIR/dyc47gCo8OOC95nueaewl/5N1HyUBXPC5vX9dMxC
7Nz7ayt93iPcawgfnGcICRI+i/Y4neO06KWACpztiuJvXFpOsZwEwOGwvWJJqNWB
hs3YLoIc7Mo7y48ksgZOq7uMY1hK80+0/5CzflBv6cre8fppu+HlyKB3dLfwI2nf
FNx3nIHGauoMZzPCuucL
=cmU8
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--

--===============1886796120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1886796120==--
