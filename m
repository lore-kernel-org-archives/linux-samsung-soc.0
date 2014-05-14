From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Wed, 14 May 2014 16:54:03 +0200
Message-ID: <20140514145402.GC8612@ulmo>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140513080501.GH6754@ulmo>
 <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647073808=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
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


--===============0647073808==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2014 at 10:19:33PM +0530, Ajay kumar wrote:
> On Tue, May 13, 2014 at 1:35 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, May 09, 2014 at 08:23:01PM +0530, Ajay Kumar wrote:
> >> implement basic panel controls as a drm_bridge so that
> >> the existing bridges can make use of it.
> >>
> >> The driver assumes that it is the last entity in the bridge chain.
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >>  .../bindings/drm/bridge/bridge_panel.txt           |   45 ++++
> >
> > Can we please stop adding files to this directory? Device tree bindings
> > are supposed to be OS agnostic, but DRM is specific to Linux and should
> > not be used when describing hardware.
> One should not be adding a devicetree node if it is not describing the
> actual hardware?

Correct. But my point is that even if you describe actual hardware, then
the bindings don't belong in a drm subdirectory, because DRM does not
make any sense in a hardware context.

Something like video/bridge may be a better name for a directory.

> >> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
> > [...]
> >> +     -led-en-gpio:
> >> +             eDP panel LED enable GPIO.
> >> +                     Indicates which GPIO needs to be powered up as output
> >> +                     to enable the backlight.
> >
> > Since this is used to control a backlight, then this should really be a
> > separate node to describe the backlight device (and use the
> > corresponding backlight driver) rather than duplicating a subset of that
> > functionality.
> I am stressing this point again!
> Backlight should ideally be enabled only after:
> 1) Panel is powered up (LCD_VDD)
> 2) HPD is thrown.
> 3) Valid data starts coming from the encoder(DP in our case)
> All the above 3 are controlled inside drm, but pwm-backlight is
> independent of drm. So, we let the pwm_config happen in pwm-backlight driver
> and enable backlight GPIO(BL_EN) inside drm, after valid video data starts
> coming out of the encoder.

But that's completely the wrong way around. Why can't you simply control
the backlight from within DRM and only enable it at the right time?

> As you said, we can get this GPIO from a backlight device node, but since
> this GPIO is related to panel also, I think conceptually its not wrong
> to have this
> GPIO binding defined in a panel node.

It's not related to the panel. It's an enable for the backlight.
Backlight could be considered part of the panel, therefore it makes
sense to control the backlight from the panel driver.

> >> +     -panel-pre-enable-delay:
> >> +             delay value in ms required for panel_pre_enable process
> >> +                     Delay in ms needed for the eDP panel LCD unit to
> >> +                     powerup, and delay needed between panel_VCC and
> >> +                     video_enable.
> >
> > What are panel_VCC or video_enable?
> It is the time taken for the panel to throw a valid HPD from the point
> we enabled LCD_VCC.
> After HPD is thrown, we can start sending video data.

What does "throw a valid HPD" mean? Is it an actual signal that can be
captured via software (GPIO, interrupt, ...)? If so then it would be
preferable to not use a delay at all but rather rely on that mechanism
to determine when it's safe to send a video signal.

> >> +     -panel-enable-delay:
> >> +             delay value in ms required for panel_enable process
> >> +                     Delay in ms needed for the eDP panel backlight/LED unit
> >> +                     to powerup, and delay needed between video_enable and
> >> +                     BL_EN.
> >
> > Similarily, what does BL_EN stand for?
> Backlight Enable, same as "enable-gpios" in pwm-backlight driver.

When writing a binding it's useful to describe these things without
referring to signal names or abbreviations, since they may be something
else for different people.

> >> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
> > [...]
> >
> > This duplicates much of the functionality that panels should provide. I
> > think a better solution would be to properly integrate panels with
> > bridges.
> True, ideally I should be calling drm_panel functions from a simple dummy
> bridge which sits at the end of the bridge chain. But, since you are not
> convinced with having pre_enable and post_disable calls for panels, I had
> no other way to do this, than stuffing these panel controls inside
> bridge! :(

What makes you think that I would suddenly be any more convinced by this
solution than by your prior proposal? I didn't say outright no to what
you proposed earlier. What I said was that I didn't like it and that I
thought we could come up with a better solution. Part of getting to a
better solution is trying to understand the problems involved. You don't
solve a problem by simply moving code into a different driver.

Thierry

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTc4OKAAoJEN0jrNd/PrOhqxgP/1VBYlJAkeHebJQg7Tzr3eio
hhrvR53TiMA6dV4osS3VcMxDO/kSrubkAzT5GeuwQQbCejXVJJ/UzjnTRhCi1Sh0
sb2xhyRclkyhDg1dYo5b6x4srt/uaqMVZ1RWL8PxT2bQMeKDpgbRVywH4tqlwYrA
1Dc6cycNeUem8jiYCGUs3bbnKIZmVKprINympZpnCjIqaKibxzwQ4acyZkEmjLzI
M6wnEkA/YrvR84jcAbrPFUIWeTZc6oxfNikyyDipCqnKRNA9EW356RGDmlSoSzd5
ZZb9iW4qunuJA4NurW9zzrHbSa5DhrjcExJsTypABC5L798lHKs62PumZMAG9mxW
z0ePc6FvAaoxwkb3p1E5gDzqJEjbDa27V8kYOtmtK+sOFq7IuPy6zQlBHjfgty1M
nlmfYme5IhpUOAp12KnBreTCZ+NK36DJxVXLuy98lz6q6nmw4HSYWvezVvJcksXE
WXMt+bi8SdsHukal1ui9ktZcLY2dtmYJgSs3864JGngJeeO6b+IJx0i3LgZnausx
4v4wPe/pORccBoq+LJ0lTjdqB1E+IX4cWCVWK3qcWSrTdGE1hbQqPE5hUi1UKVOY
jvLx9sBG4rLZv8n/ybgF7ldiJK0fXMXuVtQdUCJ8F2M28KBNmQhvkN1AoLIB1Lj8
UNEhdEOYOVm/oLs50RqG
=Potu
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

--===============0647073808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0647073808==--
