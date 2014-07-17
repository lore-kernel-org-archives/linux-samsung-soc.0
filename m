From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 05/12] Documentation: Add DT bindings for panel-lvds
 driver
Date: Fri, 18 Jul 2014 00:48:11 +0200
Message-ID: <20140717224809.GA8875@mithrandir>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-6-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQNygvwOGvw6QPGp+=7K9=oC9XvcEf9QSv=JBsEHyhM0wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:44455 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896AbaGQWsP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 18:48:15 -0400
Content-Disposition: inline
In-Reply-To: <CAEC9eQNygvwOGvw6QPGp+=7K9=oC9XvcEf9QSv=JBsEHyhM0wA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 02:20:39AM +0530, Ajay kumar wrote:
> +devicetree@vger.kernel.org
>=20
> On Fri, Jul 18, 2014 at 2:13 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wr=
ote:
> > Add DT binding documentation for panel-lvds driver.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++++++++++=
++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.=
txt
> >
> > diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/D=
ocumentation/devicetree/bindings/panel/panel-lvds.txt
> > new file mode 100644
> > index 0000000..fdf91da2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> > @@ -0,0 +1,50 @@
> > +panel interface for eDP/lvds panels
> > +
> > +Required properties:
> > +  - compatible: "panel-lvds"

I think I've said this before. I oppose the addition of this binding. We
need to list a device-specific compatible value here, wildcards like
this aren't a good choice. And then if we have that compatible value we
can move most of the optional properties below into a driver.

> > +Optional properties:

If all these properties are optional, then what happens if a device tree
node doesn't contain any of them? Doesn't that turn the driver into one
big no-op?

> > +       -lcd-enable-gpios:
> > +               panel LCD poweron GPIO.
> > +                       Indicates which GPIO needs to be powered up as =
output
> > +                       to powerup/enable the switch to the LCD panel.
> > +       -backlight-enable-gpios:
> > +               panel LED enable GPIO.
> > +                       Indicates which GPIO needs to be powered up as =
output
> > +                       to enable the backlight.

I've also said before that this really belongs in a backlight driver.
Chances are that you'll want to have a way to set the brightness of the
backlight as well, so simply an enable GPIO won't be good enough.

> > +       -panel-prepare-delay:
> > +               delay value in ms required for panel_prepare process
> > +                       Delay in ms needed for the panel LCD unit to
> > +                       powerup completely.
> > +                       ex: delay needed till eDP panel throws HPD.
> > +                           delay needed so that we cans tart reading e=
did.

If the panel signals HPD then we don't need this delay at all and we
should just wait for HPD instead.

> > +       -panel-enable-delay:
> > +               delay value in ms required for panel_enable process
> > +                       Delay in ms needed for the panel backlight/LED =
unit
> > +                       to powerup, and delay needed between video_enab=
le and
> > +                       backlight_enable.
> > +       -panel-disable-delay:
> > +               delay value in ms required for panel_disable process
> > +                       Delay in ms needed for the panel backlight/LED =
unit
> > +                       powerdown, and delay needed between backlight_d=
isable
> > +                       and video_disable.
> > +       -panel-unprepare-delay:
> > +               delay value in ms required for panel_post_disable proce=
ss
> > +                       Delay in ms needed for the panel LCD unit to
> > +                       to powerdown completely, and the minimum delay =
needed
> > +                       before powering it on again.

These delays are all panel specific and they don't vary per board, so
they shouldn't go into the device tree at all.

> > +       -panel-width-mm: physical panel width [mm]
> > +       -panel-height-mm: physical panel height [mm]

Same here.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTyFKpAAoJEN0jrNd/PrOhl20QAL3X81voKh75GcgqC6zyRTx7
0CdHOkjS8ZI8rtoaZBekYTMKBV4yHR1jnov9Ct3X+ows3rFbLdlROkuIzvr+uOJv
6RjOaGAyseUKZSbiJFTOmkzJji4nFUfgPXbnq4RNfVrmCqhSysxPuyfLYJe61MBa
osW1x1W/D0GgcjT6uX38Tn8l1oT9liOykWPDTDkQBQ2bbGvRvIvakN89BlUP9726
paZpiRi4Zvlf1Bsev0NrMzKEgxeGQpbafsncey6yMVXjG1+WKvNd30zZvKHmxhWh
ZSGw527jcYKk4VK9wR3fvG47sL2Z2Gx2M0PA6t/yhSsUJv0HE36678NMEHRskLEz
7mqUvtliVGos0uYVhXxzaXH1wGknNx73YLhEqpC6qtib7cIYyE5ZUWkEI56rY35m
7JeL+rD4Ojx2/W4NEAGferyb2oVwVencVtBaY89xIVv940Lm5QF2MI9s5IYHUwqU
+KNgCudKqcziBmHju9QCmonQjWPQXr6IBmfldC/HmXD/snp3KiAq6vJfI5eUJqaw
kac/7vUXmnSeBTFevMPxXeMMzpoN71N7ebO9JSHxvWE/JnR1O0XuJGXIqcdyarAE
i+plixTd/Z0OBv6JQVKrsGFjSG/QFLJ8VfoE7LrgyficCVTYfgID9LrsMro4lJ8N
6C0ptP8kSXGpieIuje09
=3yMO
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
