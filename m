From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Thu, 21 Aug 2014 09:36:45 +0200
Message-ID: <20140821073631.GH4486@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
 <20140422083311.GC17275@ulmo>
 <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
 <20140422152657.GB30048@ulmo>
 <CACP_E+KntYzVDjZrXcByU2LrCtzDbwW79LpSAazjHzbYbQrpDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ik0NlRzMGhMnxrMX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:39444 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751962AbaHUHgs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Aug 2014 03:36:48 -0400
Received: by mail-we0-f175.google.com with SMTP id t60so8974423wes.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2014 00:36:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACP_E+KntYzVDjZrXcByU2LrCtzDbwW79LpSAazjHzbYbQrpDQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?B?U3TDqXBoYW5l?= Marchesin <stephane.marchesin@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 09:02:39PM -0700, St=C3=A9phane Marchesin wrote:
> On Tue, Apr 22, 2014 at 8:26 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Apr 22, 2014 at 08:33:23PM +0530, Ajay kumar wrote:
> >> Hi Thierry,
> >>
> >> On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
> >> >> Register exynos_dp_panel before the list of exynos crtcs and
> >> >> connectors are probed.
> >> >>
> >> >> This is needed because exynos_dp_panel should be registered to
> >> >> the drm_panel list via panel-exynos-dp probe, i.e much before
> >> >> exynos_dp_bind calls of_drm_find_panel().
> >> >>
> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> ---
> >> >> Changes since V1:
> >> >>       Added platform_driver_unregister(&exynos_dp_panel_driver) to
> >> >>       exynos_drm_platform_remove as per Jingoo Han's correction
> >> >>
> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
> >> >>  2 files changed, 16 insertions(+)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/=
drm/exynos/exynos_drm_drv.c
> >> >> index 1d653f8..2db7f67 100644
> >> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> >> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struct p=
latform_device *pdev)
> >> >>               goto err_unregister_ipp_drv;
> >> >>  #endif
> >> >>
> >> >> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> >> >> +     ret =3D platform_driver_register(&exynos_dp_panel_driver);
> >> >> +     if (ret < 0)
> >> >> +             goto err_unregister_dp_panel;
> >> >> +#endif
> >> >
> >> > No, this is not how you're supposed to use DRM panel drivers. The id=
ea
> >> > is that you write a standalone driver for a given panel.
> >> >
> >> > What you do here has a number of problems. For one it's a driver tha=
t's
> >> > tightly coupled to Exynos SoCs. But if I have a different SoC that u=
ses
> >> > the same panel I want to be able to use the same driver, and not hav=
e to
> >> > rewrite the driver for my SoC.
> >> >
> >> > Another problem is that you're assuming here that the driver is buil=
t in
> >> > and it will break if you try to build either Exynos DRM or the panel
> >> > driver as a module. This is perhaps nothing you care about right now,
> >> > but eventually people will want to ship a single kernel that can run=
 on
> >> > a number of SoCs. But if we keep adding things like this, that kernel
> >> > will keep growing in size until it no longer fits in any kind of mem=
ory.
> >> >
> >> > Thierry
> >>
> >> I completely agree with you in this!
> >>
> >> Yes, this is not acceptable, but I want to know an "acceptable"
> >> workaround for the situation below:
> >> I register the driver using module_init().
> >> And, exynos_drm gets probed much before the panel driver probe happens.
> >> So, the panel driver hasn't probed yet, but exynos_dp via exynos_drm
> >> tries to call
> >> "of_drm_find_panel" which always returns NULL.
> >
> > That's a situation that your driver needs to be able to deal with. The
> > driver registration order doesn't matter one bit. It may happen to work
> > most of the time, but as soon as one of the resources that your panel
> > driver needs isn't there when the panel is probed, then it won't be
> > registered and of_drm_find_panel() will still return NULL.
> >
> > Usually the right thing to do in that case would be to return (and
> > propagate) -EPROBE_DEFER so that your driver's probe is deferred and
> > retried when other drivers have been probed. That way it should
> > eventually get a non-NULL panel.
>=20
> So I just gave this (drm_panel + probe deferring) a shot on exynos,
> and correctly reacting to -EPROBE_DEFER postpones DP initialization by
> approximately 1.5 second. Is there a good way to handle that? As it
> stands, this isn't usable.

How much is 1.5 seconds compared to the overall boot time of the device?
What exactly is causing this 1.5 second delay?

This really is a fundamental issue with deferred probing and the issue
has come up several times in the past. A couple of possible solutions
have been proposed, with the latest being here[0] I think. That ended in
a bit of a debacle, unfortunately, but on of the outcomes was that a lot
of the ordering problems could be fixed by using phandle references to
track dependencies. I'm not aware of anyone working on that right now,
presumably because everyone is busy getting features merged rather than
optimizing boot speed.

Thierry

[0]: https://lkml.org/lkml/2014/5/12/452

--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9aF/AAoJEN0jrNd/PrOh6DMP/0D+kxGKTtK7ekHTIpNbkocm
ro3IceccVp/NZSJvGbQqmEt0ZLN2L4m49CuLmwN+L9ibDBkosW4cSuLh9yLX2zS3
KltupTnCFeUX49k5UMiYi7S+5cpHhCW84eigZiXKXgHKXKfj3OKUxbjl/GwNydVi
HxLC6V9o/m7+7U3aYC4HdXP3JORrmomlEZfklT5yNcvrZGbGqhG0oSd2YK3hPqY4
z8MCWbZ2pSv0bms4NBkRZrL2PvFEF0tqAS7V9OMmNQnwdDo69AFdzugZYwMAVB6I
oCaBI4M6ewdfeA6Ez0J7HaOc0jGpj3lHviKoD2hxD6ENW63gVOmM9qmZ8U772CD3
XmyDaQXLX8iDCnoteAJDSPG/O3jIUz6uc7WACgGwgld9kd18D012v2lTScB8PGF/
LM1wG6YXBahL2jpg9Qk8HBJ0Tb2ih63+Nwvr9cGO6P89R4hxQ5BCwcxt2LCxV6g2
2gf+lwi6iNdOASE9UiYtEqVU0MW3BHnwzL4Bgj/NH0XCE0BazbRJlDmxO+s29sdI
VfYPI5szz7kebFXQAOvESdmc2Uamj9FUM8ZH/mV90H/eGOKv4fdsYrI9m9NqIKd6
GKe2nRQp7hsYH7zzCDPQzGiponhnvlbIBnQPQp6MkFHlqAXiPsoSSiT8zn6QVgpV
upOsypsZu9RPTKj5lDeW
=M3tC
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--
