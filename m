From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 10:26:48 +0200
Message-ID: <20140922082647.GE1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <541C279A.2030601@ti.com>
 <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
 <541C3D95.7080200@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771733489=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <541C3D95.7080200@ti.com>
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


--===============1771733489==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline


--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2014 at 05:28:37PM +0300, Tomi Valkeinen wrote:
> On 19/09/14 16:59, Ajay kumar wrote:
>=20
> > I am not really able to understand, what's stopping us from using this
> > bridge on a board with "complex" display connections. To use ps8622 dri=
ver,
> > one needs to "attach" it to the DRM framework. For this, the DRM driver
>=20
> Remember that when we talk about DT bindings, there's no such thing as
> DRM. We talk about hardware. The same bindings need to work on any
> operating system.
>=20
> > would need the DT node for ps8622 bridge. For which I use a phandle.
>=20
> A complex one could be for example a case where you have two different
> panels connected to ps8622, and you can switch between the two panels
> with, say, a gpio. How do you present that with a simple phandle?

How do you represent that with a graph? Whether you describe it using a
graph or a simple phandle you'll need additional nodes somewhere in
between. Perhaps something like this:

	mux: ... {
		compatible =3D "gpio-mux-bridge";

		gpio =3D <&gpio 42 GPIO_ACTIVE_HIGH>;

		panel@0 {
			panel =3D <&panel0>;
		};

		panel@1 {
			panel =3D <&panel1>;
		};
	};

	ps8622: ... {
		bridge =3D <&mux>;
	};

	panel0: ... {
		...
	};

	panel1: ... {
		...
	};

> > If some XYZ platform wishes to pick the DT node via a different method,
> > they are always welcome to do it. Just because I am not specifying a
> > video port/endpoint in the DT binding example, would it mean that platf=
orm
> > cannot make use of ports in future? If that is the case, I can add some=
thing
>=20
> All the platforms share the same bindings for ps8622. If you now specify
> that ps8622 bindings use a simple phandle, then anyone who uses ps8622
> should support that.
>=20
> Of course the bindings can be extended in the future. In that case the
> drivers need to support both the old and the new bindings, which is
> always a hassle.
>=20
> Generally speaking, I sense that we have different views of how display
> devices and drivers are structured. You say "If some XYZ platform wishes
> to pick the DT node via a different method, they are always welcome to
> do it.". This sounds to me that you see the connections between display
> devices as something handled by a platform specific driver.
>=20
> I, on the other hand, see connections between display devices as common
> properties.
>=20
> Say, we could have a display board, with a panel and an encoder and
> maybe some other components, which takes parallel RGB as input. The same
> display board could as well be connected to an OMAP board or to an
> Exynos board.
>=20
> I think the exact same display-board.dtsi file, which describes the
> devices and connections in the display board, should be usable on both
> OMAP and Exynos platforms. This means we need to have a common way to
> describe video devices, just as we have for other things.

A common way to describe devices in DT isn't going to give you that. The
device tree is completely missing any information about how to access an
extension board like that. The operating system defines the API by which
the board can be accessed. I imagine that this would work by making the
first component of the board a bridge of some sort and then every driver
that supports that type of bridge (ideally just a generic drm_bridge)
would also work with that display board.

Whether this is described using a single phandle to the bridge or a more
complicated graph is irrelevant. What matters is that you get a phandle
to the bridge. The job of the operating system is to give drivers a way
to resolve that phandle to some object and provide an API to access that
object.

Thierry

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBAgAGBQJUH91HAAoJEN0jrNd/PrOh4pkP+OGjzEfE76VTDYqfKih64kSp
P6QoZNouwf9OWfm5/3GMAeN8Qq00OaCaZbjBjIbqnu0YxvCUp/S9pDr5hBmh2ozj
Bna2Fe4Fe79Oon/GdS4NerSLc5Bd94Bknu2qo2/g1oKd7iie0TgkECM5VYLeys6l
YAxgShDZQkw+bQZKGuCWnlU3sjWSfKziBPCvpxexjRKpDGyzk0j+kd3jIbZsbfwJ
h0StyyqwEsE8VKFmkXTw8/apM9SnJ6hPC7qjnqyfJeOWn+Vi6ZtFgDjjElkhrUyA
DghFmfBf/wDUD6u5n2s4i/DCO+0bFF9O0rtvvER2kQ1wU4Uob+ryewmktd494EOG
V6q87nTxtrzVoYMblfQvomCOW4YpptZY1PBDBG3Np70W1y/LYl5Wfuh2Noclztcu
NUgZuHYIVOO5DTbbsAHgb10hKzqiTgW4Rnv9d8/BXv8Zs8+QGDvZNK0VaTQidPO5
b8Gf6cXqRBmyif33VHNnEPrJ/cruCHCv4rm5gwkQkXef8yT2z0VbUaJIb9zypDj7
RFTp49P4NkkDs2YmK+MOR8KQpFXw+OgMRBP+tzf3MSDe0oOYECNMzQF0Ks9q+ZXG
amtTQANyl8jf9vqO2jTEMy2OmaW13V7yPUldCYSf9RIrJbgKPpai5Xy7zQgqz+le
zUlHXV60LveCwEgMCww=
=Yr0f
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--

--===============1771733489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1771733489==--
