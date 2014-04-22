From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Tue, 22 Apr 2014 17:26:59 +0200
Message-ID: <20140422152657.GB30048@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
 <20140422083311.GC17275@ulmo>
 <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1322215369=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
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


--===============1322215369==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 08:33:23PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
> >> Register exynos_dp_panel before the list of exynos crtcs and
> >> connectors are probed.
> >>
> >> This is needed because exynos_dp_panel should be registered to
> >> the drm_panel list via panel-exynos-dp probe, i.e much before
> >> exynos_dp_bind calls of_drm_find_panel().
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >> Changes since V1:
> >>       Added platform_driver_unregister(&exynos_dp_panel_driver) to
> >>       exynos_drm_platform_remove as per Jingoo Han's correction
> >>
> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
> >>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm=
/exynos/exynos_drm_drv.c
> >> index 1d653f8..2db7f67 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struct plat=
form_device *pdev)
> >>               goto err_unregister_ipp_drv;
> >>  #endif
> >>
> >> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> >> +     ret =3D platform_driver_register(&exynos_dp_panel_driver);
> >> +     if (ret < 0)
> >> +             goto err_unregister_dp_panel;
> >> +#endif
> >
> > No, this is not how you're supposed to use DRM panel drivers. The idea
> > is that you write a standalone driver for a given panel.
> >
> > What you do here has a number of problems. For one it's a driver that's
> > tightly coupled to Exynos SoCs. But if I have a different SoC that uses
> > the same panel I want to be able to use the same driver, and not have to
> > rewrite the driver for my SoC.
> >
> > Another problem is that you're assuming here that the driver is built in
> > and it will break if you try to build either Exynos DRM or the panel
> > driver as a module. This is perhaps nothing you care about right now,
> > but eventually people will want to ship a single kernel that can run on
> > a number of SoCs. But if we keep adding things like this, that kernel
> > will keep growing in size until it no longer fits in any kind of memory.
> >
> > Thierry
>=20
> I completely agree with you in this!
>=20
> Yes, this is not acceptable, but I want to know an "acceptable"
> workaround for the situation below:
> I register the driver using module_init().
> And, exynos_drm gets probed much before the panel driver probe happens.
> So, the panel driver hasn't probed yet, but exynos_dp via exynos_drm
> tries to call
> "of_drm_find_panel" which always returns NULL.

That's a situation that your driver needs to be able to deal with. The
driver registration order doesn't matter one bit. It may happen to work
most of the time, but as soon as one of the resources that your panel
driver needs isn't there when the panel is probed, then it won't be
registered and of_drm_find_panel() will still return NULL.

Usually the right thing to do in that case would be to return (and
propagate) -EPROBE_DEFER so that your driver's probe is deferred and
retried when other drivers have been probed. That way it should
eventually get a non-NULL panel.

Thierry

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVopBAAoJEN0jrNd/PrOhJn4QAIZGVToEGB765IbLzLlNwsCR
TKvjoTI924IC0SDUZ/tRThYQz7kWlqfjhA0a6eUtQqZ7CFoiJn9AMT1PAl8u7TEL
C2o9CfDgWmeQVdgZTec/8F0qq0xCEJCJWBXXh7xg+Avj6+07J2RJfeCpr+F4F+e+
PnMQ2P/Lnh5BoglRdN9idxpRUj6rouGTIqB6nc1ntQAq5OQhaVMeMq6shLIZK7ED
2l0XE8uoYxDEzUggSjMak3lkEj0usV4OBIPN1NfHw50p6N9pByLp+h4MoFupa0Dh
EwF1bnqYu8IgTcgzikeQ/JArfrmnT8NBj6ht4jZ8daVMJSU/k4Gb3d1NZKW+p7co
g/WZ8W2jPuwCJQkadWI47fazbUlh9VPWETrgP4ZlivxKxbEU1/4JbVvYPbs5pefm
PKUcv6s/YBY7XN/aO6k530/jV7VJ8ipcp6Or2gQ9L7mLe2RYwhWRc76nxFHBS5X1
ovhXTpG2TINnzw+cKkuNyfW71X1OjfQ3SvQSeQk/tEkUROq1sQUadf5ByBosdpjn
GyXaXvPLLydnoSb0ipPezA0tZoOEuxy5u+7UAp2vSx5O0UiJ8S4rlysvY/TF+7Zh
Mq1vAS+e22XJ1Ygfud7lVPFO1Vkz2o9D+LNOC4vGhSkPEgulozkdnqzk7+CpOm8q
WDro6b9b4RVadaigqyeT
=iJaI
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--

--===============1322215369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1322215369==--
