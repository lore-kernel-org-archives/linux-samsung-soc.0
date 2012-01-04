From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Wed, 4 Jan 2012 00:00:38 -0700
Message-ID: <20120104070038.GA15445@ponder.secretlab.ca>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
 <4EFB66C3.4040504@gmail.com>
 <CAJuYYwQbTJTRdsa9WpQuCtSTYacbrcP3CVBFaAYHP1jLPky10A@mail.gmail.com>
 <4F022D7D.3060802@gmail.com>
 <CAJuYYwSGYnyq+hEbgpyvFoAB9LWWLhD2URaWsCC4vMyZwRQVbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61969 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910Ab2ADHAn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 02:00:43 -0500
Content-Disposition: inline
In-Reply-To: <CAJuYYwSGYnyq+hEbgpyvFoAB9LWWLhD2URaWsCC4vMyZwRQVbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

On Tue, Jan 03, 2012 at 01:53:28PM +0530, Thomas Abraham wrote:
> Hi Sylwester,
>=20
> On 3 January 2012 03:49, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> > Hi Thomas,
> >
> > thank you for clarifying.
> >
> > On 01/02/2012 03:14 AM, Thomas Abraham wrote:
> >>
> >> The following is a snippet from the dts file used for testing.
> >>
> >> =A0 =A0[...]
> >>
> >> =A0 =A0lcd0:power-domain-lcd0 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4210-pd";
> >> =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10023C00 0x10>;
> >> =A0 =A0};
> >>
> >> =A0 =A0[...]
> >>
> >> =A0 =A0fimd0:display-controller {
> >> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-fimd";
> >> =A0 =A0 =A0 =A0 =A0 =A0 [...]
> >> =A0 =A0 =A0 =A0 =A0 =A0 pd =3D <&lcd0>;
> >> =A0 =A0};
> >>
> >> The fimd (display controller) driver would then do the following.
> >>
> >> parp =3D of_get_property(pdev->dev.of_node, "pd", NULL);
> >> pd_np =3D of_find_node_by_phandle(be32_to_cpup(parp));
> >> pm_genpd_of_add_device(pd_np, &pdev->dev);
> >
> > Sounds interesting. Currently it's platform code that adds devices =
to
> > a corresponding power domain. But doing it at drivers might be more
> > convenient for avoiding device/driver/power domain registration
> > synchronization issues, especially that knowledge about power domai=
n
> > existence may be contained directly in DT description, not needing
> > drivers to carry platform specific data.
> >
> > BTW, I have a feeling that "samsung" is a bit longish prefix for th=
e bindings.
> > Didn't you initially consider "sec" for instance ? Probably it is a=
lready
> > too late for changing that though.
>=20
> I had not thought of "sec". I agree that "sec" would have been better
> as it is shorter and represents bindings specific to Samsung
> Electronics. But it is not intuitive at the same time. If there is
> greater consensus on using "sec", we could try and request for a
> change but looks difficult to get through.

Don't bother.  'samsung,' is fine.

g.
