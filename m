From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:41:52 +0300
Message-ID: <54213250.8050107@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com> <541C279A.2030601@ti.com> <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com> <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo> <54203561.5090306@ti.com> <20140923055352.GB30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="5Cc43QjiFmX8JOwdkhJo4POFmxOhKF60u"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923055352.GB30514@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--5Cc43QjiFmX8JOwdkhJo4POFmxOhKF60u
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 08:53, Thierry Reding wrote:

>> Yes, it's true we need a mux there. But we still have the complication=

>> that for panel0 we may need different ps8622 settings than for panel1.=

>=20
> Yes, and that's why the bridge should be querying the panel for the
> information it needs to determine the settings.

That only works if the settings to be queried are standard ones.

But, for example, let's say that the board is designed in a way that for
panel0 the bridge needs to output a bit higher level voltages than for
panel1. That's not a property of the panel, so it can't be queried from
the panel.

That feature (varying the voltage level) is specific to the bridge, and
thus the properties should be in the bridge's DT data. So we need two
different configurations in the bridge, one for panel0 and one for
panel1. This is what endpoints give us.

>> If that's the case, then I think we'd need to have two output endpoint=
s
>> in ps8622, both going to the mux, and each having the settings for the=

>> respective panel.
>=20
> But we'd be lying in DT. It no longer describes the hardware properly.
> The device only has a single input and a single output with no means to=

> mux anything. Hence the device tree shouldn't be faking multiple inputs=

> or outputs.

No, a port is a single physical output. An endpoint is a logical entity
on that single physical output.

So a bridge with a single output has one output port, but it may have as
many endpoints on that port as needed. Only one endpoint of a port can
be active at a time.

> I don't think we need to have a common way to describe video devices. I=
n
> my opinion DT bindings are much better if they are specifically tailore=
d
> towards the device that they describe. We'll provide a driver for that
> device anyway, so we should be creating appropriate abstractions at the=

> OS level to properly handle them.

I disagree. If we don't have a common way to describe the connections
between video devices, we cannot:

- have a common helper library to parse the connections
- study the connections before the drivers are loaded
- handle the connections anywhere else than the specific driver for the
component

> To stay with the example of the board/display, I'd think that the final=

> component of the board DT would implement a bridge. The first component=

> of the display DT would similarly implement a bridge. Now if we have a
> way of chaining bridges and controlling a chain of bridges, then there
> is no need for anything more complex than a plain phandle in a property=

> from the board bridge to the display bridge.

Right, that works for many cases. Of course, nothing says there's a
bridge on the main board, it could be connected directly to the SoC.

>>> Whether this is described using a single phandle to the bridge or a m=
ore
>>> complicated graph is irrelevant. What matters is that you get a phand=
le
>>> to the bridge. The job of the operating system is to give drivers a w=
ay
>>> to resolve that phandle to some object and provide an API to access t=
hat
>>> object.
>>
>> I agree it's not relevant whether we use a simple phandle or complex
>> graph. What matter is that we have a standard way to express the video=

>> paths, which everybody uses.
>=20
> Not necessarily. Consistency is always good, but I think simplicity
> trumps consistency. What matters isn't how the phandle is referenced in=

> the device tree, what matters is that it is referenced and that it make=
s
> sense in the context of the specific device. Anything else is the job o=
f
> the OS.
>=20
> While there are probably legitimate cases where the video graph is
> useful and makes sense, in many cases terms like ports and endpoints ar=
e
> simply confusing.

I again agree that I'd like to have a simpler representation than video
graphs for the simpler use cases. But again, I think it's important to
have a standard representation for those connections.

Why do you think it wouldn't be good to have a standard for the simpler
connections (in addition to the video graphs)? What kind of device
specific variations do you see that would be needed?

Even if the points I gave about why a common way to describe connections
is important would not be relevant today, it sounds much safer to have a
standard representation in the DT for the connections. I'd only go for
device specific custom descriptions if there's a very important reason
for that. And I can't come up with any reason.

 Tomi



--5Cc43QjiFmX8JOwdkhJo4POFmxOhKF60u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUITJQAAoJEPo9qoy8lh71TnUP/jJKXQa/B5YKVW+M+QNQaabf
z3W54SpA3/QZeoCgWPn/6BmoegBuPX6Az0h8uD2Ofh1Y2DWyYIyb2McN6EdqIdfq
WQJ+Wl1ZP6iP7cWY5/GMeCeFLmKYC3u5ac9kvTu5a/zPtw2KBWOdJ3dqxbjTF48b
b5RA4By0r8iBPgkOD0hBNzzblqivVYA+9eO5kfeW37ubfgDjdOjlsuS5p057eLb6
4vKS3XN2bssRgfoUW1Cji7to9I8j3iXh2dyh84cpyGippHMEuxg/J0cFxzKofhLB
aSsnmFZr8hE6un5BbvRQTXaGDtoNU0BQRFkcRkmzrCf14XSqVuR7pza09imwz3tV
uJAYlF+j77EkfhXnd8kPn4zvrtDqq2jHXBOPyU/ykjtOBHUvf4ptVKEM8unfVqOY
ulRv+KCyClndaLNPOYTrgQ5zAisueexJzoq5Dv7EleldrBEnU/cRICA9zdvbC9oX
HZ+bG+sDC/U3pqLnUdfhc/PlPrlC85wsLtcGFyqJ1FwT+pvdcFc1EMTMrrgjH2NK
hgjQSJbNNEvP5nEFnF8AdR1JgcGpdE2/zloT7sYFOH9NpRUMfBW9vPOLBAwm4GAh
A+fc7R2beTXMhiRSUHiEwc0Fx8JLF225XI3IFYwxtsBb4p7Hpb5Qylo78NH9IMqt
gJHOpxDZCugDkCWtMxyz
=jgCy
-----END PGP SIGNATURE-----

--5Cc43QjiFmX8JOwdkhJo4POFmxOhKF60u--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
