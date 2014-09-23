From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 07:53:53 +0200
Message-ID: <20140923055352.GB30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <541C279A.2030601@ti.com>
 <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
 <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo>
 <54203561.5090306@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135436951=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54203561.5090306@ti.com>
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


--===============2135436951==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 05:42:41PM +0300, Tomi Valkeinen wrote:
> On 22/09/14 11:26, Thierry Reding wrote:
> > On Fri, Sep 19, 2014 at 05:28:37PM +0300, Tomi Valkeinen wrote:
> >> On 19/09/14 16:59, Ajay kumar wrote:
> >>
> >>> I am not really able to understand, what's stopping us from using this
> >>> bridge on a board with "complex" display connections. To use ps8622 d=
river,
> >>> one needs to "attach" it to the DRM framework. For this, the DRM driv=
er
> >>
> >> Remember that when we talk about DT bindings, there's no such thing as
> >> DRM. We talk about hardware. The same bindings need to work on any
> >> operating system.
> >>
> >>> would need the DT node for ps8622 bridge. For which I use a phandle.
> >>
> >> A complex one could be for example a case where you have two different
> >> panels connected to ps8622, and you can switch between the two panels
> >> with, say, a gpio. How do you present that with a simple phandle?
> >=20
> > How do you represent that with a graph? Whether you describe it using a
> > graph or a simple phandle you'll need additional nodes somewhere in
> > between. Perhaps something like this:
> >=20
> > 	mux: ... {
> > 		compatible =3D "gpio-mux-bridge";
> >=20
> > 		gpio =3D <&gpio 42 GPIO_ACTIVE_HIGH>;
> >=20
> > 		panel@0 {
> > 			panel =3D <&panel0>;
> > 		};
> >=20
> > 		panel@1 {
> > 			panel =3D <&panel1>;
> > 		};
> > 	};
> >=20
> > 	ps8622: ... {
> > 		bridge =3D <&mux>;
> > 	};
> >=20
> > 	panel0: ... {
> > 		...
> > 	};
> >=20
> > 	panel1: ... {
> > 		...
> > 	};
>=20
> Yes, it's true we need a mux there. But we still have the complication
> that for panel0 we may need different ps8622 settings than for panel1.

Yes, and that's why the bridge should be querying the panel for the
information it needs to determine the settings.

> If that's the case, then I think we'd need to have two output endpoints
> in ps8622, both going to the mux, and each having the settings for the
> respective panel.

But we'd be lying in DT. It no longer describes the hardware properly.
The device only has a single input and a single output with no means to
mux anything. Hence the device tree shouldn't be faking multiple inputs
or outputs.

> >>> If some XYZ platform wishes to pick the DT node via a different metho=
d,
> >>> they are always welcome to do it. Just because I am not specifying a
> >>> video port/endpoint in the DT binding example, would it mean that pla=
tform
> >>> cannot make use of ports in future? If that is the case, I can add so=
mething
> >>
> >> All the platforms share the same bindings for ps8622. If you now speci=
fy
> >> that ps8622 bindings use a simple phandle, then anyone who uses ps8622
> >> should support that.
> >>
> >> Of course the bindings can be extended in the future. In that case the
> >> drivers need to support both the old and the new bindings, which is
> >> always a hassle.
> >>
> >> Generally speaking, I sense that we have different views of how display
> >> devices and drivers are structured. You say "If some XYZ platform wish=
es
> >> to pick the DT node via a different method, they are always welcome to
> >> do it.". This sounds to me that you see the connections between display
> >> devices as something handled by a platform specific driver.
> >>
> >> I, on the other hand, see connections between display devices as common
> >> properties.
> >>
> >> Say, we could have a display board, with a panel and an encoder and
> >> maybe some other components, which takes parallel RGB as input. The sa=
me
> >> display board could as well be connected to an OMAP board or to an
> >> Exynos board.
> >>
> >> I think the exact same display-board.dtsi file, which describes the
> >> devices and connections in the display board, should be usable on both
> >> OMAP and Exynos platforms. This means we need to have a common way to
> >> describe video devices, just as we have for other things.
> >=20
> > A common way to describe devices in DT isn't going to give you that. The
> > device tree is completely missing any information about how to access an
> > extension board like that. The operating system defines the API by which
> > the board can be accessed. I imagine that this would work by making the
> > first component of the board a bridge of some sort and then every driver
> > that supports that type of bridge (ideally just a generic drm_bridge)
> > would also work with that display board.
>=20
> I'm not sure I follow.
>=20
> Obviously there needs to be board specific .dts file that brings the
> board and the display board together. So, say, the display-board.dtsi
> has a i2c touchscreen node, but the board.dts will tell which i2c bus
> it's connected to.
>=20
> Well, now as I wrote that, I wonder if that's possible... A node needs
> to have a parent, and for i2c that must be the i2c master. Is that
> something the DT overlays/fragments or such are supposed to handle?
>=20
> But let's only think about the video path for now. We could have an
> encoder and a panel on the board. We could describe the video path
> between the encoder and the panel in the display-board.dts as that is
> fixed. Then all that's needed in the board.dts is to connect the board's
> video output to the encoders input with the video graph. Why would that
> not work?

My point is that the video graph isn't the solution to that problem.
Having an OS abstraction for the devices involved is. DT is only the
means to connect those devices.

> Sure, there's more that's needed. Common encoder and panel drivers for
> one. But it all starts with a common way to describe the video devices
> and the connections in the DT. If we don't have that, we don't have
> anything.

I don't think we need to have a common way to describe video devices. In
my opinion DT bindings are much better if they are specifically tailored
towards the device that they describe. We'll provide a driver for that
device anyway, so we should be creating appropriate abstractions at the
OS level to properly handle them.

To stay with the example of the board/display, I'd think that the final
component of the board DT would implement a bridge. The first component
of the display DT would similarly implement a bridge. Now if we have a
way of chaining bridges and controlling a chain of bridges, then there
is no need for anything more complex than a plain phandle in a property
=66rom the board bridge to the display bridge.

> > Whether this is described using a single phandle to the bridge or a more
> > complicated graph is irrelevant. What matters is that you get a phandle
> > to the bridge. The job of the operating system is to give drivers a way
> > to resolve that phandle to some object and provide an API to access that
> > object.
>=20
> I agree it's not relevant whether we use a simple phandle or complex
> graph. What matter is that we have a standard way to express the video
> paths, which everybody uses.

Not necessarily. Consistency is always good, but I think simplicity
trumps consistency. What matters isn't how the phandle is referenced in
the device tree, what matters is that it is referenced and that it makes
sense in the context of the specific device. Anything else is the job of
the OS.

While there are probably legitimate cases where the video graph is
useful and makes sense, in many cases terms like ports and endpoints are
simply confusing.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIQrwAAoJEN0jrNd/PrOhmDYQAKE0v4KU5Pj5FDVPpYq46Uvy
GUn39lWVpvoGggueCdGjWdvD7irp5XyKXKyZTUSfo+CPLhAkBP4K64FxYkWZ5HGq
2U3nM/bD/m9SvRT0Mu9PdQL/+9QJFZnhHZamUSu9tAOh2SG0aajrVMaAV1dkeGat
9YdLE6phoEF+WFW720gaEiDmOH6YD114xZUjnywFhCLp4poztS6K0jgCgTaojjkR
00Pk/hChg1TZmQbWBZsVhwmwTjkWYvDcujszqdOG5/efqJqdBhirGU9+lZUA7sEq
e9qJSUuGUXRsIg5vmiBbpdb8UOStDeDrO5T/BeHpuHfvKEiaZVa6FExpyldMgFC+
xv1ARxTyXHEzabOlKhhEYi5aAorvthsOVTCvLz/6mfOSvzOX2JfqlOLlIEqeuLge
K0cnHScB3vRBOLZiELRI6XSP5Ewjhau35OvuB9exKisfN3Bw1L2Qtr9a+WEXQGfL
0o8sxHEKYRvmA9lfC8O8Xh2VbE24jZOAEs8/1oc8lhxQNI/TrvKCvBBS+qFEEUJ2
zbzhhFzgl+fjT9V+O60VDPhZp3Y4n/GmvjbXiiXS8JcDndLhoQRRM0g2jF1k7Tck
YlprhkFabPs0c7fxHmpZ4PXIYxu/sCxVTmtcyr51E2lCygCuTbV0R22lRYMb++t1
wFN0zGdqCq60ATgKaQNa
=1WIc
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

--===============2135436951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2135436951==--
