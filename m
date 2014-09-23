From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 15:09:44 +0300
Message-ID: <54216308.2050500@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo> <54214008.4040105@ti.com> <20140923100139.GT30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xw9hOKXafrhkmv9kXts4bVJW1WdE0cXkq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923100139.GT30514@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--xw9hOKXafrhkmv9kXts4bVJW1WdE0cXkq
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 13:01, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 12:40:24PM +0300, Tomi Valkeinen wrote:
>> On 23/09/14 11:35, Thierry Reding wrote:
>>
>>> Well, a display controller is never going to attach to a panel direct=
ly.
>>
>> With parallel RGB, that (almost) happens. There's voltage level shifti=
ng
>> probably in the middle, but I don't see anything else there.
>=20
> The level shifting could be considered an encoder. Anyway, I didn't mea=
n
> physically attach to a panel but rather in DRM. You'll always need an
> encoder and connector before you go to the panel.

"For now", you mean.

I'd rather see much more freedom there. If a display controller is
connected to a panel directly, with only non-controllable level shifters
in between (I don't even think those are strictly needed. why couldn't
there be a low-end soc that works with higher voltages?), I think we
should model it in the SW side by just having a device for the display
controller and a device for the panel. No artificial
encoders/bridges/connectors needed in between.

But I understand that for DRM legacy reasons that may never happen.

>>> But I agree that it would be nice to unify bridges and encoders more.=
 It
>>> should be possible to make encoder always a bridge (or perhaps even
>>> replace encoders with bridges altogether). Then once you're out of th=
e
>>> DRM device everything would be a bridge until you get to a panel.
>>
>> What exactly is a bridge and what is an encoder? Those are DRM
>> constructs, aren't they?
>=20
> Yes. I think bridges are mostly a superset of encoders.

Superset in what way? If I have a SiI9022 RGB-to-HDMI encoder embedded
into my SoC (i.e. a DRM encoder), or I have a board with a SiI9022
encoder on the board (i.e. a DRM bridge), what is different?

>> As I see it, a video pipeline consist of a video source (display
>> controller usually), a chain of encoders (all of which may not be
>> strictly "encoders", they could be level shifters, muxes, ESD protecti=
on
>> devices or such), and either a display device like a panel or a
>> connector to outside world.
>=20
> Well, the panel itself is attached to a connector. The connector is
> really what userspace uses to control the output and indirectly the
> panel.

Yep. That's also something that should be fixed. A connector SW entity
is fine when connecting an external monitor, but a panel directly
connected to the SoC does not have a connector, and it's the panel that
should be controlled from the userspace.

But again, the legacy...

>> Am I right that in DRM world the encoder is the first device in the
>> display chain after the display controller,
>=20
> Yes.
>=20
>>                                             and the next is a bridge?
>=20
> A bridge or a connector. Typically it would be a connector, but that's
> only if you don't have bridges in between.
>=20
>> That sounds totally artificial, and I hope we don't reflect that in th=
e
>> DT side in any way.
>=20
> Yes, they are software concepts and I'm not aware of any of it being
> exposed in DT. A display controller is usually implemented as DRM CRTC
> object and outputs (DSI, eDP, HDMI) as encoder (often with a connector
> tied to it).

Ok. Thanks for the clarifications.

 Tomi



--xw9hOKXafrhkmv9kXts4bVJW1WdE0cXkq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIWMIAAoJEPo9qoy8lh71/bAP/3YNxEr34RZMGRYtkFUS+hQb
XAYqqagcwmWEebMC/N2kQF9e8dVZ4yjdxa7qqQA+M9biXWd1ouVbbgvIFbA0il/w
23dZ8Ds72Ac5+R6ERGTyV/NvdFqhLu5+udQuYyEow0rqtCzorvHg89SReT+xWenN
nzr3e8sVA5LOnrOu//5v4PzB532xA7VBwhFHxIDx7FbATGSMZexeMAaxz9TLuWN5
L+dgPAA54LehwrtB/A1NF9BM3T4uvIYBi5UxO3ZtnYHjuC6qpdaIF1HSU8EJX8RH
x2dmd7IUU80naKEYaR2x0h75RTG41FSyV2HWC4yFNnSqwKuLctMopnzT5syTqYsp
1ShMhP5hHjPjdyGcJq3m823I4DNIfs9fsH+m66oUEQYe+58kJBTdi9ZFjMcj5AJO
bGO9rjeDj8os745M+O7oqBDnOiyieN1X+mMm4jpowT2j87zUHaYuPnt2uZXWkDYr
dntvGUHwfHoETLlX8vnD5D+jcbK5j5pLUi+FZmqX4NyGw6+pMnXZkuh2N8RPMMl4
Zf4YPBW9fRI3MOm7RBe+CI0bor4De0OA2wUSSiKggmGG/mZIXLz6HIkXK514NVdo
KiHYgfSPjyDV8DIxaiAXclJ2R/Goltobi3w/XKBSYvRbFJ9FKjVc1YHXLJcVOBxf
QLl4SyMlidyJ/CH41WWs
=g3aD
-----END PGP SIGNATURE-----

--xw9hOKXafrhkmv9kXts4bVJW1WdE0cXkq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
