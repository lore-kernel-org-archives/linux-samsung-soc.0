From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:54:27 +0300
Message-ID: <54213543.7000306@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2fxIV9SaHef2qgtHFAxCMeRroX7BEMEwa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923060452.GD30514@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--2fxIV9SaHef2qgtHFAxCMeRroX7BEMEwa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 09:04, Thierry Reding wrote:

> I certainly agree that it's useful to have standard ways to describe at=

> least various aspects. For example I think it would be useful to add
> standard properties for a bridge's connections, such as "bridge" or
> "panel" to allow bridge chaining and attaching them to panels.

I don't see a need for such properties. Do you have examples where they
would be needed?

The driver for the respective device does know if it's a bridge or a
panel, so that information is there as soon as the driver has loaded.

> But I think that should be the end of it. Mandating anything other than=

> that will just complicate things and limit what people can do in the
> binding.
>=20
> One of the disadvantages of the video graph bindings is that they are
> overly vague in that they don't carry information about what type a
> device is. Bindings then have to require additional meta-data, at which=

> point it's become far easier to describe things with a custom property
> that already provides context.

I don't see why the graphs and such metadata are connected in any way.
They are separate issues. If we need such metadata, it needs to be added
in any case. That is not related to the graphs.

>> Yes, there's always one active input and one output for this bridge.
>> What the video graphs would bring is to have the possibility to have
>> multiple inputs and outputs, of which a single ones could be active at=
 a
>> time. The different inputs and outputs could even have different
>> settings required (say, first output requires this bit set, but when
>> using second output that bit must be cleared).
>=20
> As discussed elsewhere this should be handled at a different level then=
=2E
> DT should describe the hardware and this particular bridge device simpl=
y
> doesn't have a means to connect more than a single input or more than a=

> single output.

Well, I can't say about this particular bridge, but afaik you can
connect a parallel RGB signal to multiple panels just like that, without
any muxing.

If a mux is needed, I agree that there should be a device for that mux.
But we still need a way to have multiple different "configuration sets"
for the bridge, as I explained in the earlier mail.

 Tomi



--2fxIV9SaHef2qgtHFAxCMeRroX7BEMEwa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUITVDAAoJEPo9qoy8lh71VsUP/R444I9BadQZkdFhJoFt68/6
nxoUArfEeCPzbpOOidFhAgfmsqOUK4bxq6ORYAL40IkEbqO4wWlOzHtbFOqhfK9h
Liq08j5HEfigoZO5CLHt7C+oc5YGsb97Tbs5vqBhh8kpVyvT7RwdgzcjMhvlx7l1
iCQNhp8+FR9ZzPDnjgQF6MNr7vGwg5FcvYF7HZdmY1VGlJJERHT5i8leVGBWWTwm
RQ/OqKa0dYcfsVRRMExvMXPU9QD6YczQbfZPjRT7aNVkBC2pz95RjbtNIv23Spad
0yAsuK3eyAMtGNV89DCg3kaRnjBcowl+ZWTEc/I22pudntEJGCewD+SqKgCqx+x7
x9B75NGQd2C3pR+4m1ekfZaHBnT6qIby1iMvOblSrfheTiQBScvVbNHTAwvrLr6v
7qrWrAh8FTmluLJc/lLKHfClo0j1p9EFLl8hVHkgaqSQ3Jjrxg/u6Z0uA5yRxgZE
k3Fq94MGoOZTp5oMugKH2v0eRsgJL+Ei0z+oHEniCTBoPLrqeT7nYR2OfLaGYbPW
MJtWFD1CJycwO9X0ADz7Z3QStXAIlYo1naIc8dbIsk17mYXVbhcnt2W/lqKWKwID
MG/ZtyNXYe09WpKi06Tlp05USf6h8kIYAKlhyi44KkYKB77ooqI0tNTtIrSCfSrS
iRTd2f/7fK9bB0SPq5EU
=zKIC
-----END PGP SIGNATURE-----

--2fxIV9SaHef2qgtHFAxCMeRroX7BEMEwa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
