From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Tue, 15 Dec 2015 10:09:38 +0100
Message-ID: <1488914.9p6SgUg6XA@adelgunde>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk> <CACRpkdYvU6YG5yRCLsyS7sq816t3shWw51OTR2-fkp-FqSeESg@mail.gmail.com> <CAL_JsqJXX71Bwbm21H3QAJxYDO60kyHgKVzXxxrH9ze6ZWYtXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2992927.AjHGm4qcri"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJXX71Bwbm21H3QAJxYDO60kyHgKVzXxxrH9ze6ZWYtXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Michael Welling <mwelling@ieee.org>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org


--nextPart2992927.AjHGm4qcri
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Monday 14 December 2015 09:45:48 Rob Herring wrote:
> On Mon, Dec 14, 2015 at 8:28 AM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
> > On Fri, Dec 11, 2015 at 3:06 PM, Rob Herring <robh+dt@kernel.org> w=
rote:
> >> On Fri, Dec 11, 2015 at 6:39 AM, Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >>> On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
> >>> <martyn.welch@collabora.co.uk> wrote:
>=20
> [...]
>=20
> >>> Markus Pargmann also did a series that add initial values to
> >>> hogs, which is the inverse usecase of this, where you want to
> >>> *output* something by default, then maybe also make it available
> >>> to userspace.
> >>>
> >>> So what we need to see here is a patch series that does all of th=
ese
> >>> things:
> >>>
> >>> - Name lines
> >>>
> >>> - Sets them to initial values
> >>>
> >>> - Mark them as read-only
> >>>
> >>> - Mark them as "not used by the operating system" so that they
> >>>   can be default-exported to userspace.
> >>
> >> No! This should not be a DT property.
> >>
> >> Whether I want to control a GPIO in the kernel or userspace is not=

> >> known and can change over time. It could simply depend on kernel
> >> config. There is also the case that a GPIO has no connection or ke=
rnel
> >> driver until some time later when a DT overlay for an expansion bo=
ard
> >> is applied.
> >
> > That's correct. So from a DT point of view, what really matters is
> > to give things a name, and the hogs and initvals syntax already
> > has a structure for this that is in use
> > (from Documentation/devicetree/bindings/gpio/gpio.txt):
> >
> >         qe_pio_a: gpio-controller@1400 {
> >                 compatible =3D "fsl,qe-pario-bank-a", "fsl,qe-pario=
=2Dbank";
> >                 reg =3D <0x1400 0x18>;
> >                 gpio-controller;
> >                 #gpio-cells =3D <2>;
> >
> >                 line_b {
> >                         gpio-hog;
> >                         gpios =3D <6 0>;
> >                         output-low;
> >                         line-name =3D "foo-bar-gpio";
> >                 };
> >         };
> >
> > Markus use this also for initial values. That could easily be used =
in
> > a budget version like this:
> >
> >                 line_b {
> >                         /* Just naming */
> >                         gpios =3D <6 0>;
> >                         line-name =3D "foo-bar-gpio";
> >                 };
> >
> > That could grow kind of big though. Or maybe not? How many
> > GPIO lines are actually properly named in a typical system?
>=20
> We should limit it to GPIOs with no connection to another node. For
> example, I don't want to see a SD card detect in the list as that
> should be in the SD host node. However, that is hard to enforce and
> can change over time. Removing it would break userspace potentially.
> Of course if the kernel starts own a signal that userspace used, then=

> that potentially breaks userspace regardless of the DT changing. OTOH=
,
> using GPIOs in userspace is kind of use at your own risk.

I see this a bit differently. I would really like to see the each GPIO =
having
two different names:
=2D GPIO label: This is the name of the GPIO line in the schematic for ex=
ample
=2D GPIO use (this is the current semantic of the GPIO name): The use of =
a GPIO,
  e.g. 'sd-card-detect', 'LED', ...

I think it would be good to describe all GPIO labels in gpiochip subnod=
es as
gpio-hogging introduced it. This would offer a use-independent naming. =
The use
of the function could be defined in the device node that is using this =
gpio.

As an example perhaps something like this:

=09&gpiochip {
=09=09some_interrupt {
=09=09=09gpios =3D <4 0>;
=09=09=09line-name =3D "some_interrupt_line";
=09=09};

=09=09line_b {
=09=09=09gpios =3D <6 0>;
=09=09=09line-name =3D "line-b";
=09=09};
=09};

=09randomswitch {
=09=09compatible =3D "gpio-switch";
=09=09gpios =3D <&gpiochip 4 0>;
=09=09use =3D "action-trigger";
=09=09read-only;
=09};

Also this does seem kind of inconsistent with gpio-hogging and the prop=
osed
gpio-initval. gpio-hogging is defined in subnodes of the gpio chip whil=
e
gpio-switches are not. As "gpio-switch" is not really any kind of devic=
e it
would perhaps make sense to keep this consistent with gpio-hogging as w=
ell and
define it in the same subnodes?
I would be happy about any consistent way.

>=20
> The only real differences between this and Martyn's proposal are the
> location of the nodes and having a compatible string. A compatible
> string may be good to have. It indicates type of signal, but not
> specific use. Similar to how gpio-key compatible defines the function=
,
> but not what key code, or gpio-led does not say what color LED. A
> compatible here could cover switches, mode/id/revision strapping
> signals, jumpers, presence detect, etc.
>=20
> > The problem is that naming is usually imposed by consumers (they
> > are the ones who know how the line is used).
> >
> > And then I do not mean naming it after the pin on the capsule
> > where it comes out as per the datasheet, but
> > naming it after the actual use.
>=20
> Right. We need a way to query "I need the GPIO that does X" which
> works across boards.
>=20
> > Naming it after the hardware specs is something the operating
> > system can do, in Linux' case by the array char *names; inside the
> > struct gpio_chip and should not be part of the bindings IMO.
>=20
> Agreed. That just came up with STM32 gpio bindings[1].
>=20
> > I would rather imagine this is something used in a top-level board
> > file naming it: "header-2-22" for the 22nd pin on some second heade=
r
> > on my BeagleBone Black or something like that. And those may not
> > be so vast in numbers so they could be named using this pattern.
>=20
> Exactly. This is one of the cases I care about. However, this is not
> really a function, but it is SOC independent at least.
>=20
> We also have to consider how to handle add-on boards. We probably nee=
d
> a connector node which can remap connector signals to host signals in=

> order to have overlays independent of the host board DT. For GPIOs
> this is probably a gpio-map property similar to interrupt-map. The
> complicated part will be connectors that require pinmux setup of the
> host.

Also what about hotplugging gpio-chips? Is there any mechanism to let t=
he
'gpio-switch' know that the GPIO is not there anymore?

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2992927.AjHGm4qcri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWb9jYAAoJEEpcgKtcEGQQ0HMP/0KuQ+tafydcpV6Qj/nOsMTl
mvhtaMv65BbLp+UZV5vLukQ56sE3Lr9Uf42Dq+uSLlFJtwmpPGLeESxGxnGoz/h/
Cgh4tq3nxet7XlNVD5wxNUz6UZPdvx9z0BgLsLxiaPM7aytZkfNhbW5LvPSofy1H
kYtWDxONrso2QOYEc2IxSWSduYQIyDIxG2SOLqK9ZscALAL0oUt08stJkw9k9j8P
BZQF7OUlYBv/P2302Ozt6vpH/NNFm/o+0H5RSfL1XsLjB7tBGsxHFYhd2lIusXbl
8xmtIADLpVjAQAEdFW0pvbzlGU85oP7mZKnedyh0TlgIoP63v2GbtX+nv5P78Wwi
AtdQQJN0CG6Z8E6rR4ZOx1HA0T0D6BFzkztp86djlGAzQOvojj0SpVl7idTPoOO6
eUo0bsztxXB9mk35hPjZoHxo+sZxaq6y4rZPMsYrKsDDZXPYuFq1tjM25HYrLmzX
U7w6Vz9MDrskCoPCkr4VLHonkHWOa3qIuEG6u+1YWQUxPMC3okz3QXKZMD1WieqQ
RXzr8bNC0Z0p+ekoErp5YITHxOJHvBW4KWadPUlgNU4jM7il8e5QTNp8oyw3eiEg
sEjTUwj1xT6l8ix/aPQ5CBYckUbf6dH7Shtpus3INytTfYrLASa2CMCM5OQUSWuF
rIV6xBV6pNWeosE/AUfG
=A0NX
-----END PGP SIGNATURE-----

--nextPart2992927.AjHGm4qcri--
