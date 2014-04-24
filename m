From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Thu, 24 Apr 2014 20:31:06 +0200
Message-ID: <20140424183104.GB27443@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140422081948.GA17275@ulmo>
 <CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
 <20140423072915.GV10722@phenom.ffwll.local>
 <20140423074212.GF31226@ulmo>
 <CAEC9eQNCvfUbaRL7DnNVF21QjwCX2E2sndHRDvLUE9EL1cVN4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1290531267=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQNCvfUbaRL7DnNVF21QjwCX2E2sndHRDvLUE9EL1cVN4Q@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1290531267==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2014 at 12:56:02AM +0530, Ajay kumar wrote:
> Thierry,
>=20
> On Wed, Apr 23, 2014 at 1:12 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Apr 23, 2014 at 09:29:15AM +0200, Daniel Vetter wrote:
[...]
> >> Imo this makes sense, especially if we go through with the idea talked
> >> about yesterday of creating a drm_bridge to wrap-up a drm_panel with
> >> sufficient isolation between all components.
> >
> > I'm not at all comfortable with these. The names are totally confusing.
> > Next somebody will need to do something after the panel has been enabled
> > and we'll have to introduce .post_enable() and .pre_disable() functions.
> > And worse, what if somebody needs something to be done between
> > .pre_enable() and .enable()? .post_pre_enable()? Where does it end?
> >
> > According to the above description the only reason why we need this is
> > to avoid visible glitches when the panel is already on, but the video
> > stream hasn't started yet. If that's the only reason why we need this,
> > then perhaps adding a way for a panel to expose the associated backlight
> > would be better?
> Actually, we need not expose the entire backlight device.
> AFAIK, the glitch is caused when you enable BL_EN before
> there is valid video data. So, one way to mask off the glitch is to
> follow this sequence:
> -- power up the panel.
> -- start video data, (start PWM here or)
> -- (start PWM here), enable backlight

That's very difficult to get right, isn't it? Even if you have fine-
grained control over what to enable you still need a way to determine
_when_ it's safe to enable the backlight. Typically I guess that would
be the duration of one frame (or perhaps 2, depending on when the panel
syncs to the video signal).

Perhaps it could even by sync'ed to the VBLANK?

> The problem is that the above scenario cannot be mapped to panel-simple d=
river.
> IMO, panel_simple should provide enable/disable controls both for LCD
> and backlight.
> something like panel_simple_lcd_enable/panel_simple_led_enable, and
> panel_simple_lcd_disable/panel_simple_led_disable.

That's not what the simple panel driver can do. If we want this it needs
to be solved in a generic way for all panels since they all need to use
the drm_panel_*() functions to abstract away the details from drivers
that use the panels.

Thierry

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTWVhoAAoJEN0jrNd/PrOhigMQAKunx3qoA20Eq1WIkKATk1OL
Kb5k8aWohvpt0rJVdTj6bvUVeCE+Y4CTdmR5HuucvQaFvYMYU2X3ThqTy9YyWjaj
q9HEdyl1vIJDoef2Ux9q2+R3batal0Ht2PMBH1G9G0Z7YEacjhgwjrsCxwouPs1m
wwkuL5iSSVtv797/Ul+9I0QbvFybMxjEDm1Zg9nW0QjG7bmdTLc2rPvQxXz76Orq
dtQacBbJyx9+IwlGJEnO7gHx77S2xl6PNp5ABLjiH0ltSOQPhRk8wpxOZqV8e4q1
XaicbI9igdFuplco1RSLDEajZ/S6qYvL/NMCCYHnvhbmdBtNPkpx/sqACt6BbsKL
iu32DmAhitBGaOFTNW5UP/tPGwyk9cN1apjSqP4k08pILtNHpNKDKBYp8DsxR7V0
eRWI80DXYOPw0rvdzAfggpqNKr1/Of1B5xV/kBEPVluhWDBA4Az63Wek6lnbcFer
f2EuC+HmWvUS8EvZqMdBbSnLg3YlnnkSCotmFlUKUZ+6MB7WVfozjd1may3P7ZED
VCdnvyf+i6UjtSx129OpxiJKC3KhLQpqVEqwCdFcWoG5yUJQKznoGfufaU8i+mib
oCPLmM/7aac97H5kdrVqj1+pZ+6enKc/GlW8Lj6S1gFg7uJEwyUZGZ+LmZtDjpO6
DJgxtZiIwoVcQUGerOUl
=BDSN
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

--===============1290531267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1290531267==--
