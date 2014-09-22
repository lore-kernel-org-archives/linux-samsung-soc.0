From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 00/12] drm/exynos: few patches to enhance bridge chip
 support
Date: Mon, 22 Sep 2014 12:18:40 +0200
Message-ID: <20140922101839.GO1470@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <CABxcv==KyakjS5cf9PcHL_pEcC5Kzn8Zz9uQ6HpKLdSjTXciFA@mail.gmail.com>
 <CAEC9eQNOnvyRrvwLuLY67CiZBL9wFN=q8vqGjRqQoA09cDBc6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B3NBd8mrXZtPJEYR"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:64692 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544AbaIVKSo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 06:18:44 -0400
Received: by mail-we0-f179.google.com with SMTP id u56so2620863wes.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2014 03:18:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAEC9eQNOnvyRrvwLuLY67CiZBL9wFN=q8vqGjRqQoA09cDBc6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--B3NBd8mrXZtPJEYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 03:02:48PM +0530, Ajay kumar wrote:
> On Tue, Sep 16, 2014 at 6:14 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > [adding Laurent Pinchart to cc who had concerns with a previous
> > version of this patch-set]
> >
> > Hello Ajay,
> >
> > On Wed, Aug 27, 2014 at 4:29 PM, Ajay Kumar <ajaykumar.rs@samsung.com> =
wrote:
> >> This series is based on master branch of Linus tree at:
> >> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >>
> >> I have tested this after adding few DT changes for exynos5250-snow and
> >> exynos5420-peach-pit boards.
> >>
> >> The V4 series of this particular patchset was also tested by:
> >> Rahul Sharma <rahul.sharma@samsung.com>
> >> Javier Martinez Canillas <javier@dowhile0.org>
> >>
> >> Changes since V2:
> >>         -- Address comments from Jingoo Han for ps8622 driver
> >>         -- Address comments from Daniel, Rob and Thierry regarding
> >>            bridge chaining
> >>         -- Address comments from Thierry regarding the names for
> >>            new drm_panel functions
> >>
> >> Changes since V3:
> >>         -- Remove hotplug based initialization of exynos_dp
> >>         -- Make exynos_dp work directly with drm_panel, remove
> >>            dependency on panel_binder
> >>         -- Minor cleanups in panel_binder and panel_lvds driver
> >>
> >> Changes since V4:
> >>         -- Use gpiod interface for panel-lvds and ps8622 drivers.
> >>         -- Address comments from Javier.
> >>         -- Fix compilation issues when PANEL_BINDER is selected as mod=
ule.
> >>         -- Split Documentation patches from driver patches.
> >>         -- Rebase on top of the tree.
> >>
> >> Changes since V5:
> >>         -- Modify bridge drivers to support driver model.
> >>         -- Drop the concept of bridge chain(sincle there are no 2 real=
 bridges)
> >>            Hence drop bridge-panel_binder layer.
> >>         -- Drop panel-lvds driver and accomodate the required changes =
in
> >>            panel-simple driver.
> >>         -- Use gpiod interface in ptn3460 driver.
> >>         -- Address all comments by Thierry Reding for V5 series.
> >>         -- Address comments from Sean Paul for exynos_dp_commit issue.
> >>
> >> Changes since V6:
> >>         -- Panel patches were seperated and they are merged already.
> >>         -- Fix few issues with ptn3460, before modifying the bridge co=
re.
> >>         -- Modify drm_bridge as per Thierry's comments for V6 series.
> >>         -- Add drm_bridge changes minimally without breaking existing =
code.
> >>         -- Add new features for ptn3460, step-by-step.
> >>         -- Address comments from Thierry and Andreas for ptn3460 and p=
s8622.
> >>         -- Split documentation patches from driver patches.
> >>
> >
> > I've tested your series on an Exynos5420 Peach Pit and an Exynos5250
> > Snow Chromebooks and display worked for me on both machines.
> Great!
>=20
> > I also needed "[PATCH] drm/panel: simple: Add AUO B116XW03 panel
> > support" [0] which does not apply cleanly on linux-next so you may
> > want to do a re-spin for that patch.
> Ok. I will take care of this in next version.
>=20
> > For Snow I also had to disable CONFIG_FB_SIMPLE, otherwise I just saw
> > a blink on boot and only the backlight remained turned on (no display
> > output). I don't know if that is expected since IIUC it should be
> > possible to do a transition from simplefb to a DRM/KMS driver. I don't
> > have a serial console hooked on this machine so I couldn't debug it
> > further, sorry.
> I am just wondering how SIMPLE FB can affect DRM based display.
> I am not even sure if both can co-exist or not. Is there anything
> we can do with bootargs instead of CONFIG?

I think the issue is that simplefb will register as console but the
display driver is probably reconfiguring the display hardware and then
registering a new console, so you'd end up with just a blank screen.

Typically the simplefb device tree nodes will be added by the bootloader
so you might be able to prevent the bootloader from adding it. Ideally,
though, the solution would be to do a proper hand-off from simplefb to
DRM/KMS so that you can have a seemless transition. Somewhere in the
middle would be to make simplefb unload when loading the DRM/KMS driver.

Thierry

--B3NBd8mrXZtPJEYR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH/d/AAoJEN0jrNd/PrOhDbUQAImiu//WJobLsSmY8Prj4cWK
83c4gk+WcMC7F0ClnOz5lHvY6UAu4+kXd+n/kGYBQM1TUFAPQwXtdLcPO/moMNAE
JraRwxQYHdrrDB2s/hp45Lbh3Plvf3MPWld9GlfPzoU0sHVvsP6xWZSwQEO+FODn
DBWXU6zfjBg6Axl9qg17FInBvo6r+xG4qLi/TMALVGStcMi9+Br62xjmmZn3pqTZ
atUmJQY9aAMef/S/SW63Alpu2gXz1tJ7W4GvqdP/nFKYKxHH9JJriOoxU7THzz2A
D1GylWshzzg4V9Bj2EOL8wPJJlkDEO7pAHEpJnNHAZpR/QOO5k/tUBSZZyIIi5bI
mScD9bIuI+gzksZMRR9N+Czheu4tDjyUQ6nszbictc6T5zLlRzBbX+Kri6x2O/hH
3ksyRDPRl52BoYgtkf60YYDzD21gHnvbCC863SLfUL0NjoGStiJ3TI+Q4ZrPiXiz
AuAzlnicqMJQNqbYHqVt4XD+GSXbn9eQ6pcJh5auQSETbcFwHaooKLek6OYOFQVr
5uftGH5BX+aIX3IxlUVx/sKsy/hRE+vzfsDLeAH6H+bZYADb9VskFDE0MfqMuZ87
QWh75LghFf4m1ujSgdxCkJYdP7bKGMDb+/VJxO+1ACPhhlHCeKFNdDMFc9Exx+9j
cWJkHlOtuj2qVvgO1B6z
=3Ets
-----END PGP SIGNATURE-----

--B3NBd8mrXZtPJEYR--
