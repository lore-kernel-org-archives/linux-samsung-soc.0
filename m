From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 07:55:34 +0200
Message-ID: <20140923055533.GC30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOSFj-NWVYCtdcQz0nFM+1rVxPeC76eBdj-X4w+HWujZA@mail.gmail.com>
 <20140922113514.GS1470@ulmo> <7550026.qs7FRi8hDC@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1835892438=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7550026.qs7FRi8hDC@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1835892438==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 03:00:37AM +0300, Laurent Pinchart wrote:
> On Monday 22 September 2014 13:35:15 Thierry Reding wrote:
> > On Mon, Sep 22, 2014 at 04:53:22PM +0530, Ajay kumar wrote:
> > > On Mon, Sep 22, 2014 at 4:11 PM, Thierry Reding wrote:
> > > > On Mon, Sep 22, 2014 at 02:01:38PM +0530, Ajay kumar wrote:
> > > >> On Mon, Sep 22, 2014 at 1:40 PM, Thierry Reding wrote:
> > > >> > On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
> > > >> >> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen wrote:
> > > >> >> > On 17/09/14 17:29, Ajay kumar wrote:
> > > >> >> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen wrote:
> > > >> >> >>> On 27/08/14 17:39, Ajay Kumar wrote:
> > > >> >> >>>> Add documentation for DT properties supported by ps8622/ps=
8625
> > > >> >> >>>> eDP-LVDS converter.
> > > >> >> >>>>=20
> > > >> >> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > > >> >> >>>> ---
> > > >> >> >>>>=20
> > > >> >> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20
> > > >> >> >>>>  ++++++++++++++++++++ 1 file changed, 20 insertions(+)
> > > >> >> >>>>  create mode 100644
> > > >> >> >>>>  Documentation/devicetree/bindings/video/bridge/ps8622.txt
> > > >> >> >>>>
> > > >> >> >>>> diff --git
> > > >> >> >>>> a/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> > > >> >> >>>> b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> > > >> >> >>>> new file mode 100644
> > > >> >> >>>> index 0000000..0ec8172
> > > >> >> >>>> --- /dev/null
> > > >> >> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps862=
2.txt
> > > >> >> >>>> @@ -0,0 +1,20 @@
> > > >> >> >>>> +ps8622-bridge bindings
> > > >> >> >>>> +
> > > >> >> >>>> +Required properties:
> > > >> >> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> > > >> >> >>>> +     - reg: first i2c address of the bridge
> > > >> >> >>>> +     - sleep-gpios: OF device-tree gpio specification for=
 PD_
> > > >> >> >>>> pin.
> > > >> >> >>>> +     - reset-gpios: OF device-tree gpio specification for=
 RST_
> > > >> >> >>>> pin.
> > > >> >> >>>> +
> > > >> >> >>>> +Optional properties:
> > > >> >> >>>> +     - lane-count: number of DP lanes to use
> > > >> >> >>>> +     - use-external-pwm: backlight will be controlled by =
an
> > > >> >> >>>> external PWM
> > > >> >> >>>=20
> > > >> >> >>> What does this mean? That the backlight support from ps8625=
 is
> > > >> >> >>> not used? If so, maybe "disable-pwm" or something?
> > > >> >> >>=20
> > > >> >> >> "use-external-pwm" or "disable-bridge-pwm" would be better.
> > > >> >> >=20
> > > >> >> > Well, the properties are about the bridge. "use-external-pwm"
> > > >> >> > means that the bridge uses an external PWM, which, if I under=
stood
> > > >> >> > correctly, is not what the property is about.
> > > >> >> >=20
> > > >> >> > "disable-bridge-pwm" is ok, but the "bridge" there is extra. =
The
> > > >> >> > properties are about the bridge, so it's implicit.
> > > >> >>=20
> > > >> >> Ok. I will use "disable-pwm".
> > > >> >=20
> > > >> > Why is this even necessary? According to the datasheet this devi=
ce
> > > >> > has circuitry for backlight control. If so, I'd expect it to exp=
ose
> > > >> > either a backlight device or a PWM device. That way unless someb=
ody
> > > >> > is using the backlight/PWM exposed by the bridge the bridge can
> > > >> > simply disable PWM.
> > > >>=20
> > > >> The driver does expose a backlight device.
> > > >> And, the decision(whether to expose a backlight device or not) is =
made
> > > >> based on the DT flag "use-external-pwm".
> > > >> This was discussed before, and you suggested to use the boolean
> > > >> property, refer to this link:
> > > >> http://lists.freedesktop.org/archives/dri-devel/2014-July/065048.h=
tml
> > > >=20
> > > > I think you misunderstood what I said, or maybe I didn't explain cl=
early
> > > > what I meant. If the PS8622 provides a backlight there's nothing wr=
ong
> > > > with always exposing it. The bridge itself isn't going to be using =
the
> > > > backlight anyway. Rather the panel itself should be using the backl=
ight
> > > > device exposed by PS8622 or some separate backlight device.
> > > >=20
> > > > To illustrate by an example:
> > > >         ps8622: ... {
> > > >        =20
> > > >                 compatible =3D "parade,ps8622";
> > > >                 ...
> > > >        =20
> > > >         };
> > > >        =20
> > > >         panel {
> > > >        =20
> > > >                 ...
> > > >                 backlight =3D <&ps8622>;
> > > >                 ...
> > > >        =20
> > > >         };
> > >=20
> > > No, if ps8622 backlight control is used, we need not specify the back=
light
> > > phandle for the panel driver. Somehow, ps8622 internal circuitry keeps
> > > the bootup glitch free :)
> > > Backlight control and panel controls can be separate then.
> >=20
> > But they shouldn't. Your panel driver should always be the one to
> > control backlight. How else is the bridge supposed to know when to turn
> > backlight on or off?
> >=20
> > > > What you did in v6 of this series was look up a backlight device and
> > > > then not use it. That seemed unnecessary. Looking at v6 again the r=
eason
> > > > for getting a phandle to the backlight was so that the device itsel=
f did
> > > > not expose its own backlight controlling circuitry if an external o=
ne
> > > > was being used. But since the bridge has no business controlling the
> > > > backlight, having the backlight phandle in the bridge is not correc=
t.
> > > >=20
> > > > So I think what you could do in the driver instead is always expose=
 the
> > > > backlight device. If the panel used a different backlight, the PS86=
22's
> > > > internal on simply wouldn't be accessed. It would still be possible=
 to
> > > > control the backlight in sysfs, but that shouldn't be a problem (on=
ly
> > > > root can access it)
> > >=20
> > > That would be like simple exposing a feature which cannot be used
> > > by the user, ideally which "should not be" used by the user.
> >=20
> > And it won't be used unless they access the sysfs files directly. There
> > are a lot of cases where we expose functionality that cannot be
> > meaningfully used by the user. For example, a GPIO may not be routed to
> > anything on a board, yet we don't explicitly hide any specific GPIOs
> > from users.
> >=20
> > > > That said, I have no strong objections to the boolean property if y=
ou
> > > > feel like it's really necessary.
> > >=20
> > > Won't you think having a boolean property for an optional
> > > feature of the device, is better than all these?
> >=20
> > Like I said, I'm indifferent on the matter. I don't think it's necessary
> > to hide the backlight device, but if you want to, please feel free to do
> > so.
>=20
> DT typically use
>=20
> 	status =3D "disabled"
>=20
> to disable devices. In this case we don't want to disable the ps8622=20
> completely, but just one of its functions. Maybe a "backlight-status" pro=
perty=20
> could be used for that ? If that's considered too verbose, I would be fin=
e=20
> with a "disable-<feature>" boolean property too.

Another alternative would be to make the backlight a subnode:

	ps8622: bridge@... {
		compatible =3D "parade,ps8622";
		...

		backlight {
			...
			status =3D "disabled";
			...
		};
	};

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIQtVAAoJEN0jrNd/PrOhbPAP+wQISkiVV77/2w/OrVBhNM3I
zsJX5+vKObTrrbtxLa3nWGQJsWruia7ES68o1USY+AACM0MoCUisxOcaGexP6pag
AGVwAQ3GbaclvPFlKQTVhCCNDF6vYUgtdJFrwUxOFShiKcxK7LaE0YAnE8txtviB
mqkHOg9hNndghribPOmv+C903X1FZXClW6LczcUA4vm5vz5jvEliyr2nRlEXWBEv
rLuzjsCaWMxcr44oM36M390ZbITFJKYxCIrmJFwXPdtBL/1fEKDN/hm+Ax9HJStj
urSu3qcrmJRNNqYey4xbu9G5aNbizt/ZJtWyS9piFldLTSbwtfv0sGbLPa2Ro7fp
IhX84kBmBHmhDSx2TyjBsKpcXcXosi14vWYcSnQo1wF9Q3tYwIBq/Ngb581DFMGh
lOwDJIW+FSwvocO0vyDRpHwwPNlS8eyhBNdDUeTu/dk8sunVZQ2QVRKDFfJeBjLu
aWTLuNcCRezjwJPcQBE6bmthWJxxdg9MR1oJsCouwK+gwQP3avJVG2zm6s1ncxOQ
p1cW4jynPO7Lkz90EmUq7SZEBmsb8UDMNfVy5jRKiuL1ogVFQB5AoQ9Mau1i50a5
Ciqex63x/alV3G49yj4lXTBqiGKUKqD9eFodru8kUu0tkdUGlSDUO0GUhjT16dM5
aYI3CheHW7pOn0Clo93h
=0Xry
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--

--===============1835892438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1835892438==--
