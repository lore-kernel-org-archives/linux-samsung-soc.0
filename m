From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:28:16 +0200
Message-ID: <20140923092815.GQ30514@ulmo>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <541C279A.2030601@ti.com>
 <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
 <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo>
 <54203561.5090306@ti.com> <20140923055352.GB30514@ulmo>
 <54213250.8050107@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491524737=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54213250.8050107@ti.com>
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


--===============0491524737==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5KxTQ9fdN6Op3ksq"
Content-Disposition: inline


--5KxTQ9fdN6Op3ksq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 11:41:52AM +0300, Tomi Valkeinen wrote:
> On 23/09/14 08:53, Thierry Reding wrote:
>=20
> >> Yes, it's true we need a mux there. But we still have the complication
> >> that for panel0 we may need different ps8622 settings than for panel1.
> >=20
> > Yes, and that's why the bridge should be querying the panel for the
> > information it needs to determine the settings.
>=20
> That only works if the settings to be queried are standard ones.
>=20
> But, for example, let's say that the board is designed in a way that for
> panel0 the bridge needs to output a bit higher level voltages than for
> panel1. That's not a property of the panel, so it can't be queried from
> the panel.
>=20
> That feature (varying the voltage level) is specific to the bridge, and
> thus the properties should be in the bridge's DT data. So we need two
> different configurations in the bridge, one for panel0 and one for
> panel1. This is what endpoints give us.

You could get the same by moving the mux in front of the bridge instead.
Trying to do this within the bridge's node directly has two flaws:

	1) It violates the DT principle of describing hardware. The
	   device itself does not know anything about multiple streams
	   and deals only with a single input and output. You'd be
	   describing a board specific aspect in the device binding.

	2) Such a solution would have to be implemented for all bridge
	   devices that can potentially be muxed (really all of them).
	   If you describe it accurately in a separate mux node you get
	   genericity for free and it will work for all bridges.

> >> If that's the case, then I think we'd need to have two output endpoints
> >> in ps8622, both going to the mux, and each having the settings for the
> >> respective panel.
> >=20
> > But we'd be lying in DT. It no longer describes the hardware properly.
> > The device only has a single input and a single output with no means to
> > mux anything. Hence the device tree shouldn't be faking multiple inputs
> > or outputs.
>=20
> No, a port is a single physical output. An endpoint is a logical entity
> on that single physical output.
>=20
> So a bridge with a single output has one output port, but it may have as
> many endpoints on that port as needed. Only one endpoint of a port can
> be active at a time.

As I mentioned above, this seems to me to be the wrong point of
abstraction.

> > I don't think we need to have a common way to describe video devices. In
> > my opinion DT bindings are much better if they are specifically tailored
> > towards the device that they describe. We'll provide a driver for that
> > device anyway, so we should be creating appropriate abstractions at the
> > OS level to properly handle them.
>=20
> I disagree. If we don't have a common way to describe the connections
> between video devices, we cannot:
>=20
> - have a common helper library to parse the connections

We have a common helper already. It's called of_parse_phandle().

> - study the connections before the drivers are loaded

Why would you need that?

> - handle the connections anywhere else than the specific driver for the
> component

Why should we do that?

> > To stay with the example of the board/display, I'd think that the final
> > component of the board DT would implement a bridge. The first component
> > of the display DT would similarly implement a bridge. Now if we have a
> > way of chaining bridges and controlling a chain of bridges, then there
> > is no need for anything more complex than a plain phandle in a property
> > from the board bridge to the display bridge.
>=20
> Right, that works for many cases. Of course, nothing says there's a
> bridge on the main board, it could be connected directly to the SoC.

In either case the SoC driver would probably know how to talk to a
bridge anyway, whether it be one on the main board or on the display
board.

> >>> Whether this is described using a single phandle to the bridge or a m=
ore
> >>> complicated graph is irrelevant. What matters is that you get a phand=
le
> >>> to the bridge. The job of the operating system is to give drivers a w=
ay
> >>> to resolve that phandle to some object and provide an API to access t=
hat
> >>> object.
> >>
> >> I agree it's not relevant whether we use a simple phandle or complex
> >> graph. What matter is that we have a standard way to express the video
> >> paths, which everybody uses.
> >=20
> > Not necessarily. Consistency is always good, but I think simplicity
> > trumps consistency. What matters isn't how the phandle is referenced in
> > the device tree, what matters is that it is referenced and that it makes
> > sense in the context of the specific device. Anything else is the job of
> > the OS.
> >=20
> > While there are probably legitimate cases where the video graph is
> > useful and makes sense, in many cases terms like ports and endpoints are
> > simply confusing.
>=20
> I again agree that I'd like to have a simpler representation than video
> graphs for the simpler use cases. But again, I think it's important to
> have a standard representation for those connections.
>=20
> Why do you think it wouldn't be good to have a standard for the simpler
> connections (in addition to the video graphs)? What kind of device
> specific variations do you see that would be needed?

What do you mean by standard? I agree that it would make sense to give
properties standard names, but I don't think we need to go any further.
I mean, in the case of a simple phandle there's not much more to it
anyway. But I fail to understand why standard properties should be a
hard requirement.

Having a standard representation only matters if you want to be able to
parse the pipeline without knowing about the device specifics. But I'm
not sure I understand why you would want to do that. This sounds like
you'd want some generic code to be able to construct a pipeline. But at
the same time you can't do anything meaningful with that pipeline
because the generic code doesn't know how to program the pipeline. The
only thing you'll get is a list of devices in the pipeline, but you can
do that by looking at the bindings and the DT content, no matter what
the properties are named

> Even if the points I gave about why a common way to describe connections
> is important would not be relevant today, it sounds much safer to have a
> standard representation in the DT for the connections. I'd only go for
> device specific custom descriptions if there's a very important reason
> for that. And I can't come up with any reason.

One of the good practices in DT is to keep property names similar to the
signal names of the chip to make it easy to correlate. So if you have a
bridge that converts RGB to LVDS and DSI for example, you'd have to
describe two outputs. That's kind of difficult to do with standard
property names. Well, it depends, you could do this:

	bridge {
		panels =3D <&lvds &dsi>;
	};

Alternatively:

	bridge {
		lvds-panel =3D <&lvds>;
		dsi-panel =3D <&dsi>;
	};

Or I guess you could do the same with ports/endpoints given that there
are actually two outputs here. With endpoints it's of course difficult
to correlate them without adding extra properties.

	bridge {
		ports {
			port@0 {
				endpoint@0 {
					remote-endpoint =3D <&lvds>;
				};
			};

			port@1 {
				endpoint@0 {
					remote-endpoint =3D <&dsi>;
				};
			};
		};
	};

Note that you could also write it without graph but with a more similar
structure:

	bridge {
		lvds {
			panel =3D <&lvds>;
		};

		dsi {
			panel =3D <&dsi>;
		};
	};

While it's true that it'd be more difficult to parse that in a generic
way I also think it's a whole lot more readable than some abstract graph
where a lot of context is simply lost.

Thierry

--5KxTQ9fdN6Op3ksq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIT0vAAoJEN0jrNd/PrOhzCkP/1vdlUmQjH27JcUoEeiIPZmK
l6N3jlzp6z2yKEzSFJvVTInt4MjpKyrDhK0PuAJ4KhPz4kuqE5YlXnDPKawgDgqX
VdESJc9qhFOc2prGCE+h2xI58+0PD/9sCgDeDoq2RY8PAqR9ImibjLkgQOW8NINo
wUSh15RjKnxX2pYmtkv2rwy2ksk8dbzQ/mvtEfRy2stuBsi4V3578CiyRZcZ/EOf
OkxDyttS98azn7gdTzE/ogacjIoNvpzQEsjs8OcQ7HOQMPRzGRFpTLx249oov2Mj
Sv0dgRULSmMMiyli6FxhdPGDMegAia7SmGRDoj3s13DJw5R1GlHZMd1a2fw83DBr
2ut8BrVdBbrunmkgLt7rV7dDyriXikSpAxl6x3G//RqROdigCE1OwHpm5f3rQTpX
FS6zpcsnNgQ5/wGFF6JDDtk7WQq5leSXhcT4buWZi5lA0Qs7w2cmA7jFF/rey+kh
Idm11otDVtdZHKbsfLyfYEbJpVLJDv08zxKR0OYwt91//FsSeGbrsizPmuOq3aIc
Jvt/QyeFT7RHGDnqDG5aM26znBmq4UesyHOAa1r/EQjTuQrqoDLpImwD4jLCLvxI
QBK6ntF8cK1z0COmZeLESpNw4f7w9RhGoeg4P4Sw5vKbrv4Sstz/kYNycMhfCdEj
JKZUE84hCMIHj/fic2tr
=Kf4o
-----END PGP SIGNATURE-----

--5KxTQ9fdN6Op3ksq--

--===============0491524737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0491524737==--
