From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 09:54:25 +0200
Message-ID: <20140922075424.GB1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0069152934=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5419760A.7020908@ti.com>
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


--===============0069152934==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 02:52:42PM +0300, Tomi Valkeinen wrote:
> On 27/08/14 17:39, Ajay Kumar wrote:
> > Add documentation for DT properties supported by ps8622/ps8625
> > eDP-LVDS converter.
> >=20
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps86=
22.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt =
b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> > new file mode 100644
> > index 0000000..0ec8172
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> > @@ -0,0 +1,20 @@
> > +ps8622-bridge bindings
> > +
> > +Required properties:
> > +	- compatible: "parade,ps8622" or "parade,ps8625"
> > +	- reg: first i2c address of the bridge
> > +	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
> > +	- reset-gpios: OF device-tree gpio specification for RST_ pin.
> > +
> > +Optional properties:
> > +	- lane-count: number of DP lanes to use
> > +	- use-external-pwm: backlight will be controlled by an external PWM
>=20
> What does this mean? That the backlight support from ps8625 is not used?
> If so, maybe "disable-pwm" or something?
>=20
> > +
> > +Example:
> > +	lvds-bridge@48 {
> > +		compatible =3D "parade,ps8622";
> > +		reg =3D <0x48>;
> > +		sleep-gpios =3D <&gpc3 6 1 0 0>;
> > +		reset-gpios =3D <&gpc3 1 1 0 0>;
> > +		lane-count =3D <1>;
> > +	};
> >=20
>=20
> I wish all new display component bindings would use the video
> ports/endpoints to describe the connections. It will be very difficult
> to improve the display driver model later if we're missing such critical
> pieces from the DT bindings.

I disagree. Why would we want to burden all devices with a bloated
binding and drivers with parsing a complex graph when it's not even
known that it will be necessary? Evidently this device works fine
using the current binding. Just because there are bindings to describe
ports in a generic way doesn't mean it has to be applied everywhere.
After all the concept of ports/endpoints applies to non-video devices
too, yet we don't require the bindings for those devices to add ports
or endpoints nodes.

Also it won't be very difficult to extend the binding in a backwards
compatible way if that becomes necessary.

One thing that I'd like to see in this binding, though, is how to hook
up the bridge to a panel. However I'm still catching up on mail after
vacation, so perhaps this has already been discussed further down the
thread.

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH9WwAAoJEN0jrNd/PrOhEfoQAJC+l9vALk+djpMqyrAvTJtF
fPJYFqmSMgbVZPo3Z9luiXmwR8/BgC3djMzPuB5/BpFNdxeTbqIzMOv0ywg8Co21
bkZ56nX4dS2Gh4RfqrQwwKMD8Rm+WRUxpe1qgWxNBkltUfIwBpebZbUHLy+UoESv
hl0Dbnj+c9iE+rOwfMbY4/QZx5cET9Yud7McyjokFCfWsod3nZJ6LAfUBq9yrtO7
Naqm/dIIhIu8fA1q6wodl+GsCCqRytQ6RA4tFGgW/K4RWuBN2ILiHzSSKfgmH9uf
+yNHWonGgVR3dPlHxGqVWQRHUzPyGUVYMZtchXdJyjm5tVDgAQ/8+C9RhfnKHumF
oJiaz1lx9Twc+7ohKqWlsyJ1CLxNt0mKr+qzraTK/JHn71KAdxE6gSiW4+AuUDYA
Bpnt9Bxe0hwIoAStIuY3JHk8umFXkiqKTC0bsTwnAo/Er2avaPxvlsdGGAcLva0U
6nEnd2dSuhTInJD7EPnT372efncOIQvmtoYL76lepDGWyv828O64gz6y534Cf4FD
opkBVzDPDpa2IXNuTmo3vT5KnNjURv0vD4SjRkJkHWsBy1pb+bhx9KGtNlxJYKqH
6E6lsBUCpHVwV9OLFJQ/fOyx/M/egIL1ck7mboGJ24IqGOsCmkCLE6larjyvogcc
Z0RBylpr7QWiZ7S0RKvd
=/uHX
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--

--===============0069152934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0069152934==--
