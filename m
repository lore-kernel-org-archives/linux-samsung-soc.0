From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 12:41:24 +0200
Message-ID: <20140922104123.GP1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <20140922081036.GD1470@ulmo>
 <CAEC9eQPKqGaHdQXNu75LOno0RTePk4zbBuaf9WESaZfbcpCVmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1597105404=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPKqGaHdQXNu75LOno0RTePk4zbBuaf9WESaZfbcpCVmg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1597105404==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fjEAjMKpll6GDq3U"
Content-Disposition: inline


--fjEAjMKpll6GDq3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 02:01:38PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> On Mon, Sep 22, 2014 at 1:40 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
> >> Hi Tomi,
> >>
> >> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen <tomi.valkeinen@ti.com=
> wrote:
> >> > On 17/09/14 17:29, Ajay kumar wrote:
> >> >> Hi Tomi,
> >> >>
> >> >> Thanks for your comments.
> >> >>
> >> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.=
com> wrote:
> >> >>> On 27/08/14 17:39, Ajay Kumar wrote:
> >> >>>> Add documentation for DT properties supported by ps8622/ps8625
> >> >>>> eDP-LVDS converter.
> >> >>>>
> >> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >>>> ---
> >> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++=
++++++++++++++
> >> >>>>  1 file changed, 20 insertions(+)
> >> >>>>  create mode 100644 Documentation/devicetree/bindings/video/bridg=
e/ps8622.txt
> >> >>>>
> >> >>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps862=
2.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >> >>>> new file mode 100644
> >> >>>> index 0000000..0ec8172
> >> >>>> --- /dev/null
> >> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >> >>>> @@ -0,0 +1,20 @@
> >> >>>> +ps8622-bridge bindings
> >> >>>> +
> >> >>>> +Required properties:
> >> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> >> >>>> +     - reg: first i2c address of the bridge
> >> >>>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pi=
n.
> >> >>>> +     - reset-gpios: OF device-tree gpio specification for RST_ p=
in.
> >> >>>> +
> >> >>>> +Optional properties:
> >> >>>> +     - lane-count: number of DP lanes to use
> >> >>>> +     - use-external-pwm: backlight will be controlled by an exte=
rnal PWM
> >> >>>
> >> >>> What does this mean? That the backlight support from ps8625 is not=
 used?
> >> >>> If so, maybe "disable-pwm" or something?
> >> >> "use-external-pwm" or "disable-bridge-pwm" would be better.
> >> >
> >> > Well, the properties are about the bridge. "use-external-pwm" means =
that
> >> > the bridge uses an external PWM, which, if I understood correctly, is
> >> > not what the property is about.
> >> >
> >> > "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
> >> > properties are about the bridge, so it's implicit.
> >> Ok. I will use "disable-pwm".
> >
> > Why is this even necessary? According to the datasheet this device has
> > circuitry for backlight control. If so, I'd expect it to expose either a
> > backlight device or a PWM device. That way unless somebody is using the
> > backlight/PWM exposed by the bridge the bridge can simply disable PWM.
> The driver does expose a backlight device.
> And, the decision(whether to expose a backlight device or not) is made
> based on the DT flag "use-external-pwm".
> This was discussed before, and you suggested to use the boolean
> property, refer to this link:
> http://lists.freedesktop.org/archives/dri-devel/2014-July/065048.html

I think you misunderstood what I said, or maybe I didn't explain clearly
what I meant. If the PS8622 provides a backlight there's nothing wrong
with always exposing it. The bridge itself isn't going to be using the
backlight anyway. Rather the panel itself should be using the backlight
device exposed by PS8622 or some separate backlight device.

To illustrate by an example:

	ps8622: ... {
		compatible =3D "parade,ps8622";
		...
	};

	panel {
		...
		backlight =3D <&ps8622>;
		...
	};

Or:

	backlight: ... {
		compatible =3D "pwm-backlight";
		...
	};

	panel {
		...
		backlight =3D <&backlight>;
		...
	};

What you did in v6 of this series was look up a backlight device and
then not use it. That seemed unnecessary. Looking at v6 again the reason
for getting a phandle to the backlight was so that the device itself did
not expose its own backlight controlling circuitry if an external one
was being used. But since the bridge has no business controlling the
backlight, having the backlight phandle in the bridge is not correct.

So I think what you could do in the driver instead is always expose the
backlight device. If the panel used a different backlight, the PS8622's
internal on simply wouldn't be accessed. It would still be possible to
control the backlight in sysfs, but that shouldn't be a problem (only
root can access it).

That said, I have no strong objections to the boolean property if you
feel like it's really necessary.

Thierry

--fjEAjMKpll6GDq3U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH/zTAAoJEN0jrNd/PrOhGGUP/2b7JBUqv/0og1PD9MYgzm7w
AOwhdmOv0Nv/n+MWDzDE7CIKDBZ95Yv+UrYFlM1ZmFOp1qXxCJEbvmOdXsZj0tvQ
iKfs4ejytMpI8e5eNkS0OBWh52W9xlwmv49vqcEVcAIgpTfTKVsY0GrY1kwlHcTy
f5YSk4IHZhjyJDVDwZP3thMh3t7MHHqJYQJlaBL0scNdMUtozjqNXhHtRy9uvI2g
jY/CmL6ZKmmP07jeaCLjAnIwgQTKgMLgesGdUTgBaluwQBJJQSmx2PYKKgod3JjB
g331Pir06Mt4d5JYrbGABk8Z9p26WMfobpbATrgQiGhv3nney2E/bHgfam5gxhqh
on0jbCk8eBcvPcSxoxgtm+EXN2HSRQmEkY2D5/ftnMxBdQ13oecnh90QfcadTbDf
jEuPqLXI2C37WqkcX1/wCTS08jS5c1nRwLsngs5r0+0fjyBFxSMvEywa+TJUxPnw
IrvK0i1DSBd5rEm30WgZ86rUEmWhxE0t/rPsjT1H+YtEvvxJtZIoMKawZCdc0uPp
hwvkVKx4njfvKN2Up5i4SMgs0+VODIjBej0rktnLH/tBLc4J83Khh959Sq7i0m4z
7EKeORnptFfl0xC1Eu0vk+vQSmTbMBkWhk9kEq1DlLf1rHec0xfF8lx+WPjSTrsn
x5W4iK113BmUPrcElXIW
=43Oi
-----END PGP SIGNATURE-----

--fjEAjMKpll6GDq3U--

--===============1597105404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1597105404==--
