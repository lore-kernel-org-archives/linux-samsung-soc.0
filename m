From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 05/12] Documentation: Add DT bindings for panel-lvds
 driver
Date: Mon, 21 Jul 2014 09:52:11 +0200
Message-ID: <20140721075210.GC8843@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-6-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQNygvwOGvw6QPGp+=7K9=oC9XvcEf9QSv=JBsEHyhM0wA@mail.gmail.com>
 <20140717224809.GA8875@mithrandir>
 <CAEC9eQMJnae6DaAUd7C5xZkaaaXL+291Qf2pcUd-wrcYXgQx8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467325697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQMJnae6DaAUd7C5xZkaaaXL+291Qf2pcUd-wrcYXgQx8A@mail.gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0467325697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 12:18:05PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> Thanks for your comments.
>=20
> On Fri, Jul 18, 2014 at 4:18 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, Jul 18, 2014 at 02:20:39AM +0530, Ajay kumar wrote:
> >> +devicetree@vger.kernel.org
> >>
> >> On Fri, Jul 18, 2014 at 2:13 AM, Ajay Kumar <ajaykumar.rs@samsung.com>=
 wrote:
> >> > Add DT binding documentation for panel-lvds driver.
> >> >
> >> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> > ---
> >> >  .../devicetree/bindings/panel/panel-lvds.txt       |   50 +++++++++=
+++++++++++
> >> >  1 file changed, 50 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/panel/panel-lv=
ds.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt =
b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> >> > new file mode 100644
> >> > index 0000000..fdf91da2
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> >> > @@ -0,0 +1,50 @@
> >> > +panel interface for eDP/lvds panels
> >> > +
> >> > +Required properties:
> >> > +  - compatible: "panel-lvds"
> >
> > I think I've said this before. I oppose the addition of this binding. We
> > need to list a device-specific compatible value here, wildcards like
> > this aren't a good choice. And then if we have that compatible value we
> > can move most of the optional properties below into a driver.
> Yes, "panel-lvds" is a wildcard for all lvds panels.
> And since lvds panels from different vendors have different values
> for power_up_delay, delay from video_to_backlight etc, I thought its
> better to pick them up from device tree.

What I'm saying is that we shouldn't be adding this type of wildcard.
Instead the compatible property needs to list the specific type of panel
and since the driver will match on that specific compatible, the values
for the delays etc. are all implicit and don't have to be listed in
device tree.

> >> > +Optional properties:
> >
> > If all these properties are optional, then what happens if a device tree
> > node doesn't contain any of them? Doesn't that turn the driver into one
> > big no-op?
> No! We need to provide lcd-supply and backlight-supply.

What are those? I don't see them described anywhere.

> >> > +       -lcd-enable-gpios:
> >> > +               panel LCD poweron GPIO.
> >> > +                       Indicates which GPIO needs to be powered up =
as output
> >> > +                       to powerup/enable the switch to the LCD pane=
l.
> >> > +       -backlight-enable-gpios:
> >> > +               panel LED enable GPIO.
> >> > +                       Indicates which GPIO needs to be powered up =
as output
> >> > +                       to enable the backlight.
> >
> > I've also said before that this really belongs in a backlight driver.
> > Chances are that you'll want to have a way to set the brightness of the
> > backlight as well, so simply an enable GPIO won't be good enough.
> Ok. I can handle this in backlight driver itself (with some minor glitche=
s).

You can make it work without glitches as well and we've discussed this
before.

> But, how do I map bridge functions to panel functions now?
> The bridge supports (pre_enable, enable, disable and post_disable) which =
I map
> with (prepare, enable, disable and unprepare) of the panel, using a sampl=
e layer
> called bridge to panel_binder.
> Moving out the backlight control from panel means I really don't need
> those extra
> panel calls(prepare and unprepare)!
> Then how to distribute 2 panel calls(enable and disable) across 4 bridge =
calls?

The .prepare() and .unprepare() functions are useful irrespective of
backlight control. What you want to separate is powering up the panel
=66rom enabling the backlight. So .prepare() could be what's doing the
power up of the panel (and possibly other initialization required to
make it work) and .enable() could be as simple as turning on the
backlight.

What I'm saying is rather than use a backlight-enable-gpios property in
the panel, that property should be part of the backlight device and the
GPIO can then be toggled by the backlight driver when the backlight is
enabled.

> >> > +       -panel-prepare-delay:
> >> > +               delay value in ms required for panel_prepare process
> >> > +                       Delay in ms needed for the panel LCD unit to
> >> > +                       powerup completely.
> >> > +                       ex: delay needed till eDP panel throws HPD.
> >> > +                           delay needed so that we cans tart readin=
g edid.
> >
> > If the panel signals HPD then we don't need this delay at all and we
> > should just wait for HPD instead.
> Not always for HPD, we need to wait for EDID module as well.

I always thought that HPD signalled readiness from the panel to provide
EDID, too. Are there really panels that need additional delays after HPD
has been signalled until the EDID can be read? Are there maybe other
ways to detect that EDID can't be read?

> >> > +       -panel-enable-delay:
> >> > +               delay value in ms required for panel_enable process
> >> > +                       Delay in ms needed for the panel backlight/L=
ED unit
> >> > +                       to powerup, and delay needed between video_e=
nable and
> >> > +                       backlight_enable.
> >> > +       -panel-disable-delay:
> >> > +               delay value in ms required for panel_disable process
> >> > +                       Delay in ms needed for the panel backlight/L=
ED unit
> >> > +                       powerdown, and delay needed between backligh=
t_disable
> >> > +                       and video_disable.
> >> > +       -panel-unprepare-delay:
> >> > +               delay value in ms required for panel_post_disable pr=
ocess
> >> > +                       Delay in ms needed for the panel LCD unit to
> >> > +                       to powerdown completely, and the minimum del=
ay needed
> >> > +                       before powering it on again.
> >
> > These delays are all panel specific and they don't vary per board, so
> > they shouldn't go into the device tree at all.
> But, fetching them from device tree would allow us to support all lvds
> panels in this single driver.

You can do that even without having this data in device tree. My point
is that this is redundant information once you know the panel's specific
compatible value. Therefore there shouldn't be a need to list this in
device tree again.

Thierry

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzMaqAAoJEN0jrNd/PrOh1oAQAL/EeXio+r+zYUqVG7pGgbER
k5yeIep+RXQMdJsdzPGP91+tddM5tLE7vuBv0KvasUVsPLEQT+8sXgm3+De3FDvn
Zsq6V50S4QlAGQMNetaJacPU+5zPbLBCAJGb+l4XzNn9oksEPntjzyXlThcqAm9h
XjVmbCD2LX2Ef3Dyvg7VgWo/0xPV+dIvs1ycyD4cWgS4iS6rgadOuDBj3qie7tx5
NUZMkPQSeathpNcu/PFobGAd084WqaFm/tHCcBI/xL3wAOXFAR/GDVBMrUiE/Y+U
d0IRKQAbgXi16Ffzu01Eczh2HErc/XFFtY4GCr5gQdn3hp/eRLZUGpkuVcEs8ZQ4
jauF8PkBN9dVd0nmEP8A1knLI3/v5QnyMGCkdEaGcQhOPuRlZcf1xWyM/fHlAy/D
klLXmLzkRRF1zTvMQPxH3tllBeiI0pWMU13H02mDUN7MZbPXBeUtelxaYk2pRIpJ
62BkduyxUISa5tvTqV94eeGwikZ7vzSdQer7ILaTHYcbCUbZH35NGXP36+X7Gt/w
c54u53xpu5CxUJmChQa21QWPcPiHt4ScYa6C6SGU3oKR2zU/9JkTFRzCi+uckXD8
jcaPrNHkL/DLSSev5+4AwpTti2xo0XCoFZnVG3Zlv5DB4jOS98k7/PDM01/UIwBT
JRjl2HWKt7DirefiIV6s
=VuJJ
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--

--===============0467325697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0467325697==--
