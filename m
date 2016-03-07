From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Mon, 07 Mar 2016 09:26:31 +0100
Message-ID: <6877420.aKPrAc9Qh5@adelgunde>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk> <1488914.9p6SgUg6XA@adelgunde> <CAL_JsqLX-F=-k83_-5-QL2QZpAArQqOHjE+19c1wvNKWayYfMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart39390724.6bu8SLDD15"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLX-F=-k83_-5-QL2QZpAArQqOHjE+19c1wvNKWayYfMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--nextPart39390724.6bu8SLDD15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 02 March 2016 10:03:27 Rob Herring wrote:
> Reviving this thread...
>=20
> On Tue, Dec 15, 2015 at 3:09 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>=
 wrote:
> > Hi,
> >
> > On Monday 14 December 2015 09:45:48 Rob Herring wrote:
> >> On Mon, Dec 14, 2015 at 8:28 AM, Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >> > On Fri, Dec 11, 2015 at 3:06 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org=
> wrote:
> >> >> On Fri, Dec 11, 2015 at 6:39 AM, Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> >> >>> On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
> >> >>> <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> >>
> >> [...]
> >>
> >> >>> Markus Pargmann also did a series that add initial values to
> >> >>> hogs, which is the inverse usecase of this, where you want to
> >> >>> *output* something by default, then maybe also make it availab=
le
> >> >>> to userspace.
> >> >>>
> >> >>> So what we need to see here is a patch series that does all of=
 these
> >> >>> things:
> >> >>>
> >> >>> - Name lines
> >> >>>
> >> >>> - Sets them to initial values
> >> >>>
> >> >>> - Mark them as read-only
> >> >>>
> >> >>> - Mark them as "not used by the operating system" so that they=

> >> >>>   can be default-exported to userspace.
> >> >>
> >> >> No! This should not be a DT property.
> >> >>
> >> >> Whether I want to control a GPIO in the kernel or userspace is =
not
> >> >> known and can change over time. It could simply depend on kerne=
l
> >> >> config. There is also the case that a GPIO has no connection or=
 kernel
> >> >> driver until some time later when a DT overlay for an expansion=
 board
> >> >> is applied.
> >> >
> >> > That's correct. So from a DT point of view, what really matters =
is
> >> > to give things a name, and the hogs and initvals syntax already
> >> > has a structure for this that is in use
> >> > (from Documentation/devicetree/bindings/gpio/gpio.txt):
> >> >
> >> >         qe_pio_a: gpio-controller@1400 {
> >> >                 compatible =3D "fsl,qe-pario-bank-a", "fsl,qe-pa=
rio-bank";
> >> >                 reg =3D <0x1400 0x18>;
> >> >                 gpio-controller;
> >> >                 #gpio-cells =3D <2>;
> >> >
> >> >                 line_b {
> >> >                         gpio-hog;
> >> >                         gpios =3D <6 0>;
> >> >                         output-low;
> >> >                         line-name =3D "foo-bar-gpio";
> >> >                 };
> >> >         };
> >> >
> >> > Markus use this also for initial values. That could easily be us=
ed in
> >> > a budget version like this:
> >> >
> >> >                 line_b {
> >> >                         /* Just naming */
> >> >                         gpios =3D <6 0>;
> >> >                         line-name =3D "foo-bar-gpio";
> >> >                 };
> >> >
> >> > That could grow kind of big though. Or maybe not? How many
> >> > GPIO lines are actually properly named in a typical system?
> >>
> >> We should limit it to GPIOs with no connection to another node. Fo=
r
> >> example, I don't want to see a SD card detect in the list as that
> >> should be in the SD host node. However, that is hard to enforce an=
d
> >> can change over time. Removing it would break userspace potentiall=
y.
> >> Of course if the kernel starts own a signal that userspace used, t=
hen
> >> that potentially breaks userspace regardless of the DT changing. O=
TOH,
> >> using GPIOs in userspace is kind of use at your own risk.
> >
> > I see this a bit differently. I would really like to see the each G=
PIO having
> > two different names:
>=20
> I think we are saying the same thing...
>=20
> > - GPIO label: This is the name of the GPIO line in the schematic fo=
r example
>=20
> Yes.
>=20
> > - GPIO use (this is the current semantic of the GPIO name): The use=
 of a GPIO,
> >   e.g. 'sd-card-detect', 'LED', ...
>=20
> This should be determined from the compatible string and/or -gpios
> prefix. This is the what the function is and "label" is which one.
>=20
> > I think it would be good to describe all GPIO labels in gpiochip su=
bnodes as
> > gpio-hogging introduced it. This would offer a use-independent nami=
ng. The use
> > of the function could be defined in the device node that is using t=
his gpio.
>=20
> I think I agree here. You may have a defined function without any
> connection to another node. I also think we should encourage simple
> GPIO bindings like gpio-leds to be child nodes. Having them at the
> top-level is kind of arbitrary. Of course, allowing for both is
> required.
>=20
> > As an example perhaps something like this:
> >
> >         &gpiochip {
> >                 some_interrupt {
> >                         gpios =3D <4 0>;
> >                         line-name =3D "some_interrupt_line";
> >                 };
> >
> >                 line_b {
> >                         gpios =3D <6 0>;
> >                         line-name =3D "line-b";
> >                 };
> >         };
> >
> >         randomswitch {
> >                 compatible =3D "gpio-switch";
> >                 gpios =3D <&gpiochip 4 0>;
> >                 use =3D "action-trigger";
> >                 read-only;
> >         };
> >
> > Also this does seem kind of inconsistent with gpio-hogging and the =
proposed
> > gpio-initval. gpio-hogging is defined in subnodes of the gpio chip =
while
> > gpio-switches are not. As "gpio-switch" is not really any kind of d=
evice it
> > would perhaps make sense to keep this consistent with gpio-hogging =
as well and
> > define it in the same subnodes?
> > I would be happy about any consistent way.
>=20
> Yes, as well as gpio leds, keys, etc. bindings. The key is you would
> need to be able to start with something minimal and extend it with
> specific compatibles.

So if I understand you right it would be better to handle most
distinctions using compatibles? Something like this?

=09&gpiochip {
=09=09some_led {
=09=09=09compatible =3D "gpio-leds";
=09=09=09default-state =3D "on";
=09=09=09gpios =3D <3 0>;
=09=09=09line-name =3D "leda";
=09=09};

=09=09some_switch {
=09=09=09compatible =3D "gpio-switch", "gpio-initval";
=09=09=09gpios =3D <4 0>;
=09=09=09line-name =3D "switch1";

=09=09=09/* This is used by gpio-initval in case gpio-switch is not imp=
lemented */
=09=09=09output-low;
=09=09};

=09=09some_interrupt {
=09=09=09gpios =3D <5 0>;
=09=09=09line-name =3D "some_interrupt_line";
=09=09};

=09=09line_b {
=09=09=09gpios =3D <6 0>;
=09=09=09line-name =3D "line-b";
=09=09};
=09};

=09randomcomponent {
=09=09gpios =3D <&gpiochip 5 0>;
=09=09read-only;
=09};

In this case there is a gpio-led embedded within the gpiochip node. Als=
o
'some_switch' is a gpio-switch and falls back to being gpio-initval.
This way we can replace it at some point with a real driver. But if it
doesn't exist we can at least initialize the GPIO properly.

As you suggested this would open up the possibilities for all
compatibles and drivers for single gpios.

Best Regards,

Markus

>=20
> [...]
>=20
> >> We also have to consider how to handle add-on boards. We probably =
need
> >> a connector node which can remap connector signals to host signals=
 in
> >> order to have overlays independent of the host board DT. For GPIOs=

> >> this is probably a gpio-map property similar to interrupt-map. The=

> >> complicated part will be connectors that require pinmux setup of t=
he
> >> host.
> >
> > Also what about hotplugging gpio-chips? Is there any mechanism to l=
et the
> > 'gpio-switch' know that the GPIO is not there anymore?
>=20
> There are certainly issues around hotplug and GPIOs. If the
> gpio-switch device is a child of the gpio controller, then it should
> be possible.
>=20
> Rob
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart39390724.6bu8SLDD15
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3Ts9AAoJEEpcgKtcEGQQg9MP/0klag+6X6uw50TIupAA/HVF
0KQnyRZabAGt2BEnS55/Q+KFkHexDyV2QUKU1R+zUPNxCCl77NGST2K0nGvR9BQ/
nRM4xQbkD4Vtb1rMvdJNerv3BFtBZpu9QUGR4F2Ze49kyNWrreWI+h1z7CP1lJve
ezoMmt/k7D0g2TtNW0gAV5sYMvVfbjUfDKeNPB4jssERaaSeSjt8ybKSC0I47lRN
Q5K19Zu8Q1CvgPUZbNxxpQYOrJ2umBZO82rtHxGCwFOk0npQ+URMNZGNabbVaJVj
P5BD08SgCLRLTb8ZQmQ2r0zFOdTNzjLBqHZuOTkIsKbyp8yuULnRvCZDJdF62rOA
bx0j9/z6vV6Yn69dXd/GdvOIMcD91w/ENRlgJIR90d2lM3mHcoKDFfipnRHX6gl6
S9htuePOn6x+7GQewxX0K6uhwCokj7TEe+ZZ+zeMz/eRchBRPiyW7J2hNoZSnTz1
YWNVNyr7CIr4no9o46br8UVVC3J28eeFuaZIVRMunpKES3W8XFGQV6j1M6Lp8U/e
na9GvZ0sSmoqAgeyOvFIyuIg8+2a/lK7KpVw/vgKv2q2WIXF1dddLWR4U9B86HTS
46pem7jIkqT7+D2sFk4McPtXHS4VcSxIhlVOn61fX4TWOEocnDuQdPFh6cVrM9B2
MLyNFh0E/PXFnQPJ1bMy
=ltCr
-----END PGP SIGNATURE-----

--nextPart39390724.6bu8SLDD15--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
