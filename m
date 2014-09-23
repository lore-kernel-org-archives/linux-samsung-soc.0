From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 23 Sep 2014 03:00:37 +0300
Message-ID: <7550026.qs7FRi8hDC@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQOSFj-NWVYCtdcQz0nFM+1rVxPeC76eBdj-X4w+HWujZA@mail.gmail.com> <20140922113514.GS1470@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1919974.rbhijzjc4y"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:43886 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752686AbaIWAAq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 20:00:46 -0400
In-Reply-To: <20140922113514.GS1470@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--nextPart1919974.rbhijzjc4y
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 22 September 2014 13:35:15 Thierry Reding wrote:
> On Mon, Sep 22, 2014 at 04:53:22PM +0530, Ajay kumar wrote:
> > On Mon, Sep 22, 2014 at 4:11 PM, Thierry Reding wrote:
> > > On Mon, Sep 22, 2014 at 02:01:38PM +0530, Ajay kumar wrote:
> > >> On Mon, Sep 22, 2014 at 1:40 PM, Thierry Reding wrote:
> > >> > On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
> > >> >> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen wrote:
> > >> >> > On 17/09/14 17:29, Ajay kumar wrote:
> > >> >> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen wrote:
> > >> >> >>> On 27/08/14 17:39, Ajay Kumar wrote:
> > >> >> >>>> Add documentation for DT properties supported by ps8622/=
ps8625
> > >> >> >>>> eDP-LVDS converter.
> > >> >> >>>>=20
> > >> >> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > >> >> >>>> ---
> > >> >> >>>>=20
> > >> >> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   =
20
> > >> >> >>>>  ++++++++++++++++++++ 1 file changed, 20 insertions(+)
> > >> >> >>>>  create mode 100644
> > >> >> >>>>  Documentation/devicetree/bindings/video/bridge/ps8622.t=
xt
> > >> >> >>>>
> > >> >> >>>> diff --git
> > >> >> >>>> a/Documentation/devicetree/bindings/video/bridge/ps8622.=
txt
> > >> >> >>>> b/Documentation/devicetree/bindings/video/bridge/ps8622.=
txt
> > >> >> >>>> new file mode 100644
> > >> >> >>>> index 0000000..0ec8172
> > >> >> >>>> --- /dev/null
> > >> >> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8=
622.txt
> > >> >> >>>> @@ -0,0 +1,20 @@
> > >> >> >>>> +ps8622-bridge bindings
> > >> >> >>>> +
> > >> >> >>>> +Required properties:
> > >> >> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> > >> >> >>>> +     - reg: first i2c address of the bridge
> > >> >> >>>> +     - sleep-gpios: OF device-tree gpio specification f=
or PD_
> > >> >> >>>> pin.
> > >> >> >>>> +     - reset-gpios: OF device-tree gpio specification f=
or RST_
> > >> >> >>>> pin.
> > >> >> >>>> +
> > >> >> >>>> +Optional properties:
> > >> >> >>>> +     - lane-count: number of DP lanes to use
> > >> >> >>>> +     - use-external-pwm: backlight will be controlled b=
y an
> > >> >> >>>> external PWM
> > >> >> >>>=20
> > >> >> >>> What does this mean? That the backlight support from ps86=
25 is
> > >> >> >>> not used? If so, maybe "disable-pwm" or something?
> > >> >> >>=20
> > >> >> >> "use-external-pwm" or "disable-bridge-pwm" would be better=
.
> > >> >> >=20
> > >> >> > Well, the properties are about the bridge. "use-external-pw=
m"
> > >> >> > means that the bridge uses an external PWM, which, if I und=
erstood
> > >> >> > correctly, is not what the property is about.
> > >> >> >=20
> > >> >> > "disable-bridge-pwm" is ok, but the "bridge" there is extra=
. The
> > >> >> > properties are about the bridge, so it's implicit.
> > >> >>=20
> > >> >> Ok. I will use "disable-pwm".
> > >> >=20
> > >> > Why is this even necessary? According to the datasheet this de=
vice
> > >> > has circuitry for backlight control. If so, I'd expect it to e=
xpose
> > >> > either a backlight device or a PWM device. That way unless som=
ebody
> > >> > is using the backlight/PWM exposed by the bridge the bridge ca=
n
> > >> > simply disable PWM.
> > >>=20
> > >> The driver does expose a backlight device.
> > >> And, the decision(whether to expose a backlight device or not) i=
s made
> > >> based on the DT flag "use-external-pwm".
> > >> This was discussed before, and you suggested to use the boolean
> > >> property, refer to this link:
> > >> http://lists.freedesktop.org/archives/dri-devel/2014-July/065048=
.html
> > >=20
> > > I think you misunderstood what I said, or maybe I didn't explain =
clearly
> > > what I meant. If the PS8622 provides a backlight there's nothing =
wrong
> > > with always exposing it. The bridge itself isn't going to be usin=
g the
> > > backlight anyway. Rather the panel itself should be using the bac=
klight
> > > device exposed by PS8622 or some separate backlight device.
> > >=20
> > > To illustrate by an example:
> > >         ps8622: ... {
> > >        =20
> > >                 compatible =3D "parade,ps8622";
> > >                 ...
> > >        =20
> > >         };
> > >        =20
> > >         panel {
> > >        =20
> > >                 ...
> > >                 backlight =3D <&ps8622>;
> > >                 ...
> > >        =20
> > >         };
> >=20
> > No, if ps8622 backlight control is used, we need not specify the ba=
cklight
> > phandle for the panel driver. Somehow, ps8622 internal circuitry ke=
eps
> > the bootup glitch free :)
> > Backlight control and panel controls can be separate then.
>=20
> But they shouldn't. Your panel driver should always be the one to
> control backlight. How else is the bridge supposed to know when to tu=
rn
> backlight on or off?
>=20
> > > What you did in v6 of this series was look up a backlight device =
and
> > > then not use it. That seemed unnecessary. Looking at v6 again the=
 reason
> > > for getting a phandle to the backlight was so that the device its=
elf did
> > > not expose its own backlight controlling circuitry if an external=
 one
> > > was being used. But since the bridge has no business controlling =
the
> > > backlight, having the backlight phandle in the bridge is not corr=
ect.
> > >=20
> > > So I think what you could do in the driver instead is always expo=
se the
> > > backlight device. If the panel used a different backlight, the PS=
8622's
> > > internal on simply wouldn't be accessed. It would still be possib=
le to
> > > control the backlight in sysfs, but that shouldn't be a problem (=
only
> > > root can access it)
> >=20
> > That would be like simple exposing a feature which cannot be used
> > by the user, ideally which "should not be" used by the user.
>=20
> And it won't be used unless they access the sysfs files directly. The=
re
> are a lot of cases where we expose functionality that cannot be
> meaningfully used by the user. For example, a GPIO may not be routed =
to
> anything on a board, yet we don't explicitly hide any specific GPIOs
> from users.
>=20
> > > That said, I have no strong objections to the boolean property if=
 you
> > > feel like it's really necessary.
> >=20
> > Won't you think having a boolean property for an optional
> > feature of the device, is better than all these?
>=20
> Like I said, I'm indifferent on the matter. I don't think it's necess=
ary
> to hide the backlight device, but if you want to, please feel free to=
 do
> so.

DT typically use

=09status =3D "disabled"

to disable devices. In this case we don't want to disable the ps8622=20=

completely, but just one of its functions. Maybe a "backlight-status" p=
roperty=20
could be used for that ? If that's considered too verbose, I would be f=
ine=20
with a "disable-<feature>" boolean property too.

> Another alternative would be not to expose it at all and not have the=

> boolean property since you don't seem to have a way to test it in the=

> first place (or at least there's no device support upstream where it'=
s
> needed).

=2D-=20
Regards,

Laurent Pinchart

--nextPart1919974.rbhijzjc4y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABAgAGBQJUILgqAAoJEIkPb2GL7hl1WFMH/jOBjTqgOSRv4fVDDT6ofLoG
85uAJX5eMV85wM/9tuaR4hhRCB/qfGCejm8zNpGM/D3rEjV2XqUitKaMtt9dk/he
Rqc/CF4P1HZlvTe+CmRB5khWPtPU89XymnOq5wJmC0Qc6nj9EOm+ssE0V0wnodL4
MAR9kTv4jwf66xYTA0xjwLdYLCWPkkx3pXx4o+aWAwSH5S9h7gesxd5RdcqIhX93
KWgromAgzBZEaSgZLj8Y4YLjuzwlYbPjaCgZoRYqY1ro8GOp56pA2MAGOhExnajO
aJCeyAzs0bJkSVUm8Ulb0JafboUx7hFye2pXsfrm3qiltMxzV/D8Z3V2c+qorj4=
=nGz1
-----END PGP SIGNATURE-----

--nextPart1919974.rbhijzjc4y--
