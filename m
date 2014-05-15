From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Thu, 15 May 2014 10:13:24 +0200
Message-ID: <20140515081321.GF5952@ulmo>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140513080501.GH6754@ulmo>
 <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
 <20140514145402.GC8612@ulmo>
 <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0202711744=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0202711744==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2014 at 11:39:30PM +0530, Ajay kumar wrote:
[...]
> >> >> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
> >> > [...]
> >> >> +     -led-en-gpio:
> >> >> +             eDP panel LED enable GPIO.
> >> >> +                     Indicates which GPIO needs to be powered up as output
> >> >> +                     to enable the backlight.
> >> >
> >> > Since this is used to control a backlight, then this should really be a
> >> > separate node to describe the backlight device (and use the
> >> > corresponding backlight driver) rather than duplicating a subset of that
> >> > functionality.
> >> I am stressing this point again!
> >> Backlight should ideally be enabled only after:
> >> 1) Panel is powered up (LCD_VDD)
> >> 2) HPD is thrown.
> >> 3) Valid data starts coming from the encoder(DP in our case)
> >> All the above 3 are controlled inside drm, but pwm-backlight is
> >> independent of drm. So, we let the pwm_config happen in pwm-backlight driver
> >> and enable backlight GPIO(BL_EN) inside drm, after valid video data starts
> >> coming out of the encoder.
> >
> > But that's completely the wrong way around. Why can't you simply control
> > the backlight from within DRM and only enable it at the right time?
> I am trying to reuse existing code as much as possible. pwm-backlight driver
> takes care of generating proper pwm signals for the given backlight value,
> so I am reusing that part of it. Even though it also provides a way to handle
> "backlight enable" pin(which is ofcourse optional) I wish to control it in the
> panel drvier, because generally all panel datasheets say you should control
> backlight enable along with panel controls.

I still don't see how controlling the enable GPIO from the panel will be
in any way better, or different for that matter, from simply enabling
the backlight and let the backlight driver handle the enable GPIO. Have
you tried to do that and found that it doesn't work?

> >> As you said, we can get this GPIO from a backlight device node, but since
> >> this GPIO is related to panel also, I think conceptually its not wrong
> >> to have this
> >> GPIO binding defined in a panel node.
> >
> > It's not related to the panel. It's an enable for the backlight.
> > Backlight could be considered part of the panel, therefore it makes
> > sense to control the backlight from the panel driver.
> Ok. This GPIO goes from my AP to the backlight unit of the panel.
> Basically, a board related GPIO which exists on all the boards.
> Where should I be handling this?

In the driver that handles the backlight unit. That is: pwm-backlight.

> >> > What are panel_VCC or video_enable?
> >> It is the time taken for the panel to throw a valid HPD from the point
> >> we enabled LCD_VCC.
> >> After HPD is thrown, we can start sending video data.
> >
> > What does "throw a valid HPD" mean? Is it an actual signal that can be
> > captured via software (GPIO, interrupt, ...)? If so then it would be
> > preferable to not use a delay at all but rather rely on that mechanism
> > to determine when it's safe to send a video signal.
> Right, your explanation holds good, but only for the case of eDP panels.
> But, when we use eDP-LVDS bridges(ps8622), its a different case!
> the bridge takes care of sending HPD, so the encoder gets HPD interrupt
> and tries to read edid from the panel, but the panel might not have powered up
> enough to read edid. In such cases we would need delay.
> So, having a delay field here would be really useful.

Okay.

> May be, while describing this particular DT binding I should elaborate more.

Yes, something like the above explanation would be good to have in the
binding.

> >> >> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
> >> > [...]
> >> >
> >> > This duplicates much of the functionality that panels should provide. I
> >> > think a better solution would be to properly integrate panels with
> >> > bridges.
> >> True, ideally I should be calling drm_panel functions from a simple dummy
> >> bridge which sits at the end of the bridge chain. But, since you are not
> >> convinced with having pre_enable and post_disable calls for panels, I had
> >> no other way to do this, than stuffing these panel controls inside
> >> bridge! :(
> >
> > What makes you think that I would suddenly be any more convinced by this
> > solution than by your prior proposal? I didn't say outright no to what
> > you proposed earlier. What I said was that I didn't like it and that I
> > thought we could come up with a better solution. Part of getting to a
> > better solution is trying to understand the problems involved. You don't
> > solve a problem by simply moving code into a different driver.
> Ok. What is better solution according to you?
> Handling the backlight enable GPIO in pwm-backlight driver is not
> a better soultion "ALWAYS". Sometimes, we may just need to control it
> along with video encoders.

You keep saying that, but you haven't said *why* you need to do that.

> And, even the panel datasheets mention that  in "Power On/off sequence"
> chapter.

Can you point me to such a datasheet?

> And, I have explained the problems and feasible solutions.

You have explained the solutions that you've found to the problem. I'm
trying to understand the problem fully so that perhaps we can find a
more generic solution.

> If drm_panel can support pre_enable/post_disable, we can easily
> implement a generic bridge which sits at the end of bridge chain, and
> calls corresponding drm_panel functions.

The problem with blindly adding .pre_enable() and .post_disable()
without thinking this through is that it can easily introduce
incompatibilities between various drivers and panels. There is a risk
that some of the code that goes into a panel's .pre_enable() will be
specific to a given setup (and perhaps not even related to the panel
at all). If that panel is reused on a different board where the
restrictions may be different the panel may not work.

So before we go and add any new functions to DRM panel I'd like to see
them properly documented. It needs to be defined precisely what the
effect of these functions should be so that both panel driver writers
know what to implement and display driver writers need to know when to
call which function.

Also, please let's not call them .pre_enable() and .post_disable(). The
names should be something more specific to reflect what they are meant
to do. Even something like .prepare() and .unprepare() would be better
choices.

Thierry

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdHchAAoJEN0jrNd/PrOhzi4P/0RnneCZsbrzF/+pDf5HN3XB
mAlvXGv5tpCl7r3p9eK8UDv3zMxL9G8idQr+IMl3QzxqSNx+WfNvIMetASyznCjB
IeXMUfSec10LOevpM2GD68ZQ8bGmMa82CELDdAZkqJtcps7bbuQxPKCFC8P4ga2k
LbtM7SPi+TaDwQb3tgdIUN9IOP4XIWQ1GVBpvlA5q1EP/Cu5rd+OPtEIqWbHW17A
pqtveI3lHQgBeducktB4Fb3Q+zrmWxFxZK2VfrdIk19Nod1eZDRzjpTqCE85zdpz
EG/Mwfs+//z+osjSSdF5vzzpOj7zptVEaytY2/qjumG1rF5Wt6G7HFFa4Rs0EEhC
yjquLHwT5RXWpCfgX0taQeAhPgz6mwetLNtu8N8s7WTTvjG6ylr8RolBiZRXJAhM
roqYPGXMX2c2Kos7O7lp3UYE1Hw/dzl7JFsEbjTIlYWyvzFkLsMD4CekrCMXiRVX
3NFXUf2N/wsNXKYhkl70660438YBmDOAErb31eGO36F4VJdxvrLqmHfr8hRmiGfq
s4CGYB2SQugejz7wvU1hOuW8Ef+G0cpXxodp+SDqomIdE0dAmKTwuP5eREl9ByWy
uRcSSOKnAuBRCjDLs4HLVxG+GeAeQimDYQk4k7gycbQ367c10i8DlqpHSSYLYgzX
do2W/KaxgVHWxqqB0aEH
=GH1S
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--

--===============0202711744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0202711744==--
