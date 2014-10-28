From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 15:41:27 +0100
Message-ID: <20141028144126.GC17770@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAEC9eQPQaYjL3ZxtDZBdKi2z5yANcHQ9s4ikYkxN95K9qvu01Q@mail.gmail.com>
 <CAKMK7uGoO5TBgLh4HSDjxUM=-WRfsQoDHusLmOYxLio-QBMEPQ@mail.gmail.com>
 <CAEC9eQNJb1TgK1ihvzvC0VjSJhm48WaFO5SVigPsqTOurK2UQw@mail.gmail.com>
 <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0484301197=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, bhushan.r@samsung.com, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0484301197==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2014 at 03:19:36PM +0100, Daniel Vetter wrote:
> On Tue, Oct 28, 2014 at 1:28 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> > On Tue, Oct 28, 2014 at 3:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
[...]
> >> Hm, if you do this can you pls also update drm_panel accordingly? It
> >> shouldn't be a lot of fuzz and would make things around drm+dt more
> >> consistent.
> > Are you talking about using struct device_node instead of struct device?
> > I guess you have misplaced the comment under the wrong section!
>=20
> Yeah, that should have been one up ;-)

Like I said earlier, I don't think dropping struct device * in favour of
struct device_node * is a good idea.

> >> If you want to document drm_bridge then I recomment to sprinkle proper
> >> kerneldoc over drm_bridge.c and pull it all into the drm DocBook
> >> template. That way all the drm documentation is in one place. I've
> >> done that for drm_crtc.h in an unrelated patch series (but based upon
> >> a branch with your patch here included) and there's struct drm_bridge*
> >> in there. Hence why I've noticed.
> > Can you send a link for that?
> > And, is there any problem if the doc comes later?
>=20
> Since quite a while we've asked for the kerneldoc polish as part of
> each drm core patch series. It's just that drm_bridge/panel kinda have
> flown under the radar of the people usually asking for docs ;-)

FWIW, there's some kerneldoc in include/drm/drm_panel.h but I guess I
could write up something more complete and integrate it into DocBook.

Thierry

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT6sWAAoJEN0jrNd/PrOhtzwQAKsySwZxbNTjlVy3NxJE+CCb
avr26PcgTYNe3LjUED7dGw+XGE9uaU9ob4kYjowd0p1xiooNYWU77pJuQdp88rOk
MKbRC+wVBPPDiUXnXlx3L/Pr8/oohaLY/f/P6GrSpgNLeVH52Rg7AieM57FkgIVZ
4W5SJvrWvMdHjndg9L5RE5RESFl6O1mScM7kJQYsUYwDF6zBRY1fHqsa9G/lFmtp
AndX5sv34XDIxQnmEMyZBL1cog1Zi+CPdV12uLe3s0TyQfLmxxRxLYMZB+wwf0nM
gCC5wNX0ZLNJQQPDSosXt7FO0TwZZisOplwpdO1qt/HLTUFgZ9pAhmDNjt1QoW+T
GO2r7yQQGHzODP4lLWgwnmse8o2iFcxF36vE4eDVFwabs6VVDc5iFaPuLPRemGlr
E521lwtpV4nKfDziy6nv74OEVcXuDtBbr36HO14jnrAa8WXU+APT1HjHcRMHgscJ
LTxxeEcc+p4m2PH+4zCP9CM5HQhRic9eoedmLec/0EgZceAXb8j8m/fiFXH8Y/+W
o5AC6XJPKtLtzsm1T32IQ9k5cjooL+Pafpcvp82kCP9gI5hpiwqKZtr5HlfOERWU
H7EBXyvpPXXE1byF5BBhY9FoWz8VlAhzp/cwEdE4y9f43UdfPtwRPjApZd9F50ZF
t1IxA4jJCq8cNM95fmeN
=H9Lw
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

--===============0484301197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0484301197==--
