From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:39:17 +0200
Message-ID: <20140923093916.GR30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <54213543.7000306@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849815195=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54213543.7000306@ti.com>
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


--===============1849815195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XZQkxCYp0f/VEFS"
Content-Disposition: inline


--3XZQkxCYp0f/VEFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 11:54:27AM +0300, Tomi Valkeinen wrote:
> On 23/09/14 09:04, Thierry Reding wrote:
>=20
> > I certainly agree that it's useful to have standard ways to describe at
> > least various aspects. For example I think it would be useful to add
> > standard properties for a bridge's connections, such as "bridge" or
> > "panel" to allow bridge chaining and attaching them to panels.
>=20
> I don't see a need for such properties. Do you have examples where they
> would be needed?
>=20
> The driver for the respective device does know if it's a bridge or a
> panel, so that information is there as soon as the driver has loaded.

These are used for chaining not identifying the device. For example:

	bridge0: ... {
		...
		bridge =3D <&bridge1>;
		...
	};

	bridge1: ... {
		...
		panel =3D <&panel>;
		...
	};

	panel: ... {
		...
	};

> > But I think that should be the end of it. Mandating anything other than
> > that will just complicate things and limit what people can do in the
> > binding.
> >=20
> > One of the disadvantages of the video graph bindings is that they are
> > overly vague in that they don't carry information about what type a
> > device is. Bindings then have to require additional meta-data, at which
> > point it's become far easier to describe things with a custom property
> > that already provides context.
>=20
> I don't see why the graphs and such metadata are connected in any way.
> They are separate issues. If we need such metadata, it needs to be added
> in any case. That is not related to the graphs.

My point is that if you use plain phandles you usually have the
meta-data already. Referring to the above example, bridge0 knows that it
should look for a bridge with phandle &bridge1, whereas bridge1 knows
that the device it is connected to is a panel.

> >> Yes, there's always one active input and one output for this bridge.
> >> What the video graphs would bring is to have the possibility to have
> >> multiple inputs and outputs, of which a single ones could be active at=
 a
> >> time. The different inputs and outputs could even have different
> >> settings required (say, first output requires this bit set, but when
> >> using second output that bit must be cleared).
> >=20
> > As discussed elsewhere this should be handled at a different level then.
> > DT should describe the hardware and this particular bridge device simply
> > doesn't have a means to connect more than a single input or more than a
> > single output.
>=20
> Well, I can't say about this particular bridge, but afaik you can
> connect a parallel RGB signal to multiple panels just like that, without
> any muxing.

Right, but in that case you're not reconfiguring the signal in any way
for each of the panels. You send one single signal to all of them. For
all intents and purposes there is only one panel. Well, I guess you
could have separate backlights for the panels. In that case though it
seems better to represent it at least as a virtual mux or bridge, or
perhaps a "mux panel".

Thierry

--3XZQkxCYp0f/VEFS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIT/EAAoJEN0jrNd/PrOhSjgP/2gtt/eZzZkAT5YwkL10R06M
9i9znOh/kZ4/B5g0uQ5HY3lKGENc9puanEbs0ancezT802f6/Ntz/4+aVHJ3NP1m
lFMLwVe2B10eeFlEC5EP1gEtsMuBGxfzb0eYULs4WCOtYPkHqmUGbwd+JDw7RYvi
G2c47hOebx9+lX9E3rZkr0pUlJuk6C5UdJvADYFNV3k5YFq6ARiek/Wfb7V5BYBg
XUpjwas1wF76jVm8UYrS+kpah4K6eF13bNxLKh+4AcyNhc12JxlTkdHiuKtvRIZz
xWZS6DnXY6LduSwupgEGvVBZxY4OzrKZ10RGlHtSTLjIFDuDH+VXCHLs+IzRlDnK
BSbyEJCnI57MNavl7QlRADVs9RF6RMAD8br0BlZoEQKWSYutcoCftxgVBnRk/eFe
f2GQOkMbYWs45KbR0uUv4P8m1MXu2jr0BfAYgfajk4/QPXKU72CkAuCmASmMUrG1
Zf1XhC3D7g01EyJLywTdQVw9zwewlfaNDUZPLNqnO43ZoZQbYbzD7YBU1HmoLx46
1zw34ib7AG2FqF5rsivksmPNWl8gV2ahQSsvvXuUNwtqTeGKFmuQ3mBpyh9cDaN+
uqxPtX7KZVVlLkPsgQ9iUII/WM5ZUadzz1V80lUmFT8AX0NeYTtmMCLDGDd1DueW
oPXVtEbDsZnERoOfdPbb
=Z7o9
-----END PGP SIGNATURE-----

--3XZQkxCYp0f/VEFS--

--===============1849815195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1849815195==--
