From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/9] drm/panel: Add driver for exynos_dp based panels
Date: Tue, 22 Apr 2014 17:16:06 +0200
Message-ID: <20140422151604.GA30048@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
 <20140422082606.GB17275@ulmo>
 <CAEC9eQPnmx+EDk3FK7V+gbf6eP9SXyBHQVOxHUGHG82iyK2zbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1138675026=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPnmx+EDk3FK7V+gbf6eP9SXyBHQVOxHUGHG82iyK2zbA@mail.gmail.com>
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


--===============1138675026==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 08:23:03PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
>=20
> On Tue, Apr 22, 2014 at 1:56 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Apr 22, 2014 at 04:09:12AM +0530, Ajay Kumar wrote:
> >> This patch adds a simple driver to handle all the LCD and LED
> >> powerup/down routines needed to support eDP/eDP-LVDS panels
> >> supported on exynos boards.
> >>
> >> The LCD and LED units are usually powered up via regulators,
> >> and almost on all boards, we will have a BL_EN pin to enable/
> >> disable the backlight. Sometimes, we can have LCD_EN switches
> >> as well. The routines in this driver can be used to control
> >> panel power sequence on such boards.
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >> Changes since V1:
> >>       Added routine for post_disable, removed few unwanted headers.
> >>       Refactored a lot of code.
> >>
> >>  .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++++
> >>  drivers/gpu/drm/panel/Kconfig                      |    9 +
> >>  drivers/gpu/drm/panel/Makefile                     |    1 +
> >>  drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 +++++++++++=
+++++++++
> >>  4 files changed, 306 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-=
panel.txt
> >>  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
> >
> > What this patch does is in no way Exynos specific. It is also not eDP
> > specific.
> >
> Right. This is not at all writing into any "exynos" specific register,
> but can't this be just a placeholder for all the panel controls
> which can serve boards which use exynos_dp?

No, it shouldn't. Like I said, if I have a panel that happens to be used
on an Exynos board but I use it on a different board, then I don't want
to have to know that the panel might be supported by Exynos so that I
know which driver to use.

So ideally there should be one driver per panel. panel-simple was
introduced because of the five panels that I had access to at the time,
five panels could be supported using the same code.

> > This conflates panel drivers with board drivers in a strange way. Panel
> > drivers should be for *panels*, not for a given SoC or specific outputs
> > on that SoC.
> >
> Right. But for that matter, even the "panel-simple" driver is doing the s=
ame,
> which is just a placeholder for "generic" panel controls which serves
> multiple boards.

panel-simple is meant for panels that require only the parameters that
are specified for those. Anything that needs more is by definition no
longer "simple".

And the difference here is that panel-simple is a true wildcard, but it
isn't specific to one SoC. And the name doesn't imply that either. Also
each panel is still identified by the specific compatible value, which
makes it easier to find out which driver supports the panel.

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVoe0AAoJEN0jrNd/PrOhbPsQAKwj+KYu4h4yQhU5tZ+TC3yB
Kd66BFTbXb1QADuEN5FIxGNt5KtM+TmMd2Fbh3OlET8iLp/QLA5rp7lSrrjb85Fq
sBwG+mFbaoldo0MlRMKqfmhdNbaEHS/05rN/jWgmtsbnmHmLduDb1g1Ky79OISsL
YkeqaiRMF8OTcbJqHTvVDAWh5ZZaRklQtLX8/eXlZkqb/gCBhXygJBor6sj5rSXX
0ealjyOaI9e5hEfe5u138RsTr14lRrqNhAY7G732J4Y+N07FectOcRZOZKAixCL9
v8eLJgZezZg3fhzZUlRKPXaCknmVfeu1Atxz9AfLg0HFoLF+t0eRyMz08ug1SSGv
jvXr+XZQTvXsR2RpSBQ9NiJ+mf5wa4rq0oauXlauT+fwEzHhfbdbH2JmhJmfHsUa
RaBAualmOnCwtQbt6if6ZIwZsQautRPQcWYHMG8Ykb/wzHc2K+xnTE/0S8RBMhiS
kquLlT+IljmSeZmjA1j6lAaO6ponLIcmPeu7JOSjAr5ITo+SApU/veXrTcCU4sCc
k5WF1B9DY1Nl0DfDpcfqEWUfpuS/xvyg1WqZQ87SSMfFsQekZ71xpdod54LA65G0
8fRAjclcKNa8Fd7N77cbMChAEDhppp3l/iSAVV+sT6D3tkaD+Pnm7wUBcWzmbvnY
BJvAywbu9O/beTn9IOCq
=f+0R
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============1138675026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1138675026==--
