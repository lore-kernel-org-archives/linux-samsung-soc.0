From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 10:06:29 +0200
Message-ID: <20140922080629.GC1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2041181445=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5419B52D.4060107@ti.com>
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


--===============2041181445==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 07:22:05PM +0300, Tomi Valkeinen wrote:
> On 17/09/14 17:29, Ajay kumar wrote:
> > Hi Tomi,
> >=20
> > Thanks for your comments.
> >=20
> > On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.com>=
 wrote:
> >> On 27/08/14 17:39, Ajay Kumar wrote:
> >>> Add documentation for DT properties supported by ps8622/ps8625
> >>> eDP-LVDS converter.
> >>>
> >>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >>> ---
> >>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++=
++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps=
8622.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.tx=
t b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >>> new file mode 100644
> >>> index 0000000..0ec8172
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >>> @@ -0,0 +1,20 @@
> >>> +ps8622-bridge bindings
> >>> +
> >>> +Required properties:
> >>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> >>> +     - reg: first i2c address of the bridge
> >>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pin.
> >>> +     - reset-gpios: OF device-tree gpio specification for RST_ pin.
> >>> +
> >>> +Optional properties:
> >>> +     - lane-count: number of DP lanes to use
> >>> +     - use-external-pwm: backlight will be controlled by an external=
 PWM
> >>
> >> What does this mean? That the backlight support from ps8625 is not use=
d?
> >> If so, maybe "disable-pwm" or something?
> > "use-external-pwm" or "disable-bridge-pwm" would be better.
>=20
> Well, the properties are about the bridge. "use-external-pwm" means that
> the bridge uses an external PWM, which, if I understood correctly, is
> not what the property is about.
>=20
> "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
> properties are about the bridge, so it's implicit.
>=20
> >>> +
> >>> +Example:
> >>> +     lvds-bridge@48 {
> >>> +             compatible =3D "parade,ps8622";
> >>> +             reg =3D <0x48>;
> >>> +             sleep-gpios =3D <&gpc3 6 1 0 0>;
> >>> +             reset-gpios =3D <&gpc3 1 1 0 0>;
> >>> +             lane-count =3D <1>;
> >>> +     };
> >>>
> >>
> >> I wish all new display component bindings would use the video
> >> ports/endpoints to describe the connections. It will be very difficult
> >> to improve the display driver model later if we're missing such critic=
al
> >> pieces from the DT bindings.
> > Why do we need a complex graph when it can be handled using a simple ph=
andle?
>=20
> Maybe in your case you can handle it with simple phandle. Can you
> guarantee that it's enough for everyone, on all platforms?

Nobody can guarantee that. An interesting effect that DT ABI stability
has had is that people now try to come up with overly generic concepts
to describe devices in an attempt to make them more future-proof. I
don't think we're doing ourselves a favour with that approach.

> The point of the ports/endpoint graph is to also support more
> complicated scenarios.

But the scenario will always remain the same for this bridge. There will
always be an input signal and a translation to some output signal along
with some parameters to control how that translation happens. More
complicated scenarios will likely need to be represented differently at
a higher level than the bridge.

> If you now create ps8622 bindings that do not
> support those graphs, the no one else using ps8622 can use
> ports/endpoint graphs either.

That's not true. The binding can easily be extended in a backwards-
compatible way later on (should it really prove necessary).

Thierry

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH9iFAAoJEN0jrNd/PrOhsKcP/0dD6oQBaDB9CSNzqXaQl8Rq
M2uT2NRgclavpEc+HwIzzAopVz3n739IKWQwcWt7ULStBujF56BhyghZq2/YqrMV
mfmLoFPweGaNI30ocH3TXxmxpFElwH6iCU61QU8pY+HViffwTJcrJcHQROIt3Rqh
RA6HP4SmqPpU17ObGC6oFkq6cjpZ6hsNeh8kwFBslH3BkMJ16qu8JuthTVZkXZMJ
oe1gDZjMh1DWQ++QGW39XOoI4A3eYz/aOVawg5ZcI/QOjvYBkOqfWSyEW5onyZ08
AcJDszUyydHfss+5plvX+6goI2uRw8pVRJqSQIkz77pQBPbebqxSEO21mzJekNoG
Kz7FDe6TKCntU3PCkxN7GxjLi9cKBeOCSZRt8VQx4RtCuuKbZPiUIEgmOEq1pxSe
fUvM703VUadT9XbOw/UsMvGvdFlJ28RK61XUXpg2NqsQ4qgNXZgy8bX680zDTbrC
tkkKe3T181ghei5ymjreotac0M35iimufWqRaD060NZqtk6lk1MDV/XQNitZ4dwC
bIqVmh+iAJyHBmgmXclpNNbSqHcNhFLnSfQ39OK2UMyFItpxUgJVlIHqnuxrjt7J
0GfkJw0Pa8m/EHWo9oo+A49iYy/wfOpV2KS/sJLYiGPUcU3N6Rvr0mPmzvwEPHjI
Wykuk/jSW/Sf1xkIe22Z
=A+vz
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--

--===============2041181445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2041181445==--
